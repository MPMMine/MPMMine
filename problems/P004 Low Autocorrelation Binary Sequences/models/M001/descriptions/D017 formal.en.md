# Binary Sequence Minimization Problem

The goal is to generate a binary sequence $S_i$ of a specified length that reduces the autocorrelations among its
elements. Each element in the sequence can be either +1 or -1. Under non-periodic (or open) boundary conditions, the
k-th autocorrelation, denoted as $C_k$, is calculated as the sum of the products of elements separated by k
positions: $\sum\limits_{i=1}^{n-k} S_i * S_{i+k}$. The objective is to minimize the sum of the squares of these
autocorrelations. In other words, the aim is to minimize $E=\sum\limits_{k=1}^{n-1} C_k^2$.

[//]: # (Generated using mistral-small3.2 from D001 formal.en.md and model.mzn)
