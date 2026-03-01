# Cutting Stock Challenge

The cutting stock challenge emerges in diverse manufacturing and distribution contexts, where substantial raw materials
must be divided into smaller components to fulfill specific requirements while reducing waste.

A typical illustration involves the paper sector, where a company acquires large sheets of material, each with a
constant dimension. Clients submit orders for smaller sheets of various sizes and amounts. The organization must
determine how to divide each large sheet into smaller ones to satisfy all customer needs. Since any unused portion
becomes scrap, the objective is to plan the cutting layouts in a manner that reduces the total leftover material, or
equivalently, minimizes the quantity of large sheets used.

In this scenario, there are n_items, representing the number of distinct item types. Each item has a specific width, and
the demand for each item is given by an array. The total width of a large roll is fixed. The goal is to decide which
rolls to utilize and how many times each item is cut from each roll, while adhering to constraints.

One constraint is the physical capacity, ensuring that for each item and each roll, the number of cuts does not surpass
the maximum possible based on the roll's width and the item's width.

Another constraint is the width limitation, requiring that the sum of the widths of all cuts from a roll does not exceed
the roll's total width, considering whether the roll is used.

Additionally, there is a demand constraint that ensures the total cuts across all rolls meet or exceed the required
quantities for each item.

To reduce the search space, a symmetry breaking constraint is applied, ordering the usage of rolls to avoid redundant
checks.

A redundant constraint verifies that there are enough rolls to cover the total required width, based on the sum of
demands and widths.

The objective is to minimize the total number of rolls employed.

[//]: # (Generated using deepseek-r1:latest from D001 description.en.md and model.mzn)
