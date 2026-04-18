# Feed Blending Problem

Consider the operation of a feed production facility across a finite number of time periods. The challenge is to create
a consistent feed mixture in each period that adheres to strict mass and nutritional standards, while managing inventory
and costs effectively.

1. Mass and Nutritional Constraints: In every period, the final mixture must reach a target weight. For each nutrient in
   a set of nutrients, the blend's composition must ensure that the sum of ingredient contributions falls within
   specified minimum and maximum limits to meet quality standards.

2. Ingredient Requirements: A specific subset of ingredients, designated as Grains, must always represent at least a
   fixed minimum percentage of the total blend mass to guarantee feed consistency.

3. Inventory Dynamics: The facility has a storage capacity for each ingredient, and the process starts with an initial
   inventory level. Decisions must be made on how much to purchase and how much to utilize in each period, ensuring that
   inventory levels remain within bounds and do not exceed storage limits.

4. Cost Optimization: Ingredient costs fluctuate over time, and there is an additional expense for retaining inventory.
   The objective is to determine an optimal purchasing and usage schedule that minimizes the total cost, encompassing
   both acquisition expenses and inventory holding fees, throughout the entire planning horizon.

[//]: # (Generated using deepseek-r1:latest from D001 description.en.md and model.mzn)
