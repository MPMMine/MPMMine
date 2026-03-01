# Cargo Arrangement Problem

Rectangular cargo objects are arranged in a single layer and are positioned parallel to the edges of loading area. The
classification of cargo is determined by their contents. Certain classes of cargo must be separated by minimum
distances, either horizontally or vertically.

The goal is to determine whether a given set of cargo can be arranged on a given loading area without overlapping and
without violating the separation constraints. This problem can be viewed as packing a set of rectangles into a larger
rectangle, subject to constraints.

In practice, the arrangement may be further restricted by the physical loading sequence. The objects are maneuvered into
position from the south-east corner of loading area. Each successive object in the loading sequence must be positioned
such that it touches another object or the edge of loading area.

The objective is to find a feasible arrangement that satisfies all constraints.

[//]: # (Generated using llama3.3:latest from D001 description.en.md and model.mzn; major manual amendments applied)
