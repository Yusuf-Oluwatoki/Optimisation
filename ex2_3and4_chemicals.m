% f=[20 16] % Original costs
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