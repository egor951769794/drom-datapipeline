from bs4 import BeautifulSoup as bs4
from get_first_unpromoted_page import get_first_unpromoted_page
from create_bull_json import create_bull_json
from misc.get_request import get_request
from misc.constants import DROM_BASE_URL, REGIONS


def collect_data_tmp(region, n_pages, page=None):
    if not page:
        page = get_first_unpromoted_page(region)
    for current_page in range(page, page + n_pages):
        url = DROM_BASE_URL + '/' + REGIONS[region] + '/all/page' + str(current_page)
        
        r = get_request(url)
        bulls_list = bs4(r.text).find_all("div", {"data-ftid": "bulls-list_bull"})
    
        for bull in bulls_list:
            if ('bull_promotion_3' not in bull.find("a", {"data-ftid": "bull_title"}).previous_element.attrs.values()):
                # producer logic here
                bull_info = create_bull_json(bull)
                bull_info['images'] = None
                print(bull_info)
