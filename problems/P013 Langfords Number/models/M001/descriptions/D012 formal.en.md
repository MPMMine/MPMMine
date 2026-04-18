# Langford’s number

The goal is to find a sequence S of length 2k that contains each integer i ∈ {1,…,k} exactly twice.
The sequence must satisfy the Langford condition: for every i, the two occurrences of i are separated by exactly i other
elements, i.e. there exists an index p such that S[p] = i and S[p + i + 1] = i.

In the formal model a variable k is declared, together with an array S[1..2k] whose entries are variables that can take
any value from 1 to k.
The constraints are:

1. **Multiplicity**: for each i ∈ {1,…,k} the value i appears exactly twice in S.
2. **Distance**: for each i there must be a position p with S[p] = i and S[p + i + 1] = i.
3. **Symmetry breaking**: the first element of S is required to be smaller than the last element (S[1] < S[2k]) to
   eliminate symmetric duplicates.

Find any assignment to the array that satisfies all of these constraints.

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
