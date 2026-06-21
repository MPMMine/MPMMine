# Feed Production Scheduling

Plan the operation of a cattle‑feed plant over a chosen planning horizon that consists of several consecutive periods.
In each period a single blended product must be created that satisfies both mass and nutritional specifications while
coping with fluctuating prices.

1. **Mass Requirement** – For every period *T ∈ TimeSet* the blended output has to reach a predetermined total mass, **TargetWeight**.

2. **Nutrition Requirement** - The combined amount of all constituent nutrients must stay inside a lower and an upper
   bound that are defined for each nutrient *N ∈ NutrientSet* (**MinReq[N]** ≤ nutrient‑sum ≤ **MaxReq[N]**).

3. **Ingredient‑type Rule** – A designated group of inputs, referred to as **GrainsSet**, is required to make up at
   least a fixed fraction (20%) of the final blend’s mass. This rule is intended to preserve a minimum quality level.

4. **Stock Management** – The plant maintains a warehouse for each raw material *I ∈ IngredientSet*. At the beginning a
   known quantity, **InitialStock[I]**, of each material is already on hand. During each planning step you decide how
   much of each material to acquire and how much to withdraw from existing stock. The inventory level of every material
   at the end of a period is limited by **StorageCap**.

5. **Economic Factors** – Prices for the raw materials differ across the planning horizon; the cost of acquiring
   material *I* at period *T* is denoted **Cost[I,T]**. Moreover, keeping material *I* in the warehouse incurs a
   carrying charge per unit per period, **HoldingCost**. The overall aim is to choose purchase timings and blend
   compositions that minimise the sum of all purchase expenditures and carrying fees incurred over the entire horizon.

## Decision variables

- For every material *I* and period *T* a non‑negative purchase quantity **Buy[I,T]**.
- For every material *I* and period *T* an amount **Use[I,T]** that is taken from the stock to be incorporated into the
  blend.
- For every material *I* and intermediate time index $T ∈ TimeSet \cup \\{0\\}$ a non‑negative stock level **Stock[I,T]**
  maintained at the end of that period.

## Constraints

- The initial stock level is known for all *I*:
  `Stock[I, 0] = IntialStock[I]`
- For each period *T*, the stock carried equals the previous period’s stock plus purchases minus usage:  
  `Stock[I,T] = Stock[I,T‑1] + Buy[I,T] – Use[I,T]`.
- For each period *T*, the total of all usage quantities in a period must equal the target total mass:  
  `Σ_I Use[I,T] = TargetWeight`.
- For each period *T*, and for each nutrient *N* the weighted sum of its presence in the period’s blend must fall
  between the stipulated bounds:  
  `Σ_I (Use[I,T] × Comp[I,N]) ≥ MinReq[N]` and `≤ MaxReq[N]`.
- The total usage of materials belonging to **GrainsSet** in all periods *T* must meet or exceed the required fraction
  of the total mass:  
  `Σ_{I ∈ GrainsSet} Use[I,T] ≥ 0.2 × TargetWeight`.

**Objective** – Minimise the aggregate of (price × quantity) over all materials and periods plus the aggregate of (
carrying charge × ending stock) over all materials and periods.


[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn)
