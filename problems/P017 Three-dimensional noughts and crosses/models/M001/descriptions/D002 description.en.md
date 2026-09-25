# Three-Dimensional Tic-Tac-Toe Placement

A cubic lattice of side length $n$ yields $n^3$ individual positions arranged in an $n \times n \times n$ three-dimensional array.

A *row* is any collection of exactly $n$ cells that lie on a single straight line. Rows arise in three categories: axis-aligned lines parallel to any of the three coordinate directions; planar diagonals running across each face-parallel slice of the cube (two per slice per pair of axes); and the four space diagonals that connect opposite vertices of the entire cube. The aggregate count of rows is $3n^2 + 6n + 4$.

You are supplied with $n^3 - total\\_black\\_balls$ light-colored markers (noughts) and $total\\_black\\_balls$ dark-colored markers (crosses), where $total\\_black\\_balls$ is a prescribed constant. Place exactly one marker in every cell so that the number of rows in which all $n$ entries share the same color is minimised.


[//]: # (Generated using qwen3.8:27b from D001 description.en.md and model.mzn; minor manual adjustments applied)
