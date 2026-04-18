# Cattle feeding

Consider the challenge of managing a cattle feed production facility over a specific time horizon (multiple periods). The goal is to produce a consistent feed blend in every period that meets strict nutritional and mass requirements while navigating fluctuating market prices.

1. Nutritional Consistency: In every period, the final blend must reach a target total weight. The sum of all nutrients (such as protein or energy) must stay within defined minimum and maximum bounds.

2. Compositional Rules: A specific subset of ingredients, classified as Grains, must always constitute at least 20% of the total blend mass to ensure feed quality.

3. Inventory & Logistics: The facility has a warehouse with a maximum storage capacity for each ingredient. You start with an initial stock and must decide in each period how much of each ingredient to purchase versus how much to draw from inventory.

4. Economic Strategy: Ingredients have varying costs over time. Furthermore, holding ingredients in the warehouse incurs a holding cost per unit per period.

The objective is to find an optimal procurement and blending schedule that minimizes the total cost (the sum of all purchase costs and inventory holding costs) over the entire duration, essentially deciding when to "buy low" and store ingredients for future use.

[//]: # (Manually created)
