from kafka import KafkaConsumer
from kafka.errors import NoBrokersAvailable
from constants import CONSUMER_BOOTSTRAP_SERVERS
from constants import BUCKET_BULLETINS
from PIL import Image
from io import BytesIO
import json
import boto3
from time import sleep
from hashlib import md5


# def deserialize_image(img_bytes):
#     image = Image.open(BytesIO(img_bytes))
    
def deserialize_bulletin(bull_bytes):
    return bull_bytes.decode('utf-8')

def main():
    print("Initializing S3 connection...")

    ENDPOINT = "http://MINIO-DATALAKE:9000"
    session = boto3.Session(
        aws_access_key_id="dev_admin",
        aws_secret_access_key="dev_password",
        region_name="ru-central1"
    )

    s3 = session.client(
        "s3",
        endpoint_url=ENDPOINT
    )

    print(f"S3 connection to MinIO bucket '{BUCKET_BULLETINS}' established")

    # pictures_consumer = KafkaConsumer(
    #     group_id='pictures_csg1',
    #     bootstrap_servers=CONSUMER_BOOTSTRAP_SERVERS
    #     )

    print("Creating Kafka topic 'drom.bulletin.posted' consumer...")
    
    while True:
        try:
            bulletins_consumer = KafkaConsumer(
                group_id='bulletins_csg1',
                bootstrap_servers=CONSUMER_BOOTSTRAP_SERVERS,
                # value_deserializer=deserialize_bulletin
            )
            break
        except NoBrokersAvailable:
            print("No Kafka brokers in bootstrap_servers specified are available at the moment. Retry connection after 5 sec...")
            sleep(5)

    print("Kafka consumer created and started listening")

    bulletins_consumer.subscribe(['drom.bulletin.posted'])

    for bulletin in bulletins_consumer:
        # print(json.loads(bulletin.value.decode('utf-8')))
        print("Uploading new bulletin to MinIO Storage")
        s3.upload_fileobj(BytesIO(bulletin.value), BUCKET_BULLETINS, 'bulletin_' + md5(bulletin.value).hexdigest()[:8] + '.json')


    bulletins_consumer.unsubscribe()
    bulletins_consumer.close()


if __name__ == "__main__":
    main()
