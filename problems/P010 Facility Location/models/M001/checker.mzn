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
float: eps = 1e-6;

test check(bool: b, string: s) = 
    if b then true else trace_stdout("ERROR: " ++ s ++ "\n", false) endif;

array[int] of bool: checks = 
    % Check 1. Domain Validation: Fraction of satisfied demand must be within bounds [0.0, 1.0]
    [ check(
        satisfied[i, j] >= 0.0 - (if is_solution then eps else -eps endif) /\
        satisfied[i, j] <= 1.0 + (if is_solution then eps else -eps endif),
        "Fraction satisfied[" ++ show(i) ++ "," ++ show(j) ++ "] = " ++ show(satisfied[i, j]) ++ " is out of the [0.0, 1.0] bounds."
      )
    | i in Fac, j in Cust ]
    ++
    % Check 2. Total Demand Satisfaction: Every customer's demand must be completely met
    [ check(
        sum(i in Fac)(satisfied[i, j]) >= 1.0 - (if is_solution then eps else -eps endif),
        "Customer " ++ show(j) ++ " total satisfaction sum = " ++ show(sum(i in Fac)(satisfied[i, j])) ++ " is less than 1.0."
      )
    | j in Cust ]
    ++
    % Check 3. Capacity Constraint: Total demand serviced by facility i must fit its capacity and respect its open/closed state
    [ check(
        sum(j in Cust)(int2float(demand[j]) * satisfied[i, j]) <= int2float(capacity[i] * open[i]) + (if is_solution then eps else -eps endif),
        "Facility " ++ show(i) ++ " capacity violated. Serviced: " ++ show(sum(j in Cust)(int2float(demand[j]) * satisfied[i, j])) ++ ", Available: " ++ show(capacity[i] * open[i])
      )
    | i in Fac ];

output [
    if forall(checks)
    then "CORRECT: all constraints hold.\n"
    else "INCORRECT: See error log above for specific violations.\n"
    endif
];