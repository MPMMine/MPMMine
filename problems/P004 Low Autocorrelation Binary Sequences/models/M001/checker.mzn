int: n;
set of int: binary_values = {-1, 1};
array[1..n] of binary_values: S;
int: result = sum(k in 1..n-1) ((sum(i in 1..n-k) (S[i] * S[i+k])) ^ 2);

% Flag to determine if the objective value should be checked flag passed via -D "check_objective=true" or "check_objective=false"
bool: check_objective;
% Float with the objective value from the solution file (it is saved there as a comment) -D "obj_from_sol=<number>"
float: obj_from_sol;
float: eps = 1e-6; 


test check(bool: b, string: s) = 
    if b then true else trace_stdout("ERROR: " ++ s ++ "\n", false) endif;

output [
  if 
    if check_objective then 
        check(
            int2float(result) >= obj_from_sol - eps /\ int2float(result) <= obj_from_sol + eps,
            "The objective: " ++ show(result) ++ " does not match the objective from the solution file: " ++ show(obj_from_sol)
        )
    else 
        true
    endif
  then "CORRECT: all constraints hold.\n"
  else "INCORRECT: See error log above for specific violations.\n"
  endif
];