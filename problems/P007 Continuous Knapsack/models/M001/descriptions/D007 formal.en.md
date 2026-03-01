# Tanking a car

A tank car can be partitioned into any number of sections; the sum of those section volumes must equal the vehicle’s
total capacity. A collection of liquid commodities is available, each bearing its own profit potential and a required
space consumption when placed in a sector. The decision involves determining how much of each commodity to load—any
fractional amount up to one full unit per type may be taken—and the loading amounts are represented by variables that
lie between 0 and 1. The overarching goal is to assign these fractions so as to maximize total profit while respecting
the volume constraint imposed by the tank’s capacity.

Let **I** denote the index set of available commodities, let **C** stand for the vehicle’s capacity, let **V[i]**
represent the space required per unit of commodity *i*, and let **P[i]** denote its corresponding profit. We must choose
continuous selection values **x[i] ∈ [0,1]** such that

$$
\sum_{i\in I} V[i]\cdot x[i]\;\le\;C,
$$

while maximizing

$$
\sum_{i\in I} P[i]\cdot x[i].
$$

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
