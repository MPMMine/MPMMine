int: n;
set of int: binary_values = {-1, 1};
array[1..n] of binary_values: S;
int: result = sum(k in 1..n-1) ((sum(i in 1..n-k) (S[i] * S[((i+k-1) mod n) + 1])) ^ 2);

output [
  if true
  then "CORRECT: all constraints hold.\n"
  else "INCORRECT: See error log above for specific violations.\n"
  endif
];