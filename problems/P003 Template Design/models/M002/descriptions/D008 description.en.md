# Carton Design Optimization

This problem addresses the challenge of creating print templates for a printing firm producing diverse carton designs. The firm manufactures cartons for food and magazine products, with variations in colour and text often differentiating between product flavours or brands. Each carton shares a standard size and shape, and multiple cartons can be printed on a single large sheet of board due to the constraints of the printing machinery. The objective is to determine the most efficient template strategy, specifically how many unique templates to manufacture and which product variations, along with the quantity of each, to include on each template. Utilizing more templates reduces waste, but excessive use also increases production costs. The goal is to establish template plans that minimize material waste, considering the potential for using one template, two templates, or more.

The production process relies on aluminum templates, each etched with several design variations, which are then printed on. The challenge is to strategically select the number of templates and the specific variations to include on each, optimizing the production to minimize waste and fulfill customer orders. 

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
