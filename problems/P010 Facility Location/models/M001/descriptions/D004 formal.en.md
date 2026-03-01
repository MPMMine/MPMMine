# Capacitated Facility Location

This problem, known as the **Capacitated Facility Location Problem**, represents a core challenge in operational
research and resource distribution planning. It builds upon the basic Facility Location Problem by incorporating
capacity limitations on the facilities being considered.

## 1. Definitions and Parameters

### Key Sets

* $F$: Represents the collection of **potential sites** for facilities, referred to by $i$.
* $C$: Represents the set of **clients**, referred to by $j$.

### Input Data

* $f_i$: The **setup expense** required to activate a facility at site $i$.
* $q_i$: The **maximum throughput** or allowable demand volume for facility $i$.
* $d_j$: The **demand requirement** of client $j$.
* $c_{ij}$: The **unit allocation cost** for assigning one unit of client $j$'s demand to facility $i$.

### Decision Variables

* $open_i \in \{0, 1\}$: A **binary indicator** specifying whether facility $i$ is operational (1) or not (0).
* $alloc_{ij} \in [0, 1]$: A **continuous proportion** indicating the fraction of client $j$'s demand covered by
  facility $i$.

---

## 2. Goals and Rules

### Primary Goal

The main aim is to determine the optimal combination of facility activations and client demand allocations to minimize
the overall operational expenditures, comprising both the facility setup costs and the variable allocation expenses.

$$\min \sum_{i \in F} f_i \cdot open_i + \sum_{i \in F} \sum_{j \in C} c_{ij} \cdot d_i \cdot alloc_{ij} $$

### Key Constraints

**Constraint 1: Client Fulfillment**
This rule guarantees that every client's entire demand is addressed.
$$\sum_{i \in F} alloc_{ij} \ge 1 \quad \forall j \in C$$

**Constraint 2: Resource Limitation and Activation Condition**
This rule imposes two conditions:

1. Demand allocation to facility $i$ is only permissible if it is activated ($open_i = 1$).
2. The aggregate demand allocated to facility $i$ must stay within its maximum capacity $q_i$.
   $$\sum_{j \in C} d_j \cdot alloc_{ij} \le q_i \cdot open_i \quad \forall i \in F$$

[//]: # (Generated using deepseek-r1:latest from D001 formal.en.md and model.mzn; major manual amendments applied)
