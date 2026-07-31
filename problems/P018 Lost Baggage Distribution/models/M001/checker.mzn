include "globals.mzn";

int: num_cities;
int: num_vans;
int: t_limit;
array[int] of int: cities_range = 1..num_cities;
array[int] of int: vans_range = 1..num_vans;
int: starting_location = min(cities_range);
array[1..num_cities, 1..num_cities] of int: dist_m;
array[1..num_cities, 1..num_cities, 1..num_vans] of 0..1: travel;
array[1..num_cities, 1..num_vans] of 0..1: visit;
array[1..num_vans] of 0..1: use;

% Flag to determine if the objective value should be checked flag passed via -D "check_objective=true" or "check_objective=false"
bool: check_objective;
% Float with the objective value from the solution file (it is saved there as a comment) -D "obj_from_sol=<number>"
opt float: obj_from_sol;
float: eps = 1e-6; 

test check(bool: b, string: s) = 
    if b then true else trace_stdout("ERROR: " ++ s ++ "\n", false) endif;

% Helper function: recursively follow the successor array step-by-step
function int: trace_path(array[int] of int: succ, int: current, int: steps) =
    if steps <= 1 then 
        succ[current]
    else 
        trace_path(succ, succ[current], steps - 1)
    endif;

% Test predicate: check if a ground array forms a valid subcircuit
test is_subcircuit(array[int] of int: succ) = 
    let {
        set of int: S = index_set(succ),
        set of int: active = { i | i in S where succ[i] != i },
        int: num_active = card(active)
    } in
    if num_active == 0 then
        true
    else
        let {
            int: start_node = min(active),
            set of int: visited = { trace_path(succ, start_node, k) | k in 1..num_active }
        } in
        forall(i in S) (succ[i] in S) /\
        trace_path(succ, start_node, num_active) == start_node /\
        visited == active
    endif;

test check_subcircuit(int: k) = 
    let {
        array[1..num_cities] of int: succ = [
            if visit[i, k] == 1 then
                sum(j in cities_range where i != j) (j * travel[i, j, k])
            else
                i
            endif
        | i in cities_range
        ]
    } in is_subcircuit(succ);

array[int] of bool: checks = 
    % 1. Van usage flagging
    [ check(
        visit[i, k] <= use[k],
        "Van " ++ show(k) ++ " visits city " ++ show(i) ++ " but is not marked as used (use[" ++ show(k) ++ "] = 0).")
    | k in vans_range, i in cities_range ]
    ++
    % 2. Route time limit constraint
    [ check(
        sum(i in cities_range, j in cities_range where j != starting_location) (dist_m[i, j] * travel[i, j, k]) <= t_limit,
        "Van " ++ show(k) ++ " exceeds time limit (" ++ show(sum(i in cities_range, j in cities_range where j != starting_location) (dist_m[i, j] * travel[i, j, k])) ++ " > " ++ show(t_limit) ++ ").")
    | k in vans_range ]
    ++
    % 3. Every non-depot city visited exactly once
    [ check(
        sum(k in vans_range) (visit[i, k]) == 1,
        "City " ++ show(i) ++ " is visited by " ++ show(sum(k in vans_range) (visit[i, k])) ++ " expected: 1.")
    | i in cities_range where i != starting_location ]
    ++
    % 4. Starting location visitation
    [ check(
        sum(k in vans_range)(visit[starting_location, k]) >= sum(k in vans_range) (use[k]),
        "Starting location visited fewer times than the number of used vans."
    )]
    ++
    % 5. Inflow conservation
    [ check(
        sum(i in cities_range where i != j) (travel[i, j, k]) == visit[j, k],
        "Inflow for city " ++ show(j) ++ " and van " ++ show(k) ++ " does not match visit status visit[" ++ show(j) ++ "," ++ show(k) ++ "].")
    | j in cities_range, k in vans_range ]
    ++
    % 6. Outflow conservation
    [ check(
        sum(i in cities_range where i != j) (travel[j, i, k]) == visit[j, k],
        "Outflow for city " ++ show(j) ++ " and van " ++ show(k) ++ " does not match visit status visit[" ++ show(j) ++ "," ++ show(k) ++ "].")
    | j in cities_range, k in vans_range ]
    ++
    % 7. Subtour elimination
    [ check(
        check_subcircuit(k),
        "Route for van " ++ show(k) ++ " contains disconnected subtours or invalid cycles.")
    | k in vans_range ]
    ++
    % 8. Symmetry breaking constraint
    [ check(
        sum(i in cities_range) (visit[i, k]) >= sum(i in cities_range) (visit[i, k+1]),
        "Symmetry rule violated between van " ++ show(k) ++ " (" ++ show(sum(i in cities_range) (visit[i, k])) ++ " cities) and van " ++ show(k+1) ++ " (" ++ show(sum(i in cities_range) (visit[i, k+1])) ++ " cities).")
    | k in 1..(num_vans - 1) ]
    ++
    if check_objective then 
        let {
            int: penalty_weight = t_limit + 1;
            int: max_journey_time = max(k in vans_range) (
                sum(i in cities_range, j in cities_range where j != starting_location) (
                    dist_m[i, j] * travel[i, j, k]
                )
            );
            float: res = (sum(use) * penalty_weight) + max_journey_time;
        } in
        [ check(
            res >= obj_from_sol - eps /\ res <= obj_from_sol + eps,
            "The objective: " ++ show(res) ++ " does not match the objective from the solution file: " ++ show(obj_from_sol)) 
        ]
    else 
        [] 
    endif;

output [
    if forall(checks)
    then "CORRECT: all constraints hold.\n"
    else "INCORRECT: See error log above for specific violations.\n"
    endif
];