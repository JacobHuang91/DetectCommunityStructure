function [resu]=jie(bian)
l=length(bian);
for k=1:l
 B=zeros(1);
 B=largestcomponent(bian);
 resu(k,1:length(B))=B;
for i=1:length(B)
    for j=1:length(B)
        bian(B(i),B(j))=0;
        bian(B(j),B(i))=0;
    end
end

 if  isempty(find(bian==1)==1)==1
     break;
 end

end
end