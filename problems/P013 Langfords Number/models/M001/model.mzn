% Created by: Rafał Stachowiak 2026

include "globals.mzn";

int: k;
array[1..2*k] of var 1..k: solution;

% 1. Each number i must appear exactly 2 times in the array
constraint forall(i in 1..k) (
    count_eq(solution, i, 2)
);

% 2. The Langford distance constraint
% For every i, there must be some position p such that
% solution[p] and solution[p + i + 1] both equal i.
constraint forall(i in 1..k) (
    exists(p in 1..2*k - (i+1)) (
        solution[p] = i /\ solution[p + i + 1] = i
    )
);

% 3. Symmetry breaking
constraint solution[1] < solution[2*k];

solve satisfy;