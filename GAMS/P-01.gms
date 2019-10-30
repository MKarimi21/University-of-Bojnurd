* MyPractice01: my practice for my excercising in gams software
* Refrence: easy model in my labtop
* ======================= GAMS File ==============================
* Model:
*        Max Z = 12x"1" + 8x"2"
*           S.t:
*                2x"1" + 3x"2" <= 100
*                4x"1" + 2x"2" <= 80
*                x"1" and x"2" >= 0
* ======================= END Model ==============================

parameters
a(i) benefit
/table 12
chair 8/
c(i) wood
/table 2
chair 3/
n(i) scourse
/chair 4
table 2/;

variables
x(i) number of variable
Z objective function
positive variable x(i);

equations
object
wood
human;

object..z=e= sum(i,a(i)*x(i));
wood..sum(i,c(i)*x(i))=l=100;
human..sum(i,n(i)*x(i))=l=80;

Model woodWorking /all/;
Solve woodWorking using lp maximizing Z;

display x.l, x.m;

