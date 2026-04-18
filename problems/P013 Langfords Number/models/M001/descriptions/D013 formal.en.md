# Langford Sequence

A Langford sequence of order **k** is a permutation of the multiset $\{1,1,2,2,\dots,k,k\}$ in which each integer
appears exactly twice and the two occurrences of any integer $n$ are separated by exactly $n$ other elements.

More formally, let there be

- an integer parameter **k**,
- an array `solution[1..2*k]` whose entries are variables ranging over `1..k`.

The constraints that characterise a Langford sequence are:

1. **Multiplicity**  
   For every symbol $i \in \{1,\dots,k\}$  
   $$
   \texttt{count_eq(solution, i, 2)}
   $$
   guarantees that $i$ occurs exactly two times in `solution`.

2. **Distance condition**  
   For each $i$ there must exist a position $p$ such that  
   $$
   \texttt{solution[p] = i} \wedge \texttt{solution[p + i + 1] = i}
   $$
   where $p$ ranges over `1..2*k - (i+1)`.  
   This enforces that the two $i$’s are separated by $i$ other entries.

3. **Symmetry breaking**  
   To reduce equivalent solutions we impose  
   $$
   \texttt{solution[1] < solution[2*k]}
   $$
   which fixes the first element to be strictly smaller than the last.

The goal is simply to *satisfy* these constraints.

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
