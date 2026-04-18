# Livestock Nutrition Planning

Address the complexity of overseeing a livestock ration manufacturing operation across a series of distinct time
intervals. Let $\mathcal{T}$ denote the set of periods, $\mathcal{I}$ the set of available components, and $\mathcal{N}$
the set of dietary requirements. The primary aim is to formulate a uniform mixture in each period that satisfies rigid
dietary and weight specifications while responding to shifting market rates.

1. **Dietary Adherence:** Throughout every period, the resulting blend must achieve a designated aggregate mass. The
   combined quantities of all dietary components must remain within prescribed lower and upper limits for each nutrient
   type.

2. **Formula Requirements:** A designated subset of components, represented by $\mathcal{G} \subset \mathcal{I}$, is
   required to comprise a fixed proportion $\alpha$ of the overall mixture mass to guarantee nutritional standards.

3. **Stock Management & Distribution:** The operation maintains a storage facility with a defined capacity limit $K$ for
   every component. A starting inventory $q_i$ is provided for each item. Decisions must be made each period regarding
   the volume to acquire externally ($x_{it}$) versus the volume to withdraw from stored reserves to create the
   blend ($y_{it}$), ensuring inventory continuity over time.

4. **Financial Optimization:** Component procurement prices $c_{it}$ fluctuate across periods. Additionally, retaining
   components in storage generates a periodic holding charge $\rho$ per unit.

The overarching task is to determine a cost-effective acquisition and mixing plan that reduces the overall expenditure (
combining all acquisition expenses and storage charges) across the full timeline, effectively timing acquisitions to
capitalize on lower rates and secure supply.

[//]: # (Generated using qwen3.6:latest from D001 description.en.md and model.mzn)
