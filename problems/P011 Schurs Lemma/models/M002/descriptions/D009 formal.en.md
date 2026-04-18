# Problem statement

We are given two positive integers, denoted by symbols

- **$N$** – the total number of balls, each ball being labelled with a distinct integer from $1$ to $N$;
- **$K$** – the total number of available boxes.

The task is to assign each ball to one of the $K$ boxes so that no box contains a *Schur triple*.  
A Schur triple is a set of three distinct ball labels $(x, y, z)$ satisfying the equation

$$
x + y = z .
$$

Hence, for every pair of distinct indices $i$ and $j$ with $i < j$ and $i+j \le N$, the balls
$i$, $j$, and $i+j$ must **not** all be placed in the same box.  
Equivalently, for each such triple at least two of the three balls must lie in different boxes.

## Decision variables

Let

$$
b_i \in \{1,\dots,K\} \text{for } i = 1,\dots,N
$$

denote the box assigned to ball $i$.  
The collection $(b_1,\dots,b_N)$ constitutes a feasible placement if it satisfies the triple-avoidance condition
described above.

**Objective**

There is no optimisation objective; we only require a *feasible* assignment.

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
