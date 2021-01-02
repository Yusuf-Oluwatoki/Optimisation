%Decision variables: x1,x2,x3,y1+,y1-,y2+,y2-,y3+,y3-:
f=[0 0 0 5 0 12 8 0 15];
Aeq=[
%x1 x2 x3 y1+ y1- y2+ y2- y3+ y3-: 
35 30 25 -1 1 0 0 0 0
2 4 3 0 0 -1 1 0 0
6 8 5 0 0 0 0 -1 1
];
beq=[100,10,30]';
lb=zeros(1,9)';
[x,fval,exitflag]=linprog(f,[],[],Aeq,beq,lb)