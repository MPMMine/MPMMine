# Cattle Feed Formulation Problem

Design a blend of livestock feed from a set of $I$ distinct ingredients.
Each ingredient $i\in I$ contains a vector of $N$ nutrients; the composition of nutrient $j\in N$ in ingredient $i$ is
denoted $c_{ij}$.
The feed mixture must weigh a prescribed total mass $W$, and the total amount of each nutrient must lie between a given
minimum $m_j$ and maximum $M_j$ bound.

Let $G\subseteq I$ be the subset of ingredients that are classified as grains.  
The cumulative mass of all grain ingredients must represent at least 20% of the overall feed mass:
$$
\sum_{i\in G} x_i \ge 0.2 W,
$$
where $x_i$ is the amount of ingredient $i$ used in the blend.

The decision variables $x_i$ satisfy $0\le x_i \le W$ for every $i\in I$.  
The blend must respect the mass balance:
$$
\sum_{i\in I} x_i = W .
$$

For each nutrient $j\in N$, the total contribution from all ingredients must fall within its specified range:
$$
m_j \le \sum_{i\in I} c_{ij} x_i \le M_j .
$$

Each ingredient carries a cost $p_i$; the objective is to minimize the total cost of the blend:
$$
\text{minimise} \sum_{i\in I} p_i x_i .
$$

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
