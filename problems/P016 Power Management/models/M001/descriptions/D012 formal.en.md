# Energy Management Problem

The planning horizon consists of a finite set **P** of discrete intervals. For each interval *p* the following data are
known:

- **cₚ** – predicted net consumption (kWh)
- **yₚ** – forecasted solar output (kWh)
- **bₚ** – purchase price per kWh
- **sₚ** – sale price per kWh

Additional global parameters are:

- **γ** – allowance for excess consumption
- **δ** – allowance for insufficient generation
- **Sₘᵢₙ**, **Sₘₐₓ**, **S₀**, **S_f** – lower/upper SoC limits, initial charge and required final charge (kWh)
- **ε_ch**, **ε_dis**, **ε_str** – charging, discharging and storage (between‑period) efficiencies (unitless)
- **c_c** – monetary cost per kWh of charging (derived from battery specs)
- **σ_s**, **σ_q**, **σ_d** – peak‑shave caps for selling, charging and discharging (kWh)

Decision variables for each *p* are:

- **Gₚ** – actual generation dispatched (kWh)
- **Uₚ** – amount bought from the grid (kWh)
- **Vₚ** – amount sold back to the grid (kWh)
- **Qₚ** – energy charged into the battery (kWh)
- **Dₚ** – energy discharged from the battery (kWh)
- **Θₚ** – state‑of‑charge at the end of *p* (kWh)

Derived economic terms:

- **Cₚ** = *bₚ·Uₚ* + (*c_c / ε_ch*)·Qₚ
- **Rₚ** = *sₚ·Vₚ*

Summed quantities:

- **C_total** = Σₚ Cₚ
- **R_total** = Σₚ Rₚ

## Objective

Minimise **C_total – R_total**.

## Constraints

1. Generation cannot exceed the forecasted output:  
   Gₚ ≤ yₚ ∀ p∈P.

2. Energy balance for every period:  
   cₚ + γ + Qₚ + Vₚ = yₚ – δ + ε_dis·Dₚ + Uₚ.

3. In each period only one of the following may be positive: selling or buying, and only one of charging or discharging
   may occur.  
   Not (Vₚ>0 ∧ Uₚ>0) and Not (Qₚ>0 ∧ Dₚ>0).

4. State‑of‑charge evolves as:
   Θₚ = (Θₚ₋₁)·ε_str + ε_ch·Qₚ – Dₚ,
   with Θ₀ = S₀, and Θ_final ≥ S_f.

5. SoC must always stay within its bounds:
   Sₘᵢₙ ≤ Θₚ ≤ Sₘₐₓ ∀ p.

6. Peak‑shave limits are observed:
   0 ≤ Vₚ ≤ σ_s, 0 ≤ Qₚ ≤ σ_q, 0 ≤ Dₚ ≤ σ_d.

7. Economic expressions:  
   Cₚ = bₚ·Uₚ + (c_c/ε_ch)·Qₚ, Rₚ = sₚ·Vₚ.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
