int: k;
array[1..2*k] of 1..k: solution;

% To ensure common contract of the checker files we add those parameters as unused optionals. 
opt bool: check_objective;
opt float: obj_from_sol;

test check(bool: b, string: s) = 
    if b then true else trace_stdout("ERROR: " ++ s ++ "\n", false) endif;

array[int] of bool: checks =
    % Check 1: Each number i must appear exactly 2 times in the array inspiration: https://github.com/MiniZinc/libminizinc/blob/master/share/minizinc/std/fzn_count_eq.mzn
    [ check(
        2 = sum (j in 1..2*k) (solution[j] == i),
        "Number " ++ show(i) ++ " does not appear exatly two times in the solution array.")
    | i in 1..k ]
    ++
    % Check 2: The Langford distance constraint
    [ check(
        exists(p in 1..2*k - (i+1)) (
            solution[p] = i /\ solution[p + i + 1] = i
        ),
        "The langfordt distance constraint violated for number " ++ show(i))
    | i in 1..k ]
    ++
    % Check 3: Symmetry breaking
    [ check(
        solution[1] < solution[2*k],
        "Symmetry breaking violation"
    )];

output [
    if forall(checks)
    then "CORRECT: all constraints hold.\n"
    else "INCORRECT: See error log above for specific violations.\n"
    endif
];