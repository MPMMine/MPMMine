# Bus‑Driver Shift Planning

Bus‑driver shift planning can be cast as a classic set‑partitioning task.  
We are given a universe **W** of work units (e.g., individual routes or time slots) that must be covered exactly once.
A large catalogue **S** of potential shifts is provided; each shift *s* ∈ **S** covers a particular subset of work units
and has an identical cost.
The goal is to pick a sub‑collection of shifts that forms a partition of **W** --- every work unit appears in exactly
one chosen shift --- while using as few shifts as possible. Because all shifts cost the same, the total expense is
secondary; minimising the cardinality of the chosen shifts is the primary objective.

## Symbols

- **n₁**: number of work units (rows)
- **n₂**: number of available shifts (columns)
- **m**: the minimal number of shifts that any feasible partition must contain
- **W** be the set {0,…,n₁−1} of work indices.
- **S** be the set {1,…,n₂} of shift indices.
- `shifts[i] ⊆ W` be the subset of work units covered by shift *i*.
- Decision variable `x[i] ∈ {0,1}` indicates whether shift *i* is selected.
- Auxiliary variable `tot_shifts = Σ_{i∈S} x[i]` counts the chosen shifts.

## Constraints

1. **Partition constraint**  
   For every work unit *j* ∈ **W**:  
   `Σ_{i∈S} x[i] * 1(j ∈ shifts[i]) = 1`  
   (each work unit is covered exactly once).

2. **Shift‑count lower bound**  
   `tot_shifts ≥ m`.

The objective is to **minimise `tot_shifts`**.

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; major manual amendments applied)
