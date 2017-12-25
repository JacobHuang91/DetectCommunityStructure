function [ffbest,resuu]=GAnet(S,A)
affinity=S;
 
 %粒子数
 m=30;
 ie=1;
 iter=20;


 l=size(affinity,2);
 sim=affinity;
% U=zeros(3,150);
 v=zeros(m,l);
 c=zeros(m,l);
pbest=zeros(m,l);
pbest1=zeros(m,l); 

for z=1:m
    
   for i=1:l
     affinity(i,i)=1;
     k=find(affinity(:,i)== min(affinity(:,i)));
     affinity(k,i)=1;affinity(i,k)=1;
     pbest(z,i)=k(1);
   end
end


     for i=1:m
         bian=zeros(l,l);
       for j=1:l
        bian(j,pbest(i,j))=1;
        bian(pbest(i,j),j)=1;
       end  
        [resu]=jie(bian);
        %解码%
        numcluster=size(resu,1);
        if numcluster ==1
        %
        f1(i)=1;
        else
          for ii=1:l
          [aa,bb]=find(resu()==ii);
           IDX(ii,1)=aa;
          end
        ff(i,:)=IDX;
        f1(i)=1-NewmanUnWeightQ(A,IDX);
     
        end    
     end
 for i=1:2
  k=find(f1==min(f1));
  resultpbest(i,:)=pbest(k(1),:);
  fbest =1-min(f1);
  ffbest(1)=fbest;
  f1(k)=1;
 end
 pbest1=pbest;
  % 主循环开始
       for iiter=1:30

             
     %交叉
        for i=1:m
                         bin=zeros(1,l);
                         for i=1: round((l)*rand+0.5)
                         bin(1,round((l)*rand+0.5))=1;
                         end
                for z=1:l
                    if   bin(1,z)==0
                    pbest1(i,z)= resultpbest( 1,z);
                    else
                    pbest1(i,z)=resultpbest(2,z);
                    end
                end
        end
        % 变异
          for z=1:m
          for i=1:round((l)*rand+0.5)
          p=round((l)*rand+0.5);
          sim(p,p)=1;
          q=find(min(sim(p,:))==sim(p,:));
          pbest1(z,p)=q(1);
          end
          end
           
     pbest=pbest1;
          
       for i=1:m
         bian=zeros(l,l);
       for j=1:l
        bian(j,pbest(i,j))=1;
        bian(pbest(i,j),j)=1;
       end  
        [resu]=jie(bian);
        %解码%
     numcluster=size(resu,1);
        if numcluster ==1
        %
        f1(i)=1;
        else
          for ii=1:l
          [aa,bb]=find(resu()==ii);
           IDX(ii,1)=aa;
          end
          ff(i,:)=IDX;

          f1(i)=1-NewmanUnWeightQ(A,IDX);
        end    
    
       end    
    
       if min(f1)<1-fbest
           k=find(f1==min(f1));
           fbest=1-min(f1);
           ffbest(iiter+1)=fbest;
          IIDX=ff(k(1),:);
           resultpbest1=pbest(k,:);
       end
          
          
       end
       %显示结果
       bian=zeros(l,l);
       for j=1:l
        bian(j,resultpbest1(j))=1;
        bian(resultpbest1(j),j)=1;
       end  
        [resuu]=jie(bian);
end