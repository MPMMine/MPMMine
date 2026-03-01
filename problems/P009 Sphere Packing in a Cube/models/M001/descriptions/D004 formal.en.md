# Sphere Packing within a Cubical Container

Let $T$ be the set of all candidate spheres available for placement, where $T = \{1, 2, \dots, N\}$.

The goal is to determine a selection of spheres from $T$ and position them inside a cube of side length $L > 0$ such
that:

* Each selected sphere must be entirely contained within the cube,
* No two selected spheres can overlap, and
* The maximum possible number of spheres selected is to be achieved.

---

## Decision Variables

For each sphere $k$ in the set $T$:

* $pos_k$ represents the coordinates of the sphere's center within the cube, with $pos_k \in \mathbb{R}^3$.
* $used_k$ is a binary variable, where $used_k = 1$ if sphere $k$ is placed inside the cube, and $used_k = 0$ otherwise.

---

## Constraints

### 1. Sphere Containment Restrictions

If a sphere is placed inside the cube, its center must be located within the cube’s boundaries.
For each sphere $k \in T$, the following must hold:
$$
pos_k.x \ge used_k * r_k \land pos_k.x \le L - used_k * r_k \land
$$
$$
pos_k.y \ge used_k * r_k \land pos_k.y \le L - used_k * r_k \land
$$
$$
pos_k.z \ge used_k * r_k \land pos_k.z \le L - used_k * r_k.
$$
When $used_k = 0$, these constraints do not impose any restriction on the position variables.

### 2. Non-Overlapping Restrictions

No two placed spheres can intersect.
For every pair of distinct spheres $k, l \in T$ such that $k < l$, the Euclidean distance between their centers must be
greater than or equal to the sum of their radii, unless both spheres are placed inside the cube:
$$
(pos_k.x - pos_l.x)^2 + (pos_k.y - pos_l.y)^2 + (pos_k.z - pos_l.z)^2
\ge
(r_k + r_l)^2 - M \bigl(2 - used_k - used_l\bigr),
$$
where $M > 0$ is a sufficiently large constant.

## Objective Function

The objective is to maximize the number of spheres placed within the cube:
$$
maximize \sum_{k \in T} used_k.
$$


[//]: # (Generated using gemma3:latest from D001 formal.en.md and model.mzn; major manual amendments applied)
