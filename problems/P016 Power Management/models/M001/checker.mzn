include "globals.mzn";

set of int: periods;
array[periods] of float: consumption;
array[periods] of float: estimated_production;
array[periods] of float: buy_price;
array[periods] of float: sell_price;
float: excess_consumption; 
float: undersupply_production; 
float: soc_min;
float: soc_max;
float: soc_initial;
float: soc_final; 
float: charge_efficiency;
float: discharge_efficiency;
float: store_efficiency; 
float: charge_cost; 
float: shave_sell; 
float: shave_charge; 
float: shave_discharge; 
array[periods] of float: production;
array[periods] of float: buy;
array[periods] of float: sell;
array[periods] of float: charge;
array[periods] of float: discharge;
array[periods] of float: soc; 
array[periods] of float: cost;
array[periods] of float: earn;
float: total_cost;
float: total_earn;

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
    % Check 1. Production Limit
    [ check(
        production[p] == estimated_production[p] \/
        production[p] <= estimated_production[p] + eps,
        "Period " ++ show(p) ++ ": Production (" ++ show(production[p]) ++ 
        ") exceeds estimated production (" ++ show(estimated_production[p]) ++ ")."
      )
    | p in periods ]
    
    ++
    % Check 2. Energy Balance
    [ check(
        let {
            float: demand_side = consumption[p] + excess_consumption + charge[p] + sell[p],
            float: supply_side = production[p] - undersupply_production + (discharge_efficiency * discharge[p]) + buy[p]
        } in 
        demand_side >= supply_side - eps /\
        demand_side <= supply_side + eps,
        "Period " ++ show(p) ++ ": Energy balance broken. Load side (Cons.+Excess+Charge+Sell) = " ++ 
        show(consumption[p] + excess_consumption + charge[p] + sell[p]) ++ 
        " vs Supply side (Prod.-Undersupply+Eff*Discharge+Buy) = " ++ 
        show(production[p] - undersupply_production + discharge_efficiency * discharge[p] + buy[p]) ++ "."
      )
    | p in periods ]
    
    ++
    % Check 3. Exclusive Choice: Sell vs Buy
    [ check(
        (if sell[p] > eps then 1 else 0 endif) + (if buy[p] > eps then 1 else 0 endif) <= 1,
        "Period " ++ show(p) ++ ": Economic exclusivity violation. Cannot buy (" ++ 
        show(buy[p]) ++ ") and sell (" ++ show(sell[p]) ++ ") energy simultaneously."
      )
    | p in periods ]
    
    ++
    % Check 4. Exclusive Choice: Charge vs Discharge
    [ check(
        (if charge[p] > eps then 1 else 0 endif) + (if discharge[p] > eps then 1 else 0 endif) <= 1,
        "Period " ++ show(p) ++ ": Battery exclusivity violation. Cannot charge (" ++ 
        show(charge[p]) ++ ") and discharge (" ++ show(discharge[p]) ++ ") simultaneously."
      )
    | p in periods ]
    
    ++
    % Check 5. Battery State of Charge (SoC) Dynamics
    [ check(
        let { float: prev_soc = if p == min(periods) then soc_initial else soc[p-1] endif,
              float: expected_soc = prev_soc * store_efficiency + charge_efficiency * charge[p] - discharge[p] } in
        soc[p] >= expected_soc - eps /\
        soc[p] <= expected_soc + eps,
        "Period " ++ show(p) ++ ": Battery SoC tracking mismatch. Found soc[" ++ show(p) ++ "] = " ++ 
        show(soc[p]) ++ ", expected " ++ 
        show((if p == min(periods) then soc_initial else soc[p-1] endif) * store_efficiency + charge_efficiency * charge[p] - discharge[p]) ++ "."
      )
    | p in periods ]
    
    ++
    % Check 6. Final State of Charge Target
    [ check(
        soc[max(periods)] == soc_final \/
        soc[max(periods)] >= soc_final - eps,
        "Planning horizon target failed. Final SoC (" ++ show(soc[max(periods)]) ++ 
        ") is below required soc_final (" ++ show(soc_final) ++ ")."
      ) ]
      
    ++
    % Check 7. Intermediate Costs Calculation
    [ check(
        cost[p] >= (buy_price[p] * buy[p] + charge_cost / charge_efficiency * charge[p]) - eps /\
        cost[p] <= (buy_price[p] * buy[p] + charge_cost / charge_efficiency * charge[p]) + eps,
        "Period " ++ show(p) ++ ": Internal cost ledger error."
      )
    | p in periods ]
    
    ++
    % Check 8. Intermediate Earnings Calculation
    [ check(
        earn[p] >= (sell_price[p] * sell[p]) - eps /\
        earn[p] <= (sell_price[p] * sell[p]) + eps,
        "Period " ++ show(p) ++ ": Internal earnings ledger error."
      )
    | p in periods ]
    
    ++
    % Check 9. Global Accounting Totals
    [ check(
        total_cost >= sum(cost) - eps /\
        total_cost <= sum(cost) + eps,
        "Aggregated total_cost doesn't match sum of periodic costs."
      ),
      check(
        total_earn >= sum(earn) - eps /\
        total_earn <= sum(earn) + eps,
        "Aggregated total_earn doesn't match sum of periodic earnings."
      )
    ]
    ++
    % Conditionally append the objective check inline
    if check_objective then 
    let {float: res = total_cost - total_earn} in 
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