# Low autocorrelation sequence generation

**Problem statement** - Create an ordered collection `X` of `N` elements. Each element is labeled either **pos** or *
*neg**. For every separation distance ranging between the smallest positive lag and one before the full length, compute

$C(K)=\sum_i X_i X_{i+K}$

and accumulate a penalty

$E=\sum_K \bigl(C(K)\bigr)^2$.

The objective is to assign **pos**/**neg** values so that the accumulated penalty `E` becomes as small as possible.

**Encoding details** – Introduce an array of variables named `seq` whose admissible indices correspond to successive
positions up to length `N`. Each entry may take a value from the two‑symbol set `{pos,neg}`. Define a scalar variable (
e.g., **err**) that stores the accumulated penalty described above. Solving seeks any assignment that minimizes this
scalar objective.

[//]: # (Generated using nemotron-3-nano:latest from D001 formal.en.md and model.mzn; major manual amendments applied)
