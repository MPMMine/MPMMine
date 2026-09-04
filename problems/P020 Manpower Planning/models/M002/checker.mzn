enum Skill = { UNSKILLED, SEMI_SKILLED, SKILLED };
int: T;
array[Skill] of int: init_strength;
array[1..T, Skill] of int: req;
array[Skill] of float: retention_existing;
array[Skill] of float: retention_new;
array[Skill] of int: max_recruit;
int: max_short_time;
int: max_overmanning;
float: downgrade_dropout;
float: short_time_efficiency;
array[Skill, Skill] of float: transfer_limit;
array[Skill] of int: retrain_cost;
array[Skill] of int: redundancy_cost;
array[Skill] of int: overmanning_cost;
array[Skill] of int: short_time_cost;

% Decision variables from solution
array[0..T, Skill] of float: t_strength;
array[1..T, Skill] of float: u_recruit;
array[1..T, Skill, Skill] of float: transfer;
array[1..T, Skill] of float: w_redundancy;
array[1..T, Skill] of float: x_short;
array[1..T, Skill] of float: y_overmanning;

% Flag to determine if the objective value should be checked
bool: check_objective;
% Float with the objective value from the solution file
opt float: obj_from_sol;
float: eps = 1e-4;

test check(bool: b, string: s) = 
    if b then true else trace_stdout("ERROR: " ++ s ++ "\n", false) endif;

array[int] of bool: checks = 
    % Initial conditions
    [ check(
        abs(t_strength[0, s] - init_strength[s]) <= eps,
        "Initial strength for " ++ show(s) ++ " expected " ++ show(init_strength[s]) ++ 
        " but got " ++ show(t_strength[0, s])
    ) | s in Skill ]
    ++
    % Diagonal transfers must be zero
    [ check(
        abs(transfer[i, s, s]) <= eps,
        "Self-transfer for " ++ show(s) ++ " in Year " ++ show(i) ++ " must be zero."
    ) | i in 1..T, s in Skill ]
    ++
    % Unified Natural wastage and workforce continuity
    [ check(
        abs(t_strength[i, target] - (
            retention_existing[target] * t_strength[i-1, target]
          + retention_new[target] * u_recruit[i, target]
          + sum(source in Skill where source < target) (
                retention_existing[target] * transfer[i, source, target]
            )
          + sum(source in Skill where source > target) (
                (1.0 - downgrade_dropout) * transfer[i, source, target]
            )
          - sum(dest in Skill where dest != target) (
                transfer[i, target, dest]
            )
          - w_redundancy[i, target]
        )) <= eps,
        "Workforce balance violation for " ++ show(target) ++ " in Year " ++ show(i)
    ) | i in 1..T, target in Skill ]
    ++
    % Recruitment upper bounds
    [ check(
        u_recruit[i, s] >= -eps /\ u_recruit[i, s] <= max_recruit[s] + eps,
        "Recruitment bound violated for " ++ show(s) ++ " in Year " ++ show(i) ++ 
        ": " ++ show(u_recruit[i, s]) ++ " (Max: " ++ show(max_recruit[s]) ++ ")"
    ) | i in 1..T, s in Skill ]
    ++
    % Unified Transfer / Retraining / Demotion limits
    [ check(
        if s1 < s2 then
            transfer[i, s1, s2] <= transfer_limit[s1, s2] * t_strength[i - 1, s2] + eps
        else
            transfer[i, s1, s2] <= transfer_limit[s1, s2] * t_strength[i - 1, s1] + eps
        endif,
        "Transfer limit violated from " ++ show(s1) ++ " to " ++ show(s2) ++ " in Year " ++ show(i) ++
        ": " ++ show(transfer[i, s1, s2])
    ) | i in 1..T, s1 in Skill, s2 in Skill where s1 != s2 ]
    ++
    % Overmanning limit
    [ check(
        sum(s in Skill)(y_overmanning[i, s]) <= max_overmanning + eps,
        "Overmanning limit exceeded in Year " ++ show(i) ++ 
        ": " ++ show(sum(s in Skill)(y_overmanning[i, s])) ++ " (Max: " ++ show(max_overmanning) ++ ")"
    ) | i in 1..T ]
    ++
    % Short-time working bounds
    [ check(
        x_short[i, s] >= -eps /\ x_short[i, s] <= max_short_time + eps,
        "Short-time working bound violated for " ++ show(s) ++ " in Year " ++ show(i) ++ 
        ": " ++ show(x_short[i, s]) ++ " (Max: " ++ show(max_short_time) ++ ")"
    ) | i in 1..T, s in Skill ]
    ++
    % Production Requirements
    [ check(
        abs(t_strength[i, s] - y_overmanning[i, s] - short_time_efficiency * x_short[i, s] - req[i, s]) <= eps,
        "Production requirement violated for " ++ show(s) ++ " in Year " ++ show(i) ++ 
        ": Calculated = " ++ show(t_strength[i, s] - y_overmanning[i, s] - short_time_efficiency * x_short[i, s]) ++ 
        ", Required = " ++ show(req[i, s])
    ) | i in 1..T, s in Skill ]
    ++
    % Conditionally check objective
    if check_objective then 
        let { 
            float: total_cost = sum(i in 1..T) (
                retrain_cost[UNSKILLED] * transfer[i, UNSKILLED, SEMI_SKILLED] 
              + retrain_cost[SEMI_SKILLED] * transfer[i, SEMI_SKILLED, SKILLED]
              + sum(s in Skill) (
                    redundancy_cost[s]  * w_redundancy[i, s]
                  + short_time_cost[s]  * x_short[i, s]
                  + overmanning_cost[s] * y_overmanning[i, s]
                )
            ); 
        } in
        [ check(
            abs(total_cost - obj_from_sol) <= eps,
            "The objective: " ++ show(total_cost) ++ " does not match the objective from the solution file: " ++ show(obj_from_sol)
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