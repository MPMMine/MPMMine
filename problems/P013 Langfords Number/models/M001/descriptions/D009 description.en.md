# Constructing a Langford Sequence

We are tasked with generating a specific arrangement of numbers. Consider a sequence consisting of two repetitions of
each integer from 1 to *k*, forming a sequence [1, 1, 2, 2, ..., *k*, *k*]. The goal is to create a permutation of this
sequence where, for each number *n*, there are precisely *n* other numbers situated between the two instances of *n*
within the arrangement. First element of the sequence should be smaller than the last one.

[//]: # (Generated using gemma3:latest from D001 description.en.md and model.mzn; with added symmetry breaking information)
