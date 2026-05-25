# Energy Optimization System

A residential energy optimization system featuring solar panels, a battery, and a hybrid inverter, aims to create an
optimized energy management strategy to reduce household operational expenses. The system functions in grid-connected
mode under a net billing policy, where electricity purchase and sale rates vary over time. Each day is segmented into
distinct intervals (usually a few minutes each), with unique prices assigned to each. Pricing information is typically
accessible 24-48 hours ahead. Note that selling rates can be negative, in which case selling is not allowed.

Based on historical energy consumption, an energy demand forecast is available for each interval. Similarly, based on
weather predictions, an energy generation forecast is also available. The inverter has the capability to reduce
generation on demand below the forecasted level. The plan must incorporate safety buffers for surplus energy consumption
and insufficient production.

Throughout all intervals, the battery's state of charge (SoC) in kWh must remain within a specified range. The initial
SoC is set to a particular value, and the minimum final SoC at the end of the planning horizon is provided. The
efficiencies of AC/DC conversion for charging the battery and DC/AC conversion for discharging are known. The charged
battery experiences some energy loss over time, with the storage efficiency between consecutive intervals estimated.
Charging the battery reduces its lifespan. The cost per unit of charging is determined by the battery's sale price
divided by the nominal number of charging cycles divided by the battery capacity.

To avoid overheating or equipment damage, peak reduction limits are applied to energy sold, charged, and discharged
during each interval.

For every interval, the plan must specify the energy amounts for generation, purchases, sales, charging, discharging,
and the resulting SoC, along with the associated monetary costs and revenues.

For each interval, the balance between energy consumed, charged, sold, and generated, discharged, and purchased must be
maintained. It is not permitted to buy and sell energy within the same interval. Similarly, the battery must not be
charged and discharged in the same interval.

The goal is to minimize the total operational cost, calculated as the sum of all costs minus the sum of all earnings.

[//]: # (Generated using mistral-small3.2 from D001 description.en.md and model.mzn; minor manual amendments applied)
