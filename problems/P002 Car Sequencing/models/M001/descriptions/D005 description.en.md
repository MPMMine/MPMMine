# Car Sequencing Problem

This problem involves sequencing a fixed number of cars with different classes and features through an assembly line
with multiple stations. Each station corresponds to a specific feature and has a capacity constraint, meaning that the
number of cars with that feature in any contiguous block of a given size must not exceed a specified limit. The sequence
must also satisfy the total quantity of each car class and ensure that the feature configuration for each car matches
the required specifications. The problem is known to be NP-complete, as finding an optimal or feasible sequence can be
computationally intensive.

## Key Definitions and Symbols

- Let $C$ be the set of car classes, with each class $c$ having a quantity $Q(c)$ of cars to be produced.
- Each class $c$ has a feature configuration $F(c)$, which is a binary vector indicating whether each feature is
  required (1) or not (0).
- Let $O$ be the set of features, with each feature $o$ having a block size $B(o)$ and a maximum allowed cars in a
  block $M(o)$.
- The total number of cars $T$ is fixed and equal to the sum of $Q(c)$ over all classes $c$.

## Objective

The goal is to find a sequence of $T$ cars, each assigned a class from $C$, such that:

- For each class $c$, the total number of cars with class $c$ is exactly $Q(c)$.
- For each feature $o$, in any contiguous subsequence of length $B(o)$, the number of cars with feature $o$ is at
  most $M(o)$.

[//]: # (Generated using deepseek-r1:latest from D001 description.en.md and model.mzn; major manual amendments applied)
