# Cattle feed formulation

The problem involves selecting quantities of a set of raw ingredients so that the resulting blend has a fixed overall
mass while each nutrient’s concentration stays within prescribed lower and upper limits. A designated subset of
ingredients, denoted by **@GRAIN_SET@**, must contribute at least a given share of the total mass. The model uses a
collection of @INGREDIENTS@ indexed by **@I@** and a collection of @NUTRIENTS@ indexed by **@J@**. For each ingredient
*i* a unit cost **@COST[i]@** is known, and for each ingredient‑nutrient pair the contribution is captured by *
*@COMP[i,j]@**. Required minimum and maximum amounts for nutrient *j* are expressed by **@MIN_REQ[j]@** and *
*@MAX_REQ[j]@**. The total mass to be achieved is **@TOTAL_WEIGHT@**, and the decision variable for ingredient *i* is *
*@AMOUNT[i]@**.

Constraints enforce that the sum of all **@AMOUNT[i]@** equals **@TOTAL_WEIGHT@**, that for every nutrient *j* the
weighted sum of **@COMP[i,j]@** values stays between **@MIN_REQ[j]@** and **@MAX_REQ[j]@**, and that the aggregate
amount drawn from **@GRAIN_SET@** is at least a proportion **@PROP@** of **@TOTAL_WEIGHT@**. The objective is to
minimise the total expenditure, i.e. the sum of **@AMOUNT[i] * COST[i]@** over all ingredients.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
