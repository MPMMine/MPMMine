# Tank Car Loading Problem

A tank car contains movable partitions that can split its interior into any number of zones whose individual capacities
add up to the full volume of the container.

You are given a collection of distinct liquids each specified by a symbolic identifier, an associated **value** (
represented as `profit[i]`) and a fixed **volume** (denoted `size[i]`). Choose how much of each liquid to load using
decision variables `x[i]` that can range from 0 up to 1.

Formulate the loading plan so that the weighted sum of volumes (`size[i] × x[i]`) does not exceed the car’s total
allowance (`capacity`). The goal is to maximize the aggregated value, expressed as the weighted sum of profits (
`profit[i] × x[i]`).

All constraints must be satisfied while respecting the limits defined by the symbolic variables extracted from the model
configuration.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn)
