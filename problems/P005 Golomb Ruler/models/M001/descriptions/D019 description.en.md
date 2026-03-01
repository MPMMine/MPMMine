# Optimal Golomb Ruler Construction Problem

A Golomb ruler is characterized by a sequence of `m` distinct integers starting from zero, denoted as
`0 = x₁ < x₂ < ... < xₘ`, where all `m(m-1)/2` pairwise differences `xⱼ - xᵢ` (for `1 ≤ i < j ≤ m`) are unique. The
ruler's length is determined by the largest integer `xₘ`. The goal is to identify either the optimal (shortest length)
or near-optimal rulers. A common symmetry can be addressed by ensuring that the first difference is smaller than the
last, i.e., `x₂ - x₁ < xₘ - xₘ₋₁`.

While a Golomb ruler does not necessarily measure all distances up to its length, it must ensure that each distance is
measured in only one way. If a ruler does measure all distances, it is classified as a *perfect* Golomb ruler.

[//]: # (Generated using mistral-small3.2 from D001 description.en.md and model.mzn)
