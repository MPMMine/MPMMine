# Langford's Sequence Problem

The task is to place two instances of each integer from 1 to n in a sequence where the second instance of each integer
is located a specific distance from the first instance. This distance is determined by the value of the integer itself.
For instance, if n is 4, one possible arrangement is 4, 1, 3, 1, 2, 4, 3, 2. The problem can be represented using a
sequence of positions and a solution array that shows the integers in their correct places. The constraints ensure that
the second occurrence of each integer is placed correctly and that all integers are distinct in their positions.
Additionally, a symmetry-breaking constraint is applied to reduce the solution space - first number must be smaller than the last one.

[//]: # (Generated using mistral-small3.2 from D001 description.en.md and model.mzn; major manual amendments applied; with added symmetry breaking information)
