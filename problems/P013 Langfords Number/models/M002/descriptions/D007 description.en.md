# Langford's Number Challenge

Langford's problem L(N) requires arranging two complete sets of integers from 1 to N in a sequence of length 2N. The
arrangement must satisfy the condition that for every integer i, the two occurrences of i are separated by exactly i+1
other numbers.

The goal is to create a sequence where:

1. Each integer from 1 to N appears exactly twice
2. For each integer i, the second occurrence is positioned i+1 spots after the first occurrence

A typical solution approach involves defining two arrays:

- An array P of length 2N that records the positions of each integer
- An array S of length 2N that defines the actual sequence values

The constraints are:

1. For each i from 1 to N, the position of the second occurrence of i must be exactly i+1 more than the position of the
   first occurrence
2. All positions must be distinct
3. The first element of the sequence must be less than the last element

This problem is often modeled using integer constraints and symmetry breaking to reduce the search space. The solution
must satisfy all these conditions while maintaining the required separation between identical numbers.

[//]: # (Generated using deepseek-r1:latest from D001 description.en.md and model.mzn)
