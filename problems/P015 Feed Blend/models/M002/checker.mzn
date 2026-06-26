include "globals.mzn";

int: num_ingredients;
int: num_nutrients;
int: num_periods;
set of int: Ingredient = 1..num_ingredients;
set of int: Nutrient = 1..num_nutrients;
set of int: Time = 1..num_periods;
set of int: Time0 = 0..num_periods;
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
array[Ingredient, Time0] of float: stock;

% Unification flag passed via -D "is_solution=true" or "is_solution=false"
bool: is_solution;
float: eps = if is_solution then 1e-4 else -1e-4 endif; 

test check(bool: b, string: s) = 
    if b then true else trace_stdout("ERROR: " ++ s ++ "\n", false) endif;

array[int] of bool: checks = 
    % Check 1. Initial Inventory (at t=0)
    [ check(
        stock[i, 0] >= initial_stock[i] - eps /\
        stock[i, 0] <= initial_stock[i] + eps,
        "Initial stock mismatch for Ingredient " ++ show(i) ++ ". Expected: " ++ 
        show(initial_stock[i]) ++ ", Found: " ++ show(stock[i, 0]) ++ "."
      )
    | i in Ingredient ]
    
    ++
    % Check 2. Inventory Continuity (Mass Balance over Time)
    [ check(
        stock[i, t] >= (stock[i, t-1] + buy[i, t] - amount[i, t]) - eps /\
        stock[i, t] <= (stock[i, t-1] + buy[i, t] - amount[i, t]) + eps,
        "Inventory flow broken for Ingredient " ++ show(i) ++ " at Period " ++ show(t) ++ 
        ". Stock[" ++ show(t) ++ "] is " ++ show(stock[i, t]) ++ ", but (Stock[" ++ show(t-1) ++ 
        "] + Buy - Amount) equals " ++ show(stock[i, t-1] + buy[i, t] - amount[i, t]) ++ "."
      )
    | i in Ingredient, t in Time ]
    
    ++
    % Check 3. Production Mass Balance (Per Period Target Weight)
    [ check(
        sum(i in Ingredient)(amount[i, t]) >= total_weight - eps /\
        sum(i in Ingredient)(amount[i, t]) <= total_weight + eps,
        "Production Mass Balance violated in Period " ++ show(t) ++ ". Total batch weight is " ++ 
        show(sum(i in Ingredient)(amount[i, t])) ++ ", but target total_weight is " ++ show(total_weight) ++ "."
      )
    | t in Time ]
    
    ++
    % Check 4a. Nutritional Minimum Bounds (Per Period)
    [ check(
        sum(i in Ingredient)(amount[i, t] * comp[i, j]) >= min_req[j] - eps,
        "Period " ++ show(t) ++ ": Nutrient " ++ show(j) ++ " falls below minimum requirement. Total: " ++ 
        show(sum(i in Ingredient)(amount[i, t] * comp[i, j])) ++ ", Minimum required: " ++ show(min_req[j]) ++ "."
      )
    | t in Time, j in Nutrient ]
    
    ++
    % Check 4b. Nutritional Maximum Bounds (Per Period)
    [ check(
        sum(i in Ingredient)(amount[i, t] * comp[i, j]) <= max_req[j] + eps,
        "Period " ++ show(t) ++ ": Nutrient " ++ show(j) ++ " exceeds maximum requirement. Total: " ++ 
        show(sum(i in Ingredient)(amount[i, t] * comp[i, j])) ++ ", Maximum allowed: " ++ show(max_req[j]) ++ "."
      )
    | t in Time, j in Nutrient ]
    
    ++
    % Check 5. Group Totals (Grain base per period)
    [ check(
        sum(i in Grains)(amount[i, t]) >= (0.2 * total_weight) - eps,
        "Period " ++ show(t) ++ ": Grain base minimum requirement violated. Total grains used: " ++ 
        show(sum(i in Grains)(amount[i, t])) ++ ", requires at least 20% of batch weight (" ++ show(0.2 * total_weight) ++ ")."
      )
    | t in Time ];

output [
    if forall(checks)
    then "CORRECT: all constraints hold.\n"
    else "INCORRECT: See error log above for specific violations.\n"
    endif
];