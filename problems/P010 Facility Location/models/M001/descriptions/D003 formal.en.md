# Optimized Warehouse Allocation Problem

The **Optimized Warehouse Allocation Problem** is a critical Mixed-Integer Programming challenge utilized in logistics
and supply chain optimization. It builds upon the Basic Warehouse Allocation Problem by incorporating limitations on the
maximum demand that a single warehouse can accommodate.

## 1. Decision Elements and Constants

### Entity Sets and Identifiers

* $\mathcal{W}$: The collection of potential **warehouse sites**, referenced by $w$.
* $\mathcal{C}$: The collection of **clients**, referenced by $c$.

### Constants

* $a_w$: The fixed expense associated with establishing warehouse $w$.
* $b_w$: The maximum **integer handling capacity** of warehouse $w$.
* $e_c$: The **integer requirement** of client $c$.
* $t_{wc}$: The continuous expense of fulfilling one unit of requirement for client $c$ from warehouse $w$.

### Decision Elements

* $operate_w \in \{0, 1\}$: **Binary Indicator**. Equals 1 if warehouse $w$ is operational, 0 otherwise.
* $fulfilled_{wc} \in [0, 1]$: **Continuous Indicator**. The proportion of client $c$'s requirement fulfilled by
  warehouse $w$.

## 2. Objective and Constraints

### Objective

The objective is to minimize the overall expense, comprising the fixed expenses of establishing warehouses and the
variable expenses of fulfilling client requirements.
$$\min \Theta = \sum_{w \in \mathcal{W}} a_w operate_w + \sum_{w \in \mathcal{W}} \sum_{c \in \mathcal{C}} (e_c \cdot t_{wc}) fulfilled_{wc}$$

### Constraints

**A. Requirement Fulfillment**
Guarantees that 100% of the requirement for every client is met.
$$\sum_{w \in \mathcal{W}} fulfilled_{wc} \ge 1 \quad \forall c \in \mathcal{C}$$

**B. Capacity and Activation Constraint**
Ensures two conditions:

1. Requirement can only be assigned to warehouse $w$ if it is operational ($operate_w = 1$).
2. The total requirement assigned to warehouse $w$ cannot exceed its capacity $b_w$.
   $$\sum_{c \in \mathcal{C}} e_c fulfilled_{wc} \le b_w operate_w \quad \forall w \in \mathcal{W}$$

[//]: # (Generated using llama3.3:latest from D001 formal.en.md and model.mzn)
