# Optimization of Livestock Feed Formulation

The challenge requires establishing an optimal schedule for procuring and blending feed ingredients for cattle over a
predetermined sequence of operational periods. The formulation must ensure that each batch maintains strict
compositional and nutrient standards while minimizing the combined expenditures associated with purchasing raw materials
and storing surplus inventory.

1. **Nutrient Profile Control:** For every period $\text{t}$, the final mixture must precisely meet a predefined total
   mass ($\text{W}$). Furthermore, the concentration of every required nutrient $\text{j}$ (e.g., Protein, Energy) must
   be contained within specified minimum ($\text{R}\_{\text{min}, \text{j}}$) and
   maximum ($\text{R}\_{\text{max}, \text{j}}$) limits.

3. **Mandatory Composition:** Certain feedstock categories, designated as $\text{G}$ (Grains), must always contribute a
   minimum proportional fraction (e.g., $20\%$) of the total mass ($\text{W}$) utilized in the blend to maintain quality
   standards.

4. **Material Flow and Storage:** The operation must respect initial inventory
   levels ($\text{S}\_{\text{initial}, \text{i}}$) for every ingredient $\text{i}$. In each period $\text{t}$, the stock
   level ($\text{S}\_{\text{i}, \text{t}}$) must balance based on the previous day's stock, the purchased
   quantity ($\text{B}\_{\text{i}, \text{t}}$), and the amount consumed ($\text{A}\_{\text{i}, \text{t}}$), while also
   respecting maximum facility storage capacities ($\text{C}\_{\text{cap}}$).

5. **Financial Structure:** Costs are complex: Ingredients $\text{i}$ carry a varying purchase
   cost ($\text{C}\_{\text{i}, \text{t}}$) per time period $\text{t}$. Additionally, retaining any excess raw material in
   the warehouse incurs a fixed inventory holding cost ($\text{H}\_{\text{cost}}$) per unit stored.

The objective is thus to determine the total procurement volume ($\text{B}\_{\text{i}, \text{t}}$) and consumption
plan ($\text{A}\_{\text{i}, \text{t}}$) that minimizes the sum of all material purchasing expenses and all inventory
holding charges across the entire timeline.

[//]: # (Generated using gemma4:latest from D001 description.en.md and model.mzn)
