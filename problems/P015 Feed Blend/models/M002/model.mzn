% --- Parameters ---
int: num_ingredients;
int: num_nutrients;
int: num_periods;

set of int: Ingredient = 1..num_ingredients;
set of int: Nutrient = 1..num_nutrients;
set of int: Time = 1..num_periods;

% Costs now vary by ingredient AND time
array[Ingredient, Time] of float: cost;
array[Ingredient, Nutrient] of float: comp;

array[Nutrient] of float: min_req;
array[Nutrient] of float: max_req;

float: total_weight;        % Target weight for the blend each period
float: storage_cap;         % Max units of EACH ingredient we can store
float: holding_cost;        % Cost to keep 1 unit of ingredient in stock for 1 period
array[Ingredient] of float: initial_stock;

set of int: Grains; 

% --- Decision Variables ---

% 1. How much we buy each period
array[Ingredient, Time] of var 0.0..total_weight * num_periods: buy;

% 2. How much we use in the blend each period
array[Ingredient, Time] of var 0.0..total_weight: amount;

% 3. How much we have in the warehouse at the end of each period

array[Ingredient, Time] of var 0.0..storage_cap: stock;

% --- Constraints ---

% 1. Initial Inventory (Setting the state at Time 0)
constraint forall(i in Ingredient)(
    stock[i, 0] = initial_stock[i]
);

% 2. Inventory Continuity (Mass Balance over Time)
% Stock today = Stock yesterday + Bought today - Used today
constraint forall(i in Ingredient, t in Time)(
    stock[i, t] = (if t == min(Time) then initial_stock[i] else stock[i, t-1] endif) + buy[i, t] - amount[i, t]
);

% 3. Production Mass Balance (Each period must produce exactly total_weight)
constraint forall(t in Time)(
    sum(i in Ingredient)(amount[i, t]) = total_weight
);

% 4. Nutritional Bounds (Calculated for each period's blend)
constraint forall(t in Time, j in Nutrient)(
    let { var float: nut_sum = sum(i in Ingredient)(amount[i, t] * comp[i, j]) } in
    nut_sum >= min_req[j] /\ nut_sum <= max_req[j]
);

% 5. Group Totals (Grain base per period)
constraint forall(t in Time)(
    sum(i in Grains)(amount[i, t]) >= 0.2 * total_weight
);

% --- Objective Function ---
% Minimize: (Purchase Costs) + (Inventory Holding Costs)
solve minimize 
    sum(i in Ingredient, t in Time)(buy[i, t] * cost[i, t]) +
    sum(i in Ingredient, t in Time)(stock[i, t] * holding_cost);