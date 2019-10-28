% HAP Solution of 6.30 Francis with Eclidean Distance
clc
clear
v=[0 2
   2 0];
w=[4 2 3 0 0
   0 2 1 3 2];
a=[0 2 6 6 8];
b=[0 4 2 10 8];
Eps=0.000001;
m=length(a);
n=size(v,1);
it=1;
%% Problem Solving with Square Euclidean Distance
[x(it,:),y(it,:)]=SQE(w,v,a,b);
zp(it)=Cost(x(it,:),y(it,:),w,v,a,b);
%%
it=it+1;
[x(it,:),y(it,:)]=HAP(x(it-1,:),y(it-1,:),w,v,a,b,Eps);
zp(it)=Cost(x(it,:),y(it,:),w,v,a,b);
while abs(zp(it)-zp(it-1))>0.000001
    it=it+1;
    [x(it,:),y(it,:)]=HAP(x(it-1,:),y(it-1,:),w,v,a,b,Eps);
    zp(it)=Cost(x(it,:),y(it,:),w,v,a,b);
end
disp('Iteration Number:');
display(it);
disp('Objective Function Value:');
display(zp(it));
disp('X:');
display(x(it,:));
disp('Y:');
display(y(it,:));
plot(zp)
