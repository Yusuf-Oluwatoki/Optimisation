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
