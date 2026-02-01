from bs4 import BeautifulSoup as bs4
from get_first_unpromoted_page import get_first_unpromoted_page
from create_bull_json import create_bull_json
from misc.get_request import get_request
from misc.sleep import sleep
from misc.constants import DROM_BASE_URL, REGIONS, PRODUCER_BOOTSTRAP_SERVERS
from datetime import datetime

from kafka import KafkaProducer
from kafka.errors import NoBrokersAvailable


def collect_data_tmp(region, n_pages, page=None):
    
    try:

        producer = KafkaProducer(bootstrap_servers=PRODUCER_BOOTSTRAP_SERVERS, enable_idempotence=True, acks='all')
        print("[" + str(datetime.now()) + "] ", "Drom bulletins listener created. Press Ctrl+C once to skip page, twice for exit...\n\n")

        for current_page in range(page, page + n_pages):
            url = DROM_BASE_URL + '/' + REGIONS[region] + 'all/page' + str(current_page)
            print(print("[" + str(datetime.now()) + "] ", f"Collecting from page№{current_page}...\n\n"))
            
            try:
                r = get_request(url, find_tag=["div", {"data-bulletin-list": "true"}])
                
                if not r:
                    sleep(10, 3)
                    continue

                bulls_list = bs4(r.text, "html.parser").find_all("div", {"data-ftid": "bulls-list_bull"})

                for bull in bulls_list:
                    if ('bull_promotion_3' not in bull.find("a", {"data-ftid": "bull_title"}).previous_element.attrs.values()):
                        bull_info, image_ids, image_bytes = create_bull_json(bull)
                        print("[" + str(datetime.now()) + "] ", "New bulletin found. Sending to Kafka...")
                        producer.send(topic='drom.bulletin.posted', value=bull_info.encode('utf-8'))
                        for id, image_byte in zip(image_ids, image_bytes):
                            producer.send(topic='drom.bulletin.pictures', key=id.encode('utf-8'), value=image_byte)

                sleep(60, 10)

            
            except KeyboardInterrupt:
                print("[" + str(datetime.now()) + "] ", "Skipping current page...")
                sleep(5, 1)

    except NoBrokersAvailable:
                print("[" + str(datetime.now()) + "] ", "No Kafka brokers are available at the moment. Quiting...")

    except KeyboardInterrupt:
        print("[" + str(datetime.now()) + "] ", "Listener execution is over")
        sleep(1, 0)


if __name__ == "__main__":
    collect_data_tmp('Омск', 16, 8)
