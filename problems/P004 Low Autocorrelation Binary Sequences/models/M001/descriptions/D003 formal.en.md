# Minimal Self-Correlation Binary Pattern Problem

The goal is to generate a sequence of binary values, denoted as $X_j$, with a specified length $\lambda$, such that the
self-correlations between elements are minimized. Each element in the sequence can take on one of two possible
values: $\alpha$ or $\beta$. For an open-boundary scenario, the $m$-th self-correlation, $R_m$, is calculated as the sum
of products of corresponding elements separated by $m$ positions, i.e., $\sum_{p=1}^{\lambda-m} X_p * X_{p+m}$.
The objective is to minimize the sum of squares of these self-correlations, denoted
as $Y=\sum_{m=1}^{\lambda-1} R_m^2$, where each $R_m$ contributes to the overall measure of self-similarity.

[//]: # (Generated using llama3.3:latest from D001 formal.en.md and model.mzn)
