# Driver Shift Assignment

Driver shift assignment can be represented as a set partitioning challenge. Each scenario involves a predefined
collection of tasks (work assignments) to be completed and a substantial collection of potential shifts, where each
shift encompasses a subset of the tasks and has an associated expense. We need to choose a subset of possible shifts
that covers each work assignment exactly once: this is referred to as a partition. Additionally, the primary objective
is to minimize the number of shifts used in the solution partition, while the total cost of the partition is of
secondary importance. To streamline the problem, we have standardized the cost of each shift. Consequently, the goal is
to minimize the number of shifts.

[//]: # (Generated using mistral-small3.2 from D001 description.en.md and model.mzn; minor manual amendments applied)
