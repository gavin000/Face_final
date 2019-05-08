
import numpy as np
import os
from scipy.misc import imread, imresize
import matplotlib.pyplot as plt
from glob import glob
import face_recognition
import pandas as pd
from math import log

 
# 读取目录下所有的png图片
file_name=glob("Sport star"+"/*png")
list = []
for file in file_name:
    image = face_recognition.load_image_file(file)
    face_landmarks_list = face_recognition.face_landmarks(image)
    list.append(face_landmarks_list)
print(list[0])

df = pd.DataFrame(columns=['chin', 'left_eyebrow', 'right_eyebrow','nose_bridge','left_eye','right_eye','top_lip','bottom_lip'])
#print(df)
for x in range(len(list)):
   df1 = pd.DataFrame(list[x])
   df = pd.concat([df,df1],ignore_index = True)
#print(df)


#print(df2)
#df.to_excel("11.xlsx", sheet_name='Sheet_name_1')


#for i in range(0,9)
    #for j in range(0,len(list))
        #list1 = df[i][j]
        #list2 = [(elem1,log(elem2)) for elem1, elem2 in ]

#me = pd.DataFrame()
#me
#i = 0
#while i < len(list1):
    #hey = pd.DataFrame(list1[i][0])
    #me = pd.concat([me, hey], axis = 0)
    #i+=1
#me
    
   

#image = face_recognition.load_image_file(files)
#face_locations = face_recognition.face_locations(image)

#face_landmarks_list = face_recognition.face_landmarks(image)
#print(face_landmarks_list)
