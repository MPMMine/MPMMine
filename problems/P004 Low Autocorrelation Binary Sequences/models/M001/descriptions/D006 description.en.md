# Binary Sequence Autocorrelation Minimization Problem

The goal is to construct a binary sequence of length n, where each element S_i is either +1 or -1, to minimize the
autocorrelation measures. With open boundary conditions, the k-th autocorrelation, denoted as C_k, is calculated as the
sum from i=1 to n-k of S_i * S_{i+k}. The objective is to minimize the sum of the squares of these autocorrelations,
which is given by E = ∑_{k=1}^{n-1} C_k^2.

[//]: # (Generated using deepseek-r1:latest from D001 formal.en.md and model.mzn; minor manual amendments applied)
