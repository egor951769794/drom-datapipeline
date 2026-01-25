from pyspark.sql import SparkSession
from pyspark.sql.types import StructType, StructField, StringType, IntegerType, TimestampType, ArrayType, ShortType, BooleanType, FloatType
from pyspark.sql.functions import from_json, col, expr
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

    df.writeStream.format('console') \
        .outputMode('append')\
        .option("truncate", False)\
        .start()\
        .awaitTermination()
    
if __name__ == "__main__":
    main()

