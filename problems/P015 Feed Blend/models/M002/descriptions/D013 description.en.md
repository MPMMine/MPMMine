# Planning feed production

We are asked to run a livestock‑feed plant across a series of decision horizons. In every horizon we must create a
homogeneous feed mixture that satisfies rigid nutritional ceilings and floors while the market prices of raw items
shift.

1. **Nutritional Uniformity** – For each planning slice the combined mass of all essential nutrients must lie inside a
   prescribed lower and upper envelope.

2. **Ingredient‑Group Mandate** – A designated subset of raw items (denoted #GRAINS) is required to occupy at least 20%
   of the final blend’s mass, guaranteeing a minimum quality threshold.

3. **Stock Management & Flow** – The operation maintains a limited warehouse for each raw material. Beginning with an
   #INITIAL_STOCK vector, the planner decides, in each slice, how much of each material to acquire versus how much to
   draw from existing reserves. The stock balance obeys: ending reserve = prior reserve + purchases – consumption.

4. **Economic Considerations** – Each raw material carries a time‑varying unit price. Moreover, any unit retained in
   storage accrues a per‑period holding fee. The overall aim is to minimise the sum of purchase expenditures and storage
   fees over the entire planning horizon, i.e., to “buy cheap” and defer usage when advantageous.

The model therefore seeks a procurement‑and‑blending timetable that respects all nutritional, compositional, and storage
constraints while delivering the lowest possible total expenditure.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
