%% Practical Assignment

clear all
clc
% Arranging decision variables in order ; paper type; mill; machine type
% X variables represent production decison variables and y variables
% represent distribution decison variables

% define obejective function in the described order.
f= [0.3/4 0.42/6 0.44/9 0.58/9 0.28/6 0.8/24 0.28/5 0 0 0 0 0 0 0];

% Defining inequality constraints
% Intialise all constraints to zero
A= zeros(11,14);

% first 6 constraints for materials 
A(1,8:14)=[640 1275 1065 1795 735 1795 775];
A(2,1:7)=[0.25 -0.75 -0.75 -0.75 -0.75 -0.75 -0.75];
A(3,1:7)=[-0.75 -0.75 -0.75 -0.75 -0.75 0.25 -0.75];
A(4,1:7)=[-0.75 0.25 0.25 0.25 0.25 -0.75 0.25];
A(5,[1,8])=[-1 0.05*640];
A(6,[2,9])=[-1 0.05*1275];
A(7,[3,10])=[-1 0.05*1065];
A(8,[4,11])=[-1 0.05*1795];
A(9,[5,12])=[-1 0.05*735];
A(10,[6,13])=[-1 0.05*1795];
A(11,[7,14])=[-1 0.05*775];

% Defining inequality constraints solutions
% next 16 values are the constraints solution
b= zeros(11,1);
% first solutions corresponds to first 6 rows of A
b(1)=[1000];



% defining upper and lower boundary of the objective function
lb= zeros(1,14);
ub=[inf inf inf inf inf inf inf 1 1 1 1 1 1 1]; 
intcon=;
[x, fval]= linprog(f,A,b,Aeq,beq,lb,ub);
Total_Cost=fval
slack=b-A*x;

% Organising solution
Production_unit=x(1:12)

Distribution_unit= x(13:24)

% Production by paper type
 Production_unit_machine1_mill1=x([1 3 5])
 Production_unit_machine2_mill1=x([2 4 6])
 Production_unit_machine1_mill2=x([7 9 11])
 Production_unit_machine2_mill2=x([8 10 12])


% Distribution by paper
 Distribution_unit_customer1_mill1=x([13 15 17])
 Distribution_unit_customer2_mill1=x([14 16 18])
 Distribution_unit_customer1_mill2=x([19 21 23])
 Distribution_unit_customer2_mill2=x([20 22 24])

% A bigger picture
Production_cost= f(1:12)*x(1:12)
Distribution_cost= f(13:24)*x(13:24)
Totalcost=Production_cost+Distribution_cost
error=Total_Cost-Totalcost

