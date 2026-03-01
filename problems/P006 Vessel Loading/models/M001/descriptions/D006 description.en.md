# Vessel Loading Problem

Cargo ships carry containers between various points. The deck has a rectangular shape with dimensions W (width) and L (
length). Each container is a three-dimensional rectangular box with two dimensions, and it can be placed in two
orientations, swapping its width and length. Containers are categorized into C classes, and specific pairs of classes
have minimum separation requirements in either the horizontal or vertical direction.

The central question is whether it is possible to arrange all N containers on the deck without overlapping and without
breaching these separation constraints. This can be viewed as fitting a set of smaller rectangles into a larger
rectangle.

In real-world loading scenarios, there are additional constraints from the sequence of placement. Containers are loaded
starting from the southeast end, and each subsequent container must be positioned to touch an existing container or the
deck edge in the northern and western directions.

[//]: # (Generated using deepseek-r1:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
