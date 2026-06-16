include "globals.mzn";
 
int: k;
set of int: positionDomain = 1..2*k;
 
array[positionDomain] of positionDomain: position;
array[positionDomain] of 1..k: solution;

test check(bool: b, string: s) = 
    if b then true else trace_stdout("ERROR: " ++ s ++ "\n", false) endif;

array[int] of bool: checks =
    % Check 1
    [ check(
        position[i+k] = position[i] + i+1 /\
        solution[position[i]] = i /\
        solution[position[k+i]] = i,
        "The langfordt distance constraint violated for number " ++ show(i))
    | i in 1..k ]
    ++
    % Check 2: All positions should be different
    [ check(
        forall(i, j in index_set(position) where i < j) (
            position[i] != position[j]
        ),
        "The positions are not unique"
    )]
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