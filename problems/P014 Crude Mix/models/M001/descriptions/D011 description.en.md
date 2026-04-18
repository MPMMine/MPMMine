# Crude Slate Optimization (Refinery Blend)

This formulation captures the selection and blending of a collection of **CrudeSet** varieties to generate marketable
fuels. The refinery may procure from a domain of crudes denoted **CRUDES**, where each index *i* identifies a distinct
oil grade. Every grade exhibits its own chemical profile---some are "light and sweet," delivering a high proportion of
gasoline and low sulfur, while others are "heavy and sour," yielding more heating oil but containing greater sulfur. In
addition, each grade carries a unique purchase price and requires a specific amount of labor time and energy per unit
volume.

Decision makers must determine *quantity_i*---the volume of each crude *i* to process. The objective is to maximise
total net profit, defined as the revenue obtained from selling the blended outputs of **ProductTypes** (gasoline, jet
fuel, heating oil) at their market prices, less the total purchase cost of the crudes.

The model is subject to a series of constraints:

- **Availability and Capacity** – the processed volume of each crude *i* cannot exceed its *maxSupply_i*, and the
  aggregate volume across all crudes must stay within the refinery’s *totalCapacity*.
- **Financial Ceiling** – total expenditure on crudes must remain inside the *budgetLimit*.
- **Workforce Constraint** – the combined labor contribution, weighted by *labor_i*, must not surpass the *laborLimit*.
- **Environmental Rule** – the weighted sum of sulfur content, using *sulfur_i*, must stay under *sulfurLimit*.
- **Contractual Guarantees** – for each *ProductType* the blended output must meet or exceed the required minimum,
  expressed through *minDemand_p*.
- **Composition Requirement** – a designated minimum fraction of the total blend must originate from a specific crude,
  captured by the symbolic rule *FractionConstraint*.

All constraints intersect to delineate a feasible region, within which the optimisation seeks the highest possible
profit.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn)
