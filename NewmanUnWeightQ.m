function [Q]=NewmanUnWeightQ(A1,IDX)
%A1Ϊ0-1���󣬴�ʱQֵ��Ч 
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
disp(['QֵΪ��',num2str(Q)]);