function I_res=my_hightcoeffi_fus(I1,I2)

%
% 最大值算法融合
% 输入：
%     I1：图像1高频小波系数
%     I2：图像2高频小波系数
% 输出：
%     I_res：融合后的高频小波系数
%

% 最大值算法融合

% 获取尺寸
[size_M,size_N,size_C]=size(I1);

% 设置结果变量
I_res=zeros(size_M,size_N,size_C);

% 对小波系数进行比较
for k=1:size_C
    for i=1:size_M
        for j=1:size_N
            
            % 获取最大值
            if abs(I1(i,j,k))>=abs(I2(i,j,k))
                I_res(i,j,k)=I1(i,j,k);
            else
                I_res(i,j,k)=I2(i,j,k);
            end
            
        end
    end
end

end
