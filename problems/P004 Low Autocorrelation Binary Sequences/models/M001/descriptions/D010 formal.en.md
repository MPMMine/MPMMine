# Low Autocorrelation Binary Sequence

We seek to generate a sequence of binary values, denoted as $X_j$, with a length of $N$. The goal is to reduce the
statistical relationships between adjacent values in the sequence. Each value in the sequence can be either $+1$
or $-1$. The correlation between any subsequences $l$ indices apart, denoted as $R_l$, is computed as the sum of the
products of corresponding values, from position $j$ to $j+l$, within the sequence. Specifically, $R_l$ is calculated
as $\sum_{j=1}^{N-l} X_j * X_{j+l}$. The objective is to minimize the total squared value of these correlations.
This is achieved by minimizing the expression $T = \sum_{l=1}^{N-1} R_l^2$.

[//]: # (Generated using gemma3:latest from D001 formal.en.md and model.mzn; major manual amendments applied)
