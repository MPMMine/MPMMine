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
% - Added implied_constraint, and symmetry_breaking_constraint labels to additional constraints.
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

% Sum of all Rj.
var llower..lupper: Production;

% Production x S - sum(d[i])
var 0..lupper-llower: Surplus;

% First, set up Production to be the sum of the Rj
constraint
    Production = sum(i in 1..t)(R[i]);

% the limits on production
constraint
    Production >= llower /\ Production <= lupper;

% The number of slots occupied in each template is S.
constraint
    forall(j in 1..t)
         (sum(i in 1..n)(p[i,j]) = S);

% Enough of each variation is printed.
constraint
    forall(i in 1..n)
         (sum(j in 1..t)(p[i,j]*R[j]) >= d[i]);

% % Symmetry constraints.
% % Variations with the same demand are symmetric.
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

% implied constraints on the surplus

% [Rafał Stachowiak] Since those constraints despite being `implied` make the attached instances infeasible, we include them in the descriptions.

% These are presented in the paper as necessary to get good
% performance for this model, but I think bounds consistency on the
% sum(R[i]) constraint would produce the same amount of propagation

% [Rafał Stachowiak] The constraints below make instances P003M001I003, P003M001I005-8 infeasible,
% hence despite being implied they are included in the model checker.

% Set up surplus, which is bounded as production is bounded.
constraint implied_constraint(
    Surplus = Production*S - sum(i in 1..n)(d[i]));

% The surplus of each variation is also limited by the surplus.
constraint implied_constraint(
    forall(k in 1..n)
         (sum(j in 1..t)(p[k,j]*R[j]-d[k]) <= Surplus));

% The surplus of the first k variations is limited by the surplus.
constraint implied_constraint(
    forall(k in 2..n-1)
         (sum(j in 1..t, m in 1..k)( p[m,j]*R[j]-d[m] ) <= Surplus));

% Implied constraints on the run length.
constraint implied_constraint(
    if t=2 then (
        R[1] <= Production div 2
    /\  R[2] >= Production div 2
    ) else true endif);

constraint implied_constraint(
    if t=3 then (
        R[1] <= Production div 3
    /\  R[2] <= Production div 2
    /\  R[3] >= Production div 3
    ) else true endif);

solve :: int_search(array1d(1..n*t,p) ++ R, input_order, indomain_min, complete)
    minimize Production;

%-----------------------------------------------------------------------------%
%-----------------------------------------------------------------------------%