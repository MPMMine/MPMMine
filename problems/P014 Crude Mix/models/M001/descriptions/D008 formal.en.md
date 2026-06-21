# Crude Slate Mix Planning (Petroleum Refinery)

In a refinery the goal is to assemble the most profitable blend of crude oils – the *crude slate* – and to convert it
into marketable fuels. Crude oils come in many grades, each with its own chemical signature, price and processing
burden.  
A refinery never works on a single grade; it must choose from a set $C=\{1,\dots ,n\}$ of available crudes, decide how
many barrels of each to purchase, and determine the blend that will be fed into the daily distillation process.

---

### Decision Variables

$x_i (i\in C)$ – amount of crude *i* that will be processed (in barrels).

### Parameters (all known before the day)

| Symbol                                       | Meaning                                                     |
|----------------------------------------------|-------------------------------------------------------------|
| $c_i$                                        | purchase cost per barrel of crude *i*                       |
| $\bar{s}_i$                                  | sulfur content per barrel of crude *i*                      |
| $\bar{l}_i$                                  | labor hours required per barrel of crude *i*                |
| $u_i$                                        | maximum barrels of crude *i* available for purchase         |
| $y_{i,p}$                                    | yield (barrels of product *p* per barrel of crude *i*)      |
| $P=\{\text{Gasoline, JetFuel, HeatingOil}\}$ | product set                                                 |
| $p_p$                                        | market price per barrel of product *p*                      |
| $r_p$                                        | contractual minimum production of product *p*               |
| $C_{\text{max}}$                             | total distillation capacity (barrels per day)               |
| $B_{\text{max}}$                             | daily procurement budget                                    |
| $L_{\text{max}}$                             | total labor hours available                                 |
| $S_{\text{max}}$                             | sulfur emission cap                                         |
| $\alpha$                                     | minimum fraction of crude #1 required in the slate (≈ 0.15) |

---

### Constraints

1. **Individual supply limits**

$$
x\_i \le  u\_i \forall\\, i\in C
$$

3. **Total capacity**

$$
\sum\_{i\in C} x\_i \le  C\_{\text{max}}
$$

5. **Sulfur cap**

$$
\sum_\{i\in C} x\_i\\,\bar{s}\_i \le  S\_{\text{max}}
$$

7. **Labor limit**

$$
\sum\_{i\in C} x\_i\\,\bar{l}\_i \le  L\_{\text{max}}
$$

9. **Budget**

$$
\sum\_{i\in C} x\_i\\,c\_i \le  B\_{\text{max}}
$$

11. **Contractual minimums**

$$
\sum\_{i\in C} x_i\\,y\_{i,p} \ge  r\_p \forall\, p\in P
$$

13. **Chemical stability rule** – crude #1 must form at least a fraction $\alpha$ of the overall slate

$$
x\_{1} \ge \alpha\\,\sum\_{i\in C} x\_i
$$

---

### Objective

Maximise the **net daily profit**:

$$
\max
\underbrace{\sum\_{p\in P} p\_p\\!\\!\sum\_{i\in C}x\_i\\,y\_{i,p}}\_{\text{Revenue from fuels}} - \underbrace{\sum\_{i\in C}x\_i\,c\_i}\_{\text{Cost of crude}}
$$

The optimal values of $x_i$ yield the *Optimal Crude Slate* – a blend that satisfies all operational, financial,
environmental and contractual constraints while delivering the highest possible profit.

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
