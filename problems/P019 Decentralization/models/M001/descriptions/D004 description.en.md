# Site Allocation

A multinational firm is considering relocating various of its internal units away from a primary headquarters location. Each relocation opportunity carries quantified advantages (lower real-estate expenses, regulatory incentives, broader talent pools, and so forth), which have been estimated for every unit–city pairing. On the other hand, relocating units to different sites will introduce higher inter-unit communication expenses. These communication costs have likewise been quantified for every conceivable pair of cities. The task is to decide which city each unit should occupy so that the net annual expense is as small as possible.

Formally, let the set of units be denoted by **D** and the set of candidate cities (which includes the headquarters city) by **C**. For every unit *i* ∈ **D** and city *c* ∈ **C**, a benefit value is given, representing the yearly savings realized by placing unit *i* in city *c*. For every ordered pair of distinct units *i*, *k* ∈ **D*, a communication-quantity figure is specified, reflecting how much interaction is expected between them. For every pair of cities *c₁*, *c₂* ∈ **C*, a per-unit communication cost is defined. The net yearly cost to be minimized equals the sum, over all unordered pairs of units, of (communication quantity between the two units) multiplied by (the communication cost of the two cities to which they are assigned), minus the sum, over all units, of the benefit of the city chosen for that unit.

A capacity restriction applies: for any given city, the number of units assigned to it must not exceed a fixed upper bound **U**.

[//]: # (Generated using qwen3.8:27b from D001 description.en.md and model.mzn)
