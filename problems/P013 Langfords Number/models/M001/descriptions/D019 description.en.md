# Langford's Sequence Problem

A Langford sequence of a given size is an arrangement of a multiset containing pairs of numbers from 1 to a specified
value such that for each number in the set, there are exactly that many numbers separating its two occurrences.

The computational model for this problem involves:

- A parameter representing the size of the sequence.
- A variable array representing the sequence, where each element is a number from 1 to the specified size.

The constraints are as follows:

1. Each number must appear exactly twice in the sequence.
2. For each number, there must be a position in the sequence where the number appears, followed by that many numbers,
   and then the number appears again.
3. To reduce symmetry, the first element in the sequence should be less than the last element.

The goal is to find a sequence that satisfies all these constraints.

[//]: # (Generated using mistral-small3.2 from D001 description.en.md and model.mzn; minor manual amendments applied)
