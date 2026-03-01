# Template Design Exercise

A printing operation produces a line of identical‑shaped board items-such as food cartons-that come in many visual
variants (e.g., different flavours). All variants share the same silhouette, yet each variant’s graphics differ slightly
through wording and colour. An order specifies how many pieces of each variant must be created.

The production workflow relies on master sheets that contain a fixed number of print positions; each sheet is described
by a capacity (the maximum slots per sheet). Several variants may share the same slot arrangement across different
templates. Choosing more templates can lower scrap but adds scheduling complexity, so the goal is to devise plans for 1
template, then up to a variable count **τ**, that minimize overall waste while honouring every demand.

A *plan* includes:

- An integer **λ** representing the fixed number of slots per sheet.
- A set **I** of distinct variants; each variant **i** carries an associated required amount denoted by a positive
  integer **δ_i**.
- An integer arrangement matrix **Ζ_{i,j}** indicating how many slots variant **i** occupies on template **j**. This
  number must not exceed **λ**.
- For each template *j*, an integer production count **ρ_j**, ranging from 1 up to some upper bound **β**.

The overall output volume is expressed as **Π = ∑_j ρ_j**, which must satisfy the derived bounds:

- Lower bound: a symbol **γ_low** computed from **λ** and the total demand ∑ δ_i.
- Upper bound: an upper symbol **γ_up**.

Waste is defined as the excess capacity: **Π·λ − ∑_i δ_i**.

The model enforces several constraints:

- *Slot occupation*: For every template *j*, Σ_i **Ζ_{i,j}** = **λ**.
- *Demand fulfillment*: For each variant *i*, Σ_j (**Ζ_{i,j}**·ρ_j) ≥ δ_i.
- *Symmetry breaking*: Variants with equal demand are ordered lexicographically.
- *Implied relationships* bound waste per variant group, restrict the growth of small ρ_j beyond the total waste.

The optimisation objective seeks to minimise **Π**, thereby shrinking overall surplus and achieving the most efficient
use of printed sheets.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; major manual amendments applied)
