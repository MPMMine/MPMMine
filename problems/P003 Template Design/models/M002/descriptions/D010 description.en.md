# Carton Design Optimization

This problem concerns a printing firm specializing in creating diverse packaging for food and magazines. The firm produces various carton designs, each with the same basic dimensions but differing in the text and color displayed – for instance, one carton might feature ‘Chicken Flavour’ in blue while another shows ‘Rabbit Flavour’ in green. Orders often involve multiple designs in varying quantities. A core sheet of board, determined by the printing machinery, can accommodate several of these designs simultaneously. To minimize wasted material, the challenge is to determine the most effective template plan, considering the number of templates needed and the quantities of each design to include on each. Utilizing multiple templates reduces material waste, but excessively many templates lead to significant excess cardboard. The aim is to determine the optimal number of template plans to manufacture, along with the specific designs and the corresponding number of copies of each to be printed on each template, ultimately reducing material waste.

[//]: # (The original description from CSPLib prob002 striped out an example and an optional problem variant)
==========
MiniZinc model:
%-----------------------------------------------------------------------------%
% Template design
% Problem 002 in CSPLib
%-----------------------------------------------------------------------------%
% Based on "ILP and Constraint Programming Approaches to a Template
% Design Problem", Les Proll and Barbara Smith, School of Computing
% Research Report 97.16, University of Leeds, May 1997.
% Modified by Rafał Stachowiak 2025
%-----------------------------------------------------------------------------%
 
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


[//]: # (Generated using gemma3:latest from D001 description.en.md and model.mzn)
