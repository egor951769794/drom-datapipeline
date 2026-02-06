from datetime import datetime
import sys


from kafka import KafkaProducer
from kafka.errors import NoBrokersAvailable

from misc import PRODUCER_BOOTSTRAP_SERVERS, TAG_CHECKS
from misc.sleep import sleep
from request_module import RequestModule

class BulletinScraper:
    def __init__(self, parser, verbose=True):
        self.parser = parser
        self.session_cache = None
        self.verbose = verbose
        self.request = RequestModule(verbose=verbose)
    
    def log(self, msg, output_mode='console', log_path=None):
        if self.verbose and output_mode == 'console':
            print("[" + str(datetime.now()) + "][BulletinScraper] ", msg, "\n")

    def system_log(self, msg, output_mode='console', log_path=None):
        if output_mode == 'console':
            print("[" + str(datetime.now()) + "][BulletinScraper] ", msg, "\n")

        
    def get_page(self, url):
        res = self.request.get_request(url=url, max_retries=5, tag_to_check=TAG_CHECKS['bulletins_list'], sleep_for=15)
        if res is None:
            self.system_log(f"Unable to get proper bulletins page response. Quitting...")
            sys.exit(1)

        return res.text
            
    def process_page(self, page):

        bulls_list = self.parser.parse_page(page)

        bulls_list_not_parsed = list(filter(self.parser._filter_parsed_bulletin, bulls_list))
        bulls_list_not_promoted = list(filter(self.parser._filter_promoted_bulletin, bulls_list))

        bulls_list_filtered = list(set(bulls_list_not_parsed) & set(bulls_list_not_promoted))


        self.log(f"Got {len(bulls_list_filtered)} new bulletins from page №{self.parser.page}")

        if not self.parser.page_check_iter_countdown:

            if not len(bulls_list_not_promoted):
                self.log("Checking if first unpromoted page changed")

                _url = self.parser.create_url(self.parser.page + 1)
                _res = self.get_page(_url)

                self.parser.check_page(page=_res, dir='next')


            elif len(bulls_list_not_promoted) == 20:
                self.log("Checking if first unpromoted page changed")

                _url = self.parser.create_url(self.parser.page - 1)
                _res = self.get_page(_url)

                self.parser.check_page(page=_res, dir='prev')

        
        for bull in bulls_list_filtered:
            self.process_bulletin(bull)
            sleep(10, 2)


    def process_bulletin(self, bull):
        self.log("Got new bulletin. Processing...")
        bull_info, image_ids, image_bytes = self.parser.parse_bull_json(bull)

        self.log("Bulletin processed. Sending to kafka")
        self.producer.send(topic='drom.bulletin.posted', value=bull_info.encode('utf-8'))

        for id, image_byte in zip(image_ids, image_bytes):
            self.producer.send(topic='drom.bulletin.pictures', key=id.encode('utf-8'), value=image_byte)

        
    def create_producer(self):
        while True:
            try:
                sleep(1, 0)
                producer = KafkaProducer(bootstrap_servers=PRODUCER_BOOTSTRAP_SERVERS, enable_idempotence=True, acks='all')
                self.system_log("Drom bulletins listener created. Press Ctrl+C for exit")

                return producer
            
            except NoBrokersAvailable:
                self.system_log("No Kafka brokers are available at the moment. Retry after 5 sec or press Ctrl+C to exit")

            except KeyboardInterrupt:
                self.system_log("Quitting...")
                sys.exit(0)


    def start(self, page_n=None):
        self.producer = self.create_producer()

        if not page_n or not self.parser.check_unpromoted_page(page=self.get_page(self.parser.create_url(page_n)), page_n=page_n):
            self.log("Looking for starting page...")
            for i in range(8, 20):

                res = self.get_page(self.parser.create_url(i+1))

                if self.parser.check_unpromoted_page(page=res, page_n=i+1):
                    break

            if not self.parser.page:
                self.log("Unable to find starting page")
                sys.exit(1)
                
        try:
            while True:
                
                self.process_page(self.parser.current_page)
                
                sleep(30, 5)

                url = self.parser.create_url()
                self.parser.current_page = self.get_page(url)

        except KeyboardInterrupt:
            self.system_log("Quitting...")
            sys.exit(0)
    