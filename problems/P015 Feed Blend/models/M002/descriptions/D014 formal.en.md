# Livestock Feed Formulation Planning

Consider the task of operating a feed mixing plant across a sequence of scheduling intervals. The aim is to assemble a
uniform mixture each interval that satisfies rigid nutritional and mass targets while handling shifting market rates and
storage logistics.

1. **Nutritional Alignment:** Each interval's final mixture must hit a designated aggregate weight, denoted as $W$. The
   cumulative concentration of every nutritional component $j \in \mathcal{N}$ must remain between prescribed
   lower $\mu_j^{\min}$ and upper $\mu_j^{\max}$ limits.

2. **Component Ratios:** A designated subset $\mathcal{G} \subseteq \mathcal{I}$ of components, classified as Cereals,
   must consistently account for at least a threshold proportion $\tau$ of the overall mixture weight in every interval
   to uphold formulation standards.

3. **Stock Dynamics:** The plant operates with per-component storage limits $S$. Beginning with a known baseline
   inventory $\sigma_i^0$, the planner must determine, for each interval $t \in \mathcal{T}$, how much of each
   component $i \in \mathcal{I}$ to acquire ($x_{i,t}$) versus how much to extract from storage ($y_{i,t}$). Ending
   inventory $s_{i,t}$ follows the mass balance $s_{i,t} = s_{i,t-1} + x_{i,t} - y_{i,t}$ for $t \in \mathcal{T}$,
   initialized at $s_{i,0} = \sigma_i^0$.

4. **Cost Management:** Acquisition prices $c_{i,t}$ shift across intervals and components. Additionally, retaining
   components in storage generates a periodic holding fee $h$ per unit.

The overarching goal is to compute an acquisition and blending schedule that minimizes the aggregate
expenditure $\sum_{i \in \mathcal{I}, t \in \mathcal{T}} (c_{i,t} x_{i,t} + h s_{i,t})$ across the full planning
horizon, effectively capitalizing on price dips by purchasing and warehousing components for later periods.

[//]: # (Generated using qwen3.6:latest from D001 description.en.md and model.mzn)
