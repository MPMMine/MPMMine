# Container Arrangement Problem

Transport ships carry rectangular containers between locations. The deck is a rectangular space. Containers are
three-dimensional boxes, arranged in a single level. All containers are aligned parallel to the deck's edges. The
container's contents define its category. Certain categories of containers must maintain minimum separation distances
either along the deck or across the deck.

The container arrangement decision problem is to ascertain whether a given set of containers can be placed on a given
deck, without overlapping, and without breaching any separation constraints. This problem can be represented as fitting
a collection of rectangles into a larger rectangle, with constraints applied.

In practical scenarios, the arrangement may be further restricted by the physical loading order. Containers are
maneuvered into place starting from the bottom right corner. Each subsequent container in the loading sequence must be
positioned such that it touches another container or a deck edge both to the north and to the west.

The deck has a certain width and length. A number of containers, each belonging to a specific category, need to be
placed on the deck. Each container has a specific width and length, and the minimum allowed separation between
containers of different categories is given.

The position of each container is defined by its leftmost, rightmost, bottommost, and topmost points. The orientation of
each container can be either horizontal or vertical. The constraints ensure that containers do not overlap and that the
minimum separation distances between containers of different categories are respected.

The goal is to determine if such an arrangement is possible.

[//]: # (Generated using mistral-small3.2 from D001 description.en.md and model.mzn)
