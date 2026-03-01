# Low‑Autocorrelation Binary Sequences (LACBS)

The task is to generate a binary word  
$S \in \{-1, +1\}^{n}$
that has the smallest possible autocorrelation.

For an *open* (non‑periodic) sequence the autocorrelation of lag $k$ is

$C_k = \sum_{i=1}^{n-k} S[i] \times S[i+k], k = 1,\dots, n-1$.

The quality of a sequence is measured by the sum of the squares of all
non‑trivial autocorrelations

$result = \sum_{k=1}^{n-1} C_k^{2}.$

The objective is to *minimise* $result$.  
In the MiniZinc model this is expressed by

[//]: # (Generated using gpt-oss:latest from D001 formal.en.md and model.mzn; major manual amendments applied)
