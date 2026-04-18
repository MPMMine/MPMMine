# Optimizing Cattle Feed Production

The task involves planning the procurement, storage, and blending of feed components across a series of planning
intervals. Decision makers must guarantee that each interval yields a homogeneous mixture whose total mass matches a
predetermined target while satisfying a suite of nutritional and compositional constraints. At the same time, they must
respect physical storage limits, manage evolving inventories, and respond to time‑varying purchase prices and
warehousing charges. The ultimate aim is to generate a purchasing and blending timetable that yields the smallest
possible aggregate expense, comprising both acquisition outlays and the cost of holding stock over time.

## Key structural elements

- Let **I** denote the collection of raw material categories (e.g., corn, soybean, wheat).
- Let **J** represent the set of nutrient components that must be tracked (e.g., crude protein, digestible energy).
- Let **T** be the index set of planning horizons (e.g., weeks or months).
- Let **G** be a distinguished subset of **I** that corresponds to grain‑type constituents.

## Parameters expressed symbolically

- `c[i,t]` denotes the unit purchase cost for ingredient *i* during period *t*.
- `a[i,j]` captures the amount of nutrient *j* contributed per unit of ingredient *i*.
- `r_min[j]` and `r_max[j]` are the lower and upper bounds for nutrient *j* in the final blend.
- `W_target` is the required total mass of the blended product for every period.
- `Cap` signifies the maximum storable quantity for each ingredient at any point.
- `h` is the per‑unit‑per‑period holding expense.
- `S0[i]` denotes the initial inventory level of ingredient *i* at the start of the planning horizon.

## Core modeling components

1. **Decision variables**
    - `p[i,t]` – quantity of ingredient *i* bought in period *t*.
    - `u[i,t]` – quantity of ingredient *i* placed into the blend during period *t*.
    - `inv[i,τ]` – stock of ingredient *i* remaining at the end of period *τ* (τ ranges over an extended time index).

2. **Inventory dynamics**
    - The stock level at the start (`τ = 0`) equals the known initial stock: `inv[i,0] = S0[i]`.
    - For each subsequent period, the balance equation enforces that the ending stock equals the prior stock plus
      purchases minus usage: `inv[i,τ] = inv[i,τ‑1] + p[i,τ] – u[i,τ]`.

3. **Production requirement**
    - The aggregated usage of all ingredients in any period must exactly meet the target mass:
      `∑_{i∈I} u[i,t] = W_target`.

4. **Nutritional specifications**
    - For every nutrient *j* and period *t*, the weighted sum of its contributions must lie between the prescribed
      limits:  
      `∑_{i∈I} (u[i,t] * a[i,j]) ≥ r_min[j]` and
      `∑_{i∈I} (u[i,t] * a[i,j]) ≤ r_max[j]`.

5. **Composition rule**
    - The total mass contributed by the grain subset must constitute at least a fixed fraction of the blend:
      `∑_{i∈G} u[i,t] ≥ 0.20 * W_target`.

6. **Economic objective**
    - The optimization criterion aggregates purchase expenditures and storage charges:
      `Minimize  Σ_{i∈I, t∈T} (p[i,t] * c[i,t]) + Σ_{i∈I, τ∈T} (inv[i,τ] * h)`.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
