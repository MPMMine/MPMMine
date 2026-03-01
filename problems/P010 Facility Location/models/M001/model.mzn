int: n_fac;
int: n_cust;

set of int: Fac = 1..n_fac;
set of int: Cust = 1..n_cust;

% Parameters
array[Fac] of float: fixed_cost;
array[Fac] of int: capacity;
array[Cust] of int: demand;
array[Fac, Cust] of float: dist_cost;              % Cost per unit of demand per unit distance

% Decision Variables
array[Fac] of var 0..1: open;                      % Binary: Open facility
array[Fac, Cust] of var 0.0..1.0: satisfied;       % Continuous: Fraction of satisfied demand

% Constraints

% 1. Total demand satisfaction
constraint forall(j in Cust) (
    sum(i in Fac)(satisfied[i, j]) >= 1.0
);

% 2. Capacity Constraint
% Total demand serviced by facility i must be <= its capacity if open, and 0 if closed.
constraint forall(i in Fac) (
    sum(j in Cust)(int2float(demand[j]) * satisfied[i, j]) <= int2float(capacity[i]) * open[i]
);

% Objective
var float: total_cost = 
    sum(i in Fac)(int2float(open[i]) * fixed_cost[i]) +
    sum(i in Fac, j in Cust)(satisfied[i, j] * int2float(demand[j]) * dist_cost[i, j]);

solve minimize total_cost;
