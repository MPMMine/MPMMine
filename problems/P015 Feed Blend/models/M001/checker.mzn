include "globals.mzn";

int: num_ingredients;
int: num_nutrients;
set of int: Ingredient = 1..num_ingredients;
set of int: Nutrient = 1..num_nutrients;
array[Ingredient] of float: cost;
array[Ingredient, Nutrient] of float: comp;
array[Nutrient] of float: min_req;
array[Nutrient] of float: max_req;
float: total_weight;
set of int: Grains; 
array[Ingredient] of float: amount;

% Unification flag passed via -D "is_solution=true" or "is_solution=false"
bool: is_solution;
float: eps = 1e-4; 

test check(bool: b, string: s) = 
    if b then true else trace_stdout("ERROR: " ++ s ++ "\n", false) endif;

array[int] of bool: checks = 
    % Check 1. Mass Balance (Must equal total_weight within epsilon range)
    [ check(
        sum(i in Ingredient)(amount[i]) >= total_weight - (if is_solution then eps else -eps endif) /\
        sum(i in Ingredient)(amount[i]) <= total_weight + (if is_solution then eps else -eps endif),
        "Mass Balance violated. Total batch weight is " ++ show(sum(i in Ingredient)(amount[i])) ++ 
        ", but target total_weight is " ++ show(total_weight) ++ "."
      ) ]
      
    ++
    % Check 2. Nutritional Minimum Bounds
    [ check(
        sum(i in Ingredient)(amount[i] * comp[i, j]) >= min_req[j] - if is_solution then eps else -eps endif,
        "Nutrient " ++ show(j) ++ " falls below minimum requirement. Total: " ++ 
        show(sum(i in Ingredient)(amount[i] * comp[i, j])) ++ ", Minimum required: " ++ show(min_req[j]) ++ "."
      )
    | j in Nutrient ]
    
    ++
    % Check 3. Nutritional Maximum Bounds
    [ check(
        sum(i in Ingredient)(amount[i] * comp[i, j]) <= max_req[j] + if is_solution then eps else -eps endif,
        "Nutrient " ++ show(j) ++ " exceeds maximum requirement. Total: " ++ 
        show(sum(i in Ingredient)(amount[i] * comp[i, j])) ++ ", Maximum allowed: " ++ show(max_req[j]) ++ "."
      )
    | j in Nutrient ]
    
    ++
    % Check 4. Group Totals (Grain base minimum)
    [ check(
        sum(i in Grains)(amount[i]) >= (0.2 * total_weight) - if is_solution then eps else -eps endif,
        "Grain base minimum requirement violated. Total grains used: " ++ show(sum(i in Grains)(amount[i])) ++ 
        ", requires at least 20% of total batch weight (" ++ show(0.2 * total_weight) ++ ")."
      ) ];

output [
    if forall(checks)
    then "CORRECT: all constraints hold.\n"
    else "INCORRECT: See error log above for specific violations.\n"
    endif
];