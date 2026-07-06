# Sphere Arrangement in a Cuboid

Let $P$ denote the total count of spheres considered for placement.
Let $S = {1, 2, \dots, P}$ be the set of spheres.

The goal is to determine a selection of spheres and their locations within a cuboid, aiming to maximize the number of
selected spheres.

Specifically, we need to:

* Ensure that any chosen sphere is entirely contained within the cuboid,
* Guarantee that no two chosen spheres occupy the same space,
* Maximize the total number of spheres included in the arrangement.

---

## Decision Variables

For each sphere $i$ in the set $S$:

* $x_i, y_i, z_i$ represent the coordinates of the sphere’s center in the cuboid.
* $u_i$ is a binary variable, where $u_i = 1$ indicates that sphere $i$ is included in the arrangement, and $u_i = 0$
  indicates that it is not.

---

## Constraints

### 1. Spatial Containment Rules

Each included sphere must be completely inside the cuboid. For each sphere $i$ in the set $S$, the following conditions
must hold if $u_i = 1$:

$$
x\_i \ge r\_i, \quad x\_i \le L - r\_i,
$$

$$
y\_i \ge r\_i, \quad y\_i \le L - r\_i,
$$

$$
z\_i \ge r\_i, \quad z\_i \le L - r\_i,
$$

where $L$ is the length of the cuboid's side and $r_i$ is the radius of sphere $i$. If $u_i = 0$, these spatial
restrictions are not enforced.

### 2. Non-Overlapping Conditions

No two spheres in the arrangement can overlap. For every pair of distinct spheres $i$ and $j$ from the set $S$
where $i < j$ and $u\_i = u\_j = 1$, the distance between their centers must be greater than or equal to the sum of their
radii:

$$
sqrt((x\_i - x\_j)^2 + (y\_i - y\_j)^2 + (z\_i - z\_j)^2) \ge r\_i + r\_j.
$$

If $u_i=0$ or $u_j=0$, this condition does not hold.

## Objective

The objective is to find the maximum number of spheres that can be positioned within the cuboid:

$$
maximize \sum\_{i \in S} u\_i.
$$


[//]: # (Generated using gemma3:latest from D001 formal.en.md and model.mzn; major manual amendments applied)
