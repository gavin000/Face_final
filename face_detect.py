# -*- coding: utf-8 -*-
import requests
from json import JSONDecoder
import cv2
import os
from math import log
from glob import glob

http_url = 'https://api-cn.faceplusplus.com/facepp/v3/detect'
key = "_jrlKoRf22Ex6XKzLjmxI9X-8B4tN6O5"
secret = "NQnD1R6kLAd6UnIrPJQ7ZNvkTD_8jjkD"



filepath = glob("Movie celebertiy"+"/*jpg")
for file in filepath:
    data = {"api_key": key, "api_secret": secret, "return_attributes": "gender,age"}
    files = {"image_file": open(file, "rb")}
    response = requests.post(http_url, data=data, files=files)

    req_con = response.content.decode('utf-8')
    req_dict = JSONDecoder().decode(req_con)
    print(req_dict)

