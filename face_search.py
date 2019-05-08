# -*- coding: utf-8 -*-
import requests
from json import JSONDecoder
import cv2
import os
from math import log
from glob import glob

http_url = 'https://api-cn.faceplusplus.com/facepp/v3/search'
key = "_jrlKoRf22Ex6XKzLjmxI9X-8B4tN6O5"
secret = "NQnD1R6kLAd6UnIrPJQ7ZNvkTD_8jjkD"

faceId1 = "Adam Driver.jpg"

data = {"api_key": key, "api_secret": secret, "outer_id": "Gavin"}

files = {"image_file": open(faceId1, "rb")}
response = requests.post(http_url, data=data, files=files)
    
req_con = response.content.decode('utf-8')
req_dict = JSONDecoder().decode(req_con)
    
        
print(req_dict)