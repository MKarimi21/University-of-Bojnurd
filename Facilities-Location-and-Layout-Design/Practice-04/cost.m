function z=Cost(x,y,w,v,a,b)
z=0;
m=length(a);
n=size(v,1);
for j=1:n
    for i=1:m
        z=z+w(j,i)*sqrt((x(j)-a(i))^2+(y(j)-b(i))^2);
    end
end
for j=1:n
    for k=j+1:n
        z=z+v(j,k)*sqrt((x(j)-x(k))^2+(y(j)-y(k))^2);
    end
end
end
