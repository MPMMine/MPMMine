# Capacitated Service Allocation Problem (CSAP)

This formulation determines which candidate sites should be opened and how each customer’s requirement is split among
those facilities, respecting the capacity limit of every open site. It belongs to the family of facility‑allocation
problems studied in operations research.

## 1. Notation

### Indices

* `ι` – indices for all potential facilities.
* `π` – indices for all customers.

### Parameters

* `fixedCost[ι]` – expense incurred if facility ι is opened.
* `capacity[ι]` – maximum throughput assigned to facility ι.
* `demand[π]` – required amount of customer π.
* `perUnitLink[ι,π]` – cost per unit served from ι to π.

### Decision variables

* `open[ι] ∈ {0,1}` – 1 when facility ι is activated, otherwise 0.
* `share[ι,π] ∈ [0,1]` – fraction of customer π’s demand that is assigned to facility ι.

## 2. Objective and Constraints

**Objective:** minimise the total aggregate cost formed by activation fees and served portions multiplied by their
respective link costs:  
`totalCost = Σ_ι fixedCost[ι]·open[ι] + Σ_{ι,π} share[ι,π]·demand[π]·perUnitLink[ι,π]` .

**Demand coverage:** for every customer π the sum of all allocated shares must satisfy the entire requirement:  
`Σ_ι share[ι,π] ≥ 1 ∀ π ∈ πSet`.

**Capacity‑activation linkage:** the total demand routed to a facility may be positive only if that site is opened and
cannot exceed its capacity:  
`Σ_π demand[π]·share[ι,π] ≤ capacity[ι]·open[ι] ∀ ι ∈ ιSet`.

[//]: # (Generated using nemotron-3-nano:latest from D001 formal.en.md and model.mzn; minor manual amendments applied)
