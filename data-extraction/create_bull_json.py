from misc.constants import MANUFACTURERS
import re
import json
from misc.sleep import sleep
from misc.encode_images import encode_images
from misc.generate_image_id import generate_image_id
from get_additional_bull_info import get_additional_bull_info
from datetime import datetime


def create_bull_json(bull):

    car = dict()

    car['timeReceived'] = datetime.now()
    
    car['bullUrl'] = bull.find("a", {"data-ftid": "bull_title"}).attrs['href']
    
    car['imageUrls'] = [pic.attrs['src'] for pic in bull.find('div', {'data-ftid': 'bull_image'}).find_all('img')]

    car_name = bull.find('h3').text.split(sep=', ')[0]
    car['manufacturer'] = [mf for mf in MANUFACTURERS if mf in car_name][0]
    car['model'] = car_name.replace(car['manufacturer'], "")[1:]
    car['year'] = int(bull.find('h3').text.split(sep=', ')[1])
    if bull.find('div', {"data-ftid": "bull_subtitle"}):
        car['config'] = bull.find('div', {"data-ftid": "bull_subtitle"}).text
    else:
        car['config'] = None

    car['engineCapacity'] = None
    car['enginePower'] = None
    car['engineType'] = None
    car['transmissionType'] = None
    car['wheelDrive'] = None
    car['mileage'] = None

    description = bull.find("div", {"data-ftid": "component_inline-bull-description"})\

    if re.findall(r'\d{1,2}\.\d', str(description)):
        car['engineCapacity'] = float(re.findall(r'\d{1,2}\.\d', str(description))[0])

    fuels = ['бензин', 'дизель', 'электро', 'гибрид', 'ГБО']
    for fuel in fuels:
        if fuel in str(description):
            car['engineType'] = fuel
            break

    if re.findall(r'\(\d{1,4}\s[а-я]{1}\.[а-я]{1}\.\)', str(description)):
        car['enginePower'] = int(re.findall(r'\(\d{1,4}\s[а-я]{1}\.[а-я]{1}\.\)', str(description))[0].split(sep=' ')[0].replace("(", ""))

    transmission_types = ['АКПП', 'робот', 'вариатор', 'механика']
    for t_type in transmission_types:
        if t_type in str(description):
            car['transmissionType'] = t_type
            break

    wheel_drives = ['4WD', 'передний', 'задний']
    for w_drive in wheel_drives:
        if w_drive in str(description):
            car['wheelDrive'] = w_drive
            break

    if re.findall(r'(?:[1-9]\d{0,2}(?: \d{3})*|0)\sкм', str(description)):
        car['mileage'] = int(re.findall(r'(?:[1-9]\d{0,2}(?: \d{3})*|0)\sкм', str(description))[0].replace(" ", "").replace("км", ""))
    
        
    car['isNew'] = len(bull.find_all("div", {"data-ftid": "bull_label_new"})) \
        + len(bull.find_all("div", {"data-ftid": "bull_label_new-unofficial"})) > 0
    
    car['byOrder'] = len(bull.find_all("div", {"data-ftid": "bull_label_by-order-from-abroad"})) \
        + len(bull.find_all("div", {"data-ftid": "bull_label_abroad"})) > 0
    
    car['noMileageInRussia'] = len(bull.find_all("div", {"data-ftid": "bull_label-without-mileage-in-russia"})) > 0
    
    car['fromOwner'] = len(bull.find_all("div", {"data-ftid": "bull_label_owner"})) > 0
    
    car['priceRub'] = int(bull.find("span", {"data-ftid": "bull_price"}).text.replace("\xa0", ""))
    
    car['location'] = bull.find("span", {"data-ftid": "bull_location"}).text

    car['broken'] = len(bull.find_all("div", {"data-ftid": "bull_label_broken"})) > 0

    car['noDocs'] = len(bull.find_all("div", {"data-ftid": "bull_label_nodocs"})) > 0

    sleep(4, 0.7)

    car['color'], car['steering'], car['passportIssues'], car['ownedByCompany'], car['hasPenalties'],\
    car['numOfOwners'], car['numOfPreviousBulls'], car['date'], additionalPhotos = get_additional_bull_info(car['bull_url'])

    if additionalPhotos:
        car['imageUrls'] = additionalPhotos

    image_ids = [generate_image_id(url) for url in car['imageUrls']]
    image_bytes = encode_images(car['imageUrls'])
    
    car['imageIds'] = image_ids

    return json.dumps(car, ensure_ascii=False, default=str), image_ids, image_bytes
