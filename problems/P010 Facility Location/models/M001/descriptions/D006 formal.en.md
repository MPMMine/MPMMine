Description:

# Facility Placement with Capacity Limits

The **Facility Placement with Capacity Limits** problem is a core challenge commonly found in logistics and supply chain
design. It builds upon the basic Facility Location problem by introducing restrictions on the maximum amount of client
needs that a single placement location can fulfill.

## 1. Variables and Specifications

### Sets and Indices

* $Location$: The set of possible **placement sites**, identified by $i$.
* $Client$: The set of **customers**, identified by $j$.

### Specifications

* $cost_i$: The initial cost associated with establishing a placement at site $i$.
* $capacity_i$: The maximum **discrete volume** a placement at site $i$ can handle.
* $need_j$: The specific **discrete requirement** of client $j$.
* $cost_{ij}$: The continuous cost for servicing one unit of need for client $j$ from placement site $i$.

### Decisions

* $active_i \in \{0, 1\}$: **Boolean Variable**. Indicates whether placement site $i$ is activated (1) or inactive (0).
* $fulfillment_{ij} \in [0, 1]$: **Continuous Variable**. Represents the proportion of client $j$'s need met by
  placement site $i$.

---

## 2. Objective and Limitations

### Objective Function

The objective is to minimize the overall cost, encompassing both the initial placement costs and the ongoing expenses
for fulfilling client needs.
$$\min Z = \sum_{i \in Location} cost_i active_i + \sum_{i \in Location} \sum_{j \in Client} (need_j \cdot cost_{ij}) fulfillment_{ij}$$

### Conditions

**A. Need Fulfillment**
This constraint guarantees that all client need is satisfied.
$$\sum_{i \in Location} fulfillment_{ij} \ge 1 \quad \forall j \in Client$$

**B. Capacity and Activation Constraint**
This constraint ensures two things:

1. Need can only be fulfilled by placement site $i$ if it is active ($active_i = 1$).
2. The aggregate need fulfilled by placement site $i$ cannot surpass its capacity $capacity_i$ when active.
   $$\sum_{j \in Client} need_j fulfillment_{ij} \le capacity_i active_i \quad \forall i \in Location$$

[//]: # (Generated using gemma3:latest from D001 formal.en.md and model.mzn; minor manual amendments applied)
