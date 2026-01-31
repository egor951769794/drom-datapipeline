from bs4 import BeautifulSoup as bs4
import copy
from get_first_unpromoted_page import get_first_unpromoted_page
from create_bull_json import create_bull_json
from misc.get_request import get_request
from misc.sleep import sleep
from misc.constants import DROM_BASE_URL, REGIONS, PRODUCER_BOOTSTRAP_SERVERS
from datetime import datetime
import pickle

from kafka import KafkaProducer
from kafka.errors import NoBrokersAvailable


def bulls_listener(region=None, page=None):

    if not page:
        print("[" + str(datetime.now()) + "] ", "Optimal page for listening is not provided. Searching...")

        page = get_first_unpromoted_page(region)

    try:
        with open('data-extraction/misc/lastbulletin.pickle', 'rb') as file:
            print("[" + str(datetime.now()) + "] ", "Found existing last bulletin file")
            last_bull = pickle.load(file)
    except EOFError:
        last_bull = None
    except FileNotFoundError:
        last_bull = None

    first_bull = None
    
    url = DROM_BASE_URL + '/' + REGIONS[region] + 'all/page' + str(page)

    try:
        producer = KafkaProducer(bootstrap_servers=PRODUCER_BOOTSTRAP_SERVERS, enable_idempotence=True, acks='all')

        print("[" + str(datetime.now()) + "] ", "Drom bulletins listener created. Press Ctrl+C for exit\n\n")

        while True:
            r = get_request(url, find_tag=["div", {"data-bulletin-list": "true"}])
            
            if not r:
                sleep(10, 3)
                continue

            all_bulls = bs4(r.text, "html.parser").find("div", {"data-bulletin-list": "true"}) 
            if len(all_bulls.find_all("div", {"data-ftid": "bull_promotion_3"})) in [20, 0]:
                print("[" + str(datetime.now()) + "] ", "Optimal page for listening may changed. Searching for new one...")
                
                page, r = get_first_unpromoted_page(region)

                print("[" + str(datetime.now()) + "] ", f"Optimal page for listening is now №{page}")

            bulls_list = bs4(r.text, "html.parser").find_all("div", {"data-ftid": "bulls-list_bull"})
            first_encountered = False
            for bull in bulls_list:
                if ('bull_promotion_3' not in bull.find("a", {"data-ftid": "bull_title"}).previous_element.attrs.values()):
                    if not first_encountered:
                        first_encountered = True
                        first_bull = copy.copy(bull)
                    if last_bull != None and (bull.find('h3').text, bull.find('span', {'data-ftid': 'bull_price'})) == \
                    (last_bull.find('h3').text, last_bull.find('span', {'data-ftid': 'bull_price'})):
                        break
                    else:
                        bull_info, image_ids, image_bytes = create_bull_json(bull)
                        print("[" + str(datetime.now()) + "] ", "New bulletin found. Sending to Kafka...")
                        producer.send(topic='drom.bulletin.posted', value=bull_info.encode('utf-8'))
                        for id, image_byte in zip(image_ids, image_bytes):
                            producer.send(topic='drom.bulletin.pictures', key=id.encode('utf-8'), value=image_byte)

            last_bull = copy.copy(first_bull)
            with open ('data-extraction/misc/lastbulletin.pickle', 'wb') as file:
                pickle.dump(last_bull, file)

            sleep(60, 10)

    except NoBrokersAvailable:
        print("[" + str(datetime.now()) + "] ", "No Kafka brokers are available at the moment. Quiting...")
    
    except KeyboardInterrupt:
        if last_bull:
            with open ('data-extraction/misc/lastbulletin.pickle', 'wb') as file:
                    pickle.dump(last_bull, file)
        elif first_bull:
            with open ('data-extraction/misc/lastbulletin.pickle', 'wb') as file:
                    pickle.dump(first_bull, file)
        print("[" + str(datetime.now()) + "] ", "Listener execution is over")
        sleep(1, 0)