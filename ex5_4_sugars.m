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
