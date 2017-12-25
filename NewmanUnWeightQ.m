function [Q]=NewmanUnWeightQ(A1,IDX)
%A1为0-1矩阵，此时Q值有效 
M=sum(sum(A1))/2;
Q=0;
for i=1:size(IDX)
    for j=1:size(IDX)
        if IDX(i)==IDX(j)
           Q=Q+(A1(i,j)-sum(A1(i,:))*sum(A1(j,:))/(2*M));
        end
    end
end
Q=Q/(2*M);
disp(['Q值为：',num2str(Q)]);