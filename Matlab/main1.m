clear 
clc
close all


%% 
%  人面定位融合算法
%

%% 读取图像部分

% 读取图像
[filename,pathname,filter] = uigetfile({'*.jpg;*.jpeg;*.bmp;*.gif;*.png'},'选择图片融合1');
if filter == 0
    return
end
str = fullfile(pathname,filename);
I1=imread(str);

% 读取图像
[filename,pathname,filter] = uigetfile({'*.jpg;*.jpeg;*.bmp;*.gif;*.png'},'选择图片融合2');
if filter == 0
    return
end
str = fullfile(pathname,filename);
I2=imread(str);

% 显示
figure
imshow(I1);
title('图1');

% 显示
figure
imshow(I2);
title('图2');


%% 定位人面部分

% Create a detector object.
% Detect objects using the Viola-Jones algorithm
% 在AdaBoost算法的基础上，使用Haar-like小波特征和积分图方法进行人脸检测

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

% 结果显示
figure
imshow(I1)
title('人面定位')
hold on
% img_box=I1(bboxes(i,2):bboxes(i,2)+bboxes(i,4)-1,bboxes(i,1):bboxes(i,1)+bboxes(i,3)-1,:);
% 显示定位框
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

% 结果显示
figure
imshow(I2)
title('人面定位')
hold on
% img_box=I1(bboxes(i,2):bboxes(i,2)+bboxes(i,4)-1,bboxes(i,1):bboxes(i,1)+bboxes(i,3)-1,:);
% 显示定位框
for i=1:length(bboxes2(:,1))
    rectangle('Position',bboxes2(i,:),'EdgeColor','g') 
end


%% 人面融合部分

% 获取图1 图2的人面
Img1_face_box1=I1(bboxes1(i,2):bboxes1(i,2)+bboxes1(i,4)-1,bboxes1(i,1):bboxes1(i,1)+bboxes1(i,3)-1,:);
Img2_face_box1=I2(bboxes1(i,2):bboxes1(i,2)+bboxes1(i,4)-1,bboxes1(i,1):bboxes1(i,1)+bboxes1(i,3)-1,:);

% 人面区域缩放到一致分辨率
Img2_face_box1=imresize(Img2_face_box1,[size(Img1_face_box1,1),size(Img1_face_box1,2)]);


%% 进行人面融合

% 小波融合
% Img_face1=my_wave_fuse(Img1_face_box1,Img2_face_box1);

% 高斯融合
Img_face1(:,:,1)=my_gauss_fuse(Img1_face_box1(:,:,1),Img2_face_box1(:,:,1));
Img_face1(:,:,2)=my_gauss_fuse(Img1_face_box1(:,:,2),Img2_face_box1(:,:,2));
Img_face1(:,:,3)=my_gauss_fuse(Img1_face_box1(:,:,3),Img2_face_box1(:,:,3));

% 数据类型转换
Img_face1=uint8(Img_face1);

% 显示
figure
imshow(Img_face1);
title('融合后人面');


%% 背景融合部分
%#function vision
% % 设置背景图1的权值
% set_weight=0.5;
% 
% % 加权融合
% Img_background=my_img_weighting_fuse(I1,I2,set_weight);

% 高斯融合
Img_background(:,:,1)=my_gauss_fuse(I1(:,:,1),I2(:,:,1));
Img_background(:,:,2)=my_gauss_fuse(I1(:,:,2),I2(:,:,2));
Img_background(:,:,3)=my_gauss_fuse(I1(:,:,3),I2(:,:,3));

% 显示
figure
imshow(Img_background);
title('融合背景后的图');


%% 人面、背景融合

% 将融合后的人面替换背景的人面1
i=1;
Img_background(bboxes1(i,2):bboxes1(i,2)+bboxes1(i,4)-1,bboxes1(i,1):bboxes1(i,1)+bboxes1(i,3)-1,:)=Img_face1;


% 数据类型转换
Img_fus=uint8(Img_background);

% 显示
figure
imshow(Img_fus);
title('融合后的结果图');



