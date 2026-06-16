include "globals.mzn";

int: S;
int: t;
int: n;
array[1..n] of int: d;
int: llower = ceil(sum(i in 1..n)(int2float(d[i]))/int2float(S));
int: lupper = 2*llower;
array[1..n,1..t] of 0..S: p;
array[1..t] of 1..lupper: R;
llower..lupper: Production;
0..lupper-llower: Surplus;

test check(bool: b, string: s) = 
    if b then true else trace_stdout("ERROR: " ++ s ++ "\n", false) endif;


array[int] of bool: checks = 
    % Check 1: Set up Production to be the sum of the Rj
    [ check(
        Production = sum(i in 1..t)(R[i]),
        "The total production " ++ show(Production) ++ " does not equal the sum of template runs " ++ show(R) ++ "."
    )]
    ++
    % Check 2: The limits on production
    [ check(
        Production >= llower /\ Production <= lupper,
        "The total production " ++ show(Production) ++ " is out of bounds ( " ++ show(llower) ++ " - " ++ show(lupper) ++ " )"
    )]
    ++
    % Check 3: The number of slots occupied in each template is S.
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
    | i in 1..n-1 ]
    ++
    % Check 7: Surplus calculation definition
    [ check(
        Surplus = Production * S - sum(i in 1..n)(d[i]),
        "Surplus value " ++ show(Surplus) ++ " does not match calculated surplus " ++ show(Production * S - sum(i in 1..n)(d[i])) ++ "."
    )]
    ++
    % Check 8: Individual variation surplus is bounded by total Surplus
    [ check(
        sum(j in 1..t)(p[k,j]*R[j] - d[k]) <= Surplus,
        "Individual surplus for variation " ++ show(k) ++ " exceeds total Surplus " ++ show(Surplus) ++ "."
    )
    | k in 1..n ]
    ++
    % Check 9: Cumulative surplus of the first k variations is bounded by total Surplus
    [ check(
        sum(j in 1..t, m in 1..k)(p[m,j]*R[j] - d[m]) <= Surplus,
        "Cumulative surplus of first " ++ show(k) ++ " variations exceeds total Surplus " ++ show(Surplus) ++ "."
    )
    | k in 2..n-1 ]
    ++
    % Check 10: Run length limits for fixed t (t=2 or t=3)
    [ check(
        if t = 2 then 
            (R[1] <= Production div 2 /\ R[2] >= Production div 2)
        elseif t = 3 then 
            (R[1] <= Production div 3 /\ R[2] <= Production div 2 /\ R[3] >= Production div 3)
        else true endif,
        "Run length implied constraints violated for t = " ++ show(t) ++ " with template runs R = " ++ show(R) ++ "."
    )];

output [
  if forall(checks)
  then "CORRECT: all constraints hold.\n"
  else "INCORRECT: See error log above for specific violations.\n"
  endif
];