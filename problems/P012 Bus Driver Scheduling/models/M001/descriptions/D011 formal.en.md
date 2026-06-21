# Bus Driver Scheduling Re‑framed

Bus driver scheduling can be expressed as a **set partitioning** problem.
A problem instance is defined by a finite set of work items $W$ that must all be performed, and a much larger collection
of candidate shifts $S$. Every shift $s \in S$ covers a particular subset of $W$ and, in this simplified setting, has
the same unit cost.

The task is to select a subset $S'\subseteq S$ such that each work item in $W$ is covered **exactly once**. This
selection is called a *partition*. Because all shifts cost the same, the primary optimisation goal is to minimise the
cardinality $|S'|$; total cost is merely a secondary measure.

The decision variables are binary: 

$$
x_s = \begin{cases}
1 & \text{if shift } s \text{ is chosen},\\
0 & \text{otherwise},
\end{cases}\qquad s \in S.
$$

Let $\text{tot}\_\text{shifts}$ be the total number of shifts chosen.
The constraints are:

1. $\text{tot}\_\text{shifts} = \sum\_{s\in S} x\_s$ (definition of the total).
2. For every work item $w\in W$,
 
$$
\sum\_{\substack{s\in S: w\in s}} x\_s = 1,
$$

ensuring that $w$ is covered exactly once.
4. $\text{tot}\_\text{shifts} \ge m$, where $m$ is the pre‑specified minimum number of shifts required.

The objective is simply  

$$
\min \text{tot}\_\text{shifts}.
$$

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn)
