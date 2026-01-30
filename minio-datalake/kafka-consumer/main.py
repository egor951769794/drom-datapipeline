from io import BytesIO
from time import sleep
from hashlib import md5
import threading
import signal

import boto3
from kafka import KafkaConsumer, OffsetAndMetadata
from kafka.errors import NoBrokersAvailable

from constants import CONSUMER_BOOTSTRAP_SERVERS
from constants import BUCKET_BULLETINS, BUCKET_BULLETINPICS


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
                    leader_epoch = self.consumer._subscription.all_consumed_offsets()[partition].leader_epoch
                    offset = None
                    for message in messages:
                        try:
                            self.process_message(message, self.session)
                            offset = message.offset + 1

                        except Exception as e:
                            if shutdown_event.is_set():
                                if offset:
                                    self.consumer.commit({partition: OffsetAndMetadata(offset=offset, metadata='', leader_epoch=leader_epoch)})
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
        print(msg.value.decode('utf-8') if msg.value else "No value provided in message received") 


def handle_signal(signum, frame):
    print(f"Got signal {signum}. Performing graceful shutdown...")
    shutdown_event.set()


class BulletinKafkaConsumer(ThreadKafkaConsumer):
    def __init__(self, topic: str, group_id: str, bootstrap_servers: list, session, max_poll=300000):
        super().__init__(topic, group_id, bootstrap_servers, session, max_poll)

    def process_message(self, msg, session):
        session.upload_fileobj(BytesIO(msg.value), BUCKET_BULLETINS, 'bulletin_' + md5(msg.value).hexdigest()[:8] + '.json')


class BulletinPicsKafkaConsumer(ThreadKafkaConsumer):
    def __init__(self, topic: str, group_id: str, bootstrap_servers: list, session, max_poll=300000):
        super().__init__(topic, group_id, bootstrap_servers, session, max_poll)

    def process_message(self, msg, session):
        session.upload_fileobj(BytesIO(msg.value), BUCKET_BULLETINPICS, msg.key.decode('utf-8') + '.jpg')

        
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

    print(f"S3 connection to MinIO established")

    try:
        bulletin_consumer = BulletinKafkaConsumer(
            topic="drom.bulletin.posted",
            group_id="bulletins_csg1",
            bootstrap_servers=CONSUMER_BOOTSTRAP_SERVERS,
            session=s3,
            max_poll=10000
        )

        bulletin_consumer.start()

        pictures_consumer = BulletinPicsKafkaConsumer(
            topic="drom.bulletin.pictures",
            group_id="bulletinpics_csg1",
            bootstrap_servers=CONSUMER_BOOTSTRAP_SERVERS,
            session=s3,
            max_poll=10000
        )

        pictures_consumer.start()

        while not shutdown_event.is_set():
            sleep(1)

    except Exception as e:
        print(f"Error while executing Kafka Consumer occured: {e}")
        shutdown_event.set()
    finally:
        bulletin_consumer.join()
        pictures_consumer.join()
        print(f"Consumers are successfuly terminated. Exiting")



if __name__ == "__main__":
    main()
