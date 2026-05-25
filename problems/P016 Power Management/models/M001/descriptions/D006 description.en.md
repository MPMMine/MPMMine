# Household Energy Optimization

A residential power system, incorporating photovoltaic panels, a battery, and an inverter, needs to generate a strategic
energy plan designed to minimize the overall operating expenses. This system operates in a real-time electricity market
environment called a net energy billing scheme, where both purchasing and selling electricity prices fluctuate
dynamically across time. Each hour is segmented into distinct time intervals, and corresponding price points are
established for each. Typically, this pricing data is accessible 24-48 hours beforehand. Importantly, revenue from
selling electricity might be negative, which effectively prohibits any sales activity.

Based on historical energy consumption data, a forecast of future household energy demands is available for each
interval. Simultaneously, a weather forecast provides anticipated energy production estimates from the photovoltaic
panels. The inverter possesses the capability to modulate its power output downwards, below the projected production
level, when necessary. The plan must include contingency reserves to address both overconsumption and undersupply
conditions.

Throughout each interval, the battery's state of charge (SoC) needs to remain within predefined limits, ranging from a
minimum to a maximum value. The battery’s initial SoC is set at a specific starting level, and a lower bound is mandated
for the final SoC at the conclusion of the planning timeframe. The conversion efficiencies associated with AC-to-DC
charging and DC-to-AC discharging are known. The battery undergoes gradual energy depletion over time, with its storage
efficiency between intervals estimated. Charging the battery also negatively impacts its lifespan. The cost of charging
is calculated as the battery’s price divided by the battery’s nominal number of charge cycles divided by the battery’s
capacity.

To mitigate the risk of overheating or hardware failure, constraints are applied to limit the amount of energy sold,
charged, and discharged during each period.

For each interval, the plan must determine the optimal energy levels for production, purchases, sales, charging,
discharging, and subsequently, the resulting battery SoC, alongside the corresponding monetary gains and losses.

A balance must be maintained between consumed, charged, sold, and produced energy, alongside discharged and purchased
energy, within each interval. It is disallowed to both buy and sell energy in the same period, and battery charging and
discharging are restricted to separate periods.

The objective is to minimize the overall operating cost, calculated as the sum of all costs minus the sum of all
earnings.


[//]: # (Generated using gemma3:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
