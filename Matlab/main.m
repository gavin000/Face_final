clear 
clc
close all



[filename,pathname,filter] = uigetfile({'*.jpg;*.jpeg;*.bmp;*.gif;*.png'},'1');
if filter == 0
    return
end
str = fullfile(pathname,filename);
I1=imread(str);


[filename,pathname,filter] = uigetfile({'*.jpg;*.jpeg;*.bmp;*.gif;*.png'},'2');
if filter == 0
    return
end
str = fullfile(pathname,filename);
I2=imread(str);


figure
imshow(I1);
title('1');


figure
imshow(I2);
title('2');


% Create a detector object.
% Detect objects using the Viola-Jones algorithm
% Detects faces that are upright and forward facing. This model is composed of weak classifiers
% based on the classification and regression tree analysis (CART). 
% These classifiers use Haar features to encode facial features. 
% CART-based classifiers provide the ability to model higher-order dependencies between facial features. 
faceDetector = vision.CascadeObjectDetector;
 
% Detect faces
bboxes1 = step(faceDetector, I1);

% Annotate detected faces
% IFaces = insertObjectAnnotation(I, 'rectangle', bboxes,'face');
% figure
% imshow(IFaces)
% title('Detected faces');

figure
imshow(I1)
title('1')
hold on
% img_box=I1(bboxes(i,2):bboxes(i,2)+bboxes(i,4)-1,bboxes(i,1):bboxes(i,1)+bboxes(i,3)-1,:);

for i=1:length(bboxes1(:,1))
    rectangle('Position',bboxes1(i,:),'EdgeColor','g') 
end


% Detect faces
bboxes2 = step(faceDetector, I2);

% Annotate detected faces
% IFaces = insertObjectAnnotation(I, 'rectangle', bboxes,'face');
% figure
% imshow(IFaces)
% title('Detected faces');


figure
imshow(I2)
title('2')
hold on
% img_box=I1(bboxes(i,2):bboxes(i,2)+bboxes(i,4)-1,bboxes(i,1):bboxes(i,1)+bboxes(i,3)-1,:);

for i=1:length(bboxes2(:,1))
    rectangle('Position',bboxes2(i,:),'EdgeColor','g') 
end




Img1_face_box1=I1(bboxes1(i,2):bboxes1(i,2)+bboxes1(i,4)-1,bboxes1(i,1):bboxes1(i,1)+bboxes1(i,3)-1,:);
Img2_face_box1=I2(bboxes1(i,2):bboxes1(i,2)+bboxes1(i,4)-1,bboxes1(i,1):bboxes1(i,1)+bboxes1(i,3)-1,:);
Img2_face_box1=imresize(Img2_face_box1,[size(Img1_face_box1,1),size(Img1_face_box1,2)]);




Img_face1=my_wave_fuse(Img1_face_box1,Img2_face_box1);


Img_face1=uint8(Img_face1);

figure
imshow(Img_face1);
title('3');



set_weight=0.5;


Img_background=my_img_weighting_fuse(I1,I2,set_weight);


figure
imshow(Img_background);
title('4');



i=1;
Img_background(bboxes1(i,2):bboxes1(i,2)+bboxes1(i,4)-1,bboxes1(i,1):bboxes1(i,1)+bboxes1(i,3)-1,:)=Img_face1;



Img_fus=uint8(Img_background);

figure
imshow(Img_fus);
title('5');



