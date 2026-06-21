# Bus‑driver shift planning

The scheduling task can be cast as a set‑partitioning model.  
Let

* **W** = ${ w₁,…, w\_{num\\_work} }$ be the collection of work units,
* **S** = ${ s₁,…,s\_{num\\_shifts} }$ the set of candidate shifts.

Each shift $s∈S$ covers a subset $C_s⊆W$ and all shifts share the same unit cost.
A binary vector **x** (with components $x_s∈{0,1}$) indicates whether shift $s$ is chosen, and

$$
tot\_{shifts} = \sum\_{s\in S} x\_s .
$$

**Constraints**

* Every work unit must appear in exactly one selected shift:

$$
\sum_{s\in S} x_s \mathbf{1}(\{ w\in C\_s \}) = 1
\quad\text{for all } w\in W.
$$

* At least `min_num_shifts` shifts must be used:

$$
tot\_{shifts} \ge \text{min\\_num\\_shifts}.
$$

**Objective**

Because each shift has identical cost, the secondary aim of total cost is moot.
The primary goal is to minimise the number of shifts:

$$
\min tot\_{shifts}.
$$

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
