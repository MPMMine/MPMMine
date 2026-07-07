include "globals.mzn";

int: n; 
set of int: Crudes = 1..n;
enum Products = { Gasoline, Jet_Fuel, Heating_Oil };
enum Resources = { Sulfur, Labor, Budget };
array[Crudes] of float: max_supply;
array[Crudes, Products] of float: yields;
array[Products] of float: price;
array[Products] of float: min_req;
array[Resources, Crudes] of float: consumption;
array[Resources] of float: resource_cap;
float: total_cap;
array[Crudes] of float: amount_to_process;

% Unification flag passed via -D "is_solution=true" or "is_solution=false"
bool: is_solution;
float: eps = if is_solution then 1e-4 else -1e-4 endif; 
% Flag to determine if the objective value should be checked flag passed via -D "check_objective=true" or "check_objective=false"
bool: check_objective;
% Float with the objective value from the solution file (it is saved there as a comment) -D "obj_from_sol=<number>"
float: obj_from_sol;

test check(bool: b, string: s) = 
    if b then true else trace_stdout("ERROR: " ++ s ++ "\n", false) endif;

array[int] of bool: checks = 
    % Check 1a. Individual Supply Limits
    [ check(
        amount_to_process[i] <= max_supply[i] + eps,
        "Crude " ++ show(i) ++ " processed amount (" ++ show(amount_to_process[i]) ++ 
        ") exceeds max supply (" ++ show(max_supply[i]) ++ ")."
      )
    | i in Crudes ]
    
    ++
    % Check 1b. Total Capacity Limit
    [ check(
        sum(amount_to_process) <= total_cap + eps,
        "Total processed amount (" ++ show(sum(amount_to_process)) ++ 
        ") exceeds total distillation capacity (" ++ show(total_cap) ++ ")."
      ) ]
      
    ++
    % Check 2. Resource Limits
    [ check(
        sum(i in Crudes)(amount_to_process[i] * consumption[r, i]) <= resource_cap[r] + eps,
        "Resource limit breached for " ++ show(r) ++ "! Total consumption (" ++ 
        show(sum(i in Crudes)(amount_to_process[i] * consumption[r, i])) ++ 
        ") exceeds capacity (" ++ show(resource_cap[r]) ++ ")."
      )
    | r in Resources ]
    
    ++
    % Check 3a. Contractual Minimum Obligations
    [ check(
        sum(i in Crudes)(amount_to_process[i] * yields[i, p]) >= min_req[p] - eps,
        "Yield for product " ++ show(p) ++ " (" ++ show(sum(i in Crudes)(amount_to_process[i] * yields[i, p])) ++ 
        ") falls short of contractual minimum (" ++ show(min_req[p]) ++ ")."
      )
    | p in Products ]
    
    ++
    % Check 3b. Chemical Stability Rule
    [ check(
        amount_to_process[1] >= (sum(amount_to_process) * 0.15) - eps,
        "Chemical stability rule violated: Crude 1 must be at least 15% of the total mix. Current Crude 1: " ++ 
        show(amount_to_process[1]) ++ " out of total " ++ show(sum(amount_to_process)) ++ "."
      ) ]
    ++
    % Conditionally append the objective check inline
    if check_objective then 
    let {float: res = sum(i in Crudes, p in Products)(amount_to_process[i] * yields[i, p] * price[p]) - sum(i in Crudes)(amount_to_process[i] * consumption[Budget, i])} in 
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