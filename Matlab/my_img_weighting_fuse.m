function yu=my_img_weighting_fuse(I1,I2,set_weight1)

%
% 加权算法融合
% 输入：
%     I1：图像1
%     I2：图像2
% 输出：
%     yu：融合后的图像
%

% 数据类型转换
I1=double(I1);
I2=double(I2);

% 获取尺寸
[size_M,size_N,C]=size(I1);

% 设置结果变量
yu=zeros(size_M,size_N,C);

% 加权融合
if C>1
    yu(:,:,1)=I1(:,:,1).*set_weight1+I2(:,:,1).*(1-set_weight1);
    yu(:,:,2)=I1(:,:,2).*set_weight1+I2(:,:,2).*(1-set_weight1);
    yu(:,:,3)=I1(:,:,3).*set_weight1+I2(:,:,3).*(1-set_weight1);
else
    yu=I1.*set_weight1+I2.*(1-set_weight1);
end

% 数据类型转换
yu=uint8(yu);

end

