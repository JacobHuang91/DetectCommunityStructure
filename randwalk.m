function [S]=randwalk(A)
 
cr=A;
k=size(cr,1);
%compute the degree matrix
for i=1:k
    D(i,i) = sum(cr(i,:));
end

for i=1:k
    for j=1:k
        P(i,j) = cr(i,j) / D(i,i) ;      
    end
end

 
P2=P*P;
Ps=P;
Pr=Ps;
for i=2:34
    Ps=Ps*P;
    Pr=Pr+Ps;
end
   Pm=Pr/34;
    
%  for i = 1:k
%       sm = 0;
%        for j = 1: k
%         sm=sm+cr(i, j);
%       
%        end
%        for j = 1: k
%         degree(i, j)=cr(i, j) / sm;
%       end
% end
%    degree2=degree*degree;
%    degree3=degree2*degree;
%    ss=degree+degree2;
%    ss=ss+degree3;
%    similty=ss/3

%计算两个节点的相似度
    for i = 1 : k
      for j = 1 : k
         l = 0;
         for x = 1 : k
           if i ~= x || j ~= x 
             l = l + (Pm(i, x) - Pm(j, x)) ^ 2;
           end  
           end
         S(i, j) = sqrt(l);
         end
    end
end

