include "globals.mzn";

int: n_fac;
int: n_cust;
set of int: Fac = 1..n_fac;
set of int: Cust = 1..n_cust;
array[Fac] of float: fixed_cost;
array[Fac] of int: capacity;
array[Cust] of int: demand;
array[Fac, Cust] of float: dist_cost;
array[Fac] of 0..1: open;
array[Fac, Cust] of float: satisfied;

% Unification flag passed via -D "is_solution=true" or "is_solution=false"
bool: is_solution;
% Flag to determine if the objective value should be checked flag passed via -D "check_objective=true" or "check_objective=false"
bool: check_objective;
% Float with the objective value from the solution file (it is saved there as a comment) -D "obj_from_sol=<number>"
float: obj_from_sol;
float: eps = if is_solution then 1e-6 else -1e-6 endif;

test check(bool: b, string: s) = 
    if b then true else trace_stdout("ERROR: " ++ s ++ "\n", false) endif;

array[int] of bool: checks = 
    % Check 1. Domain Validation: Fraction of satisfied demand must be within bounds [0.0, 1.0]
    [ check(
        satisfied[i, j] >= 0.0 - eps /\
        satisfied[i, j] <= 1.0 + eps,
        "Fraction satisfied[" ++ show(i) ++ "," ++ show(j) ++ "] = " ++ show(satisfied[i, j]) ++ " is out of the [0.0, 1.0] bounds."
      )
    | i in Fac, j in Cust ]
    ++
    % Check 2. Total Demand Satisfaction: Every customer's demand must be completely met
    [ check(
        sum(i in Fac)(satisfied[i, j]) >= 1.0 - eps,
        "Customer " ++ show(j) ++ " total satisfaction sum = " ++ show(sum(i in Fac)(satisfied[i, j])) ++ " is less than 1.0."
      )
    | j in Cust ]
    ++
    % Check 3. Capacity Constraint: Total demand serviced by facility i must fit its capacity and respect its open/closed state
    [ check(
        sum(j in Cust)(int2float(demand[j]) * satisfied[i, j]) <= int2float(capacity[i] * open[i]) + eps,
        "Facility " ++ show(i) ++ " capacity violated. Serviced: " ++ show(sum(j in Cust)(int2float(demand[j]) * satisfied[i, j])) ++ ", Available: " ++ show(capacity[i] * open[i])
      )
    | i in Fac ]
    ++
    % Conditionally append the objective check inline
    if check_objective then 
        let {float: res = sum(i in Fac)(int2float(open[i]) * fixed_cost[i]) + sum(i in Fac, j in Cust)(satisfied[i, j] * int2float(demand[j]) * dist_cost[i, j]);} in 
        [ check(
            res >= obj_from_sol - eps /\ res <= obj_from_sol + eps,
            "The objective: " ++ show(res) ++ " does not match the objective from the solution file: " ++ show(obj_from_sol)
        ) ]
    else 
        [] 
    endif;

output [
    if forall(checks)
    then "CORRECT: all constraints hold.\n"
    else "INCORRECT: See error log above for specific violations.\n"
    endif
];