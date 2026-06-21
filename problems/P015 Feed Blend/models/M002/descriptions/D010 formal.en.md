# Feed‑Mix Planning

A feed‑production plant must deliver the same amount of feed each period over a fixed planning horizon.  
The goal is to decide how much of every ingredient to buy, how much to use in the blend, and how much to keep in storage
so that all mass, nutritional, compositional and economic constraints are satisfied and the total cost (purchasing plus
holding) is minimized.

- **Mass balance** – In each period $t\in\mathcal{T}$ the mixture must contain exactly the target
  mass $\text{total\\_weight}$.  
  The ingredients that actually enter the blend are denoted $\text{amount}[i,t]$ for ingredient $i\in\mathcal{I}$.

- **Nutrient limits** – Every nutrient $j\in\mathcal{N}$ has a lower and upper bound, $\text{min\\_req}[j]$
  and $\text{max\\_req}[j]$.  
  The weighted sum of the ingredients’ compositions $\text{comp}[i,j]$ must lie within those bounds in every period:

$$
\sum\_{i\in\mathcal{I}}\text{amount}[i,t]\cdot\text{comp}[i,j]
\in [\text{min\\_req}[j], \text{max\\_req}[j]].
$$

- **Grain share** – The set $\mathcal{G}\subseteq\mathcal{I}$ denotes all grain ingredients.  
  At least one‑fifth of the total mass must come from grains:

$$
\sum\_{i\in\mathcal{G}}\text{amount}[i,t] \ge 0.2 \text{total\\_weight}.
$$

- **Inventory dynamics** – For each ingredient a warehouse with capacity $\text{storage\\_cap}$ stores the
  stock $\text{stock}[i,t]$ at the end of period $t$.  
  The initial stock is $\text{initial\\_stock}[i]$.  
  The flow balance reads

$$
\text{stock}[i,t] = \text{stock}[i,t-1]+\text{buy}[i,t]-\text{amount}[i,t],
$$

  with $\text{buy}[i,t]$ the quantity purchased in period $t$.

- **Objective** – Minimize the sum of purchasing costs and holding costs over the horizon:

$$
\min \sum\_{i\in\mathcal{I}}\sum\_{t\in\mathcal{T}}
\bigl(\text{buy}[i,t]\cdot\text{cost}[i,t]+\text{stock}[i,t]\cdot\text{holding\\_cost}\bigr).
$$

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn)
