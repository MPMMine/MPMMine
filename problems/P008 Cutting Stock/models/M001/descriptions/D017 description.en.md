# Cutting aluminum extrusions for window frames

A fabrication facility produces **aluminum profiles that become the structural members of window sashes**. From the
supplier it receives identical extrusion rods, each having a fixed physical length denoted by **L**. Incoming orders
detail several segment families. Family *k* specifies bars of dimension **ℓ_k**, and the required quantity for this
family is indicated by **d_k**.

Because raw aluminum incurs significant cost, planners must organise how to partition the supplied rods into the
demanded pieces while generating the smallest possible amount of leftover material. Any portion of a rod that cannot be
reused after cutting is defined as **waste**.

The planning challenge can be phrased as finding an allocation that accomplishes two objectives:

1. Fulfil every family’s demand, i.e., for each *k* the total number of pieces of length ℓ_k produced must be at least
   its required quantity *d_k*.
2. Use the fewest possible rods from the inventory, thereby reducing overall consumption and scrap generation.

In practice the workshop seeks a cutting schedule that satisfies all customer specifications while minimising the count
of employed rods, which directly cuts material expense and by‑product waste.

[//]: # (Generated using nemotron-3-nano:latest from D010 description.en.md and model.mzn; major manual amendments applied)
