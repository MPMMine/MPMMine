# Relocating Business Units

A major enterprise is considering relocating a number of its business units away from its primary headquarters city. For every possible pairing of a unit with a candidate city, a quantifiable financial advantage has been estimated (such as reduced real-estate expenses, local tax breaks, and improved access to skilled labor). On the other hand, dispersing the units across different cities will increase inter-unit communication expenses. The volume of communication between every pair of units is known, and the per-unit communication cost between every pair of cities has likewise been determined.

The decision to be made is: assign each business unit to exactly one city so that the net annual expenditure is as small as possible. Here, net expenditure is computed as the aggregate communication cost incurred across all unordered pairs of units (weighted by their pairwise communication volume and the per-unit cost of the two cities they occupy) minus the sum of the individual placement advantages enjoyed by each unit at its assigned city.

Additionally, every city in the candidate set—including the headquarters city—has a hard upper bound on the number of business units it is permitted to host.

[//]: # (Generated using qwen3.8:27b from D001 description.en.md and model.mzn)
