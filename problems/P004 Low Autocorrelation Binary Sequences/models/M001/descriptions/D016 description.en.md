# Low Autocorrelation Binary Sequences

Create an ordered list of symbols X[i] each drawn from {+1,−1}; assume non‑circular indexing. Let L denote its length
and α any offset that keeps paired indices valid (i.e., both i and i+α lie inside the range). Build an intermediate
amount by multiplying elements along this offset; aggregate these products across all permissible i, square each result,
sum them together, and minimise this total.

[//]: # (Generated using nemotron-3-nano:latest from D001 formal.en.md and model.mzn)
