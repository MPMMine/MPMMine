# Feed Production Scheduling

Envision the task of operating a cattle feed manufacturing plant across a defined number of time intervals. The primary
aim is to create a uniform feed combination in each interval that adheres to strict mass and nutritional guidelines,
while accounting for fluctuating market expenses.

1. Mass and Nutritional Adherence: In each interval, the final mixture must achieve a predetermined total mass. The
   overall content of all nutrients must remain within specified lower and upper limits to ensure consistency.

2. Component Requirements: A specific category of items, termed as grains, must consistently represent at least 20% of
   the total mixture mass to uphold quality benchmarks.

3. Storage and Procurement: The plant includes a storage facility with a maximum capacity for each item. Initiating with
   an initial inventory, you must decide in each interval how much of each item to acquire and how much to deplete from
   stock.

4. Economic Factors: The cost of items varies over time, and maintaining items in storage incurs a cost per unit per
   interval.

The objective is to determine an optimal plan for sourcing and blending that minimizes the overall expenditure,
encompassing all purchase fees and storage charges, throughout the entire duration, by strategically acquiring items
when costs are low and preserving them for future use.

[//]: # (Generated using deepseek-r1:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
