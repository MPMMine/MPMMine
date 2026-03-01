# 3‑Dimensional Sphere Packing Inside a Cube

Let $N\in\mathbb N$ be the total number of candidate spheres.  
Denote by $I=\{1,2,\dots ,N\}$ the index set of all spheres.

Each sphere $i\in I$ comes with a fixed radius $r_i > 0$.  
The packing region is a cube of side length $L > 0$.

The goal is to choose a subset of spheres and assign positions to their centers so that

* every chosen sphere lies completely inside the cube,
* no two chosen spheres intersect,
* the total number of chosen spheres is as large as possible.

---

## Decision Variables

For every sphere $i \in I$

* $\mathbf{c}_i=(x_i,y_i,z_i)\in\mathbb R^3$ – the Cartesian coordinates of its center,
* $b_i\in\{0,1\}$ – an indicator that equals $1$ if sphere $i$ is packed and $0$ otherwise.

---

## Constraints

### Containment of Packed Spheres

If a sphere is selected ($b_i=1$) its center must satisfy

$$
r_i \,b_i \le  x_i \le  L-r_i \,b_i ,\qquad
r_i \,b_i \le  y_i \le  L-r_i \,b_i ,\qquad
r_i \,b_i \le  z_i \le  L-r_i \,b_i .
$$

When $b_i=0$ these bounds become void and do not constrain the variables.

### Non‑Overlap of Packed Spheres

For every distinct pair $i,j\in I$ with $i < j$,

$$
\|\mathbf{c}_i-\mathbf{c}_j\|^2 \ge (r_i+r_j)^2 - M (2-b_i-b_j),
$$

where $M = L^2$ is a large constant.  
If at least one of the two spheres is not packed, the right‑hand side becomes non‑restrictive because $2-b_i-b_j\ge1$.

### Feasibility of the Packing

At least one sphere may be packed; formally $\sum_{i\in I} b_i \ge 1$.

---

## Objective

$$
\max \sum_{i\in I} b_i,
$$

i.e., maximise the number of spheres placed inside the cube.

[//]: # (Generated using gpt-oss:latest from D001 formal.en.md and model.mzn; minor manual amendments applied)
