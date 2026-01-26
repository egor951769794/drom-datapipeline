from hashlib import md5
import json

from pyspark.sql import SparkSession
from pyspark.sql.types import StructType, StructField, StringType, IntegerType, TimestampType, ArrayType, ShortType, BooleanType, FloatType
from pyspark.sql.functions import from_json, col, expr, date_trunc, xxhash64, weekday, year, month, regexp_extract
from constants import KAFKA_BROKERS


scala_version = '2.12'
spark_version = '3.5.8'
packages = [
    f'org.apache.spark:spark-sql-kafka-0-10_{scala_version}:{spark_version}',
    'org.apache.kafka:kafka-clients:3.2.0',
    f'org.apache.spark:spark-streaming-kafka-0-10_{scala_version}:{spark_version}'
]

def create_session():
    spark = SparkSession.builder\
        .master('local[*]')\
        .appName('DWH Star Schema creator')\
        .config('spark.jars.packages', ",".join(packages))\
        .getOrCreate()
    
    return spark

def json_dump(value):
    return json.dumps(
        value,
        ensure_ascii=False,
        indent=None
    )

def create_hash(value):
    return md5(json_dump(value).encode('utf-8')).digest()[:8]

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
    StructField("mileage", StringType()),
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

def main():
    spark = create_session()

    df = spark\
        .readStream\
        .format('kafka')\
        .option('kafka.bootstrap.servers', KAFKA_BROKERS)\
        .option('subscribe', 'drom.bulletin.posted')\
        .option("startingOffsets", "earliest")\
        .load()\
        .selectExpr("CAST(value AS STRING) AS json")
    
    df = df.select(
        from_json(col("json"), json_schema).alias("data")
        ).select("data.*")
    
    df_dwh = df.withColumn('timeReceived', date_trunc('minute', 'timeReceived'))\
    .withColumn('bullId', regexp_extract("bullUrl", r'[0-9]{9}', 0))\
    .withColumn("bullHash", xxhash64("enginePower", "engineCapacity", "mileage", "priceRub", "numOfOwners"))\
    .withColumn('carKey', xxhash64(*car_columns))\
    .withColumn("dateKey", xxhash64(*date_columns))\
    .withColumn("conditionKey", xxhash64(*condition_columns))

    dim_car = df_dwh.select(*car_columns).drop_duplicates()\
    .withColumn("carKey", xxhash64(*car_columns))\
    .select("*")

    dim_date = df_dwh.select(*date_columns).drop_duplicates()\
    .withColumn("dateKey", xxhash64(*date_columns))\
    .withColumn("dayOfWeek", weekday("date"))\
    .withColumn("isWeekend", weekday("date").isin([5, 6]))\
    .withColumn("month", month("date"))\
    .withColumn("year", year("date"))\
    .select("*")

    dim_condition = df_dwh.select(*condition_columns).drop_duplicates()\
    .withColumn("conditionKey", xxhash64(*condition_columns))\
    .select("*")

    fact_table = df_dwh.select(*fact_columns)\
    .select("*")
    
    
    fact_table.writeStream.format('console') \
        .outputMode('append')\
        .option("truncate", False)\
        .start()\
    
    dim_condition.writeStream.format('console') \
        .outputMode('append')\
        .option("truncate", False)\
        .start()\
    
    dim_date.writeStream.format('console') \
        .outputMode('append')\
        .option("truncate", False)\
        .start()\
    
    dim_car.writeStream.format('console') \
        .outputMode('append')\
        .option("truncate", False)\
        .start()\
        
    spark.streams.awaitAnyTermination()
    
if __name__ == "__main__":
    main()

