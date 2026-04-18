% --- Parameters ---
int: num_ingredients;
int: num_nutrients;

set of int: Ingredient = 1..num_ingredients;
set of int: Nutrient = 1..num_nutrients;

array[Ingredient] of float: cost;
array[Ingredient, Nutrient] of float: comp;

array[Nutrient] of float: min_req;
array[Nutrient] of float: max_req;

float: total_weight;
set of int: Grains; 

array[Ingredient] of var 0.0..total_weight: amount;

% 1. Mass Balance
constraint sum(i in Ingredient)(amount[i]) = total_weight;

% 2 & 3. Nutritional Bounds
constraint forall(j in Nutrient)(
    sum(i in Ingredient)(amount[i] * comp[i,j])  >= min_req[j] /\ sum(i in Ingredient)(amount[i] * comp[i,j])  <= max_req[j]
);

% 4. Group Totals (Grain base)
constraint sum(i in Grains)(amount[i]) >= 0.2 * total_weight;

solve minimize sum(i in Ingredient)(amount[i] * cost[i]);
