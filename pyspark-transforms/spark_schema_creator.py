from pyspark.sql import SparkSession
from constants import KAFKA_BROKERS

scala_version = '2.12'
spark_version = '3.5.8'
packages = [
    f'org.apache.spark:spark-sql-kafka-0-10_{scala_version}:{spark_version}',
    'org.apache.kafka:kafka-clients:3.2.0',
    f'org.apache.spark:spark-streaming-kafka-0-10_{scala_version}:{spark_version}'
]


def main():
    spark = SparkSession.builder\
        .master('local[*]')\
        .appName('DWH Star Schema creator')\
        .config('spark.jars.packages', ",".join(packages))\
        .getOrCreate()

    df = spark\
        .readStream\
        .format('kafka')\
        .option('kafka.bootstrap.servers', KAFKA_BROKERS)\
        .option('subscribe', 'drom.bulletin.posted')\
        .load()

    df.writeStream.format('console') \
        .start()\
        .awaitTermination()
    
if __name__ == "__main__":
    main()

