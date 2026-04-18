# Bus shift scheduling

The problem can be seen as a set‑partitioning formulation for assigning drivers to duties. An instance is defined by:

- a collection of **`W`** elementary work items that must each be assigned exactly once,
- a large pool of candidate **`S`** duty patterns (shifts), each of which is a subset of `W` and carries an identical
  weight,
- a lower bound **`M`** on the number of patterns that must be used in any feasible partition.

A feasible solution selects a subset of the patterns such that every work item appears in exactly one chosen pattern,
i.e. the selected patterns form a partition of `W`. Because all patterns have the same weight, the primary objective is
to **minimise the number of selected patterns**; the secondary objective of minimising total cost is therefore
irrelevant.

Variables:

- a binary selector `x_i ∈ {0,1}` for each pattern `i ∈ {1,…,S}`,
- a scalar `T` representing the total number of selected patterns (`T = Σ_i x_i`).

Constraints:

1. Each work item is covered by exactly one selected pattern,
2. The number of selected patterns respects the lower bound (`T ≥ M`).

Objective:
`T` is the objective function to be minimised.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; major manual amendments applied)
