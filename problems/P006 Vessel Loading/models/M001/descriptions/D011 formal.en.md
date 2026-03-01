# Vessel Loading Problem

A supply vessel carries freight containers between ports.
The deck is a flat rectangle and every container is a rectangular cuboid that is laid out in a single layer.
All containers are aligned with the deck edges, so their sides are parallel to the deck axes.
The content of each container determines its *class*.
Certain classes must be kept at prescribed minimum separations from one another, either along the deck’s length or
width.

The core decision question is: can a given set of containers be arranged on a particular deck without overlapping and
while respecting all separation rules?
Mathematically, this becomes a rectangle‑packing problem inside a larger rectangle, subject to additional constraints.

In real loading, the procedure is sequential.
Containers are driven onto the deck from the southeast corner.
Each container that follows must be positioned so that it touches an existing container or a deck boundary on both its
northern and western sides, reflecting the practical manoeuvring constraints.

---

## Symbolic representation

Let

* **W**: width of the deck
* **L**: length of the deck
* **N**: number of containers
* **C**: number of container classes

For every container *c* ∈ {1,…,N}

* **w_c**: width of container *c*
* **l_c**: length of container *c*
* **cls_c**: class of container *c*

For each pair of classes *(a,b)* ∈ {1,…,C}²

* **sep_{a,b}**: minimum required separation between containers of classes *a* and *b*

Define the set **Cont** = {1,…,N}.

For each container *c* ∈ **Cont**

* **L_c**: leftmost x‑coordinate of *c* (0 ≤ L_c ≤ W)
* **R_c**: rightmost x‑coordinate of *c* (0 ≤ R_c ≤ W)
* **B_c**: bottom y‑coordinate of *c* (0 ≤ B_c ≤ L)
* **T_c**: top y‑coordinate of *c* (0 ≤ T_c ≤ L)
* **O_c**: orientation of *c* (1 or 2, where 2 indicates a 90° rotation)

### Orientation and Geometry

For every container *c*

```
  R_c = L_c + [w_c, l_c][O_c]
  T_c = B_c + [l_c, w_c][O_c]
```

Thus the bounding rectangle of *c* is determined by its orientation and the deck dimensions.

### Separation Constraints

For all pairs *(c,k)* with *c* < *k* in **Cont**

```
  L_c                      ≥ R_k + sep_{cls_c, cls_k} or
  R_c + sep_{cls_c, cls_k} ≤ L_k                      or
  B_c                      ≥ T_k + sep_{cls_c, cls_k} or
  T_c + sep_{cls_c, cls_k} ≤ B_k
```

Each pair of containers must be placed at least `sep_{cls_c, cls_k}` units apart in at least one axis, preventing
overlap and satisfying class‑specific safety distances.

### Loading Sequence (Optional)

If the loading sequence is enforced, each pair *(c, k)* such that *c* < *k* must satisfy

```
R_c ≥ R_k   and
B_c ≤ B_k
```

ensuring that container *c* lies south, southeast, or east of container *k*.

---

### Objective

Find any placement of all containers that satisfies all the constraints above.

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; major manual amendments applied)
