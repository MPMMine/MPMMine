# Sequences with Specific Gaps

A sequence of a particular length, denoted by λ, is arranged from a list where each element from 1 to λ appears twice.
The requirement for this arrangement is that between any two occurrences of an element μ, there must be exactly μ
elements.

To fulfill this condition, the sequence must adhere to certain constraints. Firstly, every element μ in the set {1,
2, …, λ} must appear precisely twice throughout the sequence.

Furthermore, for each element μ, there needs to exist at least one position, denoted by ρ, such that both the elements
at positions ρ and ρ + μ + 1 are equal to μ.

An additional consideration is imposed to ensure uniqueness of the solution by specifying that the first element of the
sequence must be less than the last element.

The goal is to find a sequence that satisfies these conditions for a given λ, thereby creating an arrangement where each
number has its specific gap between repetitions.

[//]: # (Generated using llama3.3:latest from D001 description.en.md and model.mzn)
