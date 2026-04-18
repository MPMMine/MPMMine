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
   x_i \le  u_i \forall\, i\in C
   $$

2. **Total capacity**  
   $$
   \sum_{i\in C} x_i \le  C_{\text{max}}
   $$

3. **Sulfur cap**  
   $$
   \sum_{i\in C} x_i\,\bar{s}_i \le  S_{\text{max}}
   $$

4. **Labor limit**  
   $$
   \sum_{i\in C} x_i\,\bar{l}_i \le  L_{\text{max}}
   $$

5. **Budget**  
   $$
   \sum_{i\in C} x_i\,c_i \le  B_{\text{max}}
   $$

6. **Contractual minimums**  
   $$
   \sum_{i\in C} x_i\,y_{i,p} \ge  r_p \forall\, p\in P
   $$

7. **Chemical stability rule** – crude #1 must form at least a fraction $\alpha$ of the overall slate  
   $$
   x_{1} \ge \alpha\,\sum_{i\in C} x_i
   $$

---

### Objective

Maximise the **net daily profit**:
$$
\max
\underbrace{\sum_{p\in P} p_p\!\!\sum_{i\in C}x_i\,y_{i,p}}_{\text{Revenue from fuels}} - \underbrace{\sum_{i\in C}x_i\,c_i}_{\text{Cost of crude}}
$$

The optimal values of $x_i$ yield the *Optimal Crude Slate* – a blend that satisfies all operational, financial,
environmental and contractual constraints while delivering the highest possible profit.

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
