# Optimal Sequence Problem

A sequence of $\mu$ integers $0 = b_1 < b_2 < ... < b_\mu$ is defined such that the $\frac{\mu(\mu-1)}{2}$
discrepancies $b_j - b_i, 1 \leq i < j \leq \mu$ are unique. This sequence has $\mu$ elements and a maximum value
of $b_\mu$. The goal is to find the shortest or near-shortest ruler that satisfies these conditions. A constraint can be
added to remove symmetry: the first discrepancy $b_2 - b_1$ should be less than the last
discrepancy $b_\mu - b_{\mu-1}$.

There is no requirement for this sequence to represent all values up to its maximum - the only condition is that each
value is represented uniquely. However, if a sequence does represent all values, it is considered *perfect*. The task is
to determine the shortest possible ruler while ensuring that all discrepancies are distinct and that the sequence meets
the specified conditions.

[//]: # (Generated using llama3.3:latest from D001 description.en.md and model.mzn; major manual amendments applied)
