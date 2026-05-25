# Residential Energy Optimization

A smart home energy management system, featuring solar panels, a storage unit, and a versatile inverter, aims to create
an optimal energy strategy to reduce household expenses. The setup functions in grid-connected mode with a net billing
policy, where electricity purchase and sale rates vary throughout the day. Each day is segmented into distinct time
slots (usually a few minutes each), each with its own pricing. Price information is typically accessible 1–2 days ahead.
Note that selling rates can be negative, which means selling is not allowed during those times.

Based on historical data, an energy demand forecast is provided for each interval. Similarly, based on meteorological
predictions, an energy generation forecast is also available. The inverter can adjust production levels below the
forecasted amount if needed. The plan should incorporate safety buffers for surplus energy use and insufficient
generation.

Throughout all intervals, the battery's state of charge (SoC) in kWh must remain within a specified range. The starting
SoC is set to a particular value, and the minimum final SoC at the end of the planning period is provided. The
efficiencies of converting AC/DC for battery charging and DC/AC for discharging are known. The charged battery
experiences some energy loss over time, with the storage efficiency between consecutive intervals estimated. Charging
the battery reduces its lifespan. The cost per charge is calculated as the battery's sale price divided by the total
number of charging cycles divided by the battery's capacity.

To avoid overheating or equipment damage, peak reduction limits are set on energy sold, charged, and discharged during
each interval.

For each interval, the plan must determine the energy amounts for generation, acquisitions, sales, charging,
discharging, and the resulting SoC, along with the associated financial costs and revenues.

For each interval, the balance between energy consumed, charged, sold, and generated, discharged, and purchased must be
maintained. It is not allowed to buy and sell energy within the same interval. Similarly, the battery must not be
charged and discharged simultaneously.

The goal is to minimize the overall operating expense, calculated as the sum of all costs minus the sum of all revenues.

[//]: # (Generated using mistral-small3.2 from D001 description.en.md and model.mzn)
