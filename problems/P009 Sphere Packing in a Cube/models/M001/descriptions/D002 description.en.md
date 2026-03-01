# Packing Spheres in a Cubic Container

Let $N$ be a natural number indicating the quantity of spheres to consider. Define the set $S$ as the indices from 1
to $N$, each representing a distinct sphere.

The problem involves placing spheres inside a cubic container with side length $L > 0$. Each sphere $i \in S$ has a
specified radius $r_i > 0$.

The objective is to select a subset of these spheres and assign their positions within the cube such that all chosen
spheres are completely contained within the boundaries, and no two selected spheres intersect. The goal is to maximize
the count of spheres included.

### Decision Variables

For each sphere $i \in S$, the decision variables include three real-valued variables representing the Cartesian
coordinates of its center point in 3D space. Additionally, a binary variable indicates whether the sphere is part of the
packing solution.

### Constraints

#### 1. Containment Conditions

If a sphere is included, its center must be positioned at least $r_i$ units from each face of the cube in all three
dimensions. This ensures the sphere lies entirely within the container.

#### 2. Non-Overlap Conditions

When two spheres are both selected, the Euclidean distance between their centers must be at least the sum of their
radii. If one sphere is not selected, the distance constraint is not enforced.

### Objective Function

The aim is to maximize the total number of spheres that are successfully packed into the cube.

[//]: # (Generated using deepseek-r1:latest from D001 formal.en.md and model.mzn; minor manual amendments applied)
