# Solar-Battery Household Energy Optimisation

## 1. Problem Overview

a residential system combines photovoltaic panels, a storage battery, and a hybrid inverter that can operate on‑grid
under a net‑billing tariff. Prices for buying and selling electricity vary over time; when the selling price is negative
the grid must not be fed. For each planning period (typically a few minutes) the system is supplied with:

| Symbol | meaning                                 |
|--------|-----------------------------------------|
| *t*    | a time period                           |
| *Ct*   | Forecasted household consumption in kWh |
| $\hat{P}_t$  | Forecasted PV generation in kWh         |
| *bt*   | Electricity buying price per kWh        |
| *st*   | Electricity selling price per kWh       |

additionally the model contains two safety‑margin parameters that allow the plan to be conservative:

* *Eₑ* - extra kWh to cover unforeseen consumption
* *Eᵤ* - extra kWh to cover unexpected shortfall in generation

the battery has a prescribed operating window:

* *SoCmin* ≤ *SoCt* ≤ *SoCmax*
* initial charge *SoC₀*
* required final charge *SoC_F* (the battery must end the horizon with at least this value)

Conversion efficiencies are known:

* *η_c* - charging efficiency (DC → aC)
* *η_d* - discharging efficiency (aC → DC)
* *η_s* - storage efficiency (SoC decay between periods)

Charging also incurs a wear cost, expressed as a per‑kWh expense *cₑ* that depends on the battery’s nominal cycle life
and capacity.

Peak‑shaving limits bound the actions that can be taken in any period:

* *Smax* - maximum kWh that may be sold
* *Cmax* - maximum kWh that may be charged
* *Dmax* - maximum kWh that may be discharged

the plan must decide, for every period *t*:

| Symbol  | action                                      | Domain              |
|---------|---------------------------------------------|---------------------|
| *pt*    | actual energy produced (kWh)                | 0 … $\hat{P}_t$          |
| *bt*    | Energy bought from the grid (kWh)           | 0 … ∞ (unbounded)   |
| *st*    | Energy sold to the grid (kWh)               | 0 … *Smax*          |
| *ct*    | Energy used to charge the battery (kWh)     | 0 … *Cmax*          |
| *dt*    | Energy extracted from the battery (kWh)     | 0 … *Dmax*          |
| *SoCt*  | Battery state of charge at period end (kWh) | *SoCmin* … *SoCmax* |
| *costt* | monetary cost incurred in the period        | 0 … ∞ (unbounded)   |
| *earnt* | monetary earnings in the period             | 0 … ∞ (unbounded)   |

the overall cost of the horizon is the sum of all *costt* minus the sum of all *earnt*.

## 2. Constraints

1. **Production limit**  
$pt \le \hat{P}\_t$ for every *t*.

2. **Energy balance**  
For each period

$$
Ct + Eₑ + ct + st = pt - Eᵤ + η_d\,dt + bt
$$

(consumption, safety margins, charging and selling must equal generation, undersupply, discharging, and buying).

4. **Exclusive actions**  
• *st* and *bt* cannot both be positive in the same period.  
• *ct* and *dt* cannot both be positive in the same period.

5. **Battery dynamics**  
For the first period,  
$SoC₁ = SoC₀·η_s + η_c·c₁ - d₁$.  
For subsequent periods,  
$SoCt = SoC_{t-1}·η_s + η_c·ct - dt$.

6. **Final state of charge**  
$SoC\_{last} \ge SoC\_F$.

7. **Cost and earnings**  
*costt* = *bt*·*bt*price + *ct*·(*cₑ*/*η_c*)  
*earnt* = *st*·*st*price

the total cost of the horizon is  
$\text{totalCost} = \sum_t \text{cost}_t$  
and the total earnings are  
$\text{totalEarn} = \sum_t \text{earn}_t$.

## 3. Objective

minimise the net operating cost:

$$
\min \text{totalCost} - \text{totalEarn}
$$

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; minor manual amendments)
