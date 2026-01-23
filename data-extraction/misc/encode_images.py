from .sleep import sleep
from .get_request import get_request


def encode_images(image_url_list):
    encoded_images = []
    for image_url in image_url_list:
        encoded_images.append(get_request(image_url).content)
        sleep(3, 0.5)
    return encoded_images