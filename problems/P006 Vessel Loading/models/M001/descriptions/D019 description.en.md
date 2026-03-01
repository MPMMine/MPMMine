# Container Arrangement Problem

Transport vessels carry rectangular containers between locations. The deck is a rectangular space. Containers are
three-dimensional with flat sides, and are arranged in one layer. All containers are aligned parallel to the deck's
edges. The contents of the containers define their category. Certain categories of containers must maintain minimum
separation distances either along the deck or across the deck.

The container arrangement decision problem is to determine if a given set of containers can be placed on a given deck,
without overlapping, and without violating any of the separation constraints. This problem can be modeled as fitting a
set of rectangles into a larger rectangle, with constraints.

In practice, the arrangement may be further restricted by the physical loading order. Containers are moved into position
starting from the bottom right corner. Each subsequent container in the loading sequence must be placed so that it
touches part of another container or a deck edge both to the north and to the west.

The deck has a certain width and length. There are a specific number of containers and container categories. Each
container has a width, length, and category. The minimum allowed separation between containers of different categories
is specified.

Each container has a leftmost and rightmost point along the width of the deck, and a bottommost and topmost point along
the length of the deck. The orientation of each container can be either standard or rotated 90 degrees.

The arrangement must satisfy the following conditions:

- The rightmost point of a container is equal to its leftmost point plus its effective width, and its topmost point is
  equal to its bottommost point plus its effective length.
- For any two containers, either their leftmost and rightmost points must be separated by at least the minimum allowed
  separation, or their bottommost and topmost points must be separated by at least the minimum allowed separation.

The goal is to find an arrangement that satisfies these constraints.

[//]: # (Generated using mistral-small3.2 from D001 description.en.md and model.mzn)
