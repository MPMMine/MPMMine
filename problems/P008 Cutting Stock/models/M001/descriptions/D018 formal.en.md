# Cutting aluminum profiles – formulation in Markdown

A workshop must cut standard extrusion bars of fixed width **W** into the different segment types needed for window
frames. There are **N** distinct segment categories; each category *k* has a required quantity **Dₖ**. The physical
limit for how many pieces of type *k* can be taken from one bar is represented by the symbol **Cₖ** (a bound derived
from **W** and the piece‑width **wₖ**).

The planning model uses binary symbols to indicate whether a particular bar index **j** (where **j = 1 … M**) is
selected for use, denoted **yⱼ ∈ {0,1}**. For every chosen bar, integer cut variables **x_{k,j} ≥ 0** specify how many
pieces of type *k* are taken from that bar.

The solution must satisfy the following logical conditions:

- **Capacity bound**: the number of cuts of any type on a selected bar cannot exceed its physical ceiling; i.e.,
  `x_{k,j} ≤ Cₖ·yⱼ` for all *k, j*.
- **Width compatibility**: the total width consumed by the cuts placed on a used bar must not surpass **W**; formally,
  `∑ₖ (x_{k,j}·wₖ) ≤ W·yⱼ` for each *j*.
- **Demand satisfaction**: aggregating the cuts of every type across all bars meets or exceeds the required demand;
  i.e., `∑ⱼ x_{k,j} ≥ Dₖ` for every *k*.
- **Ordering rule**: selected bars are considered in non‑increasing usage order, expressed as `y₁ ≥ y₂ ≥ … ≥ y_{M‑1}`.
- **Roll count** : a lower bound on the total number of employed bars follows from overall width consumption;
  mathematically, `∑ⱼ yⱼ` must be at least the ceiling of `(∑ₖ Dₖ·wₖ) / W`.

The objective is to minimize the total number of utilized bars, i.e., `min Σⱼ yⱼ`. This formulation captures all
stipulated requirements while abstracting away concrete numeric values.

[//]: # (Generated using nemotron-3-nano:latest from D010 description.en.md and model.mzn; minor manual amendments applied)
