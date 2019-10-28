function [xn,yn]=HAP(x,y,w,v,a,b,Eps)
m=length(a);
n=size(v,1);
E=zeros(n,m);
for j=1:n
    for i=1:m
        E(j,i)=sqrt((x(j)-a(i))^2+(y(j)-b(i))^2+Eps);
    end  
end
D=zeros(n,n);
for j=1:n
    for k=1:n
        D(j,k)=sqrt((x(j)-x(k))^2+(y(j)-y(k))^2+Eps);
    end
end
numeratorx=zeros(1,n);
denumeratorx=zeros(1,n);
numeratory=zeros(1,n);
denumeratory=zeros(1,n);
xn=zeros(1,n);
yn=zeros(1,n);
for j=1:n
    numeratorx(j)=sum((w(j,:).*a)./E(j,:))+sum((v(j,:).*x)./D(j,:));
    denumeratorx(j)=sum((w(j,:)./E(j,:)))+sum((v(j,:)./D(j,:)))-(v(j,j)/D(j,j));
    xn(j)=numeratorx(j)/denumeratorx(j);
    numeratory(j)=sum((w(j,:).*b)./E(j,:))+sum((v(j,:).*y)./D(j,:));
    denumeratory(j)=sum((w(j,:)./E(j,:)))+sum((v(j,:)./D(j,:)))-(v(j,j)/D(j,j));
    yn(j)=numeratory(j)/denumeratory(j);
end
