# Shift Allocation Problem

This scheduling challenge involves determining the optimal assignment of shifts to tasks. The problem is framed as a set
partitioning issue, where we need to find a solution that ensures each task is covered by exactly one shift. The goal is
to minimize the total number of shifts utilized in the solution, while the total cost associated with those shifts is
considered secondary. To simplify the scenario, we assume that all shifts have equal costs. Therefore, the primary
objective is to reduce the number of shifts used.

The problem is defined by a set of tasks (pieces of work) and a collection of possible shifts, each of which covers a
specific subset of these tasks. A valid solution requires selecting a set of shifts such that each task is assigned to
exactly one shift. The aim is to discover the fewest shifts needed to accomplish this coverage.

[//]: # (Generated using gemma3:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
