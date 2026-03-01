# Facility Location with Capacity Restrictions

The **Facility Location with Capacity Restrictions** problem is a challenge within logistics and supply chain planning.
It builds upon the basic Facility Location Problem by imposing limits on the total volume of demand that any individual
location can handle.

## 1. Variables and Specifications

### Sets and Indices

* $Facility$: The set of potential **location sites**, denoted by $i$.
* $Client$: The set of **customer sites**, denoted by $j$.

### Parameters

* $cost_i$: The initial expenditure to establish a facility at site $i$.
* $capacity_i$: The maximum **volume capacity** for facility $i$.
* $requirement_j$: The **demand volume** required by client $j$.
* $cost_{ij}$: The ongoing expense related to servicing demand from facility $i$ for client $j$.

### Decision Variables

* $active_i \in \{0, 1\}$: **Boolean Variable**. Indicates whether facility $i$ is activated (1) or not (0).
* $fulfillment_{ij} \in [0, 1]$: **Continuous Variable**. Represents the proportion of client $j$'s requirement met by
  facility $i$.

---

## 2. Objective and Restrictions

### Objective Function

The aim is to minimize the overall expenditure, encompassing both the startup expenses for locations and the operational
costs for satisfying client needs.
$$\min Z = \sum_{i \in Facility} cost_i active_i + \sum_{i \in Facility} \sum_{j \in Client} requirement_j \cdot cost_{ij} \cdot fulfillment_{ij}$$

### Restrictions

**A. Demand Fulfillment**
This ensures that the complete demand for each client is met.
$$\sum_{i \in Facility} fulfillment_{ij} \ge 1 \quad \forall j \in Client$$

**B. Capacity and Activation Constraint**
This restriction has two aspects:

1. Demand can only be allocated to facility $i$ if it’s activated ($active_i = 1$).
2. The total demand assigned to facility $i$ should not surpass its defined capacity $capacity_i$.
   $$\sum_{j \in Client} requirement_j \cdot fulfillment_{ij} \le capacity_i \cdot active_i \quad \forall i \in Facility$$

[//]: # (Generated using gemma3:latest from D001 formal.en.md and model.mzn; minor manual amendments applied)
