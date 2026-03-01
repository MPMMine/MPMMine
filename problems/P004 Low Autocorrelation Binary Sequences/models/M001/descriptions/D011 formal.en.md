# Low‑Autocorrelation Binary Sequence Construction

The task is to build a binary string of length **n** whose entries are chosen from the set {−1, +1}.  
For a shift **k** (1 ≤ k < n) the non‑periodic autocorrelation is

$C_k = \sum_{i=1}^{n-k} s_i s_{i+k}$,

where $s_i$ is the $i$-th element of the sequence.
The quality of a candidate sequence is measured by the sum of the squares of all these
autocorrelations

$E = \sum_{k=1}^{\,n-1} C_k^2$,

and the objective is to minimise **E**.

[//]: # (Generated using gpt-oss:latest from D001 formal.en.md and model.mzn)
