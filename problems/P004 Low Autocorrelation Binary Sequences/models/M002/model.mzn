% Low autocorrelation binary sequences problem with periodic boundary conditions

int: n;

set of int: binary_values = {-1, 1};

array[1..n] of var binary_values: S;

var int: result = sum(k in 1..n-1) ((sum(i in 1..n-k) (S[i] * S[((i+k-1) mod n) + 1])) ^ 2);

solve minimize result;

output ["S = " ++ show(S) ++ ";\n%Obj = " ++ show(result) ++ ";"]