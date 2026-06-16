include "globals.mzn";
 
int: S;
int: t;
int: n;
array[1..n] of int: d;
int: llower = ceil(sum(i in 1..n)(int2float(d[i]))/int2float(S));
int: lupper = 2*llower;
array[1..n,1..t] of 0..S: p;
array[1..t] of 1..lupper: R;

test check(bool: b, string: s) = 
    if b then true else trace_stdout("ERROR: " ++ s ++ "\n", false) endif;


array[int] of bool: checks = 
    % Check 1: The limits on production
    [ check(
        sum(i in 1..t)(R[i]) >= llower /\ sum(i in 1..t)(R[i]) <= lupper,
        "The total production " ++ show(sum(i in 1..t)(R[i])) ++ " is out of bounds ( " ++ show(llower) ++ " - " ++ show(lupper) ++ " )"
    )]
    ++
    % Check 2: The number of slots occupied in each template is S.
    [ check(
        sum(i in 1..n)(p[i,j]) = S,
        "Template " ++ show(j) ++ " does not have the defined number of slots " ++ show(S) ++ "."
    )
    | j in 1..t ]
    ++
    % Check 4: Enough of each variation is printed.
    [ check(
        sum(j in 1..t)(p[i,j]*R[j]) >= d[i],
        "Variation " ++ show(i) ++ " has not enough prints " ++ show(sum(j in 1..t)(p[i,j]*R[j])) ++ " (should be at least " ++ show(d[i]) ++ " )"
    )
    | i in 1..n ]
    ++
    % Check 5: Variations with the same demand are lexicographically ordered (Symmetry Breaking)
    [ check(
        if d[i] == d[i+1] then 
            lex_lesseq([p[i, j] | j in 1..t], [p[i+1, j] | j in 1..t]) 
        else true endif,
        "Symmetry violation: Variation " ++ show(i) ++ " and " ++ show(i+1) ++ " have identical demand " ++ show(d[i]) ++ " but are not lexicographically ordered."
    )
    | i in 1..n-1 ]
    ++
    % Check 6: Variations with lower demand have less or equal actual total prints (Pseudo Symmetry)
    [ check(
        if d[i] < d[i+1] then 
            sum(j in 1..t)(p[i,j]*R[j]) <= sum(j in 1..t)(p[i+1,j]*R[j]) 
        else true endif,
        "Pseudo symmetry violation: Variation " ++ show(i) ++ " has more total prints ( " ++ show(sum(j in 1..t)(p[i,j]*R[j])) ++ " ) than Variation " ++ show(i+1) ++ " ( " ++ show(sum(j in 1..t)(p[i+1,j]*R[j])) ++ " )."
    )
    | i in 1..n-1 ];

output [
  if forall(checks)
  then "CORRECT: all constraints hold.\n"
  else "INCORRECT: See error log above for specific violations.\n"
  endif
];