# Low Autocorrelation Binary Sequences Problem

The objective is to construct a binary sequence $S_i$ of length n that minimizes the autocorrelations between bits. Each
bit in the sequence takes the value +1 or -1. With periodic (or cyclic) boundary conditions, the k-th
autocorrelation, $C_k$ is defined to be $\sum\_{i=0}^{n-1} s\_i * s\_{i+k mod n}$. The aim is to minimize the sum of
the squares of these autocorrelations. That is, to minimize $E=\sum\_{k=1}^{n-1} C\_k^2$.

[//]: # (The original description from CSPLib prob005; non-periodic variant removed)
