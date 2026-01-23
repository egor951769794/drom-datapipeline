import requests
from numpy.random import normal
from .sleep import sleep
from .constants import REQUEST_USER_AGENT


def get_request(url, try_after_429=False):
    try:
        response = requests.get(url, headers = {'User-agent': REQUEST_USER_AGENT})
        return response
    except requests.exceptions.HTTPError as http_error:
        if http_error.status == 429:
            print(f"Request error 429: Too Many Requests occured. Retry-After values was: {response.headers['Retry-After']}. Freezing for time specified...")
            sleep(int(response.headers["Retry-After"]) + abs(normal(10, 3)), 0)
            # To perform a try on the same url after waiting
            if not try_after_429:
                get_request(url, try_after_429=True)
                
    # except requests.exceptions.RequestException as e:
    #     print(f"Request error occured: {e}")
    #     return 0
