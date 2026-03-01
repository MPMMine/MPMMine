# Golomb Ruler

A *Golomb ruler* refers to a strictly increasing sequence of {m} non‑negative integers beginning with
0: $p_1 = 0 < p_2 < … < p_{m}$. From this collection arise $\binom{m}{2}$ pairwise gaps $|p_j-p_i|$ (for every $i<j$),
and all those gaps have to be different. The number of marks is {m} and the **size** of the ruler equals the greatest
coordinate, i.e., $p_m$.

The task is to discover a *minimal‑length* arrangement-an optimal ruler-or any arrangement that is close to this
optimum. When a ruler manages to cover every integer distance up to its size it becomes a *perfect* Golomb ruler;
otherwise it simply obeys the distinct‑gap condition.

Symmetry can be removed by adding an ordering rule such as $p_2-p_1 < p_m-p_{m-1}$. Formally, let **{diff_set}** denote
the array of all derived differences. This collection must satisfy an *all‑different* constraint: no two entries may
coincide. Additional constraints fix the first mark at zero ($p_1=0$) and enforce strict increase $p_i < p_{i+1}$ for
each intermediate index.

The objective minimizes the final coordinate, i.e., $\min\,p_m$, thereby shrinking the largest position while keeping
every gap unique.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
