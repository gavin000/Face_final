function I_rec=my_wave_fuse(img1,img2)


[M,N,C]=size(img1);

%% С���任����

% ����С���任
% ����С����
% set_name='db1';
% set_name='dmey';
% set_name='coif1';
% set_name='rbio1.1';
set_name='sym2';

% % ����С���任
% [c,s]=wavedec2(double(img1),3,set_name);

% ͼ��1С���任
[img1_ca3,img1_ch3,img1_cv3,img1_cd3,img1_ch2,img1_cv2,img1_cd2,img1_ch1,img1_cv1,img1_cd1,s]=my_wave(img1,set_name);

% ͼ��2С���任
[img2_ca3,img2_ch3,img2_cv3,img2_cd3,img2_ch2,img2_cv2,img2_cd2,img2_ch1,img2_cv1,img2_cd1,s]=my_wave(img2,set_name);


%% ��Ƶϵ�������ں�

% ��ÿ��ά�Ƚ��м�Ȩ�ں�
if C>1
    % RGBС����Ƶϵ�������ں�
    res_ca3_R=my_imgweighting_fus(img1_ca3(:,:,1),img2_ca3(:,:,1));
    res_ca3_G=my_imgweighting_fus(img1_ca3(:,:,2),img2_ca3(:,:,2));
    res_ca3_B=my_imgweighting_fus(img1_ca3(:,:,3),img2_ca3(:,:,3));
    res_ca3(:,:,1)=res_ca3_R;
    res_ca3(:,:,2)=res_ca3_G;
    res_ca3(:,:,3)=res_ca3_B;

else
    % �Ҷ�ͼС����Ƶϵ�������ں�
    res_ca3=my_imgweighting_fus(img1_ca3,img2_ca3);
end

%% ��Ƶϵ���ںϲ���

% û��ƵС��ϵ���������ֵ�ں�
res_ch3=my_hightcoeffi_fus(img1_ch3,img2_ch3);
res_cv3=my_hightcoeffi_fus(img1_cv3,img2_cv3);
res_cd3=my_hightcoeffi_fus(img1_cd3,img2_cd3);

res_ch2=my_hightcoeffi_fus(img1_ch2,img2_ch2);
res_cv2=my_hightcoeffi_fus(img1_cv2,img2_cv2);
res_cd2=my_hightcoeffi_fus(img1_cd2,img2_cd2);

res_ch1=my_hightcoeffi_fus(img1_ch1,img2_ch1);
res_cv1=my_hightcoeffi_fus(img1_cv1,img2_cv1);
res_cd1=my_hightcoeffi_fus(img1_cd1,img2_cd1);

% �ںϺ�ϵ��ת��Ϊһά����
res_ca3=res_ca3(:)';
res_ch3=res_ch3(:)';
res_cv3=res_cv3(:)';
res_cd3=res_cd3(:)';

res_ch2=res_ch2(:)';
res_cv2=res_cv2(:)';
res_cd2=res_cd2(:)';

res_ch1=res_ch1(:)';
res_cv1=res_cv1(:)';
res_cd1=res_cd1(:)';

% �ںϺ��С��ϵ��c
res_c=[res_ca3,res_ch3,res_cv3,res_cd3,res_ch2,res_cv2,res_cd2,res_ch1,res_cv1,res_cd1];

% ����С����任
I_rec=waverec2(res_c,s,set_name);

% ��ʾ�ںϺ��ͼ��
I_rec=uint8(I_rec);

end
