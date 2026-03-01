# Cutting aluminum profiles for windows

A workshop fabricates aluminum profiles that are used as window frames. The shop receives standard extrusion bars from a
supplier and must slice each bar into shorter pieces to satisfy customer orders.

Each supplier bar has a fixed length, which we denote by **$L$**. A customer order is described by several item types.
For item type $i$ the required piece length is **$l_i$** and the total quantity demanded is **$d_i$**.

Because the bars are costly, the workshop wants to plan its cuts as efficiently as possible. Cutting a bar leaves a
remainder (off‑cut) that is typically too short to be reused; we treat this remainder as **waste**.

The planning goal is to decide how many supplier bars to use and how to cut each of them so that:

* Every demanded quantity $d_i$ for each item type $i$ is met or exceeded.
* The number of bars used is as small as possible.

---

## Symbolic model description

Let

* $n$ be the number of item types.
* $m$ be an upper bound on the number of bars that might be used.
* $W$ be the fixed length of a supplier bar.
* For each item type $i$ ($i = 1 \ldots n$):
    * $w_i$ be the length of a single piece of that type.
    * $d_i$ be the required number of pieces of that type.

Define the maximum number of pieces of type $i$ that can fit on a single bar:

$$
c_i = \bigl\lfloor W / w_i \bigr\rfloor .
$$

### Decision variables

* $u_j \in \{0,1\}$ indicates whether bar $j$ is used ($j = 1 \ldots m$).
* $x_{i,j} \in \mathbb{Z}_{\ge 0}$ is the number of pieces of type $i$ cut from bar $j$.

### Constraints

1. **Physical capacity bound**  
   $x_{i,j} \le c_i u_j$ for every $i$ and $j$.

2. **Bar‑width constraint**  
   $\sum_{i=1}^{n} w_i x_{i,j} \le W u_j$ for every $j$.

3. **Demand fulfillment**  
   $\sum_{j=1}^{m} x_{i,j} \ge d_i$ for every $i$.

4. **Symmetry breaking**  
   $u_j \ge u_{j+1}$ for all $j = 1 \ldots m-1$.

5. **Lower bound on bars**  
   $\sum_{j=1}^{m} u_j \;\ge\;
   \left\lceil \frac{\sum_{i=1}^{n} d_i w_i}{W} \right\rceil$.

### Objective

Minimise the total number of bars used:

$$
\min \sum_{j=1}^{m} u_j .
$$

This formulation captures the essential requirements of the workshop: meeting all piece demands while cutting as few
supplier bars as possible, thereby reducing material waste and cost.

[//]: # (Generated using gpt-oss:latest from D010 description.en.md and model.mzn; minor manual amendments applied)
