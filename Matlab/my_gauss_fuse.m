function resimg=my_gauss_fuse(Image1,Image2)

%% 高斯融合

% 转灰度图
[M,N,C]=size(Image1);
if C>1
    Image1=rgb2gray(Image1);
end

[M,N,C]=size(Image2);
if C>1
    Image2=rgb2gray(Image2);
end

% 进行高斯高通滤波处理
IA=Image1;
[f1,f2]=freqspace(size(IA),'meshgrid'); 
% 设置截止频率
% D=100/size(IA,1); 
D=0.2;

r=f1.^2+f2.^2;  
for i=1:size(IA,1)     
    for j=1:size(IA,2)     
        t=r(i,j)/(D*D);      
        Hd(i,j)=1-exp(-t);    
    end
end
% 频域滤波
Y=fft2(double(IA));
Y=fftshift(Y);
Ya=Y.*Hd; 
Ya=ifftshift(Ya);
Ia=real(ifft2(Ya));

resimg1=uint8(Ia);

% 进行高斯低通滤波处理
IA=Image2;
[f1,f2]=freqspace(size(IA),'meshgrid'); 
% 设置截止频率
% D=100/size(IA,1); 
D=0.1;

r=f1.^2+f2.^2; 
Hd=ones(size(IA)); 
for i=1:size(IA,1)    
    for j=1:size(IA,2)       
        t=r(i,j)/(D*D);       
        Hd(i,j)=exp(-t);  
    end
end
% 频域滤波
Y=fft2(double(IA)); 
Y=fftshift(Y);
Ya=Y.*Hd; 
Ya=ifftshift(Ya); 
Ia=real(ifft2(Ya)); 
resimg2=uint8(Ia);

% 融合图像
resimg=imadd(resimg1,resimg2);

end



