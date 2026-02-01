import requests
from bs4 import BeautifulSoup as bs4
from bs4 import Tag
from numpy.random import normal
from .sleep import sleep
from .constants import REQUEST_USER_AGENT


def get_request(url, second_try=False, find_tag=None):
    try:
        response = requests.get(url, headers = {'User-agent': REQUEST_USER_AGENT})
        if find_tag and bs4(response.text, "html.parser").find(find_tag[0], find_tag[1]):
            return response
        elif "text/html" not in response.headers.get('content-type') or bs4(response.text, "html.parser").find() is not None:
            return response
        else:
            return None
    except requests.exceptions.HTTPError as http_error:
        if http_error.status == 429:
            print(f"Request error 429: Too Many Requests occured. Retry-After values was: {response.headers['Retry-After']}. Freezing for time specified...")
            sleep(int(response.headers["Retry-After"]) + abs(normal(10, 3)), 0)
            # To perform a try on the same url after waiting
            if not second_try:
                return get_request(url, second_try=True)
                
