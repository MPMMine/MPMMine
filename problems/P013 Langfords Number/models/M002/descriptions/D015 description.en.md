# Langford's arrangement problem

The task is to place two copies of each identifier drawn from a collection of size K into a linear sequence of length
LENGTH, where LENGTH denotes the total number of slots. For every identifier i, the two occurrences must be separated by
exactly i other slots; in other words, if the first i appears at slot p, the second must be at slot p+i+1.

The model introduces two families of variables:

- a set of positional variables that occupy each slot of the sequence,
- a corresponding set of value variables that hold the identifiers placed at those slots.

Constraints bind each identifier to two distinct positions that satisfy the required distance, enforce that all
positions are different, and break symmetry by requiring the identifier at the first slot to be smaller than the
identifier at the final slot.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
