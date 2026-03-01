# Capacitated Facility Location Problem (CFLP)

The **Capacitated Facility Location Problem** is a classic mixed‑integer optimisation model that arises frequently in
supply‑chain planning.  
Unlike the simple facility‑location formulation, it imposes a hard upper bound on the amount of demand that each chosen
facility can satisfy.

---

## 1. Model Elements

### Sets

- $F$ – the collection of potential facility sites, indexed by $i$.
- $C$ – the set of customers, indexed by $j$.

### Parameters

| Symbol   | Meaning                                                                   |
|----------|---------------------------------------------------------------------------|
| $f_i$    | Fixed cost to open facility $i$                                           |
| $q_i$    | Integer capacity of facility $i$ (maximum amount of demand it can handle) |
| $d_j$    | Integer demand demanded by customer $j$                                   |
| $c_{ij}$ | Continuous cost per unit of demand sent from facility $i$ to customer $j$ |

### Decision Variables

- $open_i \in \{0,1\}$: 1 if facility  $i$ is opened, 0 otherwise.
- $satisfied_{ij} \in [0,1]$: fraction of customer $j$’s demand supplied by facility $i$.

---

## 2. Objective and Constraints

### Objective

Minimise the total cost, consisting of facility‑opening costs and variable service costs:

$$
\min \sum_{i \in F} f_i open_i
+ \sum_{i \in F}\sum_{j \in C}
d_j c_{ij} satisfied_{ij}
$$

### Constraints

1. **Full demand coverage** – every customer’s demand must be met in full:

$$
\forall j \in C:\quad
\sum_{i \in F} satisfied_{ij} \ge 1
$$

2. **Capacity and activation** – demand can only be assigned to an open facility, and the total load on each facility
   cannot exceed its capacity:

$$
\forall i \in F:\quad
\sum_{j \in C} d_j satisfied_{ij}
\le q_i open_i
$$

These two constraints guarantee that the model respects both the service‑level requirement and the physical limits of
each location.

[//]: # (Generated using gpt-oss:latest from D001 formal.en.md and model.mzn; minor manual amendments applied)
