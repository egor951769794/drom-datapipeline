from bs4 import BeautifulSoup as bs4
from misc.get_request import get_request
from misc.sleep import sleep
from misc.constants import DROM_BASE_URL, REGIONS


def get_first_unpromoted_page(region):
    promoted = True
    page_num = 1
    while promoted:
        r = get_request(DROM_BASE_URL + '/' + REGIONS[region] + '/all/page' + str(page_num))
        all_bulls = bs4(r.text, "html.parser").find("div", {"data-bulletin-list": "true"})
        if len(all_bulls.find_all("div", {"data-ftid": "bull_promotion_3"})) < 20:
            promoted = False
        else:
            page_num += 1
        sleep(5, 1.2)

    return page_num, r
