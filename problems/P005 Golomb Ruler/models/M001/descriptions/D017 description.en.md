# Golomb Ruler Problem

A Golomb ruler is characterized by a sequence of `m` integers, starting from `0` and strictly increasing, denoted as
`0 = x₁ < x₂ < ... < xₘ`. The key property of such a ruler is that all `m(m-1)/2` differences `xⱼ - xᵢ` (where
`1 ≤ i < j ≤ m`) must be unique. The ruler's length is determined by the largest integer `xₘ`. The goal is to identify
either the optimal (shortest length) or near-optimal rulers.

A symmetry can be addressed by enforcing the condition that the first difference `x₂ - x₁` is less than the last
difference `xₘ - xₘ₋₁`.

It's important to note that a Golomb ruler does not necessarily measure all distances up to its length; the sole
requirement is that each distance is measured in exactly one way. However, if a ruler does measure all distances, it is
classified as a *perfect* Golomb ruler.

[//]: # (Generated using mistral-small3.2 from D001 description.en.md and model.mzn)
