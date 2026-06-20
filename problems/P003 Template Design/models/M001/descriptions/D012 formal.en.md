# Template‑Design Challenge

A colour‑printing shop produces many small‑cardboard items, such as food cartons or magazine inserts.  
For a given product line several *variations* exist (different flavours, colours, slogans, …).  
All variations share the same size and shape, but a few text or colour changes make them distinct.

On a single **mother sheet** of board (its dimensions are dictated by the printing press) many
copies of one or more variations can be printed.  
The sheet is produced from a **template** – a thin aluminium plate on which the pattern for
several variations is carved.  
Once a template has been created, it can be pressed many times, producing a fixed
number of copies of each variation contained in that template.

The shop receives an order for a set of variations, each with a required quantity  $d[i] $
( $i = 1 … n $).  
The aim is to decide for a fixed number of templates  $t $:

* how many slots  $p[i,j] $ of variation *i* should be placed on template *j*,
* how many times  $R[j] $ each template *j* should be pressed,

so that the total production satisfies all demands while keeping the amount of
waste as small as possible.

---

## Symbols

| Symbol       | Meaning                                                                             |
|--------------|-------------------------------------------------------------------------------------|
| $S$          | Slots per template (fixed integer).                                                 |
| $t$          | Number of templates.                                                                |
| $n$          | Number of variations.                                                               |
| $d[i]$       | Demand for variation *i*.                                                           |
| $p[i,j]$     | Integer variable 0 ≤ p[i,j] ≤ S – number of slots of variation *i* on template *j*. |
| $R[j]$       | Integer variable 1 ≤ R[j] ≤  $lupper$ – times template *j* is pressed.             |
| $Production$ | Sum of all  $R[j] $ – total number of template presses.                             |
| $Surplus$    | Production × S − ∑ d[i] – extra slots that go unused.                               |
| $llower$     | Lower bound on production: ⌈∑ d[i]/S⌉.                                              |
| $lupper$     | Upper bound on production: 2 ×  $llower$.                                           |

---

## Constraints

1. **Template capacity** – every template must be fully occupied
   $\forall j\in[1..t] \sum_{i=1}^{n} p[i,j] = S$.

2. **Demand fulfilment** – every variation’s total output must meet its demand
   $\forall i\in[1..n] \sum_{j=1}^{t} p[i,j] R[j] \ge d[i]$.

3. **Production bounds** – total number of presses is within feasible limits
   $llower \le Production \le lupper$.

4. **Surplus definition** – excess capacity is tracked  
   $Surplus = Production \times S - \sum\_{i=1}^{n} d[i]$.

5. **Surplus limits per variation** – the surplus cannot exceed the total surplus  
   $\forall k \in [1..n] \sum\_{j=1}^{t}\\!\bigl(p[k,j]\\,R[j] - d[k]\bigr)  \le  Surplus$.

6. **Cumulative surplus constraint** – the summed surplus of the first *k* variations
   is also bounded  
   $\forall k \in [2..n-1] \sum\_{m=1}^{k} \sum\_{j=1}^{t}\\!\bigl(p[m,j]\\,R[j] - d[m]\bigr) \le  Surplus$.

7. **Run‑length symmetry breaking** – for small numbers of templates

   If t=2:
   $R[1] \le \frac{Production}{2}$ and
   $R[2] \ge \frac{Production}{2};$

   If t=3:
   $R[1] \le \frac{Production}{3}$,
   $R[2] \le \frac{Production}{2}$,
   $R[3] \ge \frac{Production}{3}$.

8. **Lexicographic symmetry breaking** – variations with identical demands are ordered  
   $\forall i< n \text{ with } d[i]=d[i+1]:
   [p[i,1],\dots,p[i,t]] \preceq [p[i+1,1],\dots,p[i+1,t]]$.

9. **Pseudo‑symmetry constraint** – if a variation has a lower demand than the next one, its total production
   cannot exceed that of the next variation  
   $\forall i< n \text{ with } d[i] < d[i+1] :
   \sum_{j=1}^{t} p[i,j]\,R[j]  \le
   \sum_{j=1}^{t} p[i+1,j]\,R[j] .$

---

## Objective

Minimise the total production: $\min Production$.

This corresponds to producing as few template presses as possible while satisfying all demands and keeping waste (
captured by $Surplus$) minimal.

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; major manual amendments applied)
