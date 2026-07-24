include "globals.mzn";

int: num_cities;
int: num_vans;
int: t_limit;

array[int] of int: cities_range =  1..num_cities;
array[int] of int: vans_range =  1..num_vans;

int: starting_location = min(cities_range);

array[1..num_cities, 1..num_cities] of int: dist_m;

% x[i, j, k] = 1 if van k travels directly from city i to city j
array[1..num_cities, 1..num_cities, 1..num_vans] of var 0..1: x;

% y[i, k] = 1 if city i is visited by van k
array[1..num_cities, 1..num_vans] of var 0..1: y;

% s[k] = 1 if van k is used at all
array[1..num_vans] of var 0..1: s;


% 1. If a van visits a location, then that van must be marked as used
constraint forall(k in vans_range, i in cities_range) (
    y[i, k] <= s[k]
);

% 2. Route time limit constraint 
constraint forall(k in vans_range) (
    sum(i in cities_range, j in cities_range where j != starting_location) (
        dist_m[i, j] * x[i, j, k]
    ) <= t_limit
);

% 3. Each city (except the starting_location) must be visited by exactly one van
constraint forall(i in cities_range where i != starting_location) (
    sum(k in vans_range) (y[i, k]) == 1
);

% 4. Starting location is visited by every van
constraint sum(k in vans_range)(y[starting_location, k]) >= sum(k in vans_range) (s[k]);


% 5. and 6. Flow conservation: If a van enters a city, it must leave it
constraint forall(j in cities_range, k in vans_range) (
    sum(i in cities_range where i != j) (x[i, j, k]) == y[j, k]
);

constraint forall(j in cities_range, k in vans_range) (
    sum(i in cities_range where i != j) (x[j, i, k]) == y[j, k]
);


% 7. Subtour Elimination using subcircuit
constraint forall(k in vans_range) (
    let {
        array[1..num_cities] of var 1..num_cities: succ;
        constraint forall(i in cities_range) (
            if y[i, k] == 1 then
                sum(j in cities_range where i != j) (j * x[i, j, k]) == succ[i]
            else
                succ[i] == i
            endif
        )
    % `subcircuit` constrains the elements of succ to define a subcircuit where 
    % succ[i] = j means that j is the successor of i and
    % succ[i] = i means that i is not in the circuit.
    } in subcircuit(succ)
);



% 8. Symmetry Breaking: Force higher-indexed vans to handle equal or fewer total nodes
constraint forall(k in 1..(num_vans - 1)) (
    sum(i in cities_range) (y[i, k]) >= sum(i in cities_range) (y[i, k+1])
);


var 0..t_limit: max_journey_time = max(k in vans_range) (
    sum(i in cities_range, j in cities_range where j != starting_location) (
        dist_m[i, j] * x[i, j, k]
    )
);

int: penalty_weight = t_limit + 1; 

solve minimize (sum(s) * penalty_weight) + max_journey_time;

% output [
%     "Vans used: ", show(sum(s)), "\n"
% ] ++ 
% [
%     if fix(s[k]) == 1 then
%         "\nVan " ++ show(k) ++ " route:\n" ++
%         concat([show(i) ++ " -> " ++ show(j) ++ " (" ++ show(dist_m[i,j]) ++ " min)\n" 
%                 | i in cities_range, j in cities_range where fix(x[i,j,k]) == 1 ])
%         ++ "Total route length = " ++ show(sum(i in cities_range, j in cities_range where j != starting_location) (dist_m[i,j] * fix(x[i, j, k]))) ++ " min\n"
%     else "" endif
%     | k in vans_range
% ];