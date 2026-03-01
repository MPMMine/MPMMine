# Low Autocorrelation Binary Sequences Problem

The goal is to develop a binary sequence, represented as $S$, with a specified length $n$, where each component is
assigned a value of +1 or -1. Under non-periodic or open boundary conditions, the autocorrelation $A_k$ at lag $k$ is
computed as the sum from $i=1$ to $n-k$ of the product between the i-th and (i+k)-th elements in the
sequence: $\sum\limits_{i=1}^{n-k} S_i * S_{i+k}$. The aim is to minimize the sum of the squares of these
autocorrelation values, given by $\sum_{k=1}^{n-1} A_k^2$.

[//]: # (Generated using deepseek-r1:latest from D001 formal.en.md and model.mzn; major manual amendments applied)
