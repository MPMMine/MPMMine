# Cargo Arrangement Problem

The rectangular cargo units are arranged in a single layer and positioned parallel to the sides of rectangular deck. The
type of contents in each unit determines its category. Certain categories must be separated by minimum distances, either
horizontally or vertically.

The goal is to determine whether a given set of units can be arranged on deck without overlapping and while adhering to
the separation constraints. This problem can be viewed as packing a set of rectangles into a larger rectangle, subject
to specific constraints.

In practice, the arrangement of units may be further restricted by the sequence in which they are loaded onto the deck.
The loading process starts from the south-east corner, and each subsequent unit must be placed such that it touches
another unit or the boundary of the deck on either its north or west sides.

[//]: # (Generated using llama3.3:latest from D001 description.en.md and model.mzn; major manual amendments applied)
