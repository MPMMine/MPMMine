include "globals.mzn";

% Input: Number of partitions
int: n; 

% Best known bound
int: max_k = floor((exp(1) - 1/6) * product(1..n)); 

% Decision Variables
var 1..max_k: k;                % The Schur number we want to find
array[1..max_k] of var 1..n: x; % Which set each number belongs to

% The Sum-Free Constraint:
% For any i, j where i + j is within our current range k,
% they cannot all share the same color.
constraint forall(i in 1..max_k-1, j in i..max_k-i) (
    (x[i] == x[j] /\ x[i+j] == x[i]) -> i+j > k
);

% Symmetry Breaking:
% Standard trick to ensure sets are filled in order (1, then 2, etc.)
% This prevents the solver from checking redundant permutations.
constraint symmetry_breaking_constraint(value_precede_chain(1..n, x));

% The Goal: Maximize the range k
solve maximize k;

%output [
%    "Schur Number S(\(n)) = \(k)\n",
%    "Partitions: \n"
%] ++ 
%[ "Set \(c): " ++ show([i | i in 1..fix(k) where fix(x[i]) == c]) ++ "\n" | c in 1..n];
