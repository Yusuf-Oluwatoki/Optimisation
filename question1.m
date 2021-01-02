clear all 
clc

%Question 1 

f= [500 400]';
A= [4 5; 8 5; 1 0];
b=[ 60 80 8]';
lb= [0 0];
[x, fval]= linprog(-f,A,b,[],[],lb)
Alpha= x(1)
Beta=x(2)
profit=-fval
slack=b-A*x
%[x, fval, exitflag, output, lambda]= linprog(-f,A,b,[],[],lb);
%options to change algorithms.

%%
%Question 2
clear all
clc

f= [7 4 6 8 5 3]';
A= [120 105 210 160 270 175;
    50 20 45 60 40 10;
    40 35 30 20 15 20];
b= [180; 40; 20];
lb=zeros(6,1);
[x, fval, exitflag, output, lambda]= linprog(f,-A,-b,[],[],lb)
surplus= A*x-b


%% Exerice 2
clc
clear all
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


%%
clc
clear all
%f=[20 16] % Original costs
f=[20 20]; % Changed costs
A=[6 2
   2 2
   4 12];
b=[12 8 24]';
Aeq=[];
beq=[];
lb=[0 0];
[x,fval,exitflag,output] = linprog(f,-A,-b,Aeq,beq,lb)
options=optimoptions('linprog','Algorithm','interior-point');
[x_alt1,fval_alt,exitflag,output] = linprog(f,-A,-b,Aeq,beq,lb,[],options)
options=optimoptions('linprog','Algorithm','interior-point-legacy');
[x_alt2,fval_alt2,exitflag,output] = linprog(f,-A,-b,Aeq,beq,lb,[],options)


%% Exercise 3

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

%%
claer all
clc

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

%% Exercise 4
% Bank loan model
variables={'Personal','Car','Home','Farm','Commercial'};
f=[0.14*0.9-0.1 0.13*0.93-0.07 0.12*0.97-0.03 0.125*0.95-0.05 0.1*0.98-0.02]
% f=[0.026 0.0509 0.0864 0.06875 0.078];
A=[ 1     1     1     1     1
   0.4   0.4   0.4  -0.6  -0.6
   0.5   0.5  -0.5    0     0
   0.06  0.03 -0.01  0.01 -0.02];
b=[12 0 0 0]';
Aeq=[];
beq=[];
lb=zeros(5,1);
ub=12*ones(5,1);
[x,fval,exitflag] = linprog(-f,A,b,Aeq,beq,lb,ub);
ret=-fval;

for i=1:length(variables)
      fprintf('%10s \t%8.6f\n',variables{i},x(i));
end
fprintf('\n%10s \t%8.6f\n\n','Net return',ret);

% All loans <= 3 million
ub=3*ones(5,1);
[x,fval,exitflag] = linprog(-f,A,b,Aeq,beq,lb,ub);

disp('All loans <= 3 million:')
ret=-fval;
for i=1:length(variables)
      fprintf('%10s \t%8.6f\n',variables{i},x(i));
end
fprintf('\n%10s \t%8.6f\n\n','Net return',ret);


%%

% Bank loan model, all funds used
variables={'Personal','Car','Home','Farm','Commercial'};
f=[0.14*0.9-0.1 0.13*0.93-0.07 0.12*0.97-0.03 0.125*0.95-0.05 0.1*0.98-0.02]
% f=[0.026 0.0509 0.0864 0.06875 0.078];
A=[ 0     0     0    -1    -1
   0.5   0.5  -0.5    0     0
   0.1  0.07   0.03  0.05  0.02];
b=[-4.8 0 0.48]';
Aeq=[1 1 1 1 1];
beq=[12];
lb=zeros(5,1);
ub=12*ones(5,1);
[x,fval,exitflag] = linprog(-f,A,b,Aeq,beq,lb,ub);

ret=-fval;
for i=1:length(variables)
      fprintf('%10s \t%8.6f\n',variables{i},x(i));
end
fprintf('\n%10s \t%8.6f\n\n','Net return',ret);

% All loans <= 3 million
disp('All loans <= 3 million:')
ub=3*ones(5,1);
[x,fval,exitflag] = linprog(-f,A,b,Aeq,beq,lb,ub);
% No feasible solution, conflicting constraints

%%
% Multiperiod production and inventory scheduling
% Decision variables:
% r(i) = regular production in week i
% o(i) = overtime production in week i
% s(i) = inventory at the end of week i
% Variable vector organized as 
% [r(1) r(2) r(3) r(4) r(5) r(6)...
%  o(1) o(2) o(3) o(4) o(5) o(6)...
%  s(1) s(2) s(3) s(4) s(5) s(6)]'

c = [190*ones(6,1);260*ones(6,1);10*ones(6,1)]; % costs
% Equality constraints: r(i) + o(i) + s(i-1) - s(i) = d(i)
% Matrix form: A*x = d
A = [
1 0 0 0 0 0 1 0 0 0 0 0 -1  0  0  0  0  0
0 1 0 0 0 0 0 1 0 0 0 0  1 -1  0  0  0  0
0 0 1 0 0 0 0 0 1 0 0 0  0  1 -1  0  0  0
0 0 0 1 0 0 0 0 0 1 0 0  0  0  1 -1  0  0
0 0 0 0 1 0 0 0 0 0 1 0  0  0  0  1 -1  0
0 0 0 0 0 1 0 0 0 0 0 1  0  0  0  0  1 -1];
d = [105 170 230 180 150 250]'; % demand = rhs vector
lb = zeros(18,1);
ub = [160*ones(6,1); 50*ones(6,1); 1000*ones(6,1)];
[x,cost]=linprog(c,[],[],A,d,lb,ub)
regular_production = x(1:6)'
overtime_production = x(7:12)'
inventories = x(13:18)'
% solution = reshape(x,6,3)'


%% Exercise 5

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

%%

%% Model 1

% Variables:
% [M  B  BS   BW  W   WS   WP  P]'
f=[35 0  150  0   0  200   0   230]';
A=[0 -1   1   1   0   0    0   0
   0  0   0  -0.8 1   0    0   0
   0  0   0   0  -1   1    1   0
   0  0   0   0   0   0  -0.95 1];
b=zeros(4,1);
lb=zeros(8,1);
lb(3)=25; lb(6)=25; lb(8)=25; % Sugars sold
ub=4000*ones(8,1);
ub(1)=0.1*4000; % Molasses from syrup
ub(2)=0.3*4000; % Brown sugar from syrup
[x,fval]=linprog(-f,[],[],A,b,lb,ub)
format bank
M = x(1)
B = x(2)
BS = x(3)
BW = x(4)
W = x(5)
WS = x(6)
WP = x(7)
P = x(8)
Profit = -fval
format

%% Model 2

% Variables:
% [M  BS  BW  WS  WP  P]'
f=[35 150 0  200  0  230]';
A=[1  0   0   0   0    0
   0  1   1   0   0    0
   0  0 -0.8  1   1    0
   0  0   0   0 -0.95  1];
b=[400 1200 0 0]';
lb=[0 25 0 25 0 25]';
[x,fval]=linprog(-f,[],[],A,b,lb)
format bank
M = x(1)
BS = x(2)
BW = x(3)
WS = x(4)
WP = x(5)
P = x(6)
Profit = -fval
format
%%





