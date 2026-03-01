# Binary Sequence Autocorrelation Minimization Problem

The purpose is to develop a binary sequence of length $n$, with each element $S_i$ being either +1 or -1, such that the
autocorrelations are minimized. Autocorrelation at lag $k$ is defined as the sum of the products of elements spaced $k$
positions apart, for $k$ from 1 to $n-1$, under non-periodic boundary
conditions: $C_k = \sum\limits_{i=1}^{n-k} S_i * S_{i+k}$. The objective is to minimize the sum of the squares of these
autocorrelations, given by $E = \sum_{k=1}^{n-1} C_k^2$.

[//]: # (Generated using deepseek-r1:latest from D001 formal.en.md and model.mzn; major manual amendments applied)
