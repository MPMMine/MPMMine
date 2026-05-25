# Power‑Management Optimization

A residential energy‑control system combines photovoltaic generation, a storage unit, and a hybrid inverter, and it must
produce a schedule that minimizes the net operating expense while respecting all technical limits.  
The planning horizon is divided into a finite set of **periods** (indexed by **PERIODS**). For each **period** the
following data are known ahead of time:

- **CONSUMPTION**[p] – the forecasted household demand (kWh).
- **EST_PRODUCTION**[p] – the forecasted renewable output (kWh).
- **BUY_PRICE**[p] and **SELL_PRICE**[p] – the unit cost of purchasing electricity and the unit revenue from exporting
  electricity, respectively.

Two safety margins are defined: **EXCESS_CONS** (a buffer for possible over‑consumption) and **UNDERSUPPLY_PROD** (a
buffer for anticipated shortfall in generation).

The storage device is characterized by:

- Allowable **SOC** values ranging from **SOC_MIN** to **SOC_MAX**; the initial state is **SOC_INIT** and the terminal
  state must satisfy **SOC_FIN** (a lower bound).
- Conversion efficiencies **CHARGE_EFF** (input‑to‑output ratio when charging) and **DISCHARGE_EFF** (output‑to‑input
  ratio when discharging), as well as **STORE_EFF**, the efficiency with which energy is retained from one period to the
  next.
- A per‑kWh charging expense **CHARGE_COST**, derived from the battery’s sell price, nominal cycle count and capacity.

Operational limits on each period are expressed by the parameters **SHAVE_SELL**, **SHAVE_CHARGE** and **SHAVE_DISCHARGE
**, which bound the amounts that can be sold, charged and discharged, respectively.

Decision variables associated with every period **p** include:

- **PRODUCTION[p]** – the actual generated energy (bounded above by **EST_PRODUCTION[p]**).
- **BUY[p]**, **SELL[p]**, **CHARGE[p]**, **DISCHARGE[p]** – the magnitudes of purchases, sales, charging and
  discharging, each limited by the respective shave parameter where applicable.
- **SOC[p]** – the state of charge at the end of the period, constrained to stay within **SOC_MIN** and **SOC_MAX**.

Auxiliary variables capture monetary flows: **COST[p]** (the expense incurred in period *p*) and **EARN[p]** (the
revenue earned in period *p*); global aggregates **TOTAL_COST** and **TOTAL_EARN** sum these values over all periods.

All schedules must satisfy the following core relationships:

1. **Energy Balance** – for each period the demand, safety excess, charging activity, and exported energy together equal
   the sum of generated power, anticipated shortfall and discharged energy, plus purchased power.
2. **Mutual Exclusivity** – a period cannot simultaneously involve both buying and selling, nor charging and
   discharging.
3. **State‑of‑Charge Evolution** – the SOC at the start of a period is derived from the previous period’s SOC (adjusted
   by **STORE_EFF**), modified by charging efficiency multiplied by **CHARGE[p]** and reduced by **DISCHARGE[p]**.
4. **Final SOC Requirement** – the SOC at the last period must be at least **SOC_FIN**.
5. **Cost and Revenue Expressions** – **COST[p]** incorporates purchase price multiplied by **BUY[p]** and a scaled
   charging expense; **EARN[p]** is the sell price multiplied by **SELL[p]**.

The objective is to **minimize the difference** between the accumulated expense (**TOTAL_COST**) and the accumulated
revenue (**TOTAL_EARN**), i.e., to achieve the lowest possible net operating cost.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
