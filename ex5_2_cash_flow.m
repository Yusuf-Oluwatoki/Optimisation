% Cash flow problem
% Variables [A B C D E S0 S1 S2]
f=  [ 0   1   0   1.9  1.5   0    0   1.08]';
A=[ 1   0   1    1    0    1    0    0
    -0.5  1  -1.2  0    0  -1.08  1    0
    -1 -0.5   0    0    1    0  -1.08  1];
b=[100000 0 0]';
lb=zeros(8,1);
ub=[75000,75000,75000,75000,75000,inf,inf,inf]';
[x,fval] = linprog(-f,[],[],A,b,lb,ub) % With equality constraints
%[x,fval] = linprog(-f,A,b,[],[],lb,ub) % With inequality constraints
format bank
A=x(1)
B=x(2)
C=x(3)
D=x(4)
E=x(5)
S0=x(6)
S1=x(7)
S2=x(8)
final_cash=-fval
format