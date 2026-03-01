# Container Placement Challenge

A transport vessel utilizes a rectangular deck space to hold a collection of containers. These containers are
rectangular prisms, arranged in a single layer and oriented parallel to the deck's edges. Distinct container types
require specific separation distances to be maintained, either horizontally or vertically, across the deck.

The central objective is to determine if it’s possible to arrange these containers on the deck, ensuring no overlaps
occur and all separation rules are adhered to. This task can be formulated as a packing problem involving rectangles
within a larger rectangle, incorporating relevant restrictions.

Furthermore, the loading process is governed by a defined sequence. Containers are loaded beginning from the
southeastern corner of the deck. Each container’s placement must maintain contact with a previously placed container or
a deck edge – specifically, it must be adjacent to another container or a deck border on both the northern and western
sides.

[//]: # (Generated using gemma3:latest from D001 description.en.md and model.mzn)
