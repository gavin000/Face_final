# -*- coding: utf-8 -*-
import requests
from json import JSONDecoder
import cv2
import os
from math import log
from glob import glob

http_url = 'https://api-us.faceplusplus.com/facepp/v3/compare'
key = "bFA7Hunge0Z3EwcFNaH9fes_5PfaI9Lb"
secret = "PpHsaSE8v5Kz6iQGmt7-fj8D51WMYLvk"

faceId1 = "1.jpg"

filepath1 = glob("Sport star"+"/*jpg")

data = {"api_key":key, "api_secret": secret, "return_attributes": "gender,age,smiling,beauty"}

confident_list = []
for file in filepath1:
    try:
        files = {"image_file1": open(faceId1, "rb"), "image_file2": open(file, "rb")}

        response = requests.post(http_url, data=data, files=files)
    
        req_con = response.content.decode('utf-8')
        req_dict = JSONDecoder().decode(req_con)
    
        
        print(req_dict)
        confident = req_dict['confidence']
        confident_list.append(confident)
        print(confident_list)
    except OSError:
        pass
    continue

#Max_condience = max(confident_list)
#print(Max_condience)
