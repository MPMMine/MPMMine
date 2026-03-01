# Three‑Dimensional Sphere Packing in a Cube

Let $N \in \mathbb{N}$ denote the total number of candidate spheres.  
Define the index set $S=\{1,2,\dots ,N\}$.

The spheres must be arranged inside a cube of side length $L>0$.  
Sphere $i \in S$ comes with a prescribed radius $r_i>0$.

The task is to choose a subset of the spheres and assign positions to their centres so that

* every selected sphere lies completely inside the cube,
* no two selected spheres overlap,
* the cardinality of the selected set is as large as possible.

---

## Decision Variables

For each $i\in S$:

* $x_i, y_i, z_i\in\mathbb{R}$ – the coordinates of the centre of sphere $i$;
* $u_i\in\{0,1\}$ – a binary flag, where $u_i=1$ if sphere $i$ is packed, and $u_i=0$ otherwise.

---

## Constraints

### Containment

If a sphere is used, its centre must be at least a distance $r_i$ from every face of the cube.  
Formally, for all $i\in S$,

$$
r_i u_i \le x_i \le L - r_i u_i,\qquad
r_i u_i \le y_i \le L - r_i u_i,\qquad
r_i u_i \le z_i \le L - r_i u_i .
$$

When $u_i=0$, these bounds are effectively removed.

### Non‑Overlap

For every pair of distinct spheres $i < j$ in $S$, the squared distance between their centres must be at least the
square of the sum of their radii whenever both are selected.  
Using a sufficiently large constant $M > 0$ to relax the condition when a sphere is omitted, we impose

$$
(x_i - x_j)^2 + (y_i - y_j)^2 + (z_i - z_j)^2
\ge
(r_i + r_j)^2 - M (2 - u_i - u_j ).
$$

The term $M(2 - u_i - u_j)$ turns the inequality inactive if either $u_i$ or $u_j$ equals zero.

---

## Objective

Maximise the total number of packed spheres:

$$
\max \sum_{i\in S} u_i .
$$

[//]: # (Generated using gpt-oss:latest from D001 formal.en.md and model.mzn; major manual amendments applied)
