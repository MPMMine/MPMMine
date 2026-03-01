# Optimal Placement of Spheres in a Cubic Container

Consider a scenario where a cube with side length $L > 0$ is available for packing, and there are $N$ candidate spheres,
each with a specified radius. The task is to choose a subset of these spheres and assign their positions within the cube
such that:

* Every sphere in the chosen subset is completely contained within the cube.
* No two spheres in the subset overlap with each other.

The goal is to maximize the count of spheres that are packed.

---

## Decision Variables

For each sphere, define three continuous variables representing the Cartesian coordinates of its center point in the 3D
space, and a binary variable indicating whether the sphere is included in the packing solution. Specifically:

* Let $x_i$, $y_i$, $z_i$ denote the center coordinates for sphere $i$.
* Let $s_i \in \{0,1\}$ be a binary variable, where $s_i = 1$ if sphere $i$ is packed and $s_i = 0$ otherwise.

---

## Constraints

### 1. Containment Constraints

If a sphere is selected, its center must be positioned such that it lies entirely within the cube. This is enforced by
requiring that for each sphere $i$, the center coordinates satisfy:
$$
r_i s_i \le x_i \le L - r_i s_i,
$$
$$
r_i s_i \le y_i \le L - r_i s_i,
$$
$$
r_i s_i \le z_i \le L - r_i s_i.
$$
When $s_i = 0$, these constraints do not impose restrictions on the center coordinates.

### 2. Non-Overlap Constraints

To ensure that no two packed spheres overlap, for every pair of distinct spheres $i$ and $j$ with $i < j$, the Euclidean
distance between their centers must be at least the sum of their radii if both are selected. This is expressed as:
$$
(x_i - x_j)^2 + (y_i - y_j)^2 + (z_i - z_j)^2 \ge (r_i + r_j)^2 - M (2 - s_i - s_j),
$$
where $M > 0$ is a sufficiently large constant chosen to relax the constraint whenever at least one of the spheres is
not selected.

---

## Objective Function

The aim is to maximize the total number of spheres that are packed, which is given by:
$$
\max \sum_{i} s_i.
$$

[//]: # (Generated using deepseek-r1:latest from D001 formal.en.md and model.mzn; minor manual amendments applied)
