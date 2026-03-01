# Container Placement Challenge

This problem involves arranging a collection of rectangular containers onto a rectangular deck surface. The containers
come in different types, each with specific separation requirements. The goal is to determine if a feasible arrangement
exists, adhering to size constraints and separation rules.

The deck itself is a rectangular area, and the containers are positioned within this area, all aligned parallel to the
deck's sides. Container dimensions (width and length) are fixed, and container types are categorized into classes.
Certain classes necessitate a minimum buffer distance when placed adjacent to one another, both horizontally and
vertically, on the deck.

The placement process follows a sequential order, starting from a designated corner. Each new container must be placed
in contact with an existing container or the deck’s edge – specifically, it must touch another container or a deck
border either to the north or west.

The objective is to verify if a valid arrangement can be achieved, considering the size of each container, the necessary
separation distances between containers of differing types, and the specified loading sequence. This is framed as a
packing challenge, analogous to fitting rectangles into a larger rectangle, with imposed restrictions.

[//]: # (Generated using gemma3:latest from D001 description.en.md and model.mzn)
