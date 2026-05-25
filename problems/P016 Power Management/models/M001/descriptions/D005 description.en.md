# Residential Power Optimization

A home energy management system, integrating photovoltaic panels, a battery, and a hybrid inverter, must create a
strategic power plan designed to minimize the homeowner’s monthly energy expenses. The system operates within a dynamic
net billing framework, where electricity purchase and selling rates fluctuate across different time intervals. These
intervals, typically several minutes long, are associated with specific price levels, generally available 24-48 hours
beforehand. Notably, selling electricity may yield negative returns, prohibiting sales in those instances.

Based on past energy consumption patterns and forecasted weather conditions, an anticipated energy demand is estimated
for each interval, and similarly, the expected energy generation from the solar panels is predicted. The inverter
possesses the capability to limit energy production proactively, accommodating deviations below the anticipated output.
The plan must incorporate safety buffers to address both oversupply and undersupply situations.

Throughout each interval, the battery’s state of charge (SoC), measured in kilowatt-hours (kWh), must remain within a
defined range. The battery’s initial SoC is established at a specific value, while the minimum permissible final SoC at
the end of the operational timeframe is also determined. The system accounts for the efficiencies of converting AC to DC
for battery charging and DC to AC for battery discharging. Furthermore, the battery undergoes energy loss between
intervals, quantified by an estimated storage efficiency. The battery’s longevity is also considered, with charging
impacting its remaining lifespan. The cost of charging is calculated as the battery price divided by the battery’s
nominal number of charge cycles divided by the battery capacity.

To safeguard against overheating and potential hardware damage, maximum energy limits are imposed for selling, charging,
and discharging during each interval.

For every interval, the plan must determine the appropriate amounts for energy production, purchases, sales, charging,
discharging, and the resulting SoC, along with the associated monetary gains and losses.

Maintaining a balance between consumed, charged, sold, and produced, discharged, and bought energy is essential.
Simultaneous energy buying and selling, as well as simultaneous charging and discharging of the battery, are prohibited.

The ultimate objective is to minimize the overall operating cost, which is defined as the sum of all costs minus the sum
of all earnings.


[//]: # (Generated using gemma3:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
