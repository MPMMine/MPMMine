# Livestock Nutrition Optimization

Formulate a diet optimization problem over components $\mathcal{I}$ with nutritional profiles $\mathcal{N}$. Minimize
total cost using unit prices $c_i$. The mixture must exactly match target weight $W$. For each nutrient $j$, total
provision must stay within bounds $r_j^{\min}$ and $r_j^{\max}$, derived from composition factors $k_{i,j}$. A specific
component subset $\mathcal{G}$ must comprise at least fraction $\alpha$ of $W$. All quantities $x_i$ are non-negative
and bounded by $W$.

[//]: # (Generated using qwen3.6:latest from D001 description.en.md and model.mzn)
