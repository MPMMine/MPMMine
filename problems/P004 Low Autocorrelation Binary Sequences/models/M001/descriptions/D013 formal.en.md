# Low‑Autocorrelation Binary Sequence Construction

The task is to build a binary vector $S$ of length $n$ whose elements belong to the set $\{-1,\,1\}$.  
For every shift $k$ with $k \in \{1,\dots,n-1\}$ the non‑periodic (open) autocorrelation is defined as

$C_k = \sum_{i \in \{1,\dots,n-k\}} S[i] \times S[i+k]$.

The quality of a candidate sequence is measured by

$\texttt{result} = \sum_{k \in \{1,\dots,n-1\}} C_k^2$,

and the goal is to **minimize** $\texttt{result}$.

[//]: # (Generated using gpt-oss:latest from D001 formal.en.md and model.mzn; major manual amendments applied)
