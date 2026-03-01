# Window Frame Component Production Planning

A manufacturing facility specializes in the creation of **aluminum sections for window frames**. The facility receives
long aluminum bars from a supplier and must segment these bars to meet specific customer demands.

Each supplier bar possesses a certain length, referred to as **bar_length**. Customer requests require various sizes of
frame components. Each component type, labeled *k*, necessitates a quantity of material with length **length_k**, and a
total amount of these components desired is **quantity_k**.

Because the raw material is valuable, the facility needs to carefully plan the cutting process. When a bar is cut, some
material is left over as waste, potentially too short for reuse. This discarded material is considered **scrap**.

The objective is to determine the optimal cutting strategy that ensures:

* All customer orders for each component type are fulfilled.
* The minimum number of supplier bars is utilized.

Essentially, the facility aims to establish a cutting strategy that satisfies all window frame orders while minimizing
material usage, thereby reducing expenses and waste.


[//]: # (Generated using gemma3:latest from D010 description.en.md and model.mzn; minor manual amendments applied)
