# Asset Allocation Problem

An investor with limited capital wants to construct a portfolio that achieves the highest possible return. The universe
comprises N distinct securities, denoted by an index set **K** = {1, 2, …, N}. For each security *k* we know its profit
coefficient **pₖ** and the amount of the scarce resource (budget) it consumes when a unit is acquired, represented by **rₖ**.

The decision variable **x_k** indicates how much of security *k* will be taken; it may range continuously from 0 up to
1. No integer or binary restriction is imposed---any fractional amount is permissible as long as the overall consumption
stays within the budget limit **B**. The investor must also respect availability limits for each security, though these
are implicitly encoded in the variable bounds described above.

Mathematically the model can be expressed as:

- Set of indices **K** = {1,…,N}
- Data arrays **p_k**, **r_k** giving profit per unit and resource usage per unit for each k ∈ K
- Decision variable **x_k** ∈ [0, 1] for every k ∈ K
- Resource constraint: Σ_{k∈K} rₖ·x_k ≤ B
- Objective function to maximize: Σ_{k∈K} pₖ·x_k

The problem therefore seeks the fractions {x_k} that satisfy the budget limitation while delivering the greatest
attainable total profit.

[//]: # (Generated using nemotron-3-nano:latest from D008 description.en.md and model.mzn; minor manual amendments applied)
