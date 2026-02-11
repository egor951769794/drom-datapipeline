from pyspark.sql import SparkSession
from pyspark.sql.types import StructType, StructField, StringType, IntegerType, TimestampType, ArrayType, ShortType, BooleanType, FloatType
from pyspark.sql.functions import from_json, col, xxhash64, weekday, year, month, regexp_extract, to_json, struct, window, count, avg, to_timestamp
from constants import KAFKA_BROKERS, JDBC_CONNECTION_STRING, JDBC_CONNECTION_PROPS

scala_version = '2.12'
spark_version = '3.5.8'

packages = [
    f'org.apache.spark:spark-sql-kafka-0-10_{scala_version}:{spark_version}',
    'org.apache.kafka:kafka-clients:3.2.0',
    f'org.apache.spark:spark-streaming-kafka-0-10_{scala_version}:{spark_version}',
    'org.postgresql:postgresql:42.7.9'
]

def create_session() -> SparkSession:
    spark = SparkSession.builder\
        .master('local[2]')\
        .appName('DWH Star Schema creator')\
        .config("spark.sql.shuffle.partitions", "5")\
        .config('spark.jars.packages', ",".join(packages))\
        .getOrCreate()
    
    return spark

def write_jdbc(batch, batch_id):
    batch.write\
    .mode("append")\
    .jdbc(
        url=JDBC_CONNECTION_STRING,
        table="common_analytics.monitoring",
        properties=JDBC_CONNECTION_PROPS
    )

json_schema = StructType([
    StructField("timeReceived", StringType()),
    StructField("bullUrl", StringType()),
    StructField("imageUrls", ArrayType(StringType(), True)),
    StructField("manufacturer", StringType()),
    StructField("model", StringType()),
    StructField("year", ShortType()),
    StructField("config", StringType()),
    StructField("engineCapacity", FloatType()),
    StructField("enginePower", ShortType()),
    StructField("engineType", StringType()),
    StructField("transmissionType", StringType()),
    StructField("wheelDrive", StringType()),
    StructField("mileage", IntegerType()),
    StructField("isNew", BooleanType()),
    StructField("byOrder", BooleanType()),
    StructField("noMileageInRussia", BooleanType()),
    StructField("fromOwner", BooleanType()),
    StructField("priceRub", IntegerType()),
    StructField("location", StringType()),
    StructField("broken", BooleanType()),
    StructField("noDocs", BooleanType()),
    StructField("color", StringType()),
    StructField("steering", StringType()),
    StructField("passportIssues", BooleanType()),
    StructField("ownedByCompany", BooleanType()),
    StructField("hasPenalties", BooleanType()),
    StructField("numOfOwners", ShortType()),
    StructField("numOfPreviousBulls", ShortType()),
    StructField("date", TimestampType()),
    StructField("imageIds", ArrayType(StringType(), True))]
)

car_columns = [
    "manufacturer",
    "model",
    "year",
    "engineCapacity",
    "enginePower",
    "engineType",
    "transmissionType",
    "wheelDrive",
    "steering",
    "color"
]

date_columns = [
    "date"
]

condition_columns = [
    "byOrder",
    "fromOwner",
    "isNew",
    "noMileageInRussia",
    "broken",
    "noDocs",
    "passportIssues",
    "ownedByCompany",
    "hasPenalties"
]

fact_columns = [
    "timeReceived",
    "bullId",
    "bullHash",
    "mileage",
    "priceRub",
    "location",
    "numOfOwners",
    "numOfPreviousBulls",
    "carKey",
    "dateKey",
    "conditionKey"
]

monitoring_columns = [
    "window_start",
    "window_end",
    "manufacturer",
    "bulls_count",
    "avg_price"
]

