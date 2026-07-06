# Tank Car Configuration

A tank car can be partitioned arbitrarily by repositioning its internal dividers, allowing the creation of compartments
with any desired capacity. The only requirement is that the combined volume of all compartments equals the total
capacity of the car.

## Goal

Given a list of fluids, each with a specific volume (size) and a monetary value (profit), determine how much of each
fluid to load into the car so that the overall volume does not exceed the car’s capacity while the total value of the
cargo is maximized.

## Mathematical representation

- Let $\mathcal{O}=\{1,\dots,n\}$ index the distinct fluid types.
- Parameters:
    - $c$ – the total capacity of the tank car.
    - $s_i$ – the available volume of fluid $i$.
    - $p_i$ – the profit obtained from one unit of fluid $i$.
- Decision variables:
    - $x_i \in [0,1]$ – the fraction of fluid $i$ that is loaded into the car.
- Capacity constraint:

$$
\sum\_{i\in\mathcal{O}} s\_i\\,x\_i \\;\le\\; c .
$$
- Objective:

$$
\max \\;\sum_{i\in\mathcal{O}} p\_i\\,x\_i .
$$

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
