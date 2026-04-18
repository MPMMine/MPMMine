# Bus Driver Task Partitioning

Bus driver scheduling can be addressed as a set partitioning challenge. Each instance presents a specified set of
tasks (pieces of work) to be covered and a comprehensive set of potential shifts, where each shift covers a specific
subset of the tasks. The objective is to select a subset of these shifts such that every task is covered exactly once,
forming a partition. The primary aim is to minimize the number of shifts used in this partition, while the associated
cost is secondary. To simplify the problem, the cost of each shift is set to be uniform, meaning the focus is solely on
minimizing the count of shifts.

[//]: # (Generated using deepseek-r1:latest from D001 description.en.md and model.mzn)
