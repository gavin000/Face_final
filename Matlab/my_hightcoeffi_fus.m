function I_res=my_hightcoeffi_fus(I1,I2)

%
% ���ֵ�㷨�ں�
% ���룺
%     I1��ͼ��1��ƵС��ϵ��
%     I2��ͼ��2��ƵС��ϵ��
% �����
%     I_res���ںϺ�ĸ�ƵС��ϵ��
%

% ���ֵ�㷨�ں�

% ��ȡ�ߴ�
[size_M,size_N,size_C]=size(I1);

% ���ý������
I_res=zeros(size_M,size_N,size_C);

% ��С��ϵ�����бȽ�
for k=1:size_C
    for i=1:size_M
        for j=1:size_N
            
            % ��ȡ���ֵ
            if abs(I1(i,j,k))>=abs(I2(i,j,k))
                I_res(i,j,k)=I1(i,j,k);
            else
                I_res(i,j,k)=I2(i,j,k);
            end
            
        end
    end
end

end
