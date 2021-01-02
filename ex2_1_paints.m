% Paint production
f=[5 4];
A=[1 1.5
   2 1
   1 -3
   -1 -1];
b=[15 16 0 -5]';
Aeq=[];
beq=[];
lb=[0 0];
[x,fval,exitflag,output] = linprog(-f,A,b,Aeq,beq,lb)
ext_paint=x(1)
int_paint=x(2)
profit=-fval
