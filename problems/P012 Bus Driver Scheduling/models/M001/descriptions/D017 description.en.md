# Staff Assignment Optimization

Staff assignment optimization can be represented as a set partitioning challenge. Each scenario involves a predefined
collection of tasks (work assignments) to be fulfilled and a substantial pool of potential shifts, where each shift
encompasses a portion of the tasks and carries an associated expense. The objective is to choose a subset of feasible
shifts that ensures each work assignment is addressed exactly once, forming a partition. Additionally, the primary goal
is to minimize the number of shifts utilized in the solution partition, with the total cost of the partition being of
secondary importance. To streamline the problem, we have standardized the cost of each shift, thereby focusing solely on
reducing the number of shifts.

[//]: # (Generated using mistral-small3.2 from D001 description.en.md and model.mzn; minor manual amendments applied)
