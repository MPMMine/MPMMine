# Optimal Feed Blend Formulation

This problem requires optimizing the sourcing and mixing of various raw materials ($\text{Ingredient}$) for a cattle
feed facility over multiple sequential time periods ($\text{Time}$). The primary objective is to develop a procurement
and usage plan that minimizes the total expenditures incurred throughout the planning horizon.

The total cost comprises two components: the immediate cost of purchasing materials, defined by $\text{cost}[i, t]$ for
ingredient $i$ at time $t$; and the financial burden associated with storing unused materials, determined
by $\text{holding\\_cost}$ applied to the end-of-period inventory $\text{stock}[i, t]$.

To ensure feasibility, the plan must adhere to several physical and nutritional constraints:

**I. Operational Constraints:**

1. **Inventory Management:** The stock of any ingredient at time $t$, denoted $\text{stock}[i, t]$, must adhere to a
   maximum capacity, $\text{storage\\_cap}$. Furthermore, the inventory must track mass balance: $\text{stock}[i, t]$
   equals the stock from the previous period ($\text{stock}[i, t-1]$), plus all units purchased in
   period $t$ ($\text{buy}[i, t]$), minus all units utilized in the blend ($\text{amount}[i, t]$). The initial state
   at $t=0$ is fixed by $\text{initial\\_stock}[i]$.
2. **Blending Target:** In every period $t$, the combined mass of all utilized
   ingredients ($\sum\_i \text{amount}[i, t]$) must exactly equal the mandated $\text{total\\_weight}$.

**II. Nutritional and Compositional Constraints:**

1. **Nutrient Requirements:** For every nutrient $j$, the total quantity derived from the blended
   feed ( $\sum\_i (\text{amount}[i, t] \cdot \text{comp}[i, j])$ ) must be bounded. This sum must fall between the minimum
   required level ($\text{min\\_req}[j]$) and the maximum allowed level ($\text{max\\_req}[j]$).
2. **Quality Proportion:** The combined mass of ingredients belonging to the specific subgroup $\text{Grains}$ must
   contribute at least a specified proportion to the overall blend mass in every period.

[//]: # (Generated using gemma4:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