def main():
    spark = create_session()

    df = spark\
        .readStream\
        .format('kafka')\
        .option('kafka.bootstrap.servers', KAFKA_BROKERS)\
        .option('subscribe', 'drom.bulletin.posted')\
        .option("startingOffsets", "latest")\
        .load()\
        .selectExpr("CAST(value AS STRING) AS json")
    
    df = df.select(
        from_json(col("json"), json_schema).alias("data")
        ).select("data.*")\
        .withColumn("timeReceived", to_timestamp("timeReceived"))
    
    df_monitoring = df\
        .withWatermark("timeReceived", "1 hour")\
        .groupBy(
            window(col("timeReceived"), "1 day").alias("time_window"),
            col("manufacturer")
        )\
        .agg(
            count("*").alias("bulls_count"),
            avg("priceRub").alias("avg_price")
        )\
        .select(
            col("time_window.start").alias("window_start"),
            col("time_window.end").alias("window_end"),
            "manufacturer",
            "bulls_count",
            "avg_price"
        )
    
    df_dwh = df.select(
        *df.columns,
        regexp_extract("bullUrl", r'[0-9]{9}', 0).alias("bullId"),
        xxhash64("enginePower", "engineCapacity", "mileage", "priceRub", "numOfOwners").alias("bullHash"),
        xxhash64(*car_columns).alias("carKey"),
        xxhash64(*date_columns).alias("dateKey"),
        xxhash64(*condition_columns).alias("conditionKey")
    )

    dim_car = df_dwh.select(*car_columns, xxhash64(*car_columns).alias("carKey")).drop_duplicates()
    
    dim_date = df_dwh.select(*date_columns).drop_duplicates()\
    .select(
        *date_columns,
        xxhash64(*date_columns).alias("dateKey"),
        weekday("date").alias("dayOfWeek"),
        weekday("date").isin([5, 6]).alias("isWeekend"),
        month("date").alias("month"),
        year("date").alias("year")
    )

    dim_condition = df_dwh.select(*condition_columns).drop_duplicates()\
    .withColumn("conditionKey", xxhash64(*condition_columns))
    fact_table = df_dwh.select(*fact_columns)

    df_monitoring\
    .writeStream\
    .foreachBatch(write_jdbc)\
    .trigger(processingTime="10 minutes")\
    .option("checkpointLocation", "/checkpoints/monitoring-checkpoints")\
    .outputMode("append")\
    .start()

    fact_table.select(
        to_json(
            struct(*fact_table.columns)
        ).alias("value")
    ).writeStream\
    .trigger(processingTime='5 seconds')\
    .format("kafka")\
    .option("kafka.bootstrap.servers", KAFKA_BROKERS)\
    .option("topic", "dwh.table.facts")\
    .option("checkpointLocation", "/checkpoints/fact-checkpoints")\
    .outputMode("append")\
    .start()

    dim_condition.select(
        to_json(
            struct(*dim_condition.columns)
        ).alias("value")
    ).writeStream\
    .trigger(processingTime='5 seconds')\
    .format("kafka")\
    .option("kafka.bootstrap.servers", KAFKA_BROKERS)\
    .option("topic", "dwh.table.condition")\
    .option("checkpointLocation", "/checkpoints/condition-checkpoints")\
    .outputMode("append")\
    .start()

    dim_date.select(
        to_json(
            struct(*dim_date.columns)
        ).alias("value")
    ).writeStream\
    .trigger(processingTime='5 seconds')\
    .format("kafka")\
    .option("kafka.bootstrap.servers", KAFKA_BROKERS)\
    .option("topic", "dwh.table.date")\
    .option("checkpointLocation", "/checkpoints/date-checkpoints")\
    .outputMode("append")\
    .start()

    dim_car.select(
        to_json(
            struct(*dim_car.columns)
        ).alias("value")
    ).writeStream\
    .trigger(processingTime='5 seconds')\
    .format("kafka")\
    .option("kafka.bootstrap.servers", KAFKA_BROKERS)\
    .option("topic", "dwh.table.car")\
    .option("checkpointLocation", "/checkpoints/car-checkpoints")\
    .outputMode("append")\
    .start()
        
    spark.streams.awaitAnyTermination()
    
if __name__ == "__main__":
    main()
