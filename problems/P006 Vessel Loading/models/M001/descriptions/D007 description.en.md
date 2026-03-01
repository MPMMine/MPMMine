# Container Placement Challenge

Large ships carry freight containers between different locations. The ship's surface is a flat rectangle. Each container
is a three-dimensional box, but is placed flat with its base on the ship, forming a two-dimensional rectangle.
Containers are arranged so their sides are parallel to the edges of the ship's surface. The contents inside the
containers define their classification. Certain classifications require specific minimum distances between containers of
those types, measured either along the ship's surface or across it.

The core question in this problem is whether a collection of containers can be arranged on the designated ship surface
without overlapping and while respecting all required separation rules between containers of specific classifications.
This can be viewed as fitting a group of rectangular shapes into a larger rectangle, taking into account additional
restrictions.

In real-world scenarios, the arrangement must also align with how the containers are physically loaded onto the ship.
The loading process begins by placing containers starting from the southeast corner of the surface. Each subsequent
container placed during this sequence must be positioned such that it makes contact with either an existing container or
one of the ship's sides, specifically to the north and to the west.

[//]: # (Generated using deepseek-r1:latest from D001 description.en.md and model.mzn)
