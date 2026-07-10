include "globals.mzn";

int: n;
set of int: Crudes = 1..n;
enum Products = { Gasoline, Jet_Fuel, Heating_Oil };
array[Crudes] of float: cost;            
array[Crudes] of float: max_supply;      
array[Crudes, Products] of float: yields; 
array[Crudes] of float: sulfur;          
array[Crudes] of float: labor;           
float: total_cap;        
float: budget;           
float: max_labor;        
float: max_sulfur;       
array[Products] of float: price;         
array[Products] of float: min_req;       
array[Crudes] of float: amount_to_process;   

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
    % Check 1. Individual Supply Limits
    [ check(
        amount_to_process[i] <= max_supply[i] + eps,
        "Crude " ++ show(i) ++ " processed amount (" ++ show(amount_to_process[i]) ++ 
        ") exceeds max supply (" ++ show(max_supply[i]) ++ ")."
      )
    | i in Crudes ]
    
    ++
    % Check 2. Total Distillation Capacity
    [ check(
        sum(i in Crudes)(amount_to_process[i]) <= total_cap + eps,
        "Total processed amount (" ++ show(sum(i in Crudes)(amount_to_process[i])) ++ 
        ") exceeds total capacity (" ++ show(total_cap) ++ ")."
      ) ]
      
    ++
    % Check 3. Environmental Sulfur Cap
    [ check(
        sum(i in Crudes)(amount_to_process[i] * sulfur[i]) <= max_sulfur + eps,
        "Total sulfur (" ++ show(sum(i in Crudes)(amount_to_process[i] * sulfur[i])) ++ 
        ") exceeds maximum environmental cap (" ++ show(max_sulfur) ++ ")."
      ) ]
      
    ++
    % Check 4. Labor/Staffing Limit
    [ check(
        sum(i in Crudes)(amount_to_process[i] * labor[i]) <= max_labor + eps,
        "Total labor hours (" ++ show(sum(i in Crudes)(amount_to_process[i] * labor[i])) ++ 
        ") exceed available labor limit (" ++ show(max_labor) ++ ")."
      ) ]
      
    ++
    % Check 5. Procurement Budget
    [ check(
        sum(i in Crudes)(amount_to_process[i] * cost[i]) <= budget + eps,
        "Total cost (" ++ show(sum(i in Crudes)(amount_to_process[i] * cost[i])) ++ 
        ") exceeds available procurement budget (" ++ show(budget) ++ ")."
      ) ]
      
    ++
    % Check 6. Contractual Obligations
    [ check(
        sum(i in Crudes)(amount_to_process[i] * yields[i, p]) >= min_req[p] - eps,
        "Yield for product " ++ show(p) ++ " (" ++ show(sum(i in Crudes)(amount_to_process[i] * yields[i, p])) ++ 
        ") falls short of contractual minimum (" ++ show(min_req[p]) ++ ")."
      )
    | p in Products ]
    
    ++
    % Check 7. Chemical Stability Rule
    [ check(
        amount_to_process[1] >= (sum(i in Crudes)(amount_to_process[i]) * 0.15) - eps,
        "Chemical stability rule violated: Crude 1 must be at least 15% of the total mix. Current Crude 1: " ++ 
        show(amount_to_process[1]) ++ " out of total " ++ show(sum(i in Crudes)(amount_to_process[i])) ++ "."
      ) ]
    ++
    % Conditionally append the objective check inline
    if check_objective then 
    let {float: res = sum(i in Crudes, p in Products)(amount_to_process[i] * yields[i, p] * price[p]) - sum(i in Crudes)(amount_to_process[i] * cost[i])} in 
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