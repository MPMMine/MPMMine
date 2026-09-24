# 3D Noughts and Crosses (Tic‑Tac‑Toe)

A cube of edge length $n$ contains $n^{3}$ cells laid out in an $n \times n \times n$ array.  
A *line* is any set of $n$ cells that lie on the same row, column, pillar, or any diagonal that runs across a face or through the whole cube; diagonals exist in each orthogonal plane and also connect opposite corners of the cube. For $n = 3$ there are 49 such lines in total.

We must place $B$ black balls (crosses) and $W = n^{3}-B$ white balls (noughts), one per cell, so that the number of lines that are completely filled with balls of a single color is as small as possible.

**Symbols**  
- $n$ – edge length of the cube.  
- $B$ – total number of black balls.  
- $total\_blocks = n^{3}$ – total cells.  
- $total\_lines = 3n^{2}+6n+4$ – total lines in the cube.  
- $balls[i] \in \{0,1\}$ for each cell $i$ ($1$ = black, $0$ = white).  
- $lines[l] \in \{0,1\}$ for each line $l$ ($1$ = monochrome, $0$ = mixed).

**Constraints**  
- For every line $l$ and its $n$ cells $c_{l,j}$:
$\sum\_{j=1}^{n} balls[c\_{l,j}] - lines[l] \le n-1$
$\sum\_{j=1}^{n} balls[c\_{l,j}] + lines[l] \ge 1$

  which forces $lines[l]=1$ exactly when all $n$ cells of the line share the same color.  
- The total number of black balls must equal $B$:  
$\sum\_{i=1}^{total\\_blocks} balls[i] = B$


**Objective**  
Minimise the total count of monochrome lines:  
$\text{minimise}\\;\\; \sum\_{l=1}^{total\\_lines} lines[l]$


[//]: # (Generated using nemotron3:33b from D001 description.en.md and model.mzn; major manual adjustments applied)
