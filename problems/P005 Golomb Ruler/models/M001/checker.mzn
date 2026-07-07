include "globals.mzn";

int: m;
int: n = m*m;

array[1..m] of 0..n: mark;

array[1..(m*(m-1)) div 2] of int: differences =
    [ mark[j] - mark[i] | i in 1..m, j in i+1..m];

% Flag to determine if the objective value should be checked flag passed via -D "check_objective=true" or "check_objective=false"
bool: check_objective;
% Float with the objective value from the solution file (it is saved there as a comment) -D "obj_from_sol=<number>"
float: obj_from_sol;
float: eps = 1e-6; 

test check(bool: b, string: s) = 
    if b then true else trace_stdout("ERROR: " ++ s ++ "\n", false) endif;

array[int] of bool: checks = 
    % Check 1: Domain of differences array (Fixed index loop)
    [ check(
        differences[i] <= n /\ differences[i] >= 0,
        "Differences[ " ++ show(i) ++ " ] = " ++ show(differences[i]) ++ " is out of bounds [0, " ++ show(n) ++ "]"
    )
    | i in index_set(differences) ] % <--- Dynamically safe index set
    ++
    % Check 2: First mark should be 0
    [ check(
        mark[1] = 0,
        "First mark " ++ show(mark[1]) ++ " is not 0"
    )]
    ++
    % Check 3: Marks should be sorted
    [ check(
        mark[i] < mark[i+1],
        "Mark " ++ show(i) ++ " should be less than mark " ++ show(i+1) 
    )
    | i in 1..m-1 ]
    ++
    % Check 4: All differences between marks should be different
    [ check(
        forall(i, j in index_set(differences) where i < j) (
            differences[i] != differences[j]
        ),
        "The differences between marks are not unique"
    )]
    ++
    % Check 5: (Symmetry breaking) The first difference should be smaller than the last one
    [ check(
        differences[1] < differences[max(index_set(differences))],
        "The first difference is bigger than the last one"
    )]
    ++
    % Conditionally append the objective check inline
    if check_objective then 
        [ check(
            int2float(mark[m]) >= obj_from_sol - eps /\ int2float(mark[m]) <= obj_from_sol + eps,
            "The objective: " ++ show(mark[m]) ++ " does not match the objective from the solution file: " ++ show(obj_from_sol)
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