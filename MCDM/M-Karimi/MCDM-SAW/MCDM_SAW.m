clc
clear all
close all
format shortG

%% Start

A=xlsread('MCDM_SAW.xlsx',1);
W=A(1,:);
DM=A(3:end,:);

[na,nc]=size(DM);

MaxDM=max(DM);
MinDM=min(DM);

%% Step 01

for i=1:nc
    if W(i)<0
        DM(:,i)=MinDM(i)./DM(:,i);
    else
        DM(:,i)=DM(:,i)./MaxDM(i);
    end
end

W=abs(W);
W=W./sum(W);

%% Step 02

for i=1:nc
    DM(:,i)=DM(:,i).*W(i);
end

%% Step 03

S=mean(DM,2);
S=S./sum(S);

[value,index]=sort(S, 'descend');

for i=1:na
    disp(['Rank = ' num2str(i) ' Alternative = ' num2str(index(i)) ' Score = ' num2str(value(i))])
end


%% End ** MCDM-AHP method code in Matlab ** Contact me = Github and Telegram = @MKarimi21 **
