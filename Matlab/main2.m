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


%% �ںϲ���

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
title('�ںϺ��ͼ');


