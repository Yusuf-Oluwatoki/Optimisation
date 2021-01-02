% Transportation problem:
% Electricity from 3 plants to 4 cities
% xij = amount transferred from plant i to city j
% Solution vector indexed as
% x =[x11 x12 x13 x14 x21 x22 x23 x24 x31 x32 x33 x34]

f=[8,6,10,9,9,12,13,7,14,9,16,5]';

A=[1 1 1 1 0 0 0 0 0 0 0 0
   0 0 0 0 1 1 1 1 0 0 0 0
   0 0 0 0 0 0 0 0 1 1 1 1];
b=[35,50,60]';

Aeq=[1 0 0 0 1 0 0 0 1 0 0 0
     0 1 0 0 0 1 0 0 0 1 0 0
     0 0 1 0 0 0 1 0 0 0 1 0
     0 0 0 1 0 0 0 1 0 0 0 1];
beq=[45,20,30,30]';

lb=zeros(12,1);
[x,fval,exitflag]=linprog(f,A,b,Aeq,beq,lb)
Plants_to_cities=reshape(x,4,3)'
Surplus_capacity_at_plants=b-A*x
