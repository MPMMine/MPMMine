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
float: eps = if is_solution then 1e-4 else -1e-4 endif; 
% Flag to determine if the objective value should be checked flag passed via -D "check_objective=true" or "check_objective=false"
bool: check_objective;
% Float with the objective value from the solution file (it is saved there as a comment) -D "obj_from_sol=<number>"
opt float: obj_from_sol;

test check(bool: b, string: s) = 
    if b then true else trace_stdout("ERROR: " ++ s ++ "\n", false) endif;

array[int] of bool: checks = 
    % Check 1. Mass Balance (Must equal total_weight within epsilon range)
    [ check(
        sum(i in Ingredient)(amount[i]) >= total_weight - eps /\
        sum(i in Ingredient)(amount[i]) <= total_weight + eps,
        "Mass Balance violated. Total batch weight is " ++ show(sum(i in Ingredient)(amount[i])) ++ 
        ", but target total_weight is " ++ show(total_weight) ++ "."
      ) ]
      
    ++
    % Check 2. Nutritional Minimum Bounds
    [ check(
        sum(i in Ingredient)(amount[i] * comp[i, j]) >= min_req[j] - eps,
        "Nutrient " ++ show(j) ++ " falls below minimum requirement. Total: " ++ 
        show(sum(i in Ingredient)(amount[i] * comp[i, j])) ++ ", Minimum required: " ++ show(min_req[j]) ++ "."
      )
    | j in Nutrient ]
    
    ++
    % Check 3. Nutritional Maximum Bounds
    [ check(
        sum(i in Ingredient)(amount[i] * comp[i, j]) <= max_req[j] + eps,
        "Nutrient " ++ show(j) ++ " exceeds maximum requirement. Total: " ++ 
        show(sum(i in Ingredient)(amount[i] * comp[i, j])) ++ ", Maximum allowed: " ++ show(max_req[j]) ++ "."
      )
    | j in Nutrient ]
    
    ++
    % Check 4. Group Totals (Grain base minimum)
    [ check(
        sum(i in Grains)(amount[i]) >= (0.2 * total_weight) - eps,
        "Grain base minimum requirement violated. Total grains used: " ++ show(sum(i in Grains)(amount[i])) ++ 
        ", requires at least 20% of total batch weight (" ++ show(0.2 * total_weight) ++ ")."
      ) ]
    ++
    % Conditionally append the objective check inline
    if check_objective then 
    let {float: res = sum(i in Ingredient)(amount[i] * cost[i])} in 
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