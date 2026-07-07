include "globals.mzn";
int: num_work;
int: num_shifts;
int: min_num_shifts;
array[1..num_shifts] of set of int: shifts;
array[1..num_shifts] of 0..1: x;
0..num_shifts: tot_shifts;
% Flag to determine if the objective value should be checked flag passed via -D "check_objective=true" or "check_objective=false"
bool: check_objective;
% Float with the objective value from the solution file (it is saved there as a comment) -D "obj_from_sol=<number>"
float: obj_from_sol;
float: eps = 1e-6; 

test check(bool: b, string: s) = 
    if b then true else trace_stdout("ERROR: " ++ s ++ "\n", false) endif;

array[int] of bool: checks =
    % Check 1: Total shifts are equal to scheduled shifts
    [ check(
        tot_shifts = sum(x),
        "The number of total shifts " ++ show(tot_shifts) ++ " differs from the number of scheduled shifts " ++ show(sum(x))
    ) ]
    ++
    % Check 2: Each ride is exactly once in the shift set.
    [ check(
        sum(i in 1..num_shifts) (x[i] * bool2int(j in shifts[i])) = 1,
        "The ride " ++ show(j) ++ " is not covered exactly once (Current count: " ++ show(sum(i in 1..num_shifts) (x[i] * bool2int(j in shifts[i]))) ++ ")."
    )
    | j in 0..num_work-1 ]
    ++
    % Check 3: Minimum shift requirement
    [ check( 
        tot_shifts >= min_num_shifts,
        "Total shifts (" ++ show(tot_shifts) ++ ") do not reach the minimal number of shifts (" ++ show(min_num_shifts) ++ ")."
    ) ]
    ++
    % Conditionally append the objective check inline
    if check_objective then 
        [ check(
            tot_shifts >= obj_from_sol - eps /\ tot_shifts <= obj_from_sol + eps,
            "The objective: " ++ show(tot_shifts) ++ " does not match the objective from the solution file: " ++ show(obj_from_sol)
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