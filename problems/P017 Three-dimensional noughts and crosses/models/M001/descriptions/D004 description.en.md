# Three-Dimensional Tic-Tac-Toe

A solid cube of $n \times n \times n$ positions (giving $n^3$ spots in total) constitutes the board.

$total\\_black\\_balls$ positions are said to form a **line** when they are aligned along the same row in any of the three principal directions (parallel to an axis), along a diagonal of any face (parallel plane), or along a body diagonal joining two opposite corners of the cube. Taken together, these lines comprise three families of $n^2$ axis-parallel rows, six families of $n$ face-diagonal rows, and four space-diagonal rows, yielding $3n^2 + 6n + 4$ lines in all.

You are supplied with $n^3 - total\\_black\\_balls$ markers of one kind (empty tokens) and $total\\_black\\_balls$ markers of the other kind (filled tokens). Place exactly one marker into every position of the cube so that the count of lines in which every position carries a marker of a single type is minimised.

[//]: # (Generated using qwen3.8:27b from D001 description.en.md and model.mzn; minor manual adjustments applied)
