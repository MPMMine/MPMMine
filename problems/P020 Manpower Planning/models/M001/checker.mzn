enum Skill = { UNSKILLED, SEMI_SKILLED, SKILLED };
int: T;
array[Skill] of int: init_strength;
array[1..T, Skill] of int: req;
array[Skill] of float: retention_existing;
array[Skill] of float: retention_new;
array[Skill] of int: max_recruit;
int: max_short_time;
int: max_retrain_unskilled;
int: max_overmanning;
float: downgrade_dropout;
float: promotion_limit;
float: short_time_efficiency;
array[1..2] of int: retrain_cost;
array[Skill] of int: redundancy_cost;
array[Skill] of int: overmanning_cost;
array[Skill] of int: short_time_cost;
array[0..T, Skill] of float: t_strength;
array[1..T, Skill] of float: u_recruit;
array[1..T] of float: v_US_SS;
array[1..T] of float: v_SS_SK;
array[1..T] of float: v_SK_SS;
array[1..T] of float: v_SK_US;
array[1..T] of float: v_SS_US;
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
    % Natural wastage and continuity
    [ check(
        abs(t_strength[i, SKILLED] - (
            retention_existing[SKILLED] * t_strength[i-1, SKILLED]
          + retention_new[SKILLED] * u_recruit[i, SKILLED]
          + retention_existing[SKILLED] * v_SS_SK[i]
          - v_SK_SS[i]
          - v_SK_US[i]
          - w_redundancy[i, SKILLED]
        )) <= eps,
        "Workforce balance violation for SKILLED in Year " ++ show(i)
    ) | i in 1..T ]
    ++
    [ check(
        abs(t_strength[i, SEMI_SKILLED] - (
            retention_existing[SEMI_SKILLED] * t_strength[i-1, SEMI_SKILLED]
          + retention_new[SEMI_SKILLED] * u_recruit[i, SEMI_SKILLED]
          + retention_existing[SEMI_SKILLED] * v_US_SS[i]
          + (1.0 - downgrade_dropout) * v_SK_SS[i]
          - v_SS_SK[i]
          - v_SS_US[i]
          - w_redundancy[i, SEMI_SKILLED]
        )) <= eps,
        "Workforce balance violation for SEMI_SKILLED in Year " ++ show(i)
    ) | i in 1..T ]
    ++
    [ check(
        abs(t_strength[i, UNSKILLED] - (
            retention_existing[UNSKILLED] * t_strength[i-1, UNSKILLED]
          + retention_new[UNSKILLED] * u_recruit[i, UNSKILLED]
          + (1.0 - downgrade_dropout) * v_SK_US[i]
          + (1.0 - downgrade_dropout) * v_SS_US[i]
          - v_US_SS[i]
          - w_redundancy[i, UNSKILLED]
        )) <= eps,
        "Workforce balance violation for UNSKILLED in Year " ++ show(i)
    ) | i in 1..T ]
    ++
    % Bounds and limits
    [ check(
        u_recruit[i, s] >= -eps /\ u_recruit[i, s] <= max_recruit[s] + eps,
        "Recruitment bound violated for " ++ show(s) ++ " in Year " ++ show(i) ++ 
        ": " ++ show(u_recruit[i, s]) ++ " (Max: " ++ show(max_recruit[s]) ++ ")"
    ) | i in 1..T, s in Skill ]
    ++
    [ check(
        v_US_SS[i] >= -eps /\ v_US_SS[i] <= max_retrain_unskilled + eps,
        "Unskilled-to-Semi retraining limit exceeded in Year " ++ show(i) ++ 
        ": " ++ show(v_US_SS[i]) ++ " (Max: " ++ show(max_retrain_unskilled) ++ ")"
    ) | i in 1..T ]
    ++
    [ check(
        v_SS_SK[i] <= promotion_limit * t_strength[i, SKILLED] + eps,
        "Semi-to-Skilled retraining limit (" ++ show(promotion_limit * 100) ++ "% of skilled force) exceeded in Year " ++ show(i) ++ 
        ": " ++ show(v_SS_SK[i]) ++ " > " ++ show(promotion_limit * t_strength[i, SKILLED])
    ) | i in 1..T ]
    ++
    [ check(
        sum(s in Skill)(y_overmanning[i, s]) <= max_overmanning + eps,
        "Overmanning limit exceeded in Year " ++ show(i) ++ 
        ": " ++ show(sum(s in Skill)(y_overmanning[i, s])) ++ " (Max: " ++ show(max_overmanning) ++ ")"
    ) | i in 1..T ]
    ++
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
        let { float: res = sum(i in 1..T, s in Skill)(w_redundancy[i, s]); } in
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