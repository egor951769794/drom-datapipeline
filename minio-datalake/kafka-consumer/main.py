from kafka import KafkaConsumer
from kafka.errors import NoBrokersAvailable
from constants import CONSUMER_BOOTSTRAP_SERVERS
from constants import BUCKET_BULLETINS
from PIL import Image
from io import BytesIO
import boto3
from time import sleep
from hashlib import md5
import threading
import signal


shutdown_event = threading.Event()

class ThreadKafkaConsumer:
    def __init__(self, topic: str, group_id: str, bootstrap_servers: list, session, max_poll=300000):
        self.topic = topic
        self.group_id = group_id
        self.bootstrap_servers = bootstrap_servers
        self.session = session
        self.max_poll = max_poll

    def start(self):
        print(f"Creating Kafka topic {self.topic} consumer...")
        self.thread = threading.Thread(target=self.run, daemon=True)
        self.thread.start()

    def run(self):
        while True:
            try:
                self.consumer = KafkaConsumer(
                    group_id=self.group_id,
                    bootstrap_servers=self.bootstrap_servers,
                    enable_auto_commit=False,
                    auto_offset_reset='earliest',
                    max_poll_interval_ms = self.max_poll,
                    max_poll_records = 100
                )
                break
            except NoBrokersAvailable:
                print("No Kafka brokers in bootstrap_servers specified are available at the moment. Retry connection after 5 sec...")
                sleep(5)

        self.consumer.subscribe([self.topic])
        print(f"Kafka topic {self.topic} consumer created and started listening")

        while not shutdown_event.is_set():
            try:
                messages_batch = self.consumer.poll(timeout_ms=1500)
                if not messages_batch:
                    continue

                for partition, messages in messages_batch.items():
                    offsets = {}
                    for message in messages:
                        try:
                            print(partition, message.offset)
                            self.process_message(message.value, self.session)
                            offsets[partition] = message.offset + 1

                        except Exception as e:
                            if shutdown_event.is_set():
                                self.consumer.commit(offsets)
                                self.close()
                                return
                            
                            print(f"Error while reading message from batch from topic {self.topic}: {e}. Going to the next message")
                            continue

                    self.consumer.commit()

            except Exception as e:
                print(f"Error while reading batch from kafka topic {self.topic}: {e}")
                sleep(1)

        self.consumer.commit()
        self.close()

    def close(self):
        print(f"Closing consumer for topic {self.topic}...")
        self.consumer.unsubscribe()
        self.consumer.close()
        print(f"Consumer for topic {self.topic} closed")

    def join(self, timeout=5):
        if self.thread and self.thread.is_alive():
            self.thread.join(timeout)

    def process_message(self, msg, session):
        print(msg.decode('utf-8') if msg else "No value provided in message received") 



def handle_signal(signum, frame):
    print(f"Got signal {signum}. Performing graceful shutdown...")
    shutdown_event.set()


class BulletinKafkaConsumer(ThreadKafkaConsumer):
    def __init__(self, topic: str, group_id: str, bootstrap_servers: list, session, max_poll=300000):
        super().__init__(topic, group_id, bootstrap_servers, session, max_poll)

    def process_message(self, msg, session):
        session.upload_fileobj(BytesIO(msg), BUCKET_BULLETINS, 'bulletin_' + md5(msg).hexdigest()[:8] + '.json')



# def deserialize_image(img_bytes):
#     image = Image.open(BytesIO(img_bytes))
    
        
def main():
    signal.signal(signal.SIGINT, handle_signal)
    signal.signal(signal.SIGTERM, handle_signal)

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

    try:
    
        bulletin_consumer = BulletinKafkaConsumer(
            topic="drom.bulletin.posted",
            group_id="bulletins_csg1",
            bootstrap_servers=CONSUMER_BOOTSTRAP_SERVERS,
            session=s3,
            max_poll=10000
        )

        bulletin_consumer.start()

        while not shutdown_event.is_set():
            sleep(1)

    except Exception as e:
        print(f"Error while executing Kafka Consumer occured: {e}")
        shutdown_event.set()
    finally:
        bulletin_consumer.join()
        print(f"Consumers are successfuly terminated. Exiting")



if __name__ == "__main__":
    main()
