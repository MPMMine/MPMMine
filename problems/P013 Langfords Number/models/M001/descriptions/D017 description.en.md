# Langford's Sequence Problem

A Langford sequence of a given size is an arrangement of a multiset containing pairs of integers from 1 to a specified
value, where for each integer in the multiset, there are exactly that many numbers separating its two occurrences.

The computational model for this problem involves:

- A specified size parameter.
- An array representing the sequence, with each element being a variable that can take integer values from 1 to the
  specified size.

The constraints are as follows:

1. Each integer from 1 to the specified size must appear exactly twice in the sequence.
2. For each integer, there must be a position in the sequence such that the integer appears at that position and again
   at a position that is the integer's value plus one positions ahead.
3. To reduce symmetry, the first element in the sequence must be less than the last element.

The goal is to find a sequence that satisfies all these constraints.

[//]: # (Generated using mistral-small3.2 from D001 description.en.md and model.mzn; minor manual amendments applied)
