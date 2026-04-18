# Template Planning for Board‑Based Packaging

A printing house that produces board‑based items such as food cartons and magazine inserts often sells the same product
under many flavour or colour variations. Each variation is a board piece of the same dimensions, so the number of items
that can be produced from a single *mother sheet* is fixed by the printing machine.  
A mother sheet is created by stamping a *template*; each template contains several *slots* that are filled with a
particular variation. The challenge is two‑fold:

1. decide how many distinct templates $t$ will be produced,
2. decide how many copies of each variation $i$ ($i=1\ldots n$) will be allocated to each template $j$ ($j=1\ldots t$),
   and how many times each template will be pressed.

The goal is to minimise waste, i.e. the total number of template pressings, for any given number of templates.

---

## Model Parameters and Variables

| Symbol             | Meaning                                                                                              |
|--------------------|------------------------------------------------------------------------------------------------------|
| $S$                | Number of slots that a single template can contain.                                                  |
| $t$                | Number of different templates that may be manufactured.                                              |
| $n$                | Number of distinct product variations that must be supplied.                                         |
| $d_i$              | Demand (required number of units) for variation $i$.                                                 |
| $p_{i,j}$          | Integer variable (0…$S$) representing how many slots of variation $i$ are placed on template $j$.    |
| $R_j$              | Integer variable (1…$L_{\text{upper}}$) indicating how many times template $j$ will be pressed.      |
| $L_{\text{lower}}$ | A lower bound on total pressings, defined as $\left\lceil \frac{\sum_{i=1}^{n} d_i}{S}\right\rceil$. |
| $L_{\text{upper}}$ | An upper bound on total pressings, set to $2 \times L_{\text{lower}}$.                               |

---

## Constraints

1. **Pressing limits**  
   $$
   L_{\text{lower}} \le \sum_{j=1}^{t} R_j \le L_{\text{upper}}
   $$

2. **Template capacity** - each template must be completely filled:  
   $$
   \forall j \in \{1,\dots,t\}: \sum_{i=1}^{n} p_{i,j} = S
   $$

3. **Demand fulfilment** - the total number of units produced for every variation must meet or exceed its demand:  
   $$
   \forall i \in \{1,\dots,n\}: \sum_{j=1}^{t} p_{i,j}\,R_j \ge d_i
   $$

4. **Symmetry breaking** – to reduce search space, identical demands are ordered lexicographically:  
   $$
   \text{if } d_i = d_{i+1}\text{ then } [p_{i,1},\dots,p_{i,t}] \preceq_{\text{lex}} [p_{i+1,1},\dots,p_{i+1,t}]
   $$
   Additionally, a weaker pseudo‑symmetry ensures that the total production of a variant with smaller demand does not
   exceed that of a variant with larger demand:
   $$
   \text{if } d_i < d_{i+1}\text{ then } \sum_{j} p_{i,j} R_j \le \sum_{j} p_{i+1,j} R_j
   $$

---

## Objective

Minimise the overall number of template pressings:
$$
\min \sum_{j=1}^{t} R_j
$$

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
