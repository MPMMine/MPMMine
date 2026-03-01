# Container Arrangement Problem

Transport vessels carry rectangular containers between locations. The deck is a rectangular space. Containers are
three-dimensional with rectangular faces, and are arranged in a single layer. All containers are aligned parallel to the
deck's edges. The contents of the containers define their category. Certain container categories must maintain minimum
separation distances either along the deck or across the deck.

The container arrangement decision problem is to determine if a given set of containers can be placed on a given deck,
without overlapping, and without violating any separation constraints. This problem can be modeled as packing a set of
smaller rectangles into a larger rectangle, with certain constraints.

In practice, the arrangement may be further restricted by the physical loading order. Containers are moved into position
starting from the southeast corner. Each subsequent container in the loading sequence must be placed such that it
touches another container or a deck wall both to the north and to the west.

The deck has a certain width and length. There are a specific number of containers and container categories. Each
container has a width, length, and belongs to a specific category. The minimum allowed separation between containers of
different categories is also defined.

Each container has a leftmost and rightmost point along the deck's width, and a bottommost and topmost point along the
deck's length. The orientation of each container can be either standard or rotated by 90 degrees.

The constraints ensure that the dimensions of each container are correctly positioned based on its orientation.
Additionally, containers must not overlap and must maintain the required separation distances between different
categories. The goal is to find a satisfactory arrangement of the containers on the deck.

[//]: # (Generated using mistral-small3.2 from D001 description.en.md and model.mzn)
