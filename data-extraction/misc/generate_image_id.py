import hashlib


def generate_image_id(url):
    return "img_" + hashlib.md5(url.encode()).hexdigest()[:8]
