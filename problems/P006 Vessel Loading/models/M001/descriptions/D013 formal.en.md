# Vessel Loading Problem

A fleet of supply vessels moves freight containers between ports. The cargo hold is a flat, rectangular deck. Containers
are solid cuboids that are stacked only in a single layer and are always aligned with the deck’s cardinal directions.
Each container is classified according to its contents, and certain pairs of classes must stay apart by a minimum
distance measured either along the deck’s width or length.

The **vessel‑loading decision** is to decide whether all containers in a given shipment can be placed on a specific deck
without any overlaps and while respecting the class‑separation rules. This is essentially a 2‑dimensional packing
problem of many smaller rectangles into one larger rectangle, subject to distance constraints between specific pairs of
rectangles.

In real operations the loading must also obey the **sequential manoeuvring rule**: containers are introduced from the
south‑east corner of the deck, and every container placed after the first must touch another container or a deck wall on
both its northern and western sides.

---

## Formalisation

Let

* `W` be the deck width, `L` the deck length.
* `N` the number of containers, `C` the number of container classes.

For each container `c ∈ 1..N` define

| Symbol    | Meaning                                            |
|-----------|----------------------------------------------------|
| `w[c]`    | width of container `c` (when not rotated)          |
| `ℓ[c]`    | length of container `c` (when not rotated)         |
| `cls[c]`  | class index of container `c`                       |
| `posL[c]` | x‑coordinate of the left edge                      |
| `posR[c]` | x‑coordinate of the right edge                     |
| `posB[c]` | y‑coordinate of the bottom edge                    |
| `posT[c]` | y‑coordinate of the top edge                       |
| `ori[c]`  | orientation flag (`1` = normal, `2` = rotated 90°) |

For each pair of classes `a, b ∈ 1..C` the matrix

* `sep[a,b]` – minimum allowed separation distance between any two containers of classes `a` and `b`.

### Placement constraints

For every container `c`

```
posR[c] = posL[c] + (ori[c] == 1 ? w[c] : ℓ[c])
posT[c] = posB[c] + (ori[c] == 1 ? ℓ[c] : w[c])
```

Thus the rectangle defined by `(posL[c],posB[c])` to `(posR[c],posT[c])` has the correct size depending on its
orientation.

### Non‑overlap and separation constraints

For each distinct pair of containers `c < k` the following must hold:

```
posL[c] ≥ posR[k] + sep[cls[c],cls[k]]      ∨
posR[c] + sep[cls[c],cls[k]] ≤ posL[k]      ∨
posB[c] ≥ posT[k] + sep[cls[c],cls[k]]      ∨
posT[c] + sep[cls[c],cls[k]] ≤ posB[k]
```

These inequalities ensure that every pair of containers is separated by at least the required distance in either the x
or y direction.

### Domain bounds

```
posL[c], posR[c] ∈ [0 … W]
posB[c], posT[c] ∈ [0 … L]
ori[c]          ∈ {1, 2}
```

### Objective

The model is a feasibility problem, i.e., find any arrangement that satisfies all constraints.

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
