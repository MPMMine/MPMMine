# Composition Optimization Problem

We are tasked with formulating an optimal mixture for livestock sustenance, incorporating various component types ($i$).
These components are characterized by a cost parameter and contain numerous distinct nutritional elements ($j$). The
formulated problem requires finding the quantity ($\text{Amount}_i$) for each ingredient type $i$. These quantities must
satisfy the following structural conditions:

1. **Total Mass Equality:** The sum of all chosen $\text{Amount}_i$ must precisely match the target bulk weight.
2. **Nutritional Integrity:** For every nutrient $j$, the weighted sum of nutrient $j$ across all ingredients must be
   greater than or equal to its minimum requirement $\text{MinReq}_j$ AND less than or equal to its maximum
   requirement $\text{MaxReq}_j$.
3. **Mandated Component Contribution:** The sum of $\text{Amount}_i$ for all ingredients belonging to the grain
   subset $G$ must be at least $0.2$ times the total target weight.

We seek to minimize the objective function, which is the total cost calculated by summing the product of each
ingredient's $\text{Amount}_i$ and its associated unit $\text{Cost}_i$.

[//]: # (Generated using gemma4:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
