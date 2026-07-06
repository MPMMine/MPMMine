# 3D Ball Packing Inside a Cube

Suppose we have a finite collection of candidate balls that can be examined for placement; denote this set by **`I`**
and let one index be called **`i ∈ I`**.  
Each ball `i` possesses its own radius, which we represent with the symbol **`rad_i`** (all radii are positive numbers).
Let **`L_side > 0`** be the side length of a single enclosing cube in which all selected balls must reside.

We wish to determine:

* a subset of balls that will actually be placed inside the cube, and
* for every ball of that subset, the exact Cartesian coordinates of its centre – call them **`cx_i , cy_i , cz_i`** – so
  that three goals are achieved simultaneously:

    * each selected ball lies wholly within the cube’s interior;
    * no two selected balls intersect or touch each other;
    * the total number of placed balls is as large as possible.

---

## Decision Variables

* For every ball `i`, a binary indicator **`δ_i ∈ {0,1}`** that equals 1 when ball `i` is packed into the cube and 0
  otherwise.
* The centre coordinates **`cx_i , cy_i , cz_i`**, each constrained to live somewhere inside the interval **[0 , L_side]**.

---

## Enclosure Constraints

If a ball is chosen (`δ_i = 1`), its centre must be at least one radius distance away from each face of the cube. These
requirements can be written as three simultaneous inequalities for every index `i ∈ I`:

$$
\begin{aligned}
cx\_i \ge rad\_i\\,δ\_i ,\\\
cy\_i \ge rad\_i\\,δ_i ,\\\
cz\_i \ge rad\_i\\,δ_i ,\\\
cx\_i \le L\_{side} - rad\_i\\,δ\_i ,\\\
cy\_i \le L\_{side} - rad\_i\\,δ\_i ,\\\
cz\_i \le L\_{side} - rad\_i\\,δ\_i .
\end{aligned}
$$

When `δ_i = 0` the right‑hand sides collapse and the bounds become trivially satisfied, leaving any value for the
coordinates permissible.

---

## Non‑Overlap Constraints

Two distinct balls `p` and `q` must not overlap provided that both of them are selected. This is captured by a single
pairwise inequality:

$$
(cx_p - cx_q)^2 + (cy_p - cy_q)^2 + (cz_p - cz_q)^2 \ge  
\bigl(rad_p + rad_q\bigr)^2 - M \bigl(2 - δ_p - δ_q\bigr),
$$

where **`M`** is a prescribed very large positive constant (often taken as the square of `L_side`). The term involving
`M` effectively removes the constraint whenever at least one of the balls is not packed.

---

## Objective Function

The ultimate goal is to maximise the total number of spheres that actually enter the container:

$$
\max \sum_{i\in I} δ_i .
$$

[//]: # (Generated using nemotron-3-nano:latest from D001 formal.en.md and model.mzn; major manual amendments applied)
