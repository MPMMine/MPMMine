# Capacitated Facility Location Problem (CFLP)

The **Capacitated Facility Location Problem** is a fundamental mixed‑integer programming model widely applied in
logistics and supply‑chain planning. It builds on the classic facility location formulation by imposing capacity limits
on each operational site.

## 1. Elements of the Model

### Sets Indexed by Symbols

- Let **Fac** denote the collection of prospective sites, indexed by a symbol *i*.
- Let **Cust** represent the set of demand points, indexed by a symbol *j*.

### Parameters with Formal Names

- *FC_i* – fixed cost payable if site *i* is activated.
- *CAP_i* – maximum throughput (capacity) allowed at site *i*.
- *DEM_j* – required service level of demand unit *j*.
- *C_{ij}* – per‑unit transportation expense incurred when a portion of demand *j* is satisfied from site *i*.

### Decision Variables Described Symbolically

- **open_i** ∈ {0, 1} – binary indicator that equals 1 when site *i* is opened, otherwise 0.
- **sat_{ij}** ∈ [0, 1] – a continuous fraction representing the share of demand *j* fulfilled by facility *i*.

## 2. Objective Function and Constraints

### Purpose Function

The optimization seeks to minimize overall expenditure, which aggregates opening expenses and servicing costs:  

$$
\min \Bigl[\sum\_{i\in\text{Fac}} FC_i open_i + \sum\_{i\in\text{Fac}} \sum\_{j\in\text{Cust}} (DEM_j \cdot C_{ij})  sat_{ij} \Bigr]
$$

### Required Conditions

**A. Full Demand Coverage** – Every demand node must be completely satisfied:  

$$
\sum\_{i\in\text{Fac}} sat\_{ij} \ge  1 \qquad\forall j\in\text{Cust}
$$

**B. Capacity together with Activation Rule** – Flow can only be assigned to a site that is open, and the cumulative
flow into any open site cannot exceed its capacity:  

$$
\sum\_{j\in\text{Cust}} (DEM\_j \cdot sat\_{ij}) \le CAP\_i open\_i \qquad\forall i\in\text{Fac}
$$

These expressions capture both the allocation limitation imposed by a facility’s size and the necessity that any
assigned flow originates only from an operational location. The model thus integrates fixed‑cost decisions with capacity
constraints to achieve an optimal routing of demand across potential facilities.

[//]: # (Generated using nemotron-3-nano:latest from D001 formal.en.md and model.mzn; minor manual amendments applied)
