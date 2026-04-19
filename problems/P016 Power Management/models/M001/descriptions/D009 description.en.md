# Solar‑Battery Household Energy Optimisation

## 1.  Problem Overview  
A residential system combines photovoltaic panels, a storage battery, and a hybrid inverter that can operate on‑grid under a net‑metering tariff.  Prices for buying and selling electricity vary over time; when the selling price is negative the grid must not be fed.  For each planning period (typically a few minutes) the system is supplied with:

| Symbol | Meaning |
|--------|---------|
| *t* | A time period |
| *Cₜ* | Forecasted household consumption in kWh |
| *P̂ₜ* | Forecasted PV generation in kWh |
| *bₜ* | Electricity buying price per kWh |
| *sₜ* | Electricity selling price per kWh |

Additionally the model contains two safety‑margin parameters that allow the plan to be conservative:

* *Eₑ* – extra kWh to cover unforeseen consumption  
* *Eᵤ* – extra kWh to cover unexpected shortfall in generation  

The battery has a prescribed operating window:

* *SoCₘᵢₙ* ≤ *SoCₜ* ≤ *SoCₘₐₓ*  
* initial charge *SoC₀*  
* required final charge *SoC_F* (the battery must end the horizon with at least this value)

Conversion efficiencies are known:

* *η_c* – charging efficiency (DC → AC)  
* *η_d* – discharging efficiency (AC → DC)  
* *η_s* – storage efficiency (SoC decay between periods)  

Charging also incurs a wear cost, expressed as a per‑kWh expense *cₑ* that depends on the battery’s nominal cycle life and capacity.

Peak‑shaving limits bound the actions that can be taken in any period:

* *Sₘₐₓ* – maximum kWh that may be sold  
* *Cₘₐₓ* – maximum kWh that may be charged  
* *Dₘₐₓ* – maximum kWh that may be discharged  

The plan must decide, for every period *t*:

| Symbol | Action |
|--------|--------|
| *pₜ* | Actual energy produced (kWh) |
| *bₜ* | Energy bought from the grid (kWh) |
| *sₜ* | Energy sold to the grid (kWh) |
| *cₜ* | Energy used to charge the battery (kWh) |
| *dₜ* | Energy extracted from the battery (kWh) |
| *SoCₜ* | Battery state of charge at period end (kWh) |
| *costₜ* | Monetary cost incurred in the period |
| *earnₜ* | Monetary earnings in the period |

The overall cost of the horizon is the sum of all *costₜ* minus the sum of all *earnₜ*.

---

## 2.  Decision Variables and Their Domains  

| Symbol | Allowed values |
|--------|----------------|
| *pₜ* | 0 … *P̂ₜ* |
| *bₜ* | 0 … ∞ (unbounded) |
| *sₜ* | 0 … *Sₘₐₓ* |
| *cₜ* | 0 … *Cₘₐₓ* |
| *dₜ* | 0 … *Dₘₐₓ* |
| *SoCₜ* | *SoCₘᵢₙ* … *SoCₘₐₓ* |

---

## 3.  Constraints  

1. **Production limit**  
   \( pₜ \le P̂ₜ \) for every *t*.

2. **Energy balance**  
   For each period  
   \[
   Cₜ + Eₑ + cₜ + sₜ \;=\; pₜ - Eᵤ + η_d\,dₜ + bₜ
   \]
   (consumption, safety margins, charging and selling must equal generation, undersupply, discharging, and buying).

3. **Exclusive actions**  
   • *sₜ* and *bₜ* cannot both be positive in the same period.  
   • *cₜ* and *dₜ* cannot both be positive in the same period.

4. **Battery dynamics**  
   For the first period,  
   \( SoC₁ = SoC₀·η_s + η_c·c₁ - d₁ \).  
   For subsequent periods,  
   \( SoCₜ = SoC_{t-1}·η_s + η_c·cₜ - dₜ \).

5. **Final state of charge**  
   \( SoC_{last} \ge SoC_F \).

6. **Cost and earnings**  
   *costₜ* = *bₜ*·*bₜ* price + *cₜ*·(*cₑ* / *η_c*)  
   *earnₜ* = *sₜ*·*sₜ* price  

The total cost of the horizon is  
\( \text{TotalCost} = \sum_t \text{cost}_t \)  
and the total earnings are  
\( \text{TotalEarn} = \sum_t \text{earn}_t \).

---

## 4.  Objective  

Minimise the net operating cost:
\[
\min \; \text{TotalCost} \;-\; \text{TotalEarn}
\]

---

## 5.  Output  

The solution is presented as a CSV with the following columns per period:

| Column | Description |
|--------|-------------|
| period | *t* |
| consumption | *Cₜ* |
| production | *pₜ* |
| buy | *bₜ* |
| sell | *sₜ* |
| charge | *cₜ* |
| discharge | *dₜ* |
| SoC | *SoCₜ* |
| cost | *costₜ* |
| earn | *earnₜ* |

Additionally a header line reports the aggregated figures:
* total cost, total earnings, and the resulting net operating cost.

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn)
