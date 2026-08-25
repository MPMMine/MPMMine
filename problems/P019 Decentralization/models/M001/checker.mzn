include "globals.mzn";

enum DEPT;
enum CITY;
int: max_dept;
array[DEPT, CITY] of int: benefits;
array[DEPT, DEPT] of float: comm_quantity;
array[CITY, CITY] of int: comm_cost;
array[DEPT] of CITY: loc;


float: eps = 1e-4; 
% Flag to determine if the objective value should be checked flag passed via -D "check_objective=true" or "check_objective=false"
bool: check_objective;
% Float with the objective value from the solution file (it is saved there as a comment) -D "obj_from_sol=<number>"
opt float: obj_from_sol;

test check(bool: b, string: s) = 
    if b then true else trace_stdout("ERROR: " ++ s ++ "\n", false) endif;

array[int] of bool: checks = 
    % Check 1. City capacity constraint (at most `max_dept` departments per city)
    [ check(
        sum(d in DEPT)(bool2int(loc[d] == c)) <= max_dept,
        "City capacity violated for city " ++ show(c) ++ ". Assigned departments: " ++ 
        show(sum(d in DEPT)(bool2int(loc[d] == c))) ++ ", maximum allowed is " ++ show(max_dept) ++ "."
      )
    | c in CITY ]
    ++
    % Conditionally append the objective check inline
    if check_objective then 
    let {
        float: res = sum(i in DEPT, k in DEPT where i < k)(
            comm_quantity[i, k] * comm_cost[loc[i], loc[k]]
        ) - sum(i in DEPT)(benefits[i, loc[i]])
    } in 
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