int: n;
set of int: OBJ = 1..n;
int: capacity;
array[OBJ] of int: profit;
array[OBJ] of int: size;
array[OBJ] of float: x; 

% Unification flag passed via -D "is_solution=true" or "is_solution=false"
bool: is_solution;
float: eps = if is_solution then 1e-7 else -1e-7 endif;

test check(bool: b, string: s) = 
    if b then true else trace_stdout("ERROR: " ++ s ++ "\n", false) endif;

array[int] of bool: checks = 
    % Check 1: Domain check for variables (continuous knapsack items must be between 0.0 and 1.0)
    [ check(
        x[i] >= 0.0 - eps /\ x[i] <= 1.0 + eps,
        "Item " ++ show(i) ++ " fraction " ++ show(x[i]) ++ " is out of bounds [0.0, 1.0]."
    )
    | i in OBJ ]
    ++
    % Check 2: Dynamic Capacity Constraint Check based on solution type
    [ check(
        
            % Solutions must stay within capacity bounds
            sum(i in OBJ)(size[i] * x[i]) <= capacity + eps,
            "Total size " ++ show(sum(i in OBJ)(size[i] * x[i])) ++ 
            " exceeds knapsack capacity of " ++ show(capacity)
    )];

output [
    if forall(checks)
    then "CORRECT: all constraints hold.\n"
    else "INCORRECT: See error log above for specific violations.\n"
    endif
];