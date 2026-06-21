# Cattle Feed Blend Design

Design a cattle‑feed mixture using a set of available ingredients, each of which supplies a vector of nutrients.  
The finished product must have a prescribed total mass, denoted **W**.
For every nutrient type *j*, the overall content of the mixture must lie between a specified lower bound **L\_j** and an
upper bound **U\_j**.  
A particular subset of the ingredients, called the grain group **G**, must contribute at least 20% of the total mass.  
The goal is to determine non‑negative amounts **a\_i** for each ingredient *i* that satisfy all constraints while
minimising the total cost.

**Parameters**

- **I** – the set of all ingredients.
- **N** – the set of all nutrient types.
- **c\_i** – unit cost of ingredient *i*.
- **comp\_{i,j}** – quantity of nutrient *j* supplied per unit of ingredient *i*.
- **L\_j**, **U\_j** – minimum and maximum allowed totals for nutrient *j*.
- **G ⊆ I** – the grain subset.
- **W** – desired total mass of the blend.

**Decision variables**

- **a\_i** ∈ [0, W] for each *i* ∈ **I** (amount of ingredient *i* used).

**Constraints**

1. **Mass balance**

$$
\sum\_{i \in I} a\_i = W
$$

3. **Nutrient limits**

   For every nutrient *j* ∈ **N**,

$$
L\_j \le \sum\_{i \in I} a\_i \cdot \text{comp}\_{i,j} \le U\_j
$$

5. **Grain minimum**

$$
\sum\_{i \in G} a\_i \ge 0.2 \times W
$$

**Objective**

Minimise the total cost

$$
\min \sum\_{i \in I} a\_i \cdot c\_i .
$$

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
