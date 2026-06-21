# Cattle Feed Formulation

We need to design a blend of several feed ingredients that delivers a specified total weight while satisfying a set of
nutritional requirements.
Each ingredient contributes a certain amount of each nutrient, and the overall blend must contain at least a fixed
fraction of grain ingredients. The objective is to produce the cheapest possible mixture.

## Sets and Parameters

* **Ingredient set** 𝑰 = {1,…,𝑛}
* **Nutrient set** 𝑁 = {1,…,𝑚}

For every ingredient $i \in 𝑰$:

* $c_i$ – the unit cost of ingredient *i*
* $p_{i,j}$ – the amount of nutrient *j* present in one unit of ingredient *i*

For every nutrient $j \in 𝑁$:

* $min_𝑗$ – the minimum required amount of nutrient *j* in the final product
* $max_𝑗$ – the maximum allowed amount of nutrient *j*

Other data:

* 𝑊 – the desired total weight of the finished feed
* 𝑮 ⊆ 𝑰 – the subset of ingredients that are classified as grains

## Decision Variables

For each ingredient $i \in 𝑰$, let

$a_i \in [0, 𝑊]$ – the weight of ingredient *i* to include in the blend.

## Constraints

1. **Mass balance**

$$
\sum\_{i \in 𝑰} a\_i = 𝑊
$$

3. **Nutrient bounds** – for every nutrient *j*∈𝑁

$$
min\_j \le \sum\_{i \in 𝑰} a\_i p\_{i,j} \le max_j
$$

5. **Grain fraction**

$$
\sum\_{i \in 𝑮} a\_i \ge 0.20 \times 𝑊
$$

## Objective

Minimise the total cost of the blend:

$$
\min \sum\_{i \in 𝑰} a\_i c\_i
$$

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; major manual amendments applied)
