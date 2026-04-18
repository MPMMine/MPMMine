# Langford Arrangement

**Goal**  
Given a positive integer k, construct a permutation of the multiset  
$\{1,1,2,2,\dots ,k,k\}$ such that for every integer i (1 ≤ i ≤ k) the two copies of i are separated by exactly i other
elements.  
In other words, if the first occurrence of i is at position p, the second must be at position p + i + 1.

**Model sketch**

- Let $A[1..2k]$ be a vector of decision variables, each ranging over the domain $\{1,\dots ,k\}$.
- **Multiplicity constraint**: for every $i \in \{1,\dots ,k\}$ the value i appears exactly twice in $A$.
- **Distance constraint**: for every $i \in \{1,\dots ,k\}$ there exists a position $p$ with  
  $1 \le p \le 2k-(i+1)$ such that $A[p] = i$ and $A[p+i+1] = i$.
- **Symmetry breaking**: to avoid symmetric solutions we impose $A[1] < A[2k]$.

**Task**  
Find any assignment to $A[1..2k]$ that satisfies all of the above conditions.

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn)
