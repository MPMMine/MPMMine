%-----------------------------------------------------------------------------%
% Template design
% Problem 002 in CSPLib
%-----------------------------------------------------------------------------%
% Based on "ILP and Constraint Programming Approaches to a Template
% Design Problem", Les Proll and Barbara Smith, School of Computing
% Research Report 97.16, University of Leeds, May 1997.
%-----------------------------------------------------------------------------%
% Modified by Rafał Stachowiak 2025
% === CHANGES MADE ===:
% - Added symmetry_breaking_constraint labels to additional constraints.
% - Removed Surplus variables.
% - Replaced Production variable with its definition so that it is not shown at the output.
% - Removed implied constraints.
% - Removed custom output.

include "globals.mzn";
 
int: S;         % Number of slots per template.
int: t;         % Number of templates.
int: n;         % Number of variations.
array[1..n] of int: d;  % How much of each variation we must print?
 
% Lower and upper bounds for the total production.
%
int: llower = ceil(sum(i in 1..n)(int2float(d[i]))/int2float(S));
int: lupper = 2*llower; % If t>1, this should be the optimal Production_{t-1}-1.
 
% # Slots allocated to variation i in template j
array[1..n,1..t] of var 0..S: p;
 
% # Pressings of template j.
array[1..t] of var 1..lupper: R;
 
% the limits on production
constraint
    sum(i in 1..t)(R[i]) >= llower /\ sum(i in 1..t)(R[i]) <= lupper;
 
% The number of slots occupied in each template is S.
constraint
    forall(j in 1..t)
         (sum(i in 1..n)(p[i,j]) = S);
 
% Enough of each variation is printed.
constraint
    forall(i in 1..n)
         (sum(j in 1..t)(p[i,j]*R[j]) >= d[i]);
 
% Symmetry constraints.
% Variations with the same demand are symmetric.
constraint symmetry_breaking_constraint(
    forall(i in 1..n-1) (
        if d[i] == d[i+1] then
            lex_lesseq([p[i,  j] | j in 1..t],
                [p[i+1,j] | j in 1..t])
        else
            true
        endif
    )
);

% % pseudo symmetry
constraint symmetry_breaking_constraint(
    forall(i in 1..n-1) (
        if d[i] < d[i+1] then
               sum (j in 1..t) (p[i,j]*R[j])
             <= sum (j in 1..t) (p[i+1,j]*R[j])
        else
            true
        endif
    )
);

% Minimize the production.
solve :: int_search(array1d(1..n*t,p) ++ R, input_order, indomain_min, complete)
    minimize sum(i in 1..t)(R[i]);