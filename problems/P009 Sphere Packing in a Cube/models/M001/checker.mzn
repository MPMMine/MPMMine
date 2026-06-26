include "globals.mzn";
int: N;
set of int: S = 1..N;
array[S] of float: r;
float: L;
array[S] of float: x;
array[S] of float: y;
array[S] of float: z;
array[S] of 0..1: use;

% Unification flag passed via -D "is_solution=true" or "is_solution=false"
bool: is_solution;
float: eps = if is_solution then 5e-4 else -5e-4 endif;

test check(bool: b, string: s) = 
    if b then true else trace_stdout("ERROR: " ++ s ++ "\n", false) endif;

float: M = L * L; 

array[int] of bool: checks = 
    % Check 1: Boundary Constraints (Spheres must be fully inside the cube if used)
    [ check(
        (x[i] >= r[i] * int2float(use[i]) - eps) /\
        (y[i] >= r[i] * int2float(use[i]) - eps) /\
        (z[i] >= r[i] * int2float(use[i]) - eps) /\
        (x[i] <= L - r[i] * int2float(use[i]) + eps) /\
        (y[i] <= L - r[i] * int2float(use[i]) + eps) /\
        (z[i] <= L - r[i] * int2float(use[i]) + eps),
        "Sphere " ++ show(i) ++ " violates boundary limits. Position: (" ++ show(x[i]) ++ "," ++ show(y[i]) ++ "," ++ show(z[i]) ++ ") with radius " ++ show(r[i]) ++ " and use=" ++ show(use[i])
      )
    | i in S ]
    ++
    % Check 2: Non-overlap Constraints (Euclidean distance between two active spheres)
    [ check(
        (x[i] - x[j]) * (x[i] - x[j]) +
        (y[i] - y[j]) * (y[i] - y[j]) +
        (z[i] - z[j]) * (z[i] - z[j])
        >=
        (r[i] + r[j]) * (r[i] + r[j]) - M * int2float(2 - use[i] - use[j]) - eps,
        "Sphere " ++ show(i) ++ " overlaps with Sphere " ++ show(j) ++ "."
      )
    | i, j in S where i < j ]
    ++
    % Check 3: Minimum Count (At least one sphere must be in the cube)
    [ check(
        sum(i in S)(use[i]) >= 1,
        "At least one sphere must be packed, zero packed."
      ) ];

output [
    if forall(checks)
    then "CORRECT: all constraints hold.\n"
    else "INCORRECT: See error log above for specific violations.\n"
    endif
];