# Designing Printing Templates

This challenge stems from a colour‑printing company that manufactures diverse items such as cartons for food and
magazine inserts from thin sheet material. Each item is produced in several variants-commonly different flavours-that
share the same size and shape but differ by a modest amount of printed text or colour (for example, one variant may show
‘Chicken Flavour’ on a blue background while another displays ‘Rabbit Flavour’ on green). An order typically requests
varying quantities of each variant.

Because every variant occupies a piece of board of identical dimensions, we can anticipate exactly how many units fit
onto a single mother sheet whose size is dictated by the printing equipment. A mother sheet is prepared from a *
*template**, which is an aluminium plate etched with the designs for several variants. The task is two‑fold:

1. Decide on the number of distinct templates to fabricate (`t`).
2. Allocate each variant (`i`) and a certain number of copies of that variant across the selected templates, represented
   by an allocation variable `p[i,j]` that denotes how many slots for variant *i* are reserved in template *j*.

Every template contains exactly `S` slot positions, where `S` is a fixed capacity parameter. If a template holds more
slots than there are variants, it might be possible to meet the demand with only one template; however, this usually
generates excessive waste material. By employing multiple templates we can lower the overall waste and therefore seek
plans that minimise the total produced copies across all templates.

Mathematically the problem includes:

- A capacity integer `S` (slots per template).
- The number of variants `n` and their demand vector `d[i]`.
- Allocation variables `p[i,j]` ranging from 0 up to `S`, indicating how many slots for variant *i* are assigned to
  template *j*.
- Production counts `R[j]` (positive integers bounded by an expression derived from the total demand), representing how
  many times each template is used.

Key constraints are:

- The sum of allocated slots in each template must equal its capacity (`S`).
- The cumulative production across all templates must fall within a feasible interval that captures lower and upper
  estimates of needed copies.
- Every variant’s total allocated occurrences across all selected templates have to meet or exceed its required quantity
  `d[i]`.
- Symmetry‑breaking rules are added to avoid equivalent permutations of variants with identical demand.

The optimisation goal is to **minimise the aggregate production count**, i.e., minimise $\sum_{j=1}^{t} R[j]$.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
