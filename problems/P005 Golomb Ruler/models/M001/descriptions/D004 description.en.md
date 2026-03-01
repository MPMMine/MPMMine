# Optimal Sequence Problem

A special sequence of $\mu$ integers $0 = b_1 < b_2 < ... < b_\mu$ is defined such that the $\mu(\mu-1)/2$
gaps $b_j - b_i, 1 \leq i < j \leq \mu$ are unique. This sequence has $\mu$ elements and a maximum value of $b_\mu$. The
goal is to find the sequence with maximum as small as possible. To avoid redundancy, an additional constraint can be
applied: $b_2 - b_1 < b_\mu - b_{\mu-1}$, ensuring the first gap is smaller than the last.

There's no need for this sequence to cover all intervals up to its maximum value - the only condition is that each
interval is measured uniquely. If a sequence does measure all intervals, it's classified as a *perfect* sequence.

Note: The problem focuses on finding sequences with distinct gaps between elements, without requiring them to span all
possible intervals up to their maximum value.

[//]: # (Generated using llama3.3:latest from D001 description.en.md and model.mzn; major manual amendments applied)
