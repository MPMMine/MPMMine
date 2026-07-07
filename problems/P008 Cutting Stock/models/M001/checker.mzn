include "globals.mzn";

int: n_items;                        
int: max_rolls;                      
float: roll_width;                   
array[1..n_items] of int: demand; 
array[1..n_items] of float: item_widths; 
array[1..n_items] of int: max_cuts_per_item = [
    floor(roll_width / item_widths[i]) | i in 1..n_items
];
array[1..max_rolls] of 0..1: use;
array[1..n_items, 1..max_rolls] of 0..max(max_cuts_per_item): cut;

% Unification flag passed via -D "is_solution=true" or "is_solution=false"
bool: is_solution;
float: eps = if is_solution then 1e-7 else -1e-7 endif;
% Flag to determine if the objective value should be checked flag passed via -D "check_objective=true" or "check_objective=false"
bool: check_objective;
% Float with the objective value from the solution file (it is saved there as a comment) -D "obj_from_sol=<number>"
float: obj_from_sol;

test check(bool: b, string: s) = 
    if b then true else trace_stdout("ERROR: " ++ s ++ "\n", false) endif;

array[int] of bool: checks = 
    % Check 1. Physical Capacity Bound: You cannot cut more than what physically fits.
    [ check( 
        cut[i, j] <= max_cuts_per_item[i] * use[j],
        "Item " ++ show(i) ++ " on roll " ++ show(j) ++ " violates the physical capacity bound. You want to cut " ++ show(cut[i, j]) ++ " units having " ++ show(max_cuts_per_item[i] * use[j]) ++ " units.")
    | i in 1..n_items, j in 1..max_rolls ]
    ++
    % Check 2: Width Constraint: The sum of widths must fit in the master roll width (with eps tolerance due to cast to float)
    [ check(
        sum(i in 1..n_items) (int2float(cut[i, j]) * item_widths[i]) <= roll_width * use[j] + eps,
        "Items on roll " ++ show(j) ++ "")
    | j in 1..max_rolls ]
    ++
    % Check 3: Demand Constraint: Meet (or exceed) integer demand for items
    [ check(
        sum(j in 1..max_rolls) (cut[i, j]) >= demand[i],
        "The demand on item " ++ show(i) ++ " = " ++ show(sum(j in 1..max_rolls) (cut[i, j])) ++ " is not met. Demand = " ++ show(demand[i])
    )
    | i in 1..n_items ]
    ++
    % Check 4: Symmetry Breaking
    [ check(
        use[j] >= use[j+1],
        "Item " ++ show(j) ++ " is smaller than item " ++ show(j+1)
    )
    | j in 1..max_rolls-1 ]
    ++
    % Conditionally append the objective check inline
    if check_objective then 
    let {float: res = sum(j in 1..max_rolls) (use[j])} in 
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