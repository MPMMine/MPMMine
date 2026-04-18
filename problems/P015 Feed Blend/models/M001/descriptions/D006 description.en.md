# Livestock Ration Design

Determine optimal ingredient quantities $x_i$ for $i \in I$ to achieve a target mass $W$. Each nutrient $j \in J$ must
satisfy bounds, requiring the total content $\sum_{i \in I} x_i p_{i,j}$ to lie between lower limit $L_j$ and upper
limit $U_j$. The combined mass of items in the grain subset $G$ must reach at least a proportion $\phi$ of the total
weight. The goal is to minimize total expenditure $\sum_{i \in I} x_i c_i$.

[//]: # (Generated using qwen3.6:latest from D001 description.en.md and model.mzn)
