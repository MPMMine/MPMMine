# Solar-Battery Household Energy Optimisation

## 1. Problem Overview

A residential system combines photovoltaic panels, a storage battery, and a hybrid inverter that can operate on‑grid
under a net‑billing tariff. Prices for buying and selling electricity vary over time; when the selling price is negative
the grid must not be fed. For each planning period (typically a few minutes) the system is supplied with:

| Symbol | Meaning                                 |
|--------|-----------------------------------------|
| *t*    | A time period                           |
| *Cₜ*   | Forecasted household consumption in kWh |
| *P̂ₜ*  | Forecasted PV generation in kWh         |
| *bₜ*   | Electricity buying price per kWh        |
| *sₜ*   | Electricity selling price per kWh       |

Additionally the model contains two safety‑margin parameters that allow the plan to be conservative:

* *Eₑ* - extra kWh to cover unforeseen consumption
* *Eᵤ* - extra kWh to cover unexpected shortfall in generation

The battery has a prescribed operating window:

* *SoCₘᵢₙ* ≤ *SoCₜ* ≤ *SoCₘₐₓ*
* initial charge *SoC₀*
* required final charge *SoC_F* (the battery must end the horizon with at least this value)

Conversion efficiencies are known:

* *η_c* - charging efficiency (DC → AC)
* *η_d* - discharging efficiency (AC → DC)
* *η_s* - storage efficiency (SoC decay between periods)

Charging also incurs a wear cost, expressed as a per‑kWh expense *cₑ* that depends on the battery’s nominal cycle life
and capacity.

Peak‑shaving limits bound the actions that can be taken in any period:

* *Sₘₐₓ* - maximum kWh that may be sold
* *Cₘₐₓ* - maximum kWh that may be charged
* *Dₘₐₓ* - maximum kWh that may be discharged

The plan must decide, for every period *t*:

| Symbol  | Action                                      | Domain              |
|---------|---------------------------------------------|---------------------|
| *pₜ*    | Actual energy produced (kWh)                | 0 … *P̂ₜ*           |
| *bₜ*    | Energy bought from the grid (kWh)           | 0 … ∞ (unbounded)   |
| *sₜ*    | Energy sold to the grid (kWh)               | 0 … *Sₘₐₓ*          |
| *cₜ*    | Energy used to charge the battery (kWh)     | 0 … *Cₘₐₓ*          |
| *dₜ*    | Energy extracted from the battery (kWh)     | 0 … *Dₘₐₓ*          |
| *SoCₜ*  | Battery state of charge at period end (kWh) | *SoCₘᵢₙ* … *SoCₘₐₓ* |
| *costₜ* | Monetary cost incurred in the period        | 0 … ∞ (unbounded)   |
| *earnₜ* | Monetary earnings in the period             | 0 … ∞ (unbounded)   |

The overall cost of the horizon is the sum of all *costₜ* minus the sum of all *earnₜ*.

## 2. Constraints

1. **Production limit**  
   $ pₜ \le P̂ₜ $ for every *t*.

2. **Energy balance**  
   For each period  
   $$
   Cₜ + Eₑ + cₜ + sₜ = pₜ - Eᵤ + η_d\,dₜ + bₜ
   $$
   (consumption, safety margins, charging and selling must equal generation, undersupply, discharging, and buying).

3. **Exclusive actions**  
   • *sₜ* and *bₜ* cannot both be positive in the same period.  
   • *cₜ* and *dₜ* cannot both be positive in the same period.

4. **Battery dynamics**  
   For the first period,  
   $ SoC₁ = SoC₀·η_s + η_c·c₁ - d₁ $.  
   For subsequent periods,  
   $ SoCₜ = SoC_{t-1}·η_s + η_c·cₜ - dₜ $.

5. **Final state of charge**  
   $ SoC_{last} \ge SoC_F $.

6. **Cost and earnings**  
   *costₜ* = *bₜ*·*bₜ*price + *cₜ*·(*cₑ*/*η_c*)  
   *earnₜ* = *sₜ*·*sₜ*price

The total cost of the horizon is  
$ \text{TotalCost} = \sum_t \text{cost}_t $  
and the total earnings are  
$ \text{TotalEarn} = \sum_t \text{earn}_t $.

## 3. Objective

Minimise the net operating cost:
$$
\min \text{TotalCost} - \text{TotalEarn}
$$

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; minor manual amendments)
