# Capacitated Facility Location Problem (CFLP)

The **Capacitated Facility Location Problem** is a classic Mixed‑Integer Programming (MIP) model frequently applied in
logistics, supply‑chain design, and distribution network planning. It extends the basic facility‑location framework by
imposing upper bounds on how much demand each opened facility can serve.

---

## 1. Sets, Parameters, and Decision Variables

### Sets and Indices

* **Fac** – the set of all potential facility sites, indexed by *i*.
* **Cust** – the set of all customers, indexed by *j*.

### Parameters

* **fixed_cost[i]** – the fixed cost of opening facility *i*.
* **capacity[i]** – the maximum integer capacity that facility *i* can handle.
* **demand[j]** – the integer demand required by customer *j*.
* **dist_cost[i,j]** – the continuous unit‑service cost of supplying customer *j* from facility *i*.

### Decision Variables

* **open[i] ∈ {0,1}** – binary indicator; 1 if facility *i* is opened, 0 otherwise.
* **satisfied[i,j] ∈ [0,1]** – fraction of customer *j*’s demand that is satisfied by facility *i*.

---

## 2. Objective and Constraints

### Objective

Minimize the total cost, comprising both fixed opening costs and variable service costs:

$$
\min Z = \sum\_{i\in Fac} \text{fixed\\_cost}[i] \text{open}[i]  +
\sum\_{i\in Fac}\sum\_{j\in Cust}
\bigl(\text{demand}[j] \text{dist\\_cost}[i,j]\bigr) \text{satisfied}[i,j].
$$

### Constraints

**(a) Demand Satisfaction** – Every customer’s demand must be met in full:

$$
\sum\_{i\in Fac} \text{satisfied}[i,j] \ge 1 \quad \forall j\in Cust.
$$

**(b) Capacity & Activation** – Demand can only be assigned to a facility that is opened, and the total assigned demand
must not exceed the facility’s capacity:

$$
\sum\_{j\in Cust} \text{demand}[j] \text{satisfied}[i,j]
\le
\text{capacity}[i] \text{open}[i] \quad \forall  i\in Fac.
$$

These conditions guarantee that the solution respects both the opening decisions and the capacity limits while ensuring
full service to all customers.

[//]: # (Generated using gpt-oss:latest from D001 formal.en.md and model.mzn; minor manual amendments applied)
