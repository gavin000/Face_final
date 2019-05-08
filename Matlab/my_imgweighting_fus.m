function yu=my_imgweighting_fus(I1,I2)

%
% 加权算法融合
% 输入：
%     I1：图像1低频小波系数
%     I2：图像2低频小波系数
% 输出：
%     yu：融合后的低频小波系数
%

% 加权算法融合

% 获取尺寸
[size_M,size_N]=size(I1);

% 设置权值1
set_weight=0.5;
yu=zeros(size_M,size_N);

% 像素加权融合
for i=1:size_M
    for j=1:size_N
        
        % 加权融合
        yu(i,j)=I1(i,j)*set_weight+I2(i,j)*(1-set_weight);     
    end
end

end

