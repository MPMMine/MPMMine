# Binary Sequence Autocorrelation Minimization Problem

The goal is to generate a binary sequence $S_i$ of a specified length that reduces the autocorrelations among its
elements. Each element in the sequence can be either +1 or -1. Under non-periodic (or open) boundary conditions, the
k-th autocorrelation, $C_k$, is calculated as the sum of the products of elements separated by $k$ positions. The
objective is to minimize the sum of the squares of these autocorrelations.

[//]: # (Generated using mistral-small3.2 from D001 formal.en.md and model.mzn; major manual amendments applied)
