# Cattle Feed Production Planning

The task is to devise a buying‑and‑blending schedule for a livestock‑feed plant that operates over a finite planning
horizon.  
The schedule must satisfy nutritional, compositional, inventory and economic constraints while minimizing total
expenditure.

**Sets and indices**

| Symbol         | Meaning                                               |
|----------------|-------------------------------------------------------|
| $I$            | Set of all ingredients                                |
| $N$            | Set of all nutrients                                  |
| $T$            | Set of planning periods                               |
| $G\subseteq I$ | Subset of ingredients that are classified as *Grains* |

**Parameters**

| Symbol               | Meaning                                                                |
|----------------------|------------------------------------------------------------------------|
| $\text{cost}[i,t]$   | Purchase price of ingredient $i$ during period $t$                     |
| $\text{comp}[i,j]$   | Content of nutrient $j$ per unit of ingredient $i$                     |
| $\text{min\\_req}[j]$ | Minimum allowable total amount of nutrient $j$ in a batch              |
| $\text{max\\_req}[j]$ | Maximum allowable total amount of nutrient $j$ in a batch              |
| $\text{W}$           | Target total mass of the blended feed for each period                  |
| $\text{SC}$          | Maximum units of any ingredient that may be held in stock              |
| $\text{HC}$          | Holding cost per unit of ingredient per period                         |
| $\text{S0}[i]$       | Initial stock of ingredient $i$ at the start of period 0               |
| $\gamma$             | Minimum required fraction of grains in the blend (e.g., $\gamma=0.20$) |

**Decision Variables**

| Symbol              | Meaning                                                                                                       |
|---------------------|---------------------------------------------------------------------------------------------------------------|
| $\text{buy}[i,t]$   | Quantity of ingredient $i$ purchased during period $t$                                                        |
| $\text{use}[i,t]$   | Quantity of ingredient $i$ incorporated into the blend during period $t$                                      |
| $\text{stock}[i,t]$ | Quantity of ingredient $i$ remaining in inventory at the end of period $t$ (includes the initial state $t=0$) |

**Constraints**

1. **Initial inventory**  
   $\text{stock}[i,0] = \text{S0}[i]$ for all $i \in I$.

2. **Inventory balance**  
   For each ingredient $i$ and each period $t\in T$:  
   $\text{stock}[i,t] = \text{stock}[i,t-1] + \text{buy}[i,t] - \text{use}[i,t]$.

3. **Production mass balance**  
   In every period the blended feed must weigh exactly $\text{W}$:
   $\sum\_{i\in I}\text{use}[i,t] = \text{W}$ for all $t\in T$.

5. **Nutrient limits**  
   For every nutrient $j$ and period $t$:

$$
\text{min\\_req}[j] \le \sum\_{i\in I}\text{use}[i,t] \text{comp}[i,j] \le \text{max\\_req}[j].
$$

6. **Grain proportion**  
   In each period the total amount of grains used must be at least a fraction $\gamma$ of the batch:

$$
\sum\_{i\in G}\text{use}[i,t] \ge \gamma \text{W}.
$$

8. **Storage capacity**  
   For all $i,t$:  
   $0 \le \text{stock}[i,t] \le \text{SC}$.

9. **Non‑negativity**  
   All purchase, usage and stock quantities are non‑negative and bounded by logical limits implied by the above
   constraints.

**Objective**

Minimize the sum of buying and holding costs over the entire horizon:

$$
\min
\sum\_{t\in T} \sum\_{i\in I}\bigl(
\text{buy}[i,t] \text{cost}[i,t] + \text{stock}[i,t] \text{HC}
\bigr).
$$

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
