# Household Energy Optimization

A residential energy management system featuring solar panels, a battery storage unit, and a hybrid inverter is required
to produce an efficient operational plan aimed at reducing total household expenses. The system operates in a
grid-connected configuration with a net billing mechanism, where the costs for purchasing and selling electricity vary
dynamically over time. Each day is split into discrete time slots, and specific rates are assigned to each slot. Price
data is usually accessible 24 to 48 hours prior to the planning horizon. Note that sell rates can be negative, in which
case no sales are permitted.

Leveraging historical patterns, a forecast of energy demand is developed for each time slot. Similarly, utilizing
weather predictions, an estimate of energy generation from the solar panels is available. The system includes provisions
for incorporating safety buffers to account for uncertainties in consumption and production forecasts.

Battery operation must adhere to strict charge level constraints, with an initial charge specified and a minimum charge
required at the end of the planning period. Key parameters include the efficiency of energy conversion during charging
and discharging, as well as the efficiency of energy storage between consecutive time slots. Additionally, the cost per
unit of charge is determined based on the battery's selling price, its expected lifespan in terms of charge cycles, and
its capacity. To avoid equipment strain or damage, upper limits are enforced on the maximum energy that can be sold,
charged, or discharged in any single time slot.

For each time slot, the plan specifies the amounts for energy generation, purchases, sales, battery charging, battery
discharging, and the resulting battery charge level, along with the associated financial costs and revenues. The system
must satisfy a balance equation that accounts for all energy inputs and outputs, ensuring that no energy is both bought
and sold in the same period, and that charging and discharging do not occur simultaneously. The objective is to minimize
the net operational cost by subtracting all earnings from the sum of all expenditures.

[//]: # (Generated using deepseek-r1:latest from D001 description.en.md and model.mzn)
