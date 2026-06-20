# Minimizing Inter-Element Correlations in a Dichotomous Series

The goal is to generate a sequence $\Gamma_j$ of length $\lambda$ consisting of $\alpha$ and $\beta$ values, such that
the correlations between elements are reduced. Each element in the series can take on one of two possible
values: $\alpha$ or $\beta$. Considering aperiodic boundaries, the $k$-th inter-element correlation, denoted
as $\Phi_k$, is calculated as the sum of products of corresponding elements separated by $k$ positions,
i.e., $\sum_{j=1}^{\lambda-k} \Gamma_j * \Gamma_{j+k}$. The objective is to minimize the sum of squares of these
inter-element correlations, represented as $\Upsilon = \sum_{k=1}^{\lambda-1} \Phi_k^2$.

[//]: # (Generated using llama3.3:latest from D001 formal.en.md and model.mzn)
