
set v/1*6/;
set j/1*4/;
alias(i,k,v);
table e(i,k)
         1       2       3       4       5       6
1                1       1       1       1
2                        1               1
3                                1       1       1;
e(k,i)$(ord(i)<ord(k))=e(i,k)$(ord(i)<ord(k));
free variable z,z1;
binary variable y(i,j);
y.fx('1','1')=1;
y.fx('2','2')=1;
equations
obj
co1
co2
co3
;
obj..z=e=z1;
co1(i,j)..z1=g=ord(j)*y(i,j);
co2(i)..sum(j,y(i,j))=e=1;
co3(i,k,j)$e(i,k)..y(i,j)+y(k,j)=l=1;

model gc/all/;
option optcr=0,optca=0,reslim=7200,limrow=1000;
solve gc using rmip minimizing z;
display e,z.l,y.l,gc.nodusd;


* Practice 02 
* GAMS 
* مدل دوم مساله رنگ آمیزی گراف

