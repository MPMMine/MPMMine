# Template Design Problem

A colour‑printing company makes cartons, inserts and other thin‑board items.  
Each product variation (for instance a flavour of cat food) shares the same
overall shape and size, but differs only in a few textual or colour elements.
An order typically contains many quantities of several such variations.

Because every variation has identical dimensions, the number of cartons that
can be printed on a single *mother sheet* is known exactly.  
A mother sheet is produced from a *template*, which is an aluminium panel on
which several variations are etched.  
The challenge is two‑fold:

1. Decide how many distinct templates to create.
2. Decide, for each template, which variations it contains and how many
   copies of each variation are to be printed on that template.

If a template contains more *slots* than the number of distinct variations,
the order could be satisfied with a single template, but this would generate
large amounts of waste card.  
Using more templates can reduce waste, but increases complexity.
The goal is therefore to generate template plans that minimise the total
production (and hence the waste) for any chosen number of templates
$t = 1,2,\dots$.

---

## Symbolic Modelling

| Symbol                                             | Meaning                                                   |
|----------------------------------------------------|-----------------------------------------------------------|
| $S$                                                | Number of slots on every template.                        |
| $t$                                                | Number of templates to be used.                           |
| $n$                                                | Number of distinct variations.                            |
| $d_i$                                              | Demand (required copies) for variation $i$.               |
| $p_{i,j}$                                          | Number of slots of variation $i$ on template $j$          |
| $R_j$                                              | Number of pressings (i.e. times the template is printed). |
| $\text{Production}$                                | Total number of pressings across all templates.           |
| $\text{llower} = \lceil\sum_{i=1}^n d_i / S\rceil$ | Lower bound on $\text{Production}$.                       |
| $\text{lupper} = 2\text{llower}$                   | Upper bound on $\text{Production}$.                       |
| $\text{Surplus}$                                   | Extra copies produced beyond the total demand.            |

### Decision Variables

* $p_{i,j}$ are integers in $[0, S]$.
* $R_j$ are integers in $[1, \text{lupper}]$.

### Constraints

1. **Slot capacity per template**  
   $\forall j\in\{1,\dots,t\}: \sum_{i=1}^{n} p_{i,j} = S$.

2. **Demand fulfilment**  
   $\forall i\in\{1,\dots,n\} :
   \sum_{j=1}^{t} p_{i,j} R_j \ge d_i$.

3. **Total production limits**  
   $\text{Production} = \sum_{j=1}^{t} R_j ,\qquad
   \text{llower} \le \text{Production} \le \text{lupper}$.

4. **Surplus definition**  
   $\text{Surplus} = \text{Production} \cdot S - \sum_{i=1}^{n} d_i$.

5. **Surplus bounds on individual and cumulative variations**  
   $\forall k\in\{1,\dots,n\}:
   \sum_{j=1}^{t} \bigl(p_{k,j}R_j - d_k\bigr) \le \text{Surplus}$
   and for any prefix of variations,
   $\forall k\in\{2,\dots,n-1\}:
   \sum_{j=1}^{t}\sum_{m=1}^{k}\bigl(p_{m,j}R_j - d_m\bigr) \le \text{Surplus}$.

6. **Run‑length pseudo‑symmetry**  
   For $t=2$:
   $R_1 \le \bigl\lfloor \text{Production}/2 \bigr\rfloor ,\quad
   R_2 \ge \bigl\lfloor \text{Production}/2 \bigr\rfloor$.

   For $t=3$:
   $R_1 \le \bigl\lfloor \text{Production}/3 \bigr\rfloor ,\quad
   R_2 \le \bigl\lfloor \text{Production}/2 \bigr\rfloor ,\quad
   R_3 \ge \bigl\lfloor \text{Production}/3 \bigr\rfloor$.

7. **Symmetry breaking**  
   *If two variations have identical demand* ($d_i=d_{i+1}$):
   $[p_{i,1},\dots,p_{i,t}] \preccurlyeq_{\text{lex}}[p_{i+1,1},\dots,p_{i+1,t}]$.

   *If a variation’s demand is lower than the next* ($d_i < d_{i+1}$):
   $\sum_{j=1}^{t} p_{i,j} R_j \le \sum_{j=1}^{t} p_{i+1,j} R_j$.

### Objective

$\min \text{Production}$

The optimisation seeks the minimum number of pressings (and thus the minimum
waste) for a given number of templates, respecting all slot, demand and
symmetry constraints.  
By solving the problem for successive values of $t$, one obtains the
optimal template plans for one template, two templates, and so on.

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; major manual amendments applied)

