from misc.sleep import sleep
import requests
from datetime import datetime
from misc.constants import REQUEST_USER_AGENT
from bs4 import BeautifulSoup as bs4


class RequestModule:
    def __init__(self, verbose):
        self.verbose = verbose
        self.cached_response = None
        self.satisfied_conditions = 0

    def check_tag(self, msg, tag_name=None, condition=None):
        try:
            return bs4(msg.text, "html.parser").find(tag_name, condition)
        except AttributeError:
            if tag_name:
                self.log(f"Tag {tag_name} with specified condition {condition} not found")
            return False

    def log(self, msg, output_mode='console', log_path=None):
        if self.verbose and output_mode == 'console':
            print("[" + str(datetime.now()) + "][RequestModule] ", msg, "\n")

    def system_log(self, msg, output_mode='console', log_path=None):
        if output_mode == 'console':
            print("[" + str(datetime.now()) + "][BulletinScraper] ", msg, "\n")

    def check_429(self, page):
        return False

    def get_request(self, url, max_retries=3, current_try=1, tag_to_check=None, sleep_for=10):
        try:
            response = requests.get(url, headers = {'User-agent': REQUEST_USER_AGENT})
            sleep(sleep_for, sleep_for / 4)

            if self.check_429(response.text):
                self.system_log(f"Request error 429: Too Many Requests occured. Freezing for 10 minutes...")
                sleep(600, 5)

                if current_try < max_retries:
                    return self.get_request(url=url, max_retries=max_retries, current_try=current_try+1, tag_to_check=tag_to_check, sleep_for=sleep_for*1.2)
                
                self.log(f"Couldnt get response after 429 error encounter after {max_retries} retries")
                return None

            if tag_to_check and isinstance(tag_to_check[0], list):
                if current_try > 1:
                    self.log("Perform another response to get better quality data")

                cur_satisfied_conditions = 0
                for tag_condition in tag_to_check:
                    if self.check_tag(response, tag_condition[0], tag_condition[1]):
                        cur_satisfied_conditions += 1
                
                if cur_satisfied_conditions > self.satisfied_conditions:
                    self.satisfied_conditions = cur_satisfied_conditions
                    self.cached_response = response
                
                if self.satisfied_conditions == len(tag_to_check):
                    self.satisfied_conditions = 0
                    self.cached_response = None
                    return response
                
                elif current_try < max_retries:
                    return self.get_request(url=url, max_retries=max_retries, current_try=current_try+1, tag_to_check=tag_to_check, sleep_for=sleep_for*1.2)
                else:
                    self.satisfied_conditions = 0
                    self.cached_response = None
                    return response
                

            elif tag_to_check and self.check_tag(response, tag_to_check[0], tag_to_check[1]):
                return response
            
            elif "text/html" not in response.headers.get('content-type') or (self.check_tag(response) and not tag_to_check):
                return response
            
            elif current_try < max_retries:
                sleep(6, 2)
                self.log(f"Got incorrect response. Will perform another {max_retries - current_try} tries")
                return self.get_request(url=url, max_retries=max_retries, current_try=current_try+1, tag_to_check=tag_to_check, sleep_for=sleep_for*1.2)
  
            self.log(f"Got incorrect response after {max_retries} retries")
            return None
            
        except requests.exceptions.HTTPError as http_error:
            self.system_log(f"Exception with status code {http_error.status} occured in get_request during try №{current_try}")
            sleep(6, 2)

            if current_try < max_retries:
                return self.get_request(url=url, max_retries=max_retries, current_try=current_try+1, tag_to_check=tag_to_check, sleep_for=sleep_for*1.2)
            
            self.log(f"Couldnt get response after HTTP error encounter after {max_retries} retries")
            return None
        
        except Exception as e:
            self.system_log(f"Unknown exception occured in get_request during try №{current_try}: {e}")
            sleep(6, 2)

            if current_try < max_retries:
                return self.get_request(url=url, max_retries=max_retries, current_try=current_try+1, tag_to_check=tag_to_check, sleep_for=sleep_for*1.2)

            self.log(f"Couldnt get response after unknown error encounter after {max_retries} retries")
            return None
