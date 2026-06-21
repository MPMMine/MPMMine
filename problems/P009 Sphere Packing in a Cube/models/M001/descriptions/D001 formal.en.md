# 3D Sphere Packing in a Cube

Let $N \in \mathbb{N}$ denote the number of candidate spheres available for packing.
Let $S = {1, 2, \dots, N}$ be the index set of spheres.

The spheres are to be packed inside a cube of side length $L > 0$.
Each sphere $i \in S$ has a given radius $r_i > 0$.

The problem consists of selecting a subset of spheres and determining their positions inside a cube such that:

* all selected spheres are fully contained within the cube,
* no two selected spheres overlap,
* and the total number of selected spheres is maximized.

---

## Decision Variables

For each sphere $i \in S$:

* $x_i, y_i, z_i \in \mathbb{R}$ denote the Cartesian coordinates of the center of sphere $i$.
* $u_i \in {0,1}$ is a binary decision variable indicating whether sphere $i$ is packed into the cube:
    * $u_i = 1$ if sphere $i$ is placed inside the cube,
    * $u_i = 0$ otherwise.

---

## Constraints

### 1. Containment Constraints

If a sphere is packed, it must lie entirely inside the cube.
For each sphere $i \in S$, this is enforced by requiring:

$$
r\_i u\_i \le x\_i \le L - r\_i u\_i,
$$

$$
r\_i u\_i \le y\_i \le L - r\_i u\_i,
$$

$$
r\_i u\_i \le z\_i \le L - r\_i u\_i.
$$

When $u_i = 0$, these constraints are relaxed and do not restrict the position variables.

### 2. Non-Overlap Constraints

No two packed spheres may overlap.
For every pair of distinct spheres $i, j \in S$ with $i < j$, the squared Euclidean distance between their centers must
be at least the square of the sum of their radii whenever both spheres are packed:

$$
(x\_i - x\_j)^2 + (y\_i - y\_j)^2 + (z\_i - z\_j)^2
\ge
(r\_i + r\_j)^2 - M \bigl(2 - u\_i - u\_j\bigr),
$$

where $M > 0$ is a sufficiently large constant.
This big-$M$ term relaxes the constraint whenever at least one of the two spheres is not packed.

## Objective Function

The objective is to maximize the number of spheres packed into the cube:

$$
\max \sum\_{i \in S} u\_i.
$$

[//]: # (Manually created)
