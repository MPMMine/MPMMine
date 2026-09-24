# 3‑D Noughts and Crosses (Tic‑Tac‑Toe)

A cubic board of size n × n × n contains n³ cells. A line is any set of n cells that share a row, column, pillar, face diagonal, or a space diagonal of the cube. The total number of lines is L = 3n² + 6n + 4.

We must place exactly B black pieces and W white pieces (B + W = n³), one per cell, to minimise the number of completely monochrome lines.

**Variables**  
- `cell[c]` (c ∈ [1..n³]) binary, 1 if the cell holds a black piece, 0 otherwise.  
- `line[l]` (l ∈ [1..L]) binary, 1 if line l is uniform, 0 otherwise.

**Constraints**  
- For each line l: `sum(cell[c] on l) – line[l] ≤ n‑1` and `sum(cell[c] on l) + line[l] ≥ 1`, ensuring `line[l]` correctly indicates a uniform color.  
- `∑_{c=1}^{n³} cell[c] = B`.

**Objective**  
- Minimise `∑_{l=1}^{L} line[l]`.

The model arranges the given numbers of black and white pieces to obtain the fewest wholly uniform lines.

[//]: # (Generated using nemotron3:33b from D001 description.en.md and model.mzn)
