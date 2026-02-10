from time import sleep
from hashlib import md5
import threading
import signal
import psycopg2
import json

from kafka import KafkaConsumer, OffsetAndMetadata
from kafka.errors import NoBrokersAvailable

from psycopg2.extras import execute_batch

from constants import CONSUMER_BOOTSTRAP_SERVERS
from constants import TOPIC_FACTS, TOPIC_CAR, TOPIC_CONDITION, TOPIC_DATE, POSTGRES_CONFIG
from constants import TOPIC_TABLE_SCHEMA, DB_INSERT_QUERIES


shutdown_event = threading.Event()

class ThreadKafkaConsumer:
    def __init__(self, topic: str, group_id: str, bootstrap_servers: list, cur, conn, max_poll=300000, bulk_size=200):
        self.topic = topic
        self.group_id = group_id
        self.bootstrap_servers = bootstrap_servers
        self.cur = cur
        self.conn = conn
        self.max_poll = max_poll
        self.bulk_size = bulk_size

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
                    max_poll_interval_ms=self.max_poll,
                    max_poll_records=100,
                    value_deserializer=lambda x: json.loads(x.decode('utf-8'))
                )
                break
            except NoBrokersAvailable:
                print("No Kafka brokers in bootstrap_servers specified are available at the moment. Retry connection after 5 sec...")
                sleep(5)

        self.consumer.subscribe([self.topic])
        print(f"Kafka topic {self.topic} consumer created and started listening")

        bulk = []

        while not shutdown_event.is_set():
            try:
                offsets = {}

                messages_batch = self.consumer.poll(timeout_ms=1500, max_records=self.bulk_size)
                if not messages_batch:
                    continue
                
                for partition, messages in messages_batch.items():
                    leader_epoch = self.consumer._subscription.all_consumed_offsets()[partition].leader_epoch
                    for message in messages:
                        try:
                            record = message.value
                            bulk.append(
                                [record.get(key) for key in TOPIC_TABLE_SCHEMA[self.topic]]
                            )
                            offsets[partition] = OffsetAndMetadata(offset=message.offset + 1, metadata='', leader_epoch=leader_epoch)

                        except Exception as e:
                            if shutdown_event.is_set():
                                if offsets:
                                    execute_batch(self.cur, DB_INSERT_QUERIES[self.topic], bulk)
                                    self.conn.commit()
                                    self.consumer.commit(offsets)
                                self.conn.close()
                                self.close()
                                return
                            
                            print(f"Error while reading message from batch from topic {self.topic}: {e}. Going to the next message")
                            continue
                
                if len(bulk) >= self.bulk_size:
                    execute_batch(self.cur, DB_INSERT_QUERIES[self.topic], bulk)
                    self.conn.commit()
                    self.consumer.commit(offsets)
                    bulk.clear()


            except Exception as e:
                print(f"Error while reading batch from kafka topic {self.topic}: {e}")
                sleep(1)

        if not self.conn.closed:
            self.conn.commit()
            self.conn.close()
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


def handle_signal(signum, frame):
    print(f"Got signal {signum}. Performing graceful shutdown...")
    shutdown_event.set()


def connect_to_db():
    print("Creating PostgreSQL connection...")
    while True:
        print("Trying to connect...")
        try:
            conn = psycopg2.connect(**POSTGRES_CONFIG)
            cur = conn.cursor()
            cur.execute("SELECT version()")
            version = cur.fetchone()
            print(f"PostgreSQL connection created! Version: {version}")
            return conn, cur

        except Exception as e:
            print(f"db connection failed:\n{e}")
            print("Retry connection after 5 sec...")
            sleep(5)
    
        
def main():
    signal.signal(signal.SIGINT, handle_signal)
    signal.signal(signal.SIGTERM, handle_signal)

    conn, cur = connect_to_db()

    try:
        facts_consumer = ThreadKafkaConsumer(
            topic=TOPIC_FACTS,
            group_id="facts_csg1",
            bootstrap_servers=CONSUMER_BOOTSTRAP_SERVERS,
            cur=cur,
            conn=conn,
            max_poll=10000,
            bulk_size=2
        )

        car_consumer = ThreadKafkaConsumer(
            topic=TOPIC_CAR,
            group_id="car_csg1",
            bootstrap_servers=CONSUMER_BOOTSTRAP_SERVERS,
            cur=cur,
            conn=conn,
            max_poll=10000,
            bulk_size=1
        )

        date_consumer = ThreadKafkaConsumer(
            topic=TOPIC_DATE,
            group_id="date_csg1",
            bootstrap_servers=CONSUMER_BOOTSTRAP_SERVERS,
            cur=cur,
            conn=conn,
            max_poll=10000,
            bulk_size=1
        )

        condition_consumer = ThreadKafkaConsumer(
            topic=TOPIC_CONDITION,
            group_id="condition_csg1",
            bootstrap_servers=CONSUMER_BOOTSTRAP_SERVERS,
            cur=cur,
            conn=conn,
            max_poll=10000,
            bulk_size=1
        )
        facts_consumer.start()
        condition_consumer.start()
        date_consumer.start()
        car_consumer.start()

        while not shutdown_event.is_set():
            sleep(1)

    except Exception as e:
        print(f"Error while executing Kafka Consumer occured: {e}")
        shutdown_event.set()
    finally:
        facts_consumer.join()
        car_consumer.join()
        date_consumer.join()
        condition_consumer.join()
        print(f"Consumers are successfuly terminated. Exiting")


if __name__ == "__main__":
    main()
