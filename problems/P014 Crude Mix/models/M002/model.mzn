% --- Dimensions & Sets ---
int: n; 
set of int: Crudes = 1..n;
enum Products = { Gasoline, Jet_Fuel, Heating_Oil };
enum Resources = { Sulfur, Labor, Budget };

% --- Parameters ---
array[Crudes] of float: max_supply;
array[Crudes, Products] of float: yields;
array[Products] of float: price;
array[Products] of float: min_req;

% Consolidated Resource Data
% Row 1: Sulfur, Row 2: Labor, Row 3: Cost (Budget)
array[Resources, Crudes] of float: consumption;
array[Resources] of float: resource_cap;
float: total_cap;

% --- Decision Variables ---
array[Crudes] of var 0.0..100000.0: amount_to_process;

% --- Constraints ---

% 1. Supply & Total Capacity
constraint forall(i in Crudes)(amount_to_process[i] <= max_supply[i]);
constraint sum(amount_to_process) <= total_cap;

% 2. Resource Limits (The "Concise" Loop)
constraint forall(r in Resources)(
    sum(i in Crudes)(amount_to_process[i] * consumption[r, i]) <= resource_cap[r]
);

% 3. Contracts & Stability
constraint forall(p in Products)(sum(i in Crudes)(amount_to_process[i] * yields[i, p]) >= min_req[p]);
constraint amount_to_process[1] >= sum(amount_to_process) * 0.15;

% --- Objective ---
% Note: consumption[Budget, i] is used here to avoid a separate 'cost' array
solve maximize 
    sum(i in Crudes, p in Products)(amount_to_process[i] * yields[i, p] * price[p]) 
    - sum(i in Crudes)(amount_to_process[i] * consumption[Budget, i]);