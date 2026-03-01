# Tank‑Car Loading Problem

A tank car is equipped with movable internal dividers, enabling the formation of any desired number of compartments.
Each compartment’s volume can be chosen arbitrarily, as long as the total volume of all compartments equals the car’s
overall capacity.

---

## Task

You are given a list of fluid types.  
For each fluid type *i* you know:

- $size_i$ – the volume required per unit of that fluid
- $profit_i$ – the monetary value contributed by one unit

Let

- **n** be the total number of fluid types
- **OBJ** = 1 … n be the index set of fluid types
- **capacity** be the maximum volume the tank car can hold

Define decision variables

- $x_i ∈ [0,1]$ – the fraction of fluid type *i* to load (allowing fractional loading).

The feasibility condition is

$\sum_{i \in OBJ} (size_i \times x_i) \le capacity.$

The goal is to maximize the total cargo value

$\max \sum_{i \in OBJ} (profit_i \times x_i).$

---

The challenge is to choose the proportions $x_i$ that respect the capacity constraint while achieving the highest
possible total profit.

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; major manual amendments applied)
