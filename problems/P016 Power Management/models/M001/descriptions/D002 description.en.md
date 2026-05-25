# Energy Optimization System

A domestic energy management system with solar panels, a battery storage unit, and a hybrid inverter must produce an
efficient power strategy to reduce overall household expenses. The system operates in a grid-connected mode under a net
billing scheme, where energy purchase and sale costs vary over time. Each day is divided into short intervals with
specific rates assigned to each. These rate data are usually available 24-48 hours beforehand. Note that sale rates can
be negative, in which case energy sales are not allowed.

Based on historical energy usage, an energy consumption prediction is available for each time slot. Similarly, using
weather forecasts, an energy generation prediction is provided. The inverter includes mechanisms to reduce output below
the predicted level as needed. The plan must incorporate certain buffers for extra energy use and shortfalls in energy
generation.

For all time slots, the battery charge level (SOC) must stay within specified limits. The starting SOC is set to a
particular value, and the minimum SOC at the end of the planning period is defined. The efficiencies for converting AC
to DC during battery charging and DC to AC during discharging are known. The battery loses some energy over time, with a
retention efficiency estimated between consecutive time slots. Charging affects the battery's lifespan, and the cost per
charge cycle is based on the battery's nominal capacity.

To avoid equipment overheating or damage, maximum limits are applied to the energy sold, charged, and discharged in each
time slot.

For every time slot, the plan must specify values for energy generated, purchased, sold, stored, and discharged, along
with the resulting SOC, and the related financial costs and revenues.

In each time slot, the balance among energy used, stored, sold, generated, discharged, and bought must be maintained.
Energy purchase and sale cannot occur simultaneously in the same time slot. Battery charging and discharging also cannot
be done at the same time.

The objective is to minimize the total operational cost, which is the sum of all costs minus the sum of all earnings.

[//]: # (Generated using deepseek-r1:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
