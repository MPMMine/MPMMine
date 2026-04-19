# Power Management

A home power management solution comprising photovoltaic panels, a battery, and a hybrid inverter, must generate an
optimized power management plan to minimize household operating costs. The system operates in on-grid mode under a
net energy billing scheme, where electricity buy and sell prices fluctuate over time. Each day is divided into discrete
intervals (typically several minutes), with specific prices assigned to each. Pricing data is generally available 24–48
hours in advance. Note that selling prices may be negative, in which case selling is prohibited.

Based on the past energy usage, an energy consumption forecast is available for each period. Similarly, based on the
weather forecast, an energy production forecast is available too. The inverter has technical means to reduce production
on demand below the estimated level. The plan must include some safety margins for excess energy consumption and
undersupply production.

In all periods, the battery state of charge (SoC) in kWh must fall into a given range. The initial SoC is set to a
specific value and the lower bound on the final SoC at the end of the planning horizon is given. The efficiencies of
AC/DC conversion to charge the battery and DC/AC conversion when discharging are known. The charged battery loses some
energy over time, where the storage efficiency between consecutive periods is estimated. Charging the battery deprecates
its longevity. The unit cost of charging is calculated as the battery sell price divided by the nominal number of
charging cycles divided by the battery capacity.

To prevent overheating or hardware damage, peak shaving limits are imposed on energy sold, charged, and
discharged on each period.

For every period, the plan must determine the energy values for production, purchases, sales, charging, discharging, and
the resulting SoC, as well as the associated monetary costs and earnings.

For each period the balance between energy consumed, charged, sold, and produced, discharged, and bought must be kept.
It is prohibited to buy and sell energy in the same period. Similarly, battery must not be charged and discharged in
the same period.

The objective is to minimize the total operating cost given as the sum of all costs minus the sum of all earnings.
