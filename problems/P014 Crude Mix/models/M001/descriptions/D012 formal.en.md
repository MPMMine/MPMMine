# Refined Crude Slate Maximization (Petroleum Blending)

The refinery must choose a blend of `Crudes` (`n` different grades) that will be processed each day. Each crude `i` has
a purchase price per barrel, an upper bound on available barrels, a pattern of product yields, sulfur intensity, labor
intensity, and a price per barrel. The blend must satisfy several intertwined conditions:

- **Availability & Capacity** – No more than the known supply of any grade can be taken, and the total barrels processed
  cannot exceed the refinery’s overall throughput limit (`total_cap`).

- **Environmental & Labor Limits** – The aggregate sulfur contribution (`sum_i amount_i * sulfur_i`) must stay below the
  regulatory ceiling (`max_sulfur`), and the combined labor usage (`sum_i amount_i * labor_i`) must not surpass the
  staffing bound (`max_labor`).

- **Financial Constraint** – The spend on raw material (`sum_i amount_i * cost_i`) is bounded by the daily budget (
  `budget`).

- **Market Commitments** – For each product category (`Products = {Gasoline, Jet_Fuel, Heating_Oil}`) the resulting
  amount must meet or exceed contractual minimums (`min_req[p]`), which are derived from the yields matrix (
  `yields[i,p]`).

- **Blend Composition Rule** – A designated primary crude (`index 1`) must constitute at least fifteen percent of the
  total volume (`amount_1 ≥ 0.15 * sum_i amount_i`).

- **Objective** – Maximize the net value, i.e., total revenue from finished products (
  `price[p] * amount_i * yeilds[i,p]`) minus the cost of the selected crudes (`sum_i amount_i * cost_i`).

The decision variables (`amount_i`) represent the exact barrels of each crude to introduce.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; major manual amendments applied)
