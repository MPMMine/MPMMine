# Livestock Feed Formulation Problem

We must create a mixture of several raw feed ingredients that together supply the required nutrients.
The resulting blend has to meet a predetermined total weight, and for every nutrient the aggregated contribution from
all chosen ingredients must stay inside a prescribed lower and upper interval. In addition, ingredients that belong to a
designated subgroup must together account for at least one‑fifth of the whole mass. The objective is to lower the total
expense of the blend.

Formally, introduce a variable `amount_i` for each ingredient `i` that denotes how much of that ingredient is taken.  
The collection of all `amount_i` must satisfy a mass‑balance equation: the sum of the chosen amounts equals the target
total weight.
For each nutrient type `j`, the linear combination of all `amount_i` multiplied by the corresponding
nutrient‑contribution coefficient must be no less than the minimum allowable amount and no greater than the maximum
allowable amount.  
The sum of the amounts taken from the designated subgroup must be at least one‑fifth of the target mass.  
Finally, the solution minimizes the weighted sum of all `amount_i` multiplied by their respective unit prices.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
