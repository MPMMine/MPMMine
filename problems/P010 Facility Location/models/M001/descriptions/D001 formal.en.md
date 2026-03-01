# Capacitated Facility Location Problem (CFLP)

The **Capacitated Facility Location Problem** is a fundamental Mixed-Integer Programming (MIP) problem used in logistics and supply chain management. It extends the Simple Facility Location Problem by adding constraints on the maximum amount of demand a single facility can handle.

## 1. Variables and Parameters

### Sets and Indices
* $Fac$: The set of potential **facility locations**, indexed by $i$.
* $Cust$: The set of **customers**, indexed by $j$.

### Parameters
* $f_i$: The fixed cost incurred to open facility $i$.
* $q_i$: The maximum **integer capacity** of facility $i$.
* $d_j$: The **integer demand** required by customer $j$.
* $c_{ij}$: The continuous cost to serve one unit of demand for customer $j$ from facility $i$.

### Decision Variables
* $open_i \in \{0, 1\}$: **Binary Variable**. Equals 1 if facility $i$ is opened, 0 otherwise.
* $satisfied_{ij} \in [0, 1]$: **Continuous Variable**. The fraction of customer $j$'s demand served by facility $i$.

---

## 2. Objective function and Constraints

### Objective Function
The goal is to minimize the total cost, consisting of the fixed costs of opening facilities and the variable costs of servicing customers.
$$\min Z = \sum_{i \in Fac} f_i open_i + \sum_{i \in Fac} \sum_{j \in Cust} (d_j \cdot c_{ij}) satisfied_{ij}$$



### Constraints

**A. Demand Satisfaction**
Ensures that 100% of the demand for every customer is met.
$$\sum_{i \in Fac} satisfied_{ij} \ge 1 \quad \forall j \in Cust$$

**B. Capacity and Activation Constraint**
This constraint ensures two things:
1.  Demand can only be assigned to facility $i$ if it is open ($open_i = 1$).
2.  The total demand assigned to facility $i$ cannot exceed its capacity $q_i$.
$$\sum_{j \in Cust} d_j satisfied_{ij} \le q_i open_i \quad \forall i \in Fac$$

[//]: # (Manually created)
