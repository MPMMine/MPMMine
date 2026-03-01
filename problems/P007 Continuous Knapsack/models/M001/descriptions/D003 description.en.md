# Variable Compartment Tank Loading

A tank car incorporates flexible internal dividers that can be adjusted to form sections of any desired volume, with the
total volume of all sections matching the car's overall capacity.

Provided is a collection of K items, each characterized by a volume per unit and a benefit per unit. The task is to
determine the optimal allocation of these items into the tank car, maximizing the total benefit while ensuring the
combined volume does not surpass the maximum capacity.

In more formal words, the problem involves a set of N entities, where each entity has a size parameter denoting the
volume per unit and a profit parameter representing the benefit per unit. A decision variable indicates the fractional
amount allocated to each entity, ranging from 0 to 1. The constraint requires that the sum of the products of size and
allocation for all entities does not exceed the total capacity. The objective is to maximize the sum of the products of
profit and allocation for all entities.

[//]: # (Generated using deepseek-r1:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
