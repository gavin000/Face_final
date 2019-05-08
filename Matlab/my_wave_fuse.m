function I_rec=my_wave_fuse(img1,img2)


[M,N,C]=size(img1);

%% 小波变换部分

% 进行小波变换
% 设置小波基
% set_name='db1';
% set_name='dmey';
% set_name='coif1';
% set_name='rbio1.1';
set_name='sym2';

% % 进行小波变换
% [c,s]=wavedec2(double(img1),3,set_name);

% 图像1小波变换
[img1_ca3,img1_ch3,img1_cv3,img1_cd3,img1_ch2,img1_cv2,img1_cd2,img1_ch1,img1_cv1,img1_cd1,s]=my_wave(img1,set_name);

% 图像2小波变换
[img2_ca3,img2_ch3,img2_cv3,img2_cd3,img2_ch2,img2_cv2,img2_cd2,img2_ch1,img2_cv1,img2_cd1,s]=my_wave(img2,set_name);


%% 低频系数部分融合

% 对每个维度进行加权融合
if C>1
    % RGB小波低频系数进行融合
    res_ca3_R=my_imgweighting_fus(img1_ca3(:,:,1),img2_ca3(:,:,1));
    res_ca3_G=my_imgweighting_fus(img1_ca3(:,:,2),img2_ca3(:,:,2));
    res_ca3_B=my_imgweighting_fus(img1_ca3(:,:,3),img2_ca3(:,:,3));
    res_ca3(:,:,1)=res_ca3_R;
    res_ca3(:,:,2)=res_ca3_G;
    res_ca3(:,:,3)=res_ca3_B;

else
    % 灰度图小波低频系数进行融合
    res_ca3=my_imgweighting_fus(img1_ca3,img2_ca3);
end

%% 高频系数融合部分

% 没高频小波系数进行最大值融合
res_ch3=my_hightcoeffi_fus(img1_ch3,img2_ch3);
res_cv3=my_hightcoeffi_fus(img1_cv3,img2_cv3);
res_cd3=my_hightcoeffi_fus(img1_cd3,img2_cd3);

res_ch2=my_hightcoeffi_fus(img1_ch2,img2_ch2);
res_cv2=my_hightcoeffi_fus(img1_cv2,img2_cv2);
res_cd2=my_hightcoeffi_fus(img1_cd2,img2_cd2);

res_ch1=my_hightcoeffi_fus(img1_ch1,img2_ch1);
res_cv1=my_hightcoeffi_fus(img1_cv1,img2_cv1);
res_cd1=my_hightcoeffi_fus(img1_cd1,img2_cd1);

% 融合后系数转换为一维数据
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

% 融合后的小波系数c
res_c=[res_ca3,res_ch3,res_cv3,res_cd3,res_ch2,res_cv2,res_cd2,res_ch1,res_cv1,res_cd1];

% 进行小波逆变换
I_rec=waverec2(res_c,s,set_name);

% 显示融合后的图像
I_rec=uint8(I_rec);

end
