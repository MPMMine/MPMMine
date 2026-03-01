# Portfolio Construction Problem

A capital‑constrained investor wishes to select portions of a set of assets so as to obtain the greatest possible total
return. Each asset can be taken up to a market‑defined limit, while the combined expenditure must remain within an
overall budget $B$.

Let $\mathcal{I}$ denote the collection of investment opportunities indexed from $1$ through $n$. For every
index $i \in \mathcal{I}$ there is a reward coefficient $r_i$ that measures profit per chosen unit and a cost
parameter $c_i$ indicating how much cash is consumed by one unit. Decision variables take the form $x_i$, a binary
fraction that signals whether any portion of option $i$ is selected.

The selection must satisfy  
$$
\sum_{i\in\mathcal{I}} c_i x_i \le B,
$$
and the objective seeks to maximize  
$$
\sum_{i\in\mathcal{I}} r_i x_i.
$$

[//]: # (Generated using nemotron-3-nano:latest from D008 description.en.md and model.mzn; minor manual amendments applied)
