clc
clear all
close all
format shortG

%% Start

A=xlsread('MCDM_TOPSIS.xlsx',1);
W=A(1,:);
DM=A(3:end,:);

[na,nc]=size(DM);

SumDM=sum(DM.^2);
SqrtSumDM=sqrt(SumDM);

%% Step 01

for c=1:nc
    DM(:,c)=DM(:,c)./SqrtSumDM(c);
end

%% Step 02

for c=1:nc
    DM(:,c).*abs(W(c));
end

%% Step 03

AP=zeros(1,nc);
AN=zeros(1,nc);

for c=1:nc
    if W(c)>0
        AP(c)=max(DM(:,c));
        AN(c)=min(DM(:,c));
    else
        AP(c)=min(DM(:,c));
        AN(c)=max(DM(:,c));
    end
end

%% Step 04

DP=zeros(na,1);
DN=zeros(na,1);
C=zeros(na,1);

for a=1:na
    DP(a)=norm(DM(a,:)-AP);
    DN(a)=norm(DM(a,:)-AN);
    C(a)=DN(a)/(DP(a)+DN(a));
end

%% Step 05

S=C./sum(C);
[value,index]=sort(S,'descend');

for a=1:na
    disp(['Rank = ' num2str(a) ' Alternative = ' num2str(index(a)) ' Score = ' num2str(value(a))])
end

%% End ** MCDM-AHP method code in Matlab ** Contact me = Github and Telegram = @MKarimi21 **

        
