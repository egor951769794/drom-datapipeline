from bs4 import BeautifulSoup as bs4
import re
from datetime import datetime
import pickle
import json
import hashlib

from misc.constants import MANUFACTURERS, TAG_CHECKS

from misc.sleep import sleep
from request_module import RequestModule

class BulletinParser:
    def __init__(self, url, verbose):

        self.url = url
        self.page = None
        self.current_page = None
        self.page_check_iter_countdown = 0
        self.verbose = verbose
        self.request = RequestModule(verbose=verbose)

        try:
            with open('data-extraction/misc/parsedbulletins.pickle', 'rb') as file:
                self.parsed_bulls = pickle.load(file)
                self.log(f"Found existing parsed bulletins file")
        except EOFError:
            self.parsed_bulls = []
        except FileNotFoundError:
            self.parsed_bulls = []
        except Exception:
            self.log("Unknown exception during last bulletin file reading occured")
            self.parsed_bulls = []
        


    def log(self, msg, output_mode='console', log_path=None):
        if self.verbose and output_mode == 'console':
            print("[" + str(datetime.now()) + "][BulletinParser] ", msg, "\n")

    def create_url(self, page=None):
        if page:
            return self.url + "page" + str(page)
        else:
            return self.url + "page" + str(self.page)

    def check_tag(self, msg, tag_name=None, condition=None):
        try:
            return bs4(msg.text, "html.parser").find(tag_name, condition)
        except AttributeError:
            self.log(f"Tag {tag_name} with specified condition {condition} not found")
            return False

    
    def parse_page(self, page):

        self.page_check_iter_countdown -= 1 if self.page_check_iter_countdown else 0

        try:
            return bs4(page, "html.parser").find_all("div", {"data-ftid": "bulls-list_bull"})
        except AttributeError:
            self.log("Attribute error occured due to incorrect page format")
            return []

    def _filter_promoted_bulletin(self, bull):
        return 'bull_promotion_3' not in bull.find("a", {"data-ftid": "bull_title"}).previous_element.attrs.values()

    def _filter_parsed_bulletin(self, bull):
        bull_url = bull.find("a", {"data-ftid": "bull_title"}).attrs["href"] 
        bull_id = re.findall("(?<=\/)[0-9]{6,9}(?=.html)", bull_url)
        return bull_id not in self.parsed_bulls

    def filter_bulletin(self, bull):
        return self._filter_parsed_bulletin(bull) and self._filter_promoted_bulletin(bull)

    def check_page(self, page, dir=None, page_n=None):

        if page_n:
            self.log(f"Checking page № {page_n}")

        bulls_list = self.parse_page(page)
        bulls_list_filtered = list(filter(self.filter_bulletin, bulls_list))

        if len(bulls_list_filtered):
            self.page_check_iter_countdown = 3

            self.current_page = page

            if dir == 'next':
                self.page += 1

            elif dir == 'prev':
                self.page -= 1
            
            else:
                self.page = page_n
            
            self.log(f"Setting page №{self.page} for listening")
            self.current_page = page
            return True
        
        return False
    
    def encode_images(self, image_url_list):
        encoded_images = []
        for image_url in image_url_list:
            encoded_images.append(self.request.get_request(image_url, max_retries=1, sleep_for=2).content)
        return encoded_images

    def generate_image_id(self, url):
        return "img_" + hashlib.md5(url.encode()).hexdigest()[:8]

    def parse_bull_json(self, bull):

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
        car['numOfOwners'], car['numOfPreviousBulls'], car['date'], additional_photos = self.get_additional_bull_info(car['bullUrl'])

        if additional_photos:
            car['imageUrls'] = additional_photos

        image_ids = [self.generate_image_id(url) for url in car['imageUrls']]
        image_bytes = self.encode_images(car['imageUrls'])
        
        car['imageIds'] = image_ids


        bull_url = bull.find("a", {"data-ftid": "bull_title"}).attrs["href"]
        self.parsed_bulls.append(re.findall("(?<=\/)[0-9]{6,9}(?=.html)", bull_url))
        self.parsed_bulls = self.parsed_bulls[-400:]

        with open('data-extraction/misc/parsedbulletins.pickle', 'wb') as file:
            pickle.dump(self.parsed_bulls, file)

        return json.dumps(car, ensure_ascii=False, default=str), image_ids, image_bytes
    
    
    def get_additional_bull_info(self, url):
        
        r = self.request.get_request(url, max_retries=3, tag_to_check=TAG_CHECKS['bulletin'], sleep_for=7)

        color = steering = passportIssues = company = penalties = owners = prevBulls = date = additionalPhotos = None

        if r is None:
                return color, steering, passportIssues, company, penalties, owners, prevBulls, date, additionalPhotos

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
