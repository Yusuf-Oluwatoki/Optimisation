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

