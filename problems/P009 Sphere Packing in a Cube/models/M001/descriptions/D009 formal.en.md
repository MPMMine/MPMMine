# 3D Ball Packing Inside a Cubic Shell

Let $\mathcal{I}=\{1,\dots,K\}$ be the total pool of candidate balls. Each ball $i\in\mathcal{I}$ carries a positive
radius symbolised by $\rho_i$. All balls are to be accommodated within a cubic enclosure whose edge length is
represented by the positive quantity $\Lambda$.

---

### Decision variables (abstract symbols)

* For every index $i\in\mathcal{I}$ introduce real‑valued centre coordinates
  $(\alpha_i,\beta_i,\gamma_i)\in\mathbb{R}^3$ describing its geometric centre.

* Introduce a binary selector $ \delta_i\in\{0,1\}$ whose value $1$ indicates that ball $i$ is placed inside the
  enclosure, while $0$ signals omission.

---

### Set of constraints (textual form)

**Containment condition** – If $\delta_i=1$ then the entire ball must lie strictly inside the cube.  
Formally this is captured by requiring each coordinate of its centre to stay at least a distance $\rho_i$ away from
every face:

$$
\rho_i\,\delta_i \le \alpha_i \le \Lambda-\rho_i\,\delta_i,\qquad
\rho_i\,\delta_i \le \beta_i \le \Lambda-\rho_i\,\delta_i,\qquad
\rho_i\,\delta_i \le \gamma_i \le \Lambda-\rho_i\,\delta_i .
$$

When $\delta_i=0$ the inequalities become non‑restrictive.

**Non‑intersection requirement** – Any two distinct packed balls must not overlap.  
For every ordered pair $(i,j)$ with $i\neq j$,

$$
(\alpha_i-\alpha_j)^2+(\beta_i-\beta_j)^2+(\gamma_i-\gamma_j)^2
\ge  (\rho_i+\rho_j)^2 - \mathcal{B}\,(2-\delta_i-\delta_j),
$$

where $\mathcal{B}>0$ is a sufficiently large constant that de‑activates the inequality whenever at least one of the
balls is not selected.

**Selection‐count requirement** – No additional lower bound other than non‑negativity is imposed on the binary
variables; they are free to be zero or one as dictated by feasibility.

---

### Objective (symbolic summarisation)

The formulation seeks to maximise the total number of occupied positions, i.e. the sum of all selectors:

$$
\max \sum_{i\in\mathcal{I}} \delta_i .
$$

[//]: # (Generated using nemotron-3-nano:latest from D001 formal.en.md and model.mzn; major manual amendments applied)
