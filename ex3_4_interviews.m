f=[20 25 18 20];
A=[-1 -1  0  0
    0  0 -1 -1
    1 -1  1 -1
    0.4 -0.6 0 0
    0 0 0.6 -0.4];
b=[-400 -400 0 0 0]';
Aeq=[1 1 1 1];
beq=[1000];
lb=[0 0 0 0];
[x,cost,exitflag] = linprog(f,A,b,Aeq,beq,lb)
daytime_with_children=x(1)
evening_with_children=x(2)
daytime_without_children=x(3)
evening_without_children=x(4)
cost
