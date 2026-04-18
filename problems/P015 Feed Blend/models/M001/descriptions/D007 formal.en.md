# Cattle Feed Formulation

Design a livestock feed mixture using a set of available components $I$, each with a defined unit cost $c_i$, a
multi-nutrient profile $p_{ij}$ across nutrient set $J$, and a variable mass contribution. The final blend must satisfy
specific constraints: the aggregate weight must exactly match a target total $W$; each nutrient's cumulative amount must
fall within predetermined lower and upper limits $L_j$ and $U_j$; and the combined weight of a designated cereal-based
subset $G$ must comprise at least a fixed proportion of the mix. The objective is to determine the precise
quantity $x_i$ for each component to minimize total expenditure
$$\sum_{i \in I} c_i x_i$$
subject to
$$\sum_{i \in I} x_i = W$$
$$\forall_{j \in J} L_j \leq \sum_{i \in I} p_{ij} x_i \leq U_j$$
$$\sum_{i \in G} x_i \geq \beta W$$

[//]: # (Generated using qwen3.6:latest from D001 description.en.md and model.mzn; major manual amendments applied)
