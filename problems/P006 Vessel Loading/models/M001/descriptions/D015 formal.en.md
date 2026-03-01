# Container Placement Puzzle

Supply vessels move loads across multiple terminals. The terminal floor is rectangular, containers are stacked in a
single layer and each box aligns its faces with the ambient axes. Every container carries a material designation that
belongs to a particular class. Certain classes must be kept apart by at least a given gap measured either along the
horizontal axis or across the vertical axis.

The packing decision asks whether an input collection of boxes can be arranged inside the terminal without interior
overlap and while respecting all required gaps. This translates into fitting rectangles into a larger rectangle subject
to extra spatial rules.

In practice, placement proceeds in a fixed order: each new box is driven from the southeast corner and must share at
least one point on its northern side or western side with an already‑placed box or with a boundary wall.

---

## Formal statement

- **Deck dimensions** – $D\_W$ for width, $D\_L$ for length of the terminal floor.
- **Counts** – $N_{\text{con}}$ = total number of boxes, $N_{\text{cls}}$ = number of distinct classes.

- **Box‑specific data** (arrays indexed by $i\in\{1,\dots,N_{\text{con}}\}$)
    - $[W_i]$ – intrinsic width of box *i* when not rotated.
    - $[L_i]$ – intrinsic length of box *i* when not rotated.
    - $[c_i]$ – class label of box *i*.

- **Pairwise separation matrix** – $Sep_{a,b}$ gives the minimum gap required between any two boxes whose classes are
  *a* and *b*.

- **Domain of items** – $\mathcal{I}= \{1,\dots,N_{\text{con}}\}$.

- **Decision variables** (each indexed by $i\in\mathcal{I}$)
    - $L_i$, $R_i$ ∈ $[0, D\_W]$ representing the left and right edges of box *i*.
    - $B_i$, $T_i$ ∈ $[0, D\_L]$ representing the bottom and top edges of box *i*.
    - $o_i\in\{1,2\}$ indicating orientation – “2” means rotated ninety degrees.

- **Geometric occupancy rule** for every bag *j*∈𝓘:

  The footprint of bag *j* equals the base dimensions if $o_j=1$, otherwise they are swapped; formally
  $$R_j = L_j + \bigl(W_{j}, L_{j}\bigr)[ o_j],\qquad
  T_j = B_j + \bigl(L_{j}, W_{j}\bigr)[ o_j].$$

- **Non‑overlap and separation rule** for each ordered pair $(i,k)$ with $i < k$:

  Either the boxes are side‑by‑side horizontally or stacked vertically, respecting the class‑specific minimum gap:
  $L_i \ge R_k + Sep_{c_i,c_k} \lor$

  $R_i + Sep_{c_i,c_k} \le L_k \lor$

  $B_i \ge T_k + Sep_{c_i,c_k} \lor$

  $T_i + Sep_{c_i,c_k} \le B_k$.

The solver seeks values for $L_i$, $R_i$, $B_i$, $T_i$, and $o_i$ that satisfy all occupancy and separation constraints,
thereby answering whether the described arrangement is feasible.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; major manual amendments applied)
