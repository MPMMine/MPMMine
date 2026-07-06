# Cattle Feed Formulation Problem

Design a blend of livestock feed from a set of $I$ distinct ingredients.
Each ingredient $i\in I$ contains a vector of $N$ nutrients; the composition of nutrient $j\in N$ in ingredient $i$ is
denoted $c_{ij}$.
The feed mixture must weigh a prescribed total mass $W$, and the total amount of each nutrient must lie between a given
minimum $m_j$ and maximum $M_j$ bound.

Let $G\subseteq I$ be the subset of ingredients that are classified as grains.  
The cumulative mass of all grain ingredients must represent at least 20% of the overall feed mass:

$$
\sum\_{i\in G} x\_i \ge 0.2 W,
$$

where $x_i$ is the amount of ingredient $i$ used in the blend.

The decision variables $x_i$ satisfy $0\le x\_i \le W$ for every $i\in I$.  
The blend must respect the mass balance:

$$
\sum\_{i\in I} x\_i = W .
$$

For each nutrient $j\in N$, the total contribution from all ingredients must fall within its specified range:

$$
m\_j \le \sum\_{i\in I} c\_{ij} x\_i \le M\_j .
$$

Each ingredient carries a cost $p_i$; the objective is to minimize the total cost of the blend:

$$
\text{minimise} \sum\_{i\in I} p\_i x\_i .
$$

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
