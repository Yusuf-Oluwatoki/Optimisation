%%


%Question 2
clear all
clc

f= [1 3]';
A= [1 0;
    0 2;
    2 3];
b= [7; 11; 19];
lb=zeros(2,1);
intcon=[1,2];
[x, fval]= intlinprog(-f,intcon,A,b,[],[],lb)
profit=-fval
slack=b-A*x
%%
%Question 3
clear all
clc

f= [1 3]';
A= [1 0;
    0 2;
    2 3];
b= [7; 11; 19];
lb=zeros(2,1);
intcon=[1,2];
[x, fval]= linprog(-f,A,b,[],[],lb)
profit=f'*floor(x)
slack=b-A*x



%%
%Question 2
clear all
clc

f= [48 55 50 -1000 -800 -900]';
A= [2 3 6 0 0 0;
    6 3 4 0 0 0;
    5 6 2 0 0 0
    1 0 0 -1000 0 0;
    0 1 0  0    -800 0 ;
    0 0 1  0   0   -900];
b= [600; 300; 400; 0 ; 0; 0];
lb=[0;0;0;0;0;0];
ub=[inf; inf; inf; 1; 1; 1]; 
intcon=4:6;
[x, fval]= intlinprog(-f,intcon,A,b,[],[],lb,ub)
profit=-fval
slack=b-A*x

