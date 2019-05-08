function yu=my_img_weighting_fuse(I1,I2,set_weight1)

%
% ��Ȩ�㷨�ں�
% ���룺
%     I1��ͼ��1
%     I2��ͼ��2
% �����
%     yu���ںϺ��ͼ��
%

% ��������ת��
I1=double(I1);
I2=double(I2);

% ��ȡ�ߴ�
[size_M,size_N,C]=size(I1);

% ���ý������
yu=zeros(size_M,size_N,C);

% ��Ȩ�ں�
if C>1
    yu(:,:,1)=I1(:,:,1).*set_weight1+I2(:,:,1).*(1-set_weight1);
    yu(:,:,2)=I1(:,:,2).*set_weight1+I2(:,:,2).*(1-set_weight1);
    yu(:,:,3)=I1(:,:,3).*set_weight1+I2(:,:,3).*(1-set_weight1);
else
    yu=I1.*set_weight1+I2.*(1-set_weight1);
end

% ��������ת��
yu=uint8(yu);

end

