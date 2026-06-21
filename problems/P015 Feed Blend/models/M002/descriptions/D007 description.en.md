# Optimal Feed Resource Management

The objective is to devise an optimal supply and blending plan for a livestock feed production facility spanning
multiple sequential time periods ($\mathcal{T}$). The plan must ensure that every blend created maintains strict
nutritional standards and total mass targets while minimizing overall operational expenses.

1. Nutritional Adherence: For every time period $t \in \mathcal{T}$, the composition must satisfy bounds for all
   measured nutrients. Specifically, the aggregate nutrient contribution from all ingredients must be maintained between
   a defined minimum requirement ($\text{MinReq}\_j$) and a maximum allowable limit ($\text{MaxReq}\_j$) for every
   nutrient $j \in \mathcal{N}$.

2. Structural Minimums: The blend must uphold a minimum proportional requirement for a specialized subset of
   ingredients ($\mathcal{G}$, designated as Grains). Over any period $t \in \mathcal{T}$, the total mass contributed by
   ingredients $i \in \mathcal{G}$ must be at least $0.2$ times the required total blend mass ($\text{TotalWeight}$).

3. Inventory and Logistics Flow: The facility manages initial stock levels ($\text{InitialStock}\_i$) for every
   ingredient $i \in \mathcal{I}$. The core logistical constraint dictates the mass balance at the end of each
   period $t$. The final stored inventory ($\text{Stock}\_{i,t}$) for ingredient $i$ must equal the previous period's
   inventory ($\text{Stock}\_{i, t-1}$), plus all newly acquired units ($\text{Buy}\_{i, t}$), minus the quantity utilized
   in the current blend ($\text{Amount}\_{i, t}$). Furthermore, all inventory must remain within a defined maximum
   capacity ($\text{StorageCap}$).

4. Operational Economy: Cost considerations are critical. Ingredients incur varying acquisition
   costs ($\text{Cost}\_{i,t}$) across different times. Additionally, retaining residual quantities in the warehouse
   incurs a fixed inventory holding penalty ($\text{HoldingCost}$) per unit per period.

The goal is to solve for the optimal schedule of purchasing ($\text{Buy}\_{i,t}$) and utilization ($\text{Amount}\_{i,t}$)
that minimizes the combined total expenditure: the sum of all procurement costs across $\mathcal{I}$ and $\mathcal{T}$,
plus the total inventory holding costs incurred over $\mathcal{I}$ and $\mathcal{T}$.

[//]: # (Generated using gemma4:latest from D001 description.en.md and model.mzn)
