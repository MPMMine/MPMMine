# Optimized Logistics Hub Placement Problem

The **Optimized Logistics Hub Placement** problem is a crucial Mixed-Integer Programming challenge utilized in supply
chain optimization and logistics management. This problem builds upon the basic hub placement scenario by incorporating
limitations on the maximum demand that a single hub can accommodate.

## 1. Key Elements and Parameters

### Entity Sets

* $\mathcal{H}$: The collection of potential **logistics hub sites**, denoted by $h$.
* $\mathcal{C}$: The set of **clients**, indexed by $c$.

### Fundamental Parameters

* $\phi_h$: The initial investment required to establish hub $h$.
* $\kappa_h$: The maximum **integer handling capacity** of hub $h$.
* $\delta_c$: The **integer service requirement** of client $c$.
* $\gamma_{hc}$: The continuous cost associated with serving one unit of demand for client $c$ from hub $h$.

### Decision Elements

* $\omega_h \in \{0, 1\}$: **Binary Indicator**. Equals 1 if hub $h$ is operational, 0 otherwise.
* $\sigma_{hc} \in [0, 1]$: **Continuous Service Level**. Represents the fraction of client $c$'s demand fulfilled by
  hub $h$.

## 2. Objective and Constraints

### Objective

The primary goal is to minimize the overall expenditure, comprising the initial costs of establishing hubs and the
ongoing costs of servicing clients.
$$\min \Theta = \sum_{h \in \mathcal{H}} \phi_h \omega_h + \sum_{h \in \mathcal{H}} \sum_{c \in \mathcal{C}} (\delta_c \cdot \gamma_{hc}) \sigma_{hc}$$

### Constraints

**A. Client Satisfaction Guarantee**
Ensures that each client's demand is fully met.
$$\sum_{h \in \mathcal{H}} \sigma_{hc} \ge 1 \quad \forall c \in \mathcal{C}$$

**B. Hub Capacity and Activation Rule**
This rule ensures two critical aspects:

1. Demand can only be allocated to hub $h$ if it is operational ($\omega_h = 1$).
2. The total demand assigned to hub $h$ must not exceed its handling capacity $\kappa_h$.
   $$\sum_{c \in \mathcal{C}} \delta_c \sigma_{hc} \le \kappa_h \omega_h \quad \forall h \in \mathcal{H}$$

[//]: # (Generated using llama3.3:latest from D001 formal.en.md and model.mzn)
