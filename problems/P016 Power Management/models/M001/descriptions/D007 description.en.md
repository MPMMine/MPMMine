# Home Energy Optimization

A residential power system, integrating photovoltaic panels, a battery, and an inverter, needs to develop a strategic
power management plan designed to minimize household energy expenses. Operating within a dynamic net energy billing
framework --- where electricity purchase and sale rates fluctuate over time --- the system aims to optimize its
operations. Energy pricing data is typically accessible 24 to 48 hours beforehand. Notably, selling prices may be
negative, prohibiting sales in those periods.

Based on historical energy consumption patterns and forecasted weather conditions, the system anticipates both energy
demand and energy generation. The inverter possesses the ability to modulate energy production to accommodate
anticipated needs. The resulting plan must incorporate buffer capacities to handle unexpected surges in energy
consumption or shortfalls in energy production.

Throughout each period, the battery’s state of charge (SoC) must remain within predetermined limits. The battery begins
with a specified initial SoC, and a minimum SoC level is mandated for the end of the planning timeframe. The
efficiencies associated with converting AC to DC for battery charging and DC to AC for discharging are known. Energy
loss occurs during the storage process between periods, quantified by a storage efficiency. Furthermore, battery
charging incurs a unit cost calculated from the selling price and battery capacity.

To safeguard against overheating and hardware failures, energy sales, charging, and discharging are subject to peak
shaving restrictions for each period.

For every period, the plan must determine the optimal amounts for energy generation, purchases, sales, charging,
discharging, and the resulting battery SoC, along with the associated monetary costs and revenue.

Maintaining a balance between consumed, charged, sold, and produced energy, as well as discharged and bought energy, is
crucial. Simultaneous buying and selling are prohibited, and so are charging and discharging the battery concurrently.

The primary objective is to minimize the total operational cost, which represents the sum of all expenses minus the sum
of all revenues.


[//]: # (Generated using gemma3:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
