# Feed‑Blend Planning

In a livestock‑feed plant that operates over several discrete periods, the task is to produce a uniform feed mix in
every period while respecting weight, nutrition, and inventory limits, all under varying price signals.

**1. Targeted Blend Consistency**  
For each period $t \in \mathcal{T}$ the blend must have a prescribed mass $W_{\text{tot}}$.  
The total content of each nutrient $n \in \mathcal{N}$ derived from the chosen ingredients must lie between a lower
bound $R^{\min }_n$ and an upper bound $R^{\max }_n$.

**2. Grain‑Content Requirement**  
A distinguished subset of ingredients, the *Grains* $\mathcal{G} \subseteq \mathcal{I}$, must contribute at least 20% of
the blend mass in every period.

**3. Stock Management**  
The plant stores each ingredient $i \in \mathcal{I}$ in a warehouse whose capacity per ingredient is $S_{\max}$.  
Initially the warehouse contains $\text{Init}_i$ units of ingredient $i$.  
During each period the decision variables are

* $B_{i,t}$: quantity of ingredient $i$ purchased at period $t$;
* $U_{i,t}$: quantity of ingredient $i$ drawn from inventory to form the blend;
* $S_{i,t}$: inventory level of ingredient $i$ at the end of period $t$.

The stock evolution follows the balance equation  
$S_{i,t}=S_{i,t-1}+B_{i,t}-U_{i,t}$ for all $t\ge1$.

**4. Cost Structure**  
The purchase price of ingredient $i$ at period $t$ is $c_{i,t}$, while a holding cost $\kappa$ is charged per unit of
any ingredient stored for one period.

**Objective**  
Select the purchase, usage, and storage schedules $\{B_{i,t},U_{i,t},S_{i,t}\}$ to minimise the total expenditure over
the planning horizon:
$$
\min \sum_{i\in\mathcal{I}}\sum_{t\in\mathcal{T}}
\bigl(c_{i,t} B_{i,t} + \kappa S_{i,t}\bigr).
$$

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn)
