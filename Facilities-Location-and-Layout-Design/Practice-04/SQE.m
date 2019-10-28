function [x,y]=SQE(w,v,a,b)
m=length(a);
n=size(v,1);
A=zeros(n);
for j=1:n
    for jj=1:n
        if j==jj
    A(j,j)=sum(w(j,:))+sum(v(j,:));
        else
    A(j,jj)=-v(j,jj);
        end
    end
end
alfa=w*a';
beta=w*b';
x(1,:)=A\alfa;
y(1,:)=A\beta;
