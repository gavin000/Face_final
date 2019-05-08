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


%% 融合部分

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
title('融合后的图');


