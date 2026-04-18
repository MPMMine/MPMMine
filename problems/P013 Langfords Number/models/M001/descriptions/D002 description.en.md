# Sequencing with Uniform Gaps

A sequence of degree δ is a rearrangement of the collection {α,α,β,β,…,δ,δ} where for each element γ in the collection,
precisely γ elements are situated between its two occurrences.

The goal is to find an arrangement that fulfills two primary conditions:

1. Each element ε appears exactly twice in the sequence, ensuring a balanced distribution.
2. For every element μ, there exists a position ρ such that both the element at position ρ and the element at position
   ρ + μ + 1 are equal to μ, maintaining a uniform gap between repeated elements.

To ensure a unique solution, an additional constraint is imposed, requiring the first element of the sequence to be less
than the last element.

[//]: # (Generated using llama3.3:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
