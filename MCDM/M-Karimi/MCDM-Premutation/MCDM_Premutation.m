clc
clear all
close all
format shortG

%% Start
A=xlsread('MCDM_Premutation.xlsx',1);

W=A(1,:);
DM=A(3:end,:);
[na,nc]=size(DM);
if na>10
    error(' Not Solve ')
end

%% step 1

e=find(W<0);
DM(:,e)=-DM(:,e);

W=abs(W);
W=W./sum(W);

U=perms(1:na);
Nperms=size(U,1);

%% step 2

Xperms=zeros(Nperms,na);
Fperms=zeros(Nperms,1);

for p=1:Nperms 
    x=U(p,:);
    M=zeros(na,na);
    for i1=1:na
        i=x(i1);
        for j1=1:na
            j=x(j1);
            V=0;       
            for c=1:nc                
                if DM(i,c)>=DM(j,c)
                    V=V+W(c);
                end               
            end
            
            if i==j
                M(i1,j1)=0;
            else
                M(i1,j1)=V;
            end            
        end
    end
   
    M1=triu(M,0);
    M2=tril(M,0);
    f=sum(M1(:))-sum(M2(:));
    
    Xperms(p,:)=x;
    Fperms(p)=f;        
end

%% step 3


[value,index]=max(Fperms);

disp(['Best Permutation = ' num2str(Xperms(index,:))])  
disp([ ' Score = ' num2str(value)])

%% End ** MCDM-AHP method code in Matlab ** Contact me = Github and Telegram = @MKarimi21 **
