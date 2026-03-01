# Capacitated Facility Location Problem

The **Capacitated Facility Location Problem** is a well-known optimization challenge in logistics and supply chain
design. It serves as an extension of the basic facility location model by incorporating constraints that limit the
maximum throughput of each facility.

## 1. Definitions and Parameters

### Sets and Indices

* Define a set representing potential facility sites, indexed by a facility identifier.
* Define another set for customer locations, indexed by a customer identifier.

### Parameters

* For each facility, specify a fixed cost that applies if it is activated.
* For each facility, provide a maximum capacity constraint that cannot be exceeded.
* For each customer, state a specific demand requirement that must be fulfilled.
* For each pair of facility and customer, give a unit cost associated with serving that customer from that facility.

### Decision Variables

* Use a binary variable to indicate whether a facility is operational or inactive.
* Employ a continuous variable to represent the fraction of a customer's demand allocated to a specific facility.

---

## 2. Objective and Constraints

### Objective Function

The goal is to minimize the total cost, which includes the fixed costs for operating facilities and the variable costs
for serving customer demands.

### Constraints

**A. Demand Fulfillment**
This ensures that the entire demand of every customer is satisfied.

**B. Capacity and Activation Constraint**
This constraint enforces two conditions: first, demand allocation is only possible if the facility is active; second,
the cumulative demand assigned to a facility must not surpass its capacity.

[//]: # (Generated using deepseek-r1:latest from D001 formal.en.md and model.mzn; minor manual amendments applied)
