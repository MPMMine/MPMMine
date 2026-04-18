# Items and containers

The task is to assign each of a set of $N$ distinct items, labelled $1,\dots ,N$, to one of $B$ distinct containers.
Let $f\colon\{1,\dots ,N\}\to\{1,\dots ,B\}$ denote this assignment. The requirement is that for every pair of distinct
indices $i,j$ with $i+j\le N$ the three indices $i, j$ and $i+j$ must **not** all be mapped to the same container. In
other words, we must avoid a monochromatic triple $(i,j,i+j)$ satisfying the additive relation. The decision problem
asks whether such a mapping $f$ exists for given values of the symbols representing the total number of items and the
total number of containers.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
