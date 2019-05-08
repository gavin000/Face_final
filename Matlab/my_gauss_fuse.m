function resimg=my_gauss_fuse(Image1,Image2)

%% ��˹�ں�

% ת�Ҷ�ͼ
[M,N,C]=size(Image1);
if C>1
    Image1=rgb2gray(Image1);
end

[M,N,C]=size(Image2);
if C>1
    Image2=rgb2gray(Image2);
end

% ���и�˹��ͨ�˲�����
IA=Image1;
[f1,f2]=freqspace(size(IA),'meshgrid'); 
% ���ý�ֹƵ��
% D=100/size(IA,1); 
D=0.2;

r=f1.^2+f2.^2;  
for i=1:size(IA,1)     
    for j=1:size(IA,2)     
        t=r(i,j)/(D*D);      
        Hd(i,j)=1-exp(-t);    
    end
end
% Ƶ���˲�
Y=fft2(double(IA));
Y=fftshift(Y);
Ya=Y.*Hd; 
Ya=ifftshift(Ya);
Ia=real(ifft2(Ya));

resimg1=uint8(Ia);

% ���и�˹��ͨ�˲�����
IA=Image2;
[f1,f2]=freqspace(size(IA),'meshgrid'); 
% ���ý�ֹƵ��
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
% Ƶ���˲�
Y=fft2(double(IA)); 
Y=fftshift(Y);
Ya=Y.*Hd; 
Ya=ifftshift(Ya); 
Ia=real(ifft2(Ya)); 
resimg2=uint8(Ia);

% �ں�ͼ��
resimg=imadd(resimg1,resimg2);

end



