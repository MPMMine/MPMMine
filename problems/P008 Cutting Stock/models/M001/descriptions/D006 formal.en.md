# Cutting‑Stock Problem

In many manufacturing and logistics scenarios a large raw material—such as a roll of paper or a sheet of metal—is
divided into smaller pieces that satisfy customer requests. The goal is to organise the cuts so that the number of large
rolls used (or the amount of waste produced) is as small as possible.

## Modelling the situation

Let

* **n**  – the number of distinct item types that must be produced;
* **R**  – a pre‑selected maximum number of rolls that may be employed;
* **W**  – the fixed width of each large roll.

For each item type *i* (1 ≤ i ≤ n):

* **w_i**  – the width of one piece of type *i*;
* **d_i**  – the integer quantity demanded of type *i*.

Define

* **m_i = ⌊W / w_i⌋** – the greatest number of pieces of type *i* that can fit in a single roll.

The decision variables are

* **u_j ∈ {0,1}** – equals 1 if roll *j* is used, 0 otherwise (1 ≤ j ≤ R);
* **c_{ij} ∈ ℤ₊** – the number of pieces of type *i* cut from roll *j*.

The variables are restricted by the following logical conditions.

### 1. Physical capacity

A roll cannot contain more pieces of a type than it physically allows, and only rolls that are selected may contain
cuts:

$$
c_{ij} \le m_i u_j\quad\forall i, j.
$$

### 2. Width constraint

The total width of all pieces taken from a roll cannot exceed the roll’s width:

$$
\sum_{i=1}^{n} c_{ij} w_i \le W u_j\quad\forall j.
$$

### 3. Demand satisfaction

Every required quantity must be produced in total:

$$
\sum_{j=1}^{R} c_{ij} \ge d_i\quad\forall i.
$$

### 4. Symmetry breaking

To reduce the search space the rolls are ordered by usage:

$$
u_j \ge u_{j+1}\quad\forall j=1,\dots,R-1.
$$

### 5. Redundant lower bound

The number of rolls used must be at least the smallest integer that can accommodate the overall width of all demanded
pieces:

$$
\sum_{j=1}^{R} u_j \ge
\left\lceil \frac{\sum_{i=1}^{n} d_i w_i}{W}\right\rceil.
$$

## Objective

The optimisation problem is to minimise the total number of rolls that are used:

$$
\min \sum_{j=1}^{R} u_j.
$$

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
