# Template Design Challenge

A colour‑printing company produces a range of items from a common thin board, such as cartons for food products and
inserts for magazines.  
When a product line has several flavours or styles, the packaging for all variants shares the same overall shape and
size; only the printed text or background colour changes slightly. For example, two cat‑food cartons might be identical
except that one shows *Chicken Flavour* on a blue background while the other shows *Rabbit Flavour* on green.
For a typical order a customer requests many units of several design variants.  
A mother sheet is produced from a **template**: a thin aluminium plate etched with a pattern that tells the press where
to print each variant.  
The decision problem is to determine for each of **t** templates, which variants and how many copies of each should be
assigned to the available **slots** on that template?

---

## Problem Parameters

- **S** – number of slots on a single template.
- **t** – total number of templates to be considered.
- **n** – number of design variants.
- **d[i]** – required number of units of variant *i* (for *i* = 1 … *n*).

From these we define bounds on total production:

- **L** = ⌈ ∑ d[i] / S ⌉ (minimum presses needed for one template).
- **U** = 2 · L (upper bound on total presses).

Let

- **p[i,j]** ∈ [0, S] be the number of slots in template *j* reserved for variant *i*.
- **R[j]** ∈ [1, U] be the number of times template *j* is pressed.

Define aggregate variables

- **Production** = ∑ R[j] (total number of presses).
- **Surplus** = Production · S – ∑ d[i] (unused slots after meeting demands).

---

## Constraints

1. **Template fullness**  
   For every template *j*: ∑ p[i,j] = S.

2. **Demand fulfilment**  
   For every variant *i*: ∑ p[i,j] · R[j] ≥ d[i].

3. **Production bounds**  
   L ≤ Production ≤ U.

4. **Surplus limits**  
   Surplus = Production · S – ∑ d[i].  
   For each variant *k*: ∑ p[k,j] · R[j] – d[k] ≤ Surplus.  
   For any prefix of variants up to *k* (k ≥ 2): ∑_{m≤k}∑ p[m,j] · R[j] – d[m] ≤ Surplus.

5. **Run‑length balance (when t = 2 or 3)**  
   If t = 2: R[1] ≤ Production / 2 ≤ R[2].  
   If t = 3: R[1] ≤ Production / 3, R[2] ≤ Production / 2, R[3] ≥ Production / 3.

6. **Symmetry breaking**
    - Variants with equal demand: the slot vectors [p[i,1], …, p[i,t]] must be lexicographically less than or equal to
      those of the next variant.
    - Variants with increasing demand: the total printed copies of earlier variants must not exceed those of later
      variants.

---

## Objective

Minimise **Production** (the total number of presses), thereby reducing wasted board material while satisfying all
variant demands with the chosen number of templates and slot allocations.

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; major manual amendments applied)
