# Energy Management Plan

The system comprises photovoltaic arrays, a battery bank, and a hybrid inverter that must generate a schedule intended
to lower the household's operating expense. The network operates under a net‑billing scheme in which the price paid for
importing electricity and the price received for exporting electricity varies from one interval to the next. The
planning horizon is split into discrete steps (typically a few minutes), each bearing its own import and export price.
Forecasts of the home's demand and of the renewable output are available for every step; the inverter may also be
instructed to curtail its output on request.

To safeguard the operation, the schedule must respect margins for anticipated surplus demand and for possible shortfall
in generation. The battery's state‑of‑charge (SoC) measured in kilowatt‑hours is required to remain inside prescribed
limits; the initial SoC is prescribed and the terminal SoC must meet a minimum threshold. Conversion efficiencies for
charging and discharging are known, as is the storage efficiency that links consecutive steps. A per‑kilowatt‑hour
charge fee is derived from the battery’s sell price, its nominal cycle count, and its capacity.

Peak‑shaving limits restrict the amount of energy that may be exported, charged, or discharged during any step.

For each step the plan must select the quantities of generation, grid import, export, charging, discharging, and the
resulting SoC, together with the monetary flows associated with them. The power balance in every step must satisfy an
accounting equation that ties demand, the surplus‑margin, charging activity, export, net production, adjusted discharge,
and import together. It is forbidden to conduct both import and export, or both charge and discharge, within the same
step.

The objective is to minimise the net operating cost, defined as the sum of all incurred charges minus the sum of all
earnings.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
