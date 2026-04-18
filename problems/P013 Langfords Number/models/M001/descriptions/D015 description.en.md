# Langford arrangement

For a given order $K$, a Langford arrangement is a linear ordering of a multiset that contains exactly two copies of
each identifier from $1$ up to $K$, forming a sequence whose length is double the order. The arrangement must place each
identifier $i$ so that the two copies are separated by a gap equal to the identifier's own value, and the initial
element must be strictly smaller than the terminal element. Formally, if $S$ denotes the sequence variable and $p$
denotes a candidate position, there must exist a $p$ such that $S[p]=i$ and the element located after a gap of size
equal to $i$ is also $i$, while also requiring that the count of each identifier $i$ in $S$ equals two and that the
initial element is less than the terminal element. The solver is asked to produce any sequence $S$ of length $2K$ the
order that fulfills these conditions.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; major manual amendments applied)
