function yu=my_imgweighting_fus(I1,I2)

%
% ��Ȩ�㷨�ں�
% ���룺
%     I1��ͼ��1��ƵС��ϵ��
%     I2��ͼ��2��ƵС��ϵ��
% �����
%     yu���ںϺ�ĵ�ƵС��ϵ��
%

% ��Ȩ�㷨�ں�

% ��ȡ�ߴ�
[size_M,size_N]=size(I1);

% ����Ȩֵ1
set_weight=0.5;
yu=zeros(size_M,size_N);

% ���ؼ�Ȩ�ں�
for i=1:size_M
    for j=1:size_N
        
        % ��Ȩ�ں�
        yu(i,j)=I1(i,j)*set_weight+I2(i,j)*(1-set_weight);     
    end
end

end

