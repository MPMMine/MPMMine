# Cutting Stock Problem – Reformulated Overview

The cutting stock problem concerns partitioning large blank units (e.g., rolls) into a collection of smaller demanded
pieces while keeping waste to a minimum or, equivalently, reducing the number of raw units required. Typical settings
involve many product widths and quantities that must be satisfied from stock items of a single fixed length.

Mathematically let **N** denote the total set of distinct piece types; each type *i* has an associated requirement **D_i
** (represented by a symbolic variable). Raw material blocks all share a common size parameter, denoted **L**.

The planning formulation introduces binary indicators **U_j** that signal whether a particular raw block *j* is actually
taken into service. For each ordered pair *(i,j)* the model stores an integer count **C_{i,j}**, representing how many
pieces of type *i* are cut from raw block *j*.

The structure enforces three families of logical conditions:

1. **Physical capacity restriction** – each count cannot exceed the maximum number of pieces of type *i* that can
   physically fit on a single blank, expressed compactly as a derived upper bound and linked to the activation flag (
   e.g., if block *j* is unused then all counts for this block are forced to zero).

2. **Length‑fit limitation** – the aggregate width contributed by every cut placed on one raw unit must never exceed its
   usable length; in symbolic form this reads as a linear combination of item widths weighted by their respective piece
   counts being bounded by **L·U_j**.

3. **Demand fulfillment rule** – the summed production across all selected blanks for each product type *i* has to meet
   or surpass its prescribed order quantity **D_i**.

Additional structure eliminates equivalent solutions through a monotonicity clause that forces the activation flags of
successive candidate units to be nonincreasing (earlier used blocks must be activated first). A derived lower bound on
the number of raw units is also imposed, based on the total required width expressed as a ceiling operation over the
ratio of overall demand‑weighted length to single‑unit size.

The optimization goal seeks to minimize the summed activation flag across all candidate blocks, thereby driving the
selection toward fewer used blanks and consequently less scrap or waste.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; major manual amendments applied)
