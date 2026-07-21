include "globals.mzn";

int: num_ingredients;
int: num_nutrients;
int: num_periods;
set of int: Ingredient = 1..num_ingredients;
set of int: Nutrient = 1..num_nutrients;
set of int: Time = 1..num_periods;
array[Ingredient, Time] of float: cost;
array[Ingredient, Nutrient] of float: comp;
array[Nutrient] of float: min_req;
array[Nutrient] of float: max_req;
float: total_weight;        
float: storage_cap;         
float: holding_cost;        
array[Ingredient] of float: initial_stock;
set of int: Grains; 
array[Ingredient, Time] of float: buy;
array[Ingredient, Time] of float: amount;
array[Ingredient, Time] of float: stock;

% Unification flag passed via -D "is_solution=true" or "is_solution=false"
bool: is_solution;
float: eps = if is_solution then 1e-4 else -1e-4 endif; 
% Flag to determine if the objective value should be checked flag passed via -D "check_objective=true" or "check_objective=false"
bool: check_objective;
% Float with the objective value from the solution file (it is saved there as a comment) -D "obj_from_sol=<number>"
opt float: obj_from_sol;

test check(bool: b, string: s) = 
    if b then true else trace_stdout("ERROR: " ++ s ++ "\n", false) endif;

array[int] of bool: checks =
    % Check 1. Inventory Continuity (Mass Balance over Time)
    [ check(
        stock[i, t] >= ((if t == min(Time) then initial_stock[i] else stock[i, t-1] endif) + buy[i, t] - amount[i, t]) - eps /\
        stock[i, t] <= ((if t == min(Time) then initial_stock[i] else stock[i, t-1] endif) + buy[i, t] - amount[i, t]) + eps,
        "Inventory flow broken for Ingredient " ++ show(i) ++ " at Period " ++ show(t) ++ 
        ". Stock[" ++ show(t) ++ "] is " ++ show(stock[i, t]) ++ ", but (Stock[" ++ show(t-1) ++ "] + Buy - Amount) equals " ++
        show((if t == min(Time) then initial_stock[i] else stock[i, t-1] endif) + buy[i, t] - amount[i, t]) ++ "."
      )
    | i in Ingredient, t in Time ]
    
    ++
    % Check 2. Production Mass Balance (Per Period Target Weight)
    [ check(
        sum(i in Ingredient)(amount[i, t]) >= total_weight - eps /\
        sum(i in Ingredient)(amount[i, t]) <= total_weight + eps,
        "Production Mass Balance violated in Period " ++ show(t) ++ ". Total batch weight is " ++ 
        show(sum(i in Ingredient)(amount[i, t])) ++ ", but target total_weight is " ++ show(total_weight) ++ "."
      )
    | t in Time ]
    
    ++
    % Check 3a. Nutritional Minimum Bounds (Per Period)
    [ check(
        sum(i in Ingredient)(amount[i, t] * comp[i, j]) >= min_req[j] - eps,
        "Period " ++ show(t) ++ ": Nutrient " ++ show(j) ++ " falls below minimum requirement. Total: " ++ 
        show(sum(i in Ingredient)(amount[i, t] * comp[i, j])) ++ ", Minimum required: " ++ show(min_req[j]) ++ "."
      )
    | t in Time, j in Nutrient ]
    
    ++
    % Check 3b. Nutritional Maximum Bounds (Per Period)
    [ check(
        sum(i in Ingredient)(amount[i, t] * comp[i, j]) <= max_req[j] + eps,
        "Period " ++ show(t) ++ ": Nutrient " ++ show(j) ++ " exceeds maximum requirement. Total: " ++ 
        show(sum(i in Ingredient)(amount[i, t] * comp[i, j])) ++ ", Maximum allowed: " ++ show(max_req[j]) ++ "."
      )
    | t in Time, j in Nutrient ]
    
    ++
    % Check 4. Group Totals (Grain base per period)
    [ check(
        sum(i in Grains)(amount[i, t]) >= (0.2 * total_weight) - eps,
        "Period " ++ show(t) ++ ": Grain base minimum requirement violated. Total grains used: " ++ 
        show(sum(i in Grains)(amount[i, t])) ++ ", requires at least 20% of batch weight (" ++ show(0.2 * total_weight) ++ ")."
      )
    | t in Time ]
    ++
    % Conditionally append the objective check inline
    if check_objective then 
    let {float: res = sum(i in Ingredient, t in Time)(buy[i, t] * cost[i, t]) + sum(i in Ingredient, t in Time)(stock[i, t] * holding_cost)} in 
        [ check(
            res >= obj_from_sol - eps /\ res <= obj_from_sol + eps,
            "The objective: " ++ show(res) ++ " does not match the objective from the solution file: " ++ show(obj_from_sol)
        ) ]
    else 
        [] 
    endif;

output [
    if forall(checks)
    then "CORRECT: all constraints hold.\n"
    else "INCORRECT: See error log above for specific violations.\n"
    endif
];
