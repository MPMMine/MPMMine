# Cutting Stock Problem

The cutting stock problem is an optimization challenge in manufacturing and logistics, focusing on cutting large raw
materials into smaller pieces to satisfy specific demands while minimizing waste.

A common application is in the paper and printing sector. A company buys large rolls of paper with a fixed width.
Customers place orders for smaller rolls of various widths and quantities. The company must decide on cutting patterns
for each large roll to fulfill these orders, ensuring that any unused material is minimized, which can be achieved by
reducing the total number of large rolls needed.

In the mathematical model, let N represent the number of item types. For each item i, define w_i as its width and d_i as
its demand. There are up to M large rolls, each with width W.

The model uses binary variables u_j for each roll j, indicating whether it is used, and integer variables c_{i,j} for
the number of times item i is cut from roll j.

Constraints include:

- A capacity constraint ensuring that the number of cuts for each item does not exceed the physical maximum per roll,
  which is floor(W / w_i) * u_j for item i and roll j.

- A width constraint that the total width of cuts from a roll does not exceed W * u_j if the roll is used.

- A demand constraint to ensure that the total cuts across all rolls meet or exceed d_i for each item i.

- A symmetry-breaking constraint to reduce symmetric solutions by enforcing u_j >= u_{j+1} for j from 1 to M-1.

- An implied constraint based on the total required width, given by ceil( sum_i d_i * w_i / W ), ensuring the total
  rolls are sufficient.

The objective is to minimize the total number of rolls used.

[//]: # (Generated using deepseek-r1:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
