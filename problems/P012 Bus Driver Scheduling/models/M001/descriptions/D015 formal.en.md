# Bus driver scheduling

Bus driver scheduling can be cast as an exact set‑covering problem.  
An instance contains a family of required work items **W** and a large pool of candidate shifts **S**.
Each shift s ∈ **S** covers a subset of **W**, and every shift carries the same weight, so the cost term can be ignored.
The goal is to pick a sub‑collection of shifts that forms a partition of **W** --- i.e., every work item appears in
exactly one chosen shift --- while using as few shifts as possible; the secondary cost objective is therefore
irrelevant.

Instances are derived from four transit operators (Reading, CentreWest Ealing, former London Transport, etc.) and are
described by three symbolic parameters:

* **|W|** – the number of distinct work items,
* **|S|** – the number of candidate shifts,
* **M** – a lower bound on the number of shifts that any feasible partition must contain.

The underlying mathematical formulation introduces a binary decision variable **xₛ** for every shift s, a cumulative
variable **T** equal to the sum of all **xₛ**, and the following constraints:

1. Every work item in **W** must be covered by exactly one selected shift: ∑ₛ (xₛ·1[i ∈ shiftₛ]) = 1 for each i ∈ **W**.
2. The total number of selected shifts must respect the lower bound: **T** ≥ M.
3. The objective is to minimise **T**.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; major manual amendments applied)
