# Optimal Sequence Problem

A special sequence of $\mu$ integers $0 = b_1 < b_2 < ... < b_\mu$ can be defined such that the $\mu(\mu-1)/2$
gaps $b_j - b_i, 1 <= i < j <= \mu$ are all unique. This sequence is said to have $\mu$ elements and a maximum value
of $b_\mu$. The goal is to find the sequence with the smallest $b_\mu$. Note that a redundant solution can be avoided by
adding a constraint that $b_2 - b_1 < b_\mu - b_{\mu-1}$, where the smallest gap is less than the largest gap.

There is no need for this sequence to cover all values up to its maximum - the only requirement is that each value is
only represented once. However, if a sequence does cover all values, it is classified as a *perfect* sequence.

The sequence should have distinct differences between elements, and the first element should be fixed at 0.
Additionally, the elements should be ordered, and the smallest difference should be less than the largest difference to
ensure a unique solution. The objective is to minimize the maximum value of the sequence.

[//]: # (Generated using llama3.3:latest from D001 description.en.md and model.mzn; major manual amendments applied)
