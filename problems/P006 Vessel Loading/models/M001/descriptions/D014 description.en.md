# Container Placement Challenge

The task concerns arranging several rectangular units on a rectangular deck while observing separation rules and loading
order.

- Deck dimensions are represented by **D_W** (horizontal span) and **D_L** (vertical extent).
- There are **N_C** distinct blocks, each belonging to one of **C_N** categories.
- For every ordered pair of categories *(a,b)*, an exclusion distance **SEP[a,b]** must be respected.

Each block *i* defines four boundary symbols: left `X_i`, right `XR_i`, bottom `YB_i` and top `YT_i`. The size may be
used as `(W_i, L_i)` or swapped for rotation.

No two blocks may overlap. If a block of class *c_i* meets a block of class *c_j*, at least one of the following must
hold:

- `XR_i + SEP[c_i,c_j] ≤ X_j`  or
- `XR_j + SEP[c_j,c_i] ≤ X_i`, and an analogous condition for the vertical coordinates.

Furthermore, every new block after the first must be placed so that it touches an already positioned block on both its
northern side and western side.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; major manual amendments applied)
