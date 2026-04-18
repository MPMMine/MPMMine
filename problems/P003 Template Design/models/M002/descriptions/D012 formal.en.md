# Template Design

In a colour‑printing company that manufactures a wide range of thin‑board products—cartons for food, magazine inserts,
etc., each variant of a product is produced on a board of identical size and shape.  
Different flavour or colour variations of the same basic design share the same overall dimensions, differing only in
small textual or colour details.  
An order typically specifies quantities for several such variations. Because every variation occupies the same amount of
space, the number of items that fit on a single mother sheet (the “template”) is fixed and known in advance.

A mother sheet is made from a thin aluminium plate onto which a set of variations is etched. The decision problem
consists of two coupled sub‑problems:

1. **How many distinct templates should be manufactured?**
2. **For each template, which variations should appear and how many copies of each variation should be printed on that
   template?**

If a template contains more slots than there are variations, the order could in principle be satisfied with a single
template. However, that would generate excessive waste of card material. Introducing more templates can reduce waste,
but each additional template incurs its own production cost.  
Thus the goal is to determine template plans that minimise the total amount of card waste for all feasible numbers of
templates (1, 2, …).

---

## Symbolic Problem Formulation

Let us denote:

| Symbol      | Meaning                                                                                                   |
|-------------|-----------------------------------------------------------------------------------------------------------|
| **S**       | Number of slots available on a single template.                                                           |
| **t**       | Number of templates to be produced.                                                                       |
| **n**       | Number of distinct product variations.                                                                    |
| **d[i]**    | Demand (required production quantity) for variation *i*.                                                  |
| **p[i,j]**  | Number of slots on template *j* allocated to variation *i* (integer, 0 ≤ p[i,j] ≤ S).                     |
| **R[j]**    | Number of times template *j* is pressed (integer, 1 ≤ R[j] ≤ l_upper).                                    |
| **l_lower** | A lower bound on total pressings, computed as the ceiling of the total demand divided by *S*.             |
| **l_upper** | An upper bound on total pressings, set to twice *l_lower* (or any value that surely exceeds the optimum). |

### Constraints

1. **Total production limits**  
   The total number of pressings must be at least *l_lower* and at most *l_upper*:
   $$
   l_{\text{lower}} \le \sum_{j=1}^{t} R[j] \le l_{\text{upper}}.
   $$

2. **Full utilisation of each template**  
   Every template must be completely filled with slots:
   $$
   \forall j \in \{1,\dots,t\}: \sum_{i=1}^{n} p[i,j] = S .
   $$

3. **Demand satisfaction**  
   For each variation the total number printed across all templates must meet or exceed its demand:
   $$
   \forall i \in \{1,\dots,n\}: \sum_{j=1}^{t} p[i,j] R[j] \ge d[i] .
   $$

4. **Symmetry breaking**  
   a) Variations with identical demand values are treated symmetrically; their slot allocations across templates are
   ordered lexicographically:
   $$
   \text{if } d[i] = d[i+1] \text{ then } \bigl[p[i,1],\dots,p[i,t]\bigr] \le_{\text{lex}} \bigl[p[i+1,1],\dots,p[i+1,t]\bigr] .
   $$
   b) Variations with increasing demand values are required to produce at least as many copies as the next variation:
   $$
   \text{if } d[i] < d[i+1] \text{ then } \sum_{j} p[i,j]R[j] \le \sum_{j} p[i+1,j]R[j] .
   $$

### Objective

Minimise the total number of pressings, i.e. the sum of *R[j]* over all templates:
$$
\min \sum_{j=1}^{t} R[j].
$$

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
