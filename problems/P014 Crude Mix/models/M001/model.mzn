% --- Dimensions ---
int: n;                  % Number of crude types
set of int: Crudes = 1..n;
enum Products = { Gasoline, Jet_Fuel, Heating_Oil };

% --- Input Parameters (Generalized) ---
array[Crudes] of float: cost;            % Cost per barrel for each crude
array[Crudes] of float: max_supply;      % Max barrels available for each crude
array[Crudes, Products] of float: yields; % Matrix of product yields
array[Crudes] of float: sulfur;          % Sulfur units per barrel
array[Crudes] of float: labor;           % Labor hours per barrel

% Global Operational Limits
float: total_cap;        % Total distillation capacity
float: budget;           % Financial limit
float: max_labor;        % Staffing limit
float: max_sulfur;       % Environmental limit
array[Products] of float: price;         % Market price for outputs
array[Products] of float: min_req;       % Contractual minimums

% --- Decision Variables ---
array[Crudes] of var 0.0..100000.0: amount_to_process;   % Amount of each crude to process

% --- Constraints ---

% 1. Individual Supply Limits
constraint forall(i in Crudes)(
    amount_to_process[i] <= max_supply[i]
);

% 2. Total Distillation Capacity
constraint sum(i in Crudes)(amount_to_process[i]) <= total_cap;

% 3. Environmental Sulfur Cap
constraint sum(i in Crudes)(amount_to_process[i] * sulfur[i]) <= max_sulfur;

% 4. Labor/Staffing Limit
constraint sum(i in Crudes)(amount_to_process[i] * labor[i]) <= max_labor;

% 5. Procurement Budget
constraint sum(i in Crudes)(amount_to_process[i] * cost[i]) <= budget;

% 6. Contractual Obligations
constraint forall(p in Products)(
    sum(i in Crudes)(amount_to_process[i] * yields[i, p]) >= min_req[p]
);

% 7. Chemical Stability Rule (Crude #1 must be at least 15% of the mix)
constraint amount_to_process[1] >= sum(i in Crudes)(amount_to_process[i]) * 0.15;

% --- Objective ---

solve maximize sum(i in Crudes, p in Products)(amount_to_process[i] * yields[i, p] * price[p]) - sum(i in Crudes)(amount_to_process[i] * cost[i]);