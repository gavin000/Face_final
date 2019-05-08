function [ca3,ch3,cv3,cd3,ch2,cv2,cd2,ch1,cv1,cd1,s]=my_wave(I,name)

%
% С���ֽ⺯��
% ���룺
%     I��ͼ��
%  name��С������������
% �����
%      ����С���ֽ���ϵ��
%

% name='db1';

% ����С���任
[c,s]=wavedec2(double(I),3,name);

% ��ȡС���任���ϵ��
ca3 = appcoef2(c,s,name,3);
ch3 = detcoef2('h',c,s,3);
cv3 = detcoef2('v',c,s,3);
cd3 = detcoef2('d',c,s,3);
ch2 = detcoef2('h',c,s,2);
cv2 = detcoef2('v',c,s,2);
cd2 = detcoef2('d',c,s,2);
ch1 = detcoef2('h',c,s,1);
cv1 = detcoef2('v',c,s,1);
cd1 = detcoef2('d',c,s,1);

% ��ʾС���任���ͼ��
ca3_img=wcodemat(ca3,255);
ch3_img=wcodemat(ch3,255);
cv3_img=wcodemat(cv3,255);
cd3_img=wcodemat(cd3,255);

ch2_img=wcodemat(ch2,255);
cv2_img=wcodemat(cv2,255);
cd2_img=wcodemat(cd2,255);

ch1_img=wcodemat(ch1,255);
cv1_img=wcodemat(cv1,255);
cd1_img=wcodemat(cd1,255);

% ��ʾ�ֽ���ͼ��
A3=[ca3_img,ch3_img;cv3_img,cd3_img];

% �ߴ����
[size_M,size_N,size_C]=size(ch2_img);
if size_C>1
    A3_temp(:,:,1)=imresize(A3(:,:,1),[size_M,size_N]);
    A3_temp(:,:,2)=imresize(A3(:,:,2),[size_M,size_N]);
    A3_temp(:,:,3)=imresize(A3(:,:,3),[size_M,size_N]);
else
    A3_temp=imresize(A3,[size_M,size_N]);
end
A3=A3_temp;
A2=[A3,ch2_img;cv2_img,cd2_img];

% �ߴ����
[size_M,size_N,size_C]=size(ch1_img);
if size_C>1
    A2_temp(:,:,1)=imresize(A2(:,:,1),[size_M,size_N]);
    A2_temp(:,:,2)=imresize(A2(:,:,2),[size_M,size_N]);
    A2_temp(:,:,3)=imresize(A2(:,:,3),[size_M,size_N]);
else
    A2_temp=imresize(A2,[size_M,size_N]);
end
A2=A2_temp;

% �ֲ���ʾ
A1=[A2,ch1_img;cv1_img,cd1_img];
A1=uint8(A1);

% ��ʾ���
figure
imshow(A1);
title('����С���任');

end



