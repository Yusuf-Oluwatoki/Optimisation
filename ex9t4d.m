%Decision variables: x1,x2,x3,y1+,y1-,y2+,y2-,y3+,y3-,y4+,y4-:
f=[0 0 0 10 0 10 0 10 0 8/100 8/100];
Aeq=[
%x1 x2 x3 y1+ y1- y2+ y2- y3+ y3- y4+ y4-: 
1 0 0 -1 1 0 0 0 0 0 0 
0 1 0 0 0 -1 1 0 0 0 0 
0 0 1 0 0 0 0 -1 1 0 0 
40 75 105 0 0 0 0 0 0 -1 1 
];
beq=[5,10,15,2500]';

A=[18000 33000 45150 0 0 0 0 0 0 0 0]
b=1000000;
lb=zeros(1,13)';
intcon=1:3;     
[x,fval,exitflag]=intlinprog(f,intcon,A,b,Aeq,beq,lb)