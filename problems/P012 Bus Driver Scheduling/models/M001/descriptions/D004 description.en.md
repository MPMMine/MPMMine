# Scheduling Bus Drivers

The task of scheduling bus drivers can be viewed as a problem of dividing a set of jobs into distinct groups, where each
group represents a possible work schedule. We are given a collection of tasks that need to be completed and a large pool
of potential schedules, with each schedule covering a subset of the tasks. The objective is to select a subset of these
schedules such that each task is covered exactly once. This selection is referred to as a partition. Our primary goal is
to minimize the number of schedules used in this partition, while also considering the overall cost of the selected
schedules. To simplify the problem, we assume that the cost associated with each schedule is uniform, making our primary
objective the minimization of the number of schedules.

Given a set of $\gamma$ tasks and a set of $\delta$ potential schedules, where each schedule covers a subset of
the $\gamma$ tasks, we aim to find the smallest subset of $\delta$ that covers all tasks without overlap. The problem is
derived from real-world scenarios involving bus companies with varying regulations and features, such as urban and rural
bus schedules, which can have significantly different characteristics. The solution involves determining the optimal
combination of schedules that achieves full coverage of all tasks while minimizing the number of schedules used.

[//]: # (Generated using llama3.3:latest from D001 description.en.md and model.mzn)
