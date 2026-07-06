# Optimizing Sphere Placement within a Cubical Container

Let $\gamma$ denote the collection of spherical objects available for arrangement.
Let $\Sigma = \{\sigma_1, \sigma_2, \dots, \sigma_\gamma\}$ be the indexing set for these spherical entities.

The goal is to position these spheres within a cubical enclosure with edge length $\lambda > 0$.
Each sphere $\sigma_i \in \Sigma$ has an associated radius $\rho_i > 0$.

The challenge involves selecting a subset of spheres and determining their spatial arrangements within the cube such
that:

* all chosen spheres are entirely enclosed within the cube,
* no two selected spheres intersect,
* and the total count of selected spheres is optimized.

## Decision Entities

For each sphere $\sigma_i \in \Sigma$:

* $\xi_i, \eta_i, \zeta_i \in \mathbb{R}$ represent the Cartesian coordinates of the center of sphere $\sigma_i$.
* $\upsilon_i \in \{0,1\}$ is a binary decision entity indicating whether sphere $\sigma_i$ is positioned within the
  cube:
    * $\upsilon_i = 1$ if sphere $\sigma_i$ is placed inside the cube,
    * $\upsilon_i = 0$ otherwise.

## Constraints

### 1. Enclosure Constraints

If a sphere is positioned, it must be fully contained within the cube.
For each sphere $\sigma_i \in \Sigma$, this requirement is enforced by:

$$
\rho\_i \upsilon\_i \le \xi\_i \le \lambda - \rho\_i \upsilon\_i,
$$

$$
\rho\_i \upsilon\_i \le \eta\_i \le \lambda - \rho\_i \upsilon\_i,
$$

$$
\rho\_i \upsilon\_i \le \zeta\_i \le \lambda - \rho\_i \upsilon\_i.
$$

### 2. Non-Intersection Constraints

No two positioned spheres may intersect.
For every pair of distinct spheres $\sigma_i, \sigma_j \in \Sigma$ with $i < j$, the squared Euclidean distance between
their centers must be at least the square of the sum of their radii whenever both spheres are positioned:

$$
(\xi\_i - \xi\_j)^2 + (\eta\_i - \eta\_j)^2 + (\zeta\_i - \zeta\_j)^2
\ge
(\rho\_i + \rho\_j)^2 - \Phi \bigl(2 - \upsilon\_i - \upsilon\_j\bigr),
$$

where $\Phi > 0$ is a sufficiently large constant.

## Objective

The objective is to optimize the count of spheres positioned within the cube:

$$
\max \sum\_{i \in \Sigma} \upsilon\_i.
$$

[//]: # (Generated using llama3.3:latest from D001 formal.en.md and model.mzn; minor manual amendments applied)
