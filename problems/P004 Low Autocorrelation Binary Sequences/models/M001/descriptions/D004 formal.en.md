# Optimizing Binary Patterns for Reduced Self-Similarity

The goal is to generate a sequence of symbols, denoted as $X_j$, where each symbol can take one of two possible
values: $\alpha$ or $\beta$. The sequence consists of $\gamma$ elements. To assess the similarity between different
positions in the sequence, a metric called the $k^{th}$ self-correlation, $R_k$, is utilized. This metric is calculated
as the sum of the products of corresponding symbols separated by $k$ positions, considering all possible
pairs: $R_k = \sum\limits_{j=1}^{\gamma-k} X_j * X_{j+k}$. The ultimate objective is to minimize the cumulative sum of
the squared self-correlations across all possible separations, represented as $F = \sum\limits_{k=1}^{\gamma-1} R_k^2$.

[//]: # (Generated using llama3.3:latest from D001 formal.en.md and model.mzn; major manual amendments applied)
