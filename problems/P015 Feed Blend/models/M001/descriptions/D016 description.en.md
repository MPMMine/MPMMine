# Optimal Feed Formulation Planning

This optimization task involves determining the ideal proportions of various feed components to create a blend for
livestock. The resulting product must meet specific nutritional standards while achieving the lowest possible production
expense.

We are given a set of ingredients, each characterized by a specific unit cost ($C_i$) and a detailed composition matrix,
which specifies the amount of each nutrient ($j$) contributed by that ingredient ($\text{Comp}_{i,j}$). The required
parameters include the minimum ($\text{MinReq}_j$) and maximum ($\text{MaxReq}_j$) allowable concentrations for every
nutrient. We also identify a specific subset of ingredients, designated as Grains.

The objective is to select an amount ($\text{Amount}_i$) for every component such that the total expenditure is
minimized.

The plan must adhere to the following governing rules:

1. **Mass Requirement:** The sum of all selected component amounts must equal a predetermined total required
   mass ($\text{TotalMass}$).
2. **Nutrient Compliance:** For every single nutrient $j$, the aggregated amount contributed by all components must
   simultaneously fall between the minimum requirement ($\text{MinReq}_j$) and the maximum
   requirement ($\text{MaxReq}_j$).
3. **Structural Proportion:** The combined mass of all ingredients belonging to the Grains subset must constitute at
   least a predefined fraction of the total required mass ($\text{TotalMass}$).

We seek to minimize $\sum_{i} (\text{Amount}_i \cdot C_i)$, subject to all physical and nutritional constraints listed
above.

[//]: # (Generated using gemma4:latest from D001 description.en.md and model.mzn)
