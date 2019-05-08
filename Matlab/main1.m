clear 
clc
close all


%% 
%  ���涨λ�ں��㷨
%

%% ��ȡͼ�񲿷�

% ��ȡͼ��
[filename,pathname,filter] = uigetfile({'*.jpg;*.jpeg;*.bmp;*.gif;*.png'},'ѡ��ͼƬ�ں�1');
if filter == 0
    return
end
str = fullfile(pathname,filename);
I1=imread(str);

% ��ȡͼ��
[filename,pathname,filter] = uigetfile({'*.jpg;*.jpeg;*.bmp;*.gif;*.png'},'ѡ��ͼƬ�ں�2');
if filter == 0
    return
end
str = fullfile(pathname,filename);
I2=imread(str);

% ��ʾ
figure
imshow(I1);
title('ͼ1');

% ��ʾ
figure
imshow(I2);
title('ͼ2');


%% ��λ���沿��

% Create a detector object.
% Detect objects using the Viola-Jones algorithm
% ��AdaBoost�㷨�Ļ����ϣ�ʹ��Haar-likeС�������ͻ���ͼ���������������

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

% �����ʾ
figure
imshow(I1)
title('���涨λ')
hold on
% img_box=I1(bboxes(i,2):bboxes(i,2)+bboxes(i,4)-1,bboxes(i,1):bboxes(i,1)+bboxes(i,3)-1,:);
% ��ʾ��λ��
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

% �����ʾ
figure
imshow(I2)
title('���涨λ')
hold on
% img_box=I1(bboxes(i,2):bboxes(i,2)+bboxes(i,4)-1,bboxes(i,1):bboxes(i,1)+bboxes(i,3)-1,:);
% ��ʾ��λ��
for i=1:length(bboxes2(:,1))
    rectangle('Position',bboxes2(i,:),'EdgeColor','g') 
end


%% �����ںϲ���

% ��ȡͼ1 ͼ2������
Img1_face_box1=I1(bboxes1(i,2):bboxes1(i,2)+bboxes1(i,4)-1,bboxes1(i,1):bboxes1(i,1)+bboxes1(i,3)-1,:);
Img2_face_box1=I2(bboxes1(i,2):bboxes1(i,2)+bboxes1(i,4)-1,bboxes1(i,1):bboxes1(i,1)+bboxes1(i,3)-1,:);

% �����������ŵ�һ�·ֱ���
Img2_face_box1=imresize(Img2_face_box1,[size(Img1_face_box1,1),size(Img1_face_box1,2)]);


%% ���������ں�

% С���ں�
% Img_face1=my_wave_fuse(Img1_face_box1,Img2_face_box1);

% ��˹�ں�
Img_face1(:,:,1)=my_gauss_fuse(Img1_face_box1(:,:,1),Img2_face_box1(:,:,1));
Img_face1(:,:,2)=my_gauss_fuse(Img1_face_box1(:,:,2),Img2_face_box1(:,:,2));
Img_face1(:,:,3)=my_gauss_fuse(Img1_face_box1(:,:,3),Img2_face_box1(:,:,3));

% ��������ת��
Img_face1=uint8(Img_face1);

% ��ʾ
figure
imshow(Img_face1);
title('�ںϺ�����');


%% �����ںϲ���
%#function vision
% % ���ñ���ͼ1��Ȩֵ
% set_weight=0.5;
% 
% % ��Ȩ�ں�
% Img_background=my_img_weighting_fuse(I1,I2,set_weight);

% ��˹�ں�
Img_background(:,:,1)=my_gauss_fuse(I1(:,:,1),I2(:,:,1));
Img_background(:,:,2)=my_gauss_fuse(I1(:,:,2),I2(:,:,2));
Img_background(:,:,3)=my_gauss_fuse(I1(:,:,3),I2(:,:,3));

% ��ʾ
figure
imshow(Img_background);
title('�ںϱ������ͼ');


%% ���桢�����ں�

% ���ںϺ�������滻����������1
i=1;
Img_background(bboxes1(i,2):bboxes1(i,2)+bboxes1(i,4)-1,bboxes1(i,1):bboxes1(i,1)+bboxes1(i,3)-1,:)=Img_face1;


% ��������ת��
Img_fus=uint8(Img_background);

% ��ʾ
figure
imshow(Img_fus);
title('�ںϺ�Ľ��ͼ');



