# Langford's Sequence

A specific sequence arrangement, denoted as order λ, involves rearranging the elements of a multiset containing pairs of
identical integers from 1 to λ. The crucial requirement is that for each integer μ within this set, precisely μ elements
are situated between its two occurrences.

To fulfill this condition, each integer θ must appear exactly twice throughout the sequence. Moreover, for every integer
θ, there exists a position ρ such that the elements at positions ρ and ρ + θ + 1 in the sequence are both equal to θ,
thus satisfying the distance constraint inherent to Langford's sequence.

The arrangement must also adhere to a symmetry-breaking rule to ensure a unique solution. This is achieved by imposing
an order on the first and last elements of the sequence, ensuring that the first element is less than the last. The goal
is to find a sequence that satisfies all these conditions, thereby fulfilling the requirements of Langford's number
sequence.

[//]: # (Generated using llama3.3:latest from D001 description.en.md and model.mzn)
