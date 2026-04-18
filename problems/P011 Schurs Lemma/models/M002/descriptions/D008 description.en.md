# Balls and boxes

Distribute $N$ balls labeled $1,\dots ,N$ into $K$ distinct boxes.  
The placement is represented by variables $box_i\in\{1,\dots ,K\}$ for each ball $i$.  
The assignment must satisfy the following restriction: for every pair of indices $i < j$ with $i+j\le N$, the three
balls $i, j, i+j$ are not all placed in the same box-i.e. at least one of $box_i, box_j, box_{i+j}$ differs from the
others.

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
