# Three-Dimensional Noughts and Crosses

A cubic lattice of side length $n$ provides $n^3$ distinct positions arranged in an $n \times n \times n$ block.

A *line* is any collection of exactly $n$ positions that share a common direction. The full catalogue of lines consists of: three axis-parallel families (one aligned with each spatial direction), two in-plane diagonal families for every coordinate plane (yielding six such families overall), and four space diagonals that join opposite vertices of the cube. In the special case $n = 3$, this gives $49$ lines in total.

Two kinds of markers are available: white pieces (noughts) and black pieces (crosses). The supply is fixed at $n^3 - total\\_black\\_balls$ white pieces and $total\\_black\\_balls$ black pieces, where $total\\_black\\_balls$ is a given parameter.

Each position receives a single binary assignment: one value encoding a black piece, the other encoding a white piece. Every line, in turn, is assigned a binary flag that is raised precisely when all $n$ positions along that line carry markers of a single colour (all black or all white).

The requirement is to place exactly $total\\_black\\_balls$ black pieces and $n^3 - total\\_black\\_balls$ white pieces into the $n^3$ positions—no more, no less, one piece per position—so that the total number of lines whose flag is raised (i.e., uniformly coloured lines) is as small as possible.

[//]: # (Generated using qwen3.8:27b from D001 description.en.md and model.mzn; minor manual adjustments applied)
