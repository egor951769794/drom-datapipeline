REQUEST_USER_AGENT = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0'

DROM_BASE_URL = "https://auto.drom.ru/"

REGIONS = {
    None: '',
    'Омск': 'omsk/',
    
}

MANUFACTURERS = [
    'Toyota', 'Лада', 'Nissan', 'Honda', 'Hyundai', 'Abrath', 'AC', 'Acura', 'AITO', 'Aiways', 
    'Alfa Romeo', 'Alpina', 'Alpine', 'AMC', 'Arcfox', 'Aro', 'Asia', 'Aston Martin', 'Audi', 'Avatr', 
    'BAIC', 'Baojun', 'Barkas', 'BAW', 'Belgee', 'Bentley', 'Bestune', 'BMW', 'Borgward', 'Brilliance', 
    'Bugatti', 'Buick', 'BYD', 'Cadillac', 'Changan', 'Changfeng', 'Changhe', 'Chery', 'Chevrolet', 'Chrysler', 
    'Ciimo', 'Citroen', 'Cupra', 'Dacia', 'Dadi', 'Daewoo', 'Daihatsu', 'Daimler', 'Datsun', 'Dayun', 
    'DeLorean', 'Denza', 'Derways', 'Dodge', 'Dongfeng', 'Dorcen', 'DW Hower', 'Eagle', 'Enovate', 'Eonyx', 
    'EXEED', 'FAW', 'Ferrari', 'Fiat', 'Fisker', 'Ford', 'Forthing', 'Foton', 'FSO', 'GAC', 
    'Geely', 'Genesis', 'Geo', 'GMC', 'Great Wall', 'Hafei', 'Haima', 'Hanteng', 'Haval', 'Hawtai', 
    'HiPhi', 'Holden', 'iCAR', 'Hongqi', 'Hozon', 'Huaihai', 'Huazi', 'Hummer', 'Hycan', 'IM Motors', 
    'Ineos', 'Infiniti', 'Iran Khodro', 'Isuzu', 'IVECO', 'JAC', 'Jaecoo', 'Jaguar', 'Jeep', 'Jetour',
    'Jetta', 'Jidu', 'Jinbei', 'JMC', 'JMEV', 'Jonway', 'Kaiyi', 'Kama', 'Kawei', 'KJ Mobility', 
    'Kia', 'Knewstar', 'Koenigsegg', 'Kuayue', 'Lamborghini', 'Lancia', 'Land Rover', 'Landwind', 'Leapmotor', 'LEVC',
    'Lexus', 'Li', 'Lifan', 'Lincoln', 'Livan', 'Lotus', 'Lucid', 'Luxeed', 'Luxgen', 'Lynk & Co', 
    'M-Hero', 'Maextro', 'Marussia', 'Maserati', 'Maxus', 'Maybach', 'Mazda', 'McLaren', 'Mercedes-Benz', 'Mercury', 
    'MG', 'MINI', 'Mitsubishi', 'Mitsuoka', 'Morgan', 'Nio', 'NordCross', 'Oldsmobile', 'OMODA', 'Opel', 
    'ORA', 'Oshan', 'Oting', 'Packard', 'Pagani', 'Perodua', 'Peugeot', 'Plymouth', 'Polar Stone', 'Polestar', 
    'Pontiac', 'Porsche', 'Proton', 'Qiantu', 'Qingling', 'Qoros', 'Radar', 'RAM', 'Ravon', 'Renault', 
    'Renault Samsung', 'Rimac', 'Rising Auto', 'Rivian', 'Roewe', 'Rolls-Royce', 'Rover', 'Rox', 'Saab', 'SAIPA', 
    'Saturn', 'Scion', 'SEAT', 'Seres', 'Shuanghuan', 'Skoda', 'Skywell', 'Small Sports Car', 'Smart', 'Solaris',
    'Soueast', 'Spyker', 'SRM Shineray', 'SsangYong', 'Stelato', 'Subaru', 'Suzuki', 'SWM', 'Tank', 'TATA', 
    'Tatra', 'Tenet', 'Tesla', 'Tianma', 'Tianye', 'Trabant', 'Vauxhall', 'Venucia', 'VGV', 'Volkswagen', 
    'Volvo', 'Vortex', 'Voyah', 'Wartburg', 'Weltmeister', 'WEY', 'Wiesmann', 'Willys', 'Wuling', 'Xcite', 
    'Xiaomi', 'Xin Kai', 'Xpeng', 'Yema', 'Zeekr', 'Zotye', 'ZX', 'Абмеравто', 'Амбертрак', 'Аурус', 
    'Богдан', 'ГАЗ', 'Донинвест', 'ЗАЗ', 'ЗИЛ', 'ЗиС', 'ИЖ', 'КАМА', 'ЛуАЗ', 'Москвич', 
    'Прочие авто', 'РАФ', 'Соллерс', 'ТагАЗ', 'УАЗ', 'Эволют', 
]

PRODUCER_BOOTSTRAP_SERVERS = ['localhost:9092', 'localhost:9082', 'localhost:9072']

TAG_CHECKS = {
    'bulletins_list': ["div", {"data-bulletin-list": "true"}],
    'bulletin': ["h1", {"data-ftid": "page-title"}]
}
