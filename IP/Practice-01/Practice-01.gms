
set v/1*6/;
alias(i,j,v);
table e(i,j)
         1       2       3       4       5       6
1                1       1       1       1
2                        1               1
3                                1       1       1;
e(j,i)$(ord(i)<ord(j))=e(i,j)$(ord(i)<ord(j));
free variable z,z1;
binary variable b(i,j);
integer variable x(i);
parameter m;
m=4;
equations
obj
co1
co2
co3
;
obj..z=e=z1;
co1(i)..z1=g=x(i);
co2(i,j)$e(i,j)..x(i)=l=x(j)-1+b(i,j)*m;
co3(i,j)$e(i,j)..x(i)=g=x(j)+1-(1-b(i,j))*m;

model gc/all/;
option optcr=0,optca=0,reslim=7200,limrow=1000;
solve gc using rmip minimizing z;
display e,z.l,x.l,b.l,gc.nodusd;



* Practice 01
* مدل 1: مدل برنامه ریزی رنگ آمیزی با نرم افزار گمز

