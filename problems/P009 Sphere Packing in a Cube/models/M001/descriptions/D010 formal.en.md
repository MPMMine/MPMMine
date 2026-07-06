# Optimizing Sphere Placement within a Cubic Boundary

Let $\gamma$ denote the collection of available spherical objects, where each object has a unique identifier from the
set $\Gamma = \{\sigma_1, \sigma_2, \dots, \sigma_{\gamma}\}$.

These spherical objects are to be positioned within a cubic container with a side length of $\lambda > 0$.
Each spherical object $\sigma_i \in \Gamma$ has an associated radius of $\rho_i > 0$.

The goal is to select a subset of these spherical objects and determine their optimal positions within the cubic
container such that:

* all selected objects are completely enclosed within the container,
* no two selected objects intersect or overlap,
* and the total count of selected objects is maximized.

## Decision Parameters

For each object $\sigma_i \in \Gamma$:

* The coordinates $\xi_i, \eta_i, \zeta_i \in \mathbb{R}$ represent the central point of object $\sigma_i$.
* A binary indicator $\upsilon_i \in \{0,1\}$ signifies whether object $\sigma_i$ is included in the container:
    * $\upsilon_i = 1$ indicates that object $\sigma_i$ is placed inside the container,
    * $\upsilon_i = 0$ indicates that object $\sigma_i$ is not included.

## Constraints

### Containment Requirements

If an object is selected, it must be fully contained within the cubic container.
For each object $\sigma_i \in \Gamma$, this requirement is enforced by ensuring:

$$
\rho\_i \upsilon\_i \le \xi\_i \le \lambda - \rho\_i \upsilon\_i,
$$

$$
\rho\_i \upsilon\_i \le \eta\_i \le \lambda - \rho\_i \upsilon\_i,
$$

$$
\rho\_i \upsilon\_i \le \zeta\_i \le \lambda - \rho\_i \upsilon\_i.
$$

When $\upsilon_i = 0$, these constraints are relaxed, allowing the position parameters to vary without restriction.

### Non-Intersection Requirements

No two selected objects can intersect or overlap.
For every pair of distinct objects $\sigma_i, \sigma_j \in \Gamma$ with $i < j$, the squared distance between their
central points must exceed the square of the sum of their radii whenever both objects are selected:

$$
(\xi\_i - \xi\_j)^2 + (\eta\_i - \eta\_j)^2 + (\zeta\_i - \zeta\_j)^2
\ge
(\rho\_i + \rho\_j)^2 - \Psi \bigl(2 - \upsilon\_i - \upsilon\_j\bigr),
$$

where $\Psi > 0$ is a sufficiently large constant that relaxes the constraint if either object is not selected.

## Objective

The objective is to maximize the count of objects placed within the cubic container:

$$
\max \sum_\{i \in \Gamma} \upsilon\_i.
$$

[//]: # (Generated using llama3.3:latest from D001 formal.en.md and model.mzn)
