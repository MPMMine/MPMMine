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
| $d\_i$              | Demand (required number of units) for variation $i$.                                                 |
| $p\_{i,j}$          | Integer variable (0 … $S$) representing how many slots of variation $i$ are placed on template $j$.    |
| $R\_j$              | Integer variable (1 … $L\_{\text{upper}}$) indicating how many times template $j$ will be pressed.      |
| $L\_{\text{lower}}$ | A lower bound on total pressings, defined as $\left\lceil \frac{\sum\_{i=1}^{n} d\_i}{S}\right\rceil$. |
| $L\_{\text{upper}}$ | An upper bound on total pressings, set to $2 \times L_{\text{lower}}$.                               |

---

## Constraints

1. **Pressing limits**  
   $L\_{\text{lower}} \le \sum\_{j=1}^{t} R\_j \le L\_{\text{upper}}$

2. **Template capacity** - each template must be completely filled:  
   $\forall j \in \\{1,\dots,t\\}: \sum\_{i=1}^{n} p\_{i,j} = S$

3. **Demand fulfilment** - the total number of units produced for every variation must meet or exceed its demand:  
   $\forall i \in \\{1,\dots,n\\}: \sum\_{j=1}^{t} p\_{i,j}\\,R_j \ge d_i$

4. **Symmetry breaking** – to reduce search space, identical demands are ordered lexicographically:  
   $\text{if } d\_i = d\_{i+1}\text{ then } [p_{i,1},\dots,p_{i,t}] \preceq\_{\text{lex}} [p_{i+1,1},\dots,p_{i+1,t}]$
   Additionally, a weaker pseudo‑symmetry ensures that the total production of a variant with smaller demand does not
   exceed that of a variant with larger demand:
   $\text{if } d\_i < d\_{i+1}\text{ then } \sum\_{j} p\_{i,j} R_j \le \sum\_{j} p\_{i+1,j} R\_j$

---

## Objective

Minimise the overall number of template pressings:
$\min \sum\_{j=1}^{t} R\_j$

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
