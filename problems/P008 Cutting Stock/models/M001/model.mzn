include "globals.mzn";

% Parameters
int: n_items;                        
int: max_rolls;                      
float: roll_width;                   

array[1..n_items] of int: demand; 
array[1..n_items] of float: item_widths; 

% Example:
% n_items = 6;
% max_rolls = 25;
% roll_width = 150.0;
% item_widths = [81.5, 69.1, 51.2, 49.5, 33.8, 22.4];
% demand = [8, 10, 5, 12, 7, 15];

% The absolute physical limit of how many times item i fits on one roll width
array[1..n_items] of int: max_cuts_per_item = [
    floor(roll_width / item_widths[i]) | i in 1..n_items
];

% Variables
% use[j] = 1 if we "buy/use" roll j
array[1..max_rolls] of var 0..1: use;

% cut[i, j] is bounded strictly by the physical capacity of a single roll.
array[1..n_items, 1..max_rolls] of var 0..max(max_cuts_per_item): cut;

% 1. Physical Capacity Bound: You cannot cut more than what physically fits.
constraint forall(i in 1..n_items, j in 1..max_rolls) (
    cut[i, j] <= max_cuts_per_item[i] * use[j]
);

% 2. Width Constraint: The sum of widths must fit in the master roll width
constraint forall(j in 1..max_rolls) (
    sum(i in 1..n_items) (int2float(cut[i, j]) * item_widths[i]) <= roll_width * use[j]
);

% 3. Demand Constraint: Meet (or exceed) integer demand for items
constraint forall(i in 1..n_items) (
    sum(j in 1..max_rolls) (cut[i, j]) >= demand[i]
);

% 4. Symmetry Breaking
constraint symmetry_breaking_constraint(
    forall(j in 1..max_rolls-1) (
        use[j] >= use[j+1]
    )
);

% 5. Redundant Constraint
% We need at least enough rolls to cover the total required width.
constraint implied_constraint(sum(j in 1..max_rolls) (use[j]) >= 
    ceil(sum(i in 1..n_items) (int2float(demand[i]) * item_widths[i]) / roll_width)
    );

solve minimize sum(j in 1..max_rolls) (use[j]);

