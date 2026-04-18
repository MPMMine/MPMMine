# Feed Formulation Planning

Consider the task of coordinating a mixed feed manufacturing operation across a finite scheduling horizon. The primary
aim is to determine procurement and blending quantities that satisfy strict physical and dietary specifications while
capitalizing on shifting market rates.

1. **Dietary & Mass Specifications:** Each scheduled batch must exactly match a predefined aggregate mass $W$. The
   concentration of every dietary component $n \in N$ within the mixture must fall between prescribed lower
   bounds $min_n$ and upper bounds $max_n$.

2. **Base Composition Requirement:** A designated subset of foundational components $G \subseteq I$ must consistently
   account for a fixed proportion $\alpha$ of every batch's total mass, guaranteeing structural consistency.

3. **Storage & Material Flow:** Every raw material $i \in I$ has a maximum allowable storage limit $K$. The operation
   begins with known starting quantities $I_0$. At each interval $t \in T$, decisions must be made regarding procurement
   volumes $x_{i,t}$ versus withdrawal amounts $y_{i,t}$ from storage. The inventory levels $s_{i,t}$ across $t \in T$
   evolve according to the balance equation: current stock equals prior stock plus purchases minus withdrawals.

4. **Cost Dynamics:** Acquisition prices $p_{i,t}$ for each material fluctuate across the scheduling horizon.
   Additionally, a per-unit storage fee $h$ applies to retained inventory at the end of each interval.

The overarching goal is to optimize the procurement and mixing plan to minimize the combined expenditure of procurement
and storage fees. This requires strategically timing purchases to exploit lower prices, effectively balancing immediate
acquisition against future inventory costs.

[//]: # (Generated using qwen3.6:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
