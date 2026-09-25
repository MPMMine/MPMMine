# 3D Noughts and Crosses (Tic‑Tac‑Toe)

A cube of size n holds n³ cells in an n × n × n grid. Any n cells on a horizontal, vertical or diagonal path form a line; diagonals run across each face and join opposite corners. For n = 3 there are 49 lines.

We must place total_black_balls black pieces and the remaining white pieces, one per cell, to minimise lines whose n cells are all one color.

Model int parameters: n, total_black_balls, total_blocks = n³, total_lines, 

Model binary variables: balls[i] (black=1, white=0) and lines[l] (monochrome=1), 

Constraints tie a line’s color sum to its monochrome flag, setting it to 1 only when all cells share same color. Total number of black pieces equals Σ balls[i] = total_black_balls. Objective minimizes Σ lines[l].

Therefore seeks a placement of the given balls that yields the fewest uniform‑color lines.

[//]: # (Generated using nemotron3:33b from D001 description.en.md and model.mzn; major manual adjustments applied)
