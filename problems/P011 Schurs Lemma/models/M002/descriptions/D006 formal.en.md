# Packing balls into boxes

The problem is to put $n$ balls labelled ${1,...,n}$ into $k$ boxes so that for any triple of balls $(x,y,z)$
with $x+y=z$, not all are in the same box.
The problem can be formulated as an 0-1 problem using the variables, $M_{ij}$ for $i \in {1,...,n}, j \in {1,...,k}$
with $M_{ij}$ true iff ball $i$ is in box $j$. The constraints are that a ball must be in exactly one
box, $M_{i1} + M_{i2} + ... + M_{ik} = 1$ for all $i \in {1,...,n}$. And for each $x+y=z$ and $j \in {i+1,...,k-i-1}$,
not $(M_{xj} \wedge M_{yj} \wedge M_{zj}$). This converts to, $(1-M_{xj}) + (1-M_{yj}) + (1-M_{zj}) \geq 1$
or, $M_{xj} + M_{yj} + M_{zj} \leq 2$.

[//]: # (A modified description from CSPLib prob015 generalized for to k containers; fixed for the consistency with the reference model)
