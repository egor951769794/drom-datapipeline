from bs4 import BeautifulSoup as bs4
import re
from misc.get_request import get_request
from misc.sleep import sleep


def get_additional_bull_info(url, attempt=0):
    
    r = get_request(url)

    if not r:
        if attempt < 10:
            sleep(5, 2)
            return get_additional_bull_info(url, attempt=attempt+1)
        else:
            return [None] * 9

    color = steering = passportIssues = company = penalties = owners = prevBulls = date = additionalPhotos = None

    page = bs4(r.text, "html.parser")
    if page.find('tr', {'data-ftid': 'specification-color'}):
        color = page.find('tr', {'data-ftid': 'specification-color'}).find('td').text

    if page.find('tr', {'data-ftid': 'specification-wheel'}):
        steering = page.find('tr', {'data-ftid': 'specification-wheel'}).find('td').text

    if re.findall(r'не совпада[а-я]{1}т с ПТС', str(page)):
        passportIssues = True
    elif re.findall(r'Характеристики совпадают с ПТС', str(page)):
        passportIssues = False

    company = len(re.findall(r'Был во владении у юр. лица', str(page))) > 0

    penalties = len(re.findall(r'Есть ограничения', str(page))) > 0

    if re.findall(r'[0-9]{1,4} запис[а-я]{1,2} о регистрации', str(page)):
        owners = int(re.findall(r'[0-9]{1,4} запис[а-я]{1,2} о регистрации', str(page))[0].split(sep=' ')[0])
    elif page.find('tr', {'data-ftid': 'specification-owners'}):
        owners = int(page.find('tr', {'data-ftid': 'specification-owners'}).find('td').text.split(sep=' ')[0])

    if re.findall(r'[0-9]{1,3} предыдущих объявлени[а-я]{1}', str(page)):
        prevBulls = int(re.findall(r'[0-9]{1,3} предыдущих объявлени[а-я]{1}', str(page))[0].split(sep=' ')[0])

    if page.find('div', {"data-ftid": "bull-page_bull-gallery_thumbnails"}):
        additionalPhotos = [pic.attrs['href'] for pic in page.find('div', {"data-ftid": "bull-page_bull-gallery_thumbnails"}).find_all('a')][:5]

    if re.findall(r'[0-9]{2}.[0-1]{1}[0-9]{1}.20[0-9]{2}', str(page.find('div', {'data-ftid': 'bull-page_bull-views'}).text)):
        date_ = re.findall(r'[0-9]{2}.[0-1]{1}[0-9]{1}.20[0-9]{2}', str(page.find('div', {'data-ftid': 'bull-page_bull-views'}).text))[0].split(sep='.')
        date = f'{date_[2]}-{date_[1]}-{date_[0]}'

    sleep(1, 0.15)
        
    return color, steering, passportIssues, company, penalties, owners, prevBulls, date, additionalPhotos
