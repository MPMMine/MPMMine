# Carton Design Problem

This challenge concerns a printing business that produces a range of packaging products from thin board, including boxes for food and promotional materials. These food boxes frequently come in different flavours and varieties, while promotional inserts are typically uniform in design but vary in text and colour. For example, distinct flavour versions of a pet food carton might show ‘Chicken Taste’ on one with a blue backdrop and ‘Salmon Taste’ on another with a red backdrop. A typical order involves multiple quantities of several distinct design types. Since each type of design uses a board segment of a consistent size and shape, we can determine beforehand precisely how many items can be printed on each substantial board sheet, which is largely defined by the constraints of the printing machinery. Each substantial board sheet is printed upon using a template, consisting of a compact aluminium sheet bearing the design for a multitude of variants. The goal is to decide the optimal number of unique templates to create and which design variations, alongside the quantity of each, should be included on each template.

To minimize waste, it's necessary to produce a template plan that reduces the amount of unused board. This can be achieved by using more templates. The challenge is to determine the ideal number of template designs – from one to several – to achieve this minimized waste, considering the diverse range of carton designs and their respective demands.

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
