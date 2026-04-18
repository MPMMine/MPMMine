# Bus driver scheduling

Bus driver scheduling can be formulated as a set partitioning problem. Each instance consist of a given set of tasks (
pieces of work) to cover and a large set of possible shifts, where each shift covers a subset of the tasks and has an
associated cost. We must select a subset of possible shifts that covers each piece of work once and only once: this is
called a partition. Further the main aim is to reduce the number of shifts used in the solution partition and the total
cost of the partition is secondary. To simplify the problem we have made the cost of each shift the same. This means
that the goal is to minimise the number of shifts.

[//]: # (The original description from CSPLib prob022 stripped out of concrete instances)
