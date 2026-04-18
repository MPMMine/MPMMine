# Feed Blending Challenge

Managing a feed blending operation over multiple time intervals requires producing a consistent mix each period to
satisfy specific weight and nutritional criteria while dealing with dynamic cost structures. The primary aim is to
devise an optimal sourcing and mixing plan that minimizes overall expenses, including procurement and storage-related
fees.

1. Weight and Nutritional Targets: In each period, the final mixture must hit a designated total mass. The aggregate of
   all nutrient components, such as proteins or vitamins, must adhere to predefined lower and upper limits.

2. Component Proportions: A particular group of materials, identified as grains, must represent at least one fifth of
   the total mass in every blend to uphold quality standards.

3. Storage and Resource Handling: The operation includes a storage system with finite capacity for each type of
   material. Start with an initial inventory and must determine how much to acquire versus how much to utilize from
   stock each period.

4. Cost Management: The expense for each material varies across the time periods. Additionally, keeping materials in
   storage incurs a recurring fee based on the quantity and duration.

The goal is to find a schedule that minimizes the total expenditure, encompassing all purchase and inventory maintenance
costs, by strategically timing acquisitions and blends.

[//]: # (Generated using deepseek-r1:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
