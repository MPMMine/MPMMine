# Power Management

A residential energy‑management system that integrates photovoltaic panels, a battery, and a hybrid inverter must
construct an optimal schedule to minimise the household’s operating expense.  
The system is assumed to operate in on‑grid mode under a net‑energy billing arrangement, where the purchase and sale
tariffs change over time.  
Time is divided into a finite set of periods $P$ (usually every few minutes); the tariff schedule for each period is
known 24-48 h in advance, and may be negative, in which case exporting is disallowed.

Energy consumption is forecasted for each period, and a production forecast is derived from weather data.  
The inverter can throttle production below the estimate on demand, and a safety buffer is required to cover both excess
consumption and undersupply of generation.

## Battery and Efficiency Parameters

For the storage system the following parameters are defined:

| Symbol                                   | Meaning                                                       |
|------------------------------------------|---------------------------------------------------------------|
| $\text{soc}_{\min}$, $\text{soc}_{\max}$ | Minimum and maximum state‑of‑charge limits (kWh)              |
| $\text{soc}_{0}$                         | Initial SoC at the beginning of the horizon                   |
| $\text{soc}_{f}$                         | Mandatory lower bound on the final SoC                        |
| $\eta_{\text{c}}$, $\eta_{\text{d}}$     | Charging and discharging efficiencies (output‑to‑input ratio) |
| $\eta_{\text{s}}$                        | Storage efficiency between successive periods                 |
| $\text{price}_{\text{buy},p}$            | Energy buy price per kWh in period $p$                        |
| $\text{price}_{\text{sell},p}$           | Energy sell price per kWh in period $p$                       |
| $c_{\text{charge}}$                      | Cost of charging per kWh                                      |
| $\text{shave}_{\text{sell}}$             | Per-period sold energy limit (kWh)                            |
| $\text{shave}_{\text{charge}}$           | Per-period charge energy limit (kWh)                          |
| $\text{shave}_{\text{discharge}}$        | Per-period discharge energy limit (kWh)                       |

The charge‑cost is derived from the battery’s nominal cycle life, nominal capacity, and the unit sell price, but the
model treats it as a constant. Peak‑shaving limits constrain the maximum amount that can be sold, charged, or discharged
in any single period to prevent overheating and damage.

## Decision Variables

For every period $p \in P$ the scheduler chooses:

| Symbol    | Unit           | Domain                                                | Meaning                                  |
|-----------|----------------|-------------------------------------------------------|------------------------------------------|
| $P_{p}$   | kWh            | $0 \le P_{p} \le 999$                                 | Production energy in period $p$          |
| $U_{p}$   | kWh            | $0 \le U_{p} \le 999$                                 | Energy use in period $p$                 |
| $B_{p}$   | kWh            | $0 \le B_{p} \le 999$                                 | Bought energy in period $p$              |
| $S_{p}$   | kWh            | $0 \le S_{p} \le \text{shave}_{\text{sell}}$          | Sold energy period $p$                   |
| $Ch_{p}$  | kWh            | $0 \le Ch_{p} \le \text{shave}_{\text{charge}}$       | Charged energy in period $p$             |
| $D_{p}$   | kWh            | $0 \le D_{p} \le \text{shave}_{\text{discharge}}$     | Discharged energy in period $p$          |
| $SoC_{p}$ | kWh            | $\text{soc}_{\min} \le SoC_{p} \le \text{soc}_{\max}$ | State of charge at the end of period $p$ |
| $C_{p}$   | monetary units | $0 \le C_{p} \le 10$                                  | Cost incurred in period $p$              |
| $E_{p}$   | monetary units | $0 \le E_{p} \le 10$                                  | Earnings in period $p$                   |

The total cost and total earnings are defined as

$$
\begin{align}
C_{\text{tot}} &= \sum_{p \in P} C_{p},\\
E_{\text{tot}} &= \sum_{p \in P} E_{p}
\end{align}
$$

### Model Constraints

1. **Production limit**  
   $$
   P_{p} \le \text{prod_est}_{p}\quad \forall p
   $$

2. **Energy balance**  
   $$
   U_{p} + \text{excess} + Ch_{p} + S_{p}
   = P_{p} - \text{undersupply} + \eta_{\text{d}} D_{p} + B_{p}
   $$

3. **Exclusive choices**  
   $$
   \text{not}\bigl(S_{p} > 0 \land B_{p} > 0\bigr),
   \text{not}\bigl(Ch_{p} > 0 \land D_{p} > 0\bigr)\quad \forall p
   $$

4. **State‑of‑charge evolution**  
   $$
   SoC_{p} =
   \begin{cases}
   \eta_{\text{s}} \text{soc}_{0} + \eta_{\text{c}} Ch_{p} - D_{p} & p = 1 \\
   \eta_{\text{s}} SoC_{p-1} + \eta_{\text{c}} Ch_{p} - D_{p} & \text{otherwise}
   \end{cases}
   $$
   and the final SoC satisfies  
   $$
   SoC_{\max} \ge \text{soc}_{f}
   $$

5. **Cost and earnings**  
   $$
   \begin{align}
   C_{p} &= \text{price}_{\text{buy},p} B_{p} + \frac{c_{\text{charge}}}{\eta_{\text{c}}} Ch_{p},\\
   E_{p} &= \text{price}_{\text{sell},p} S_{p}
   \end{align}
   $$

### Objective

Minimise the net operating cost:

$$
\min   C_{\text{tot}} - E_{\text{tot}}
$$

The resulting schedule consists of, for each period, the amounts of production, purchase, sale, charging, discharging,
the battery’s state‑of‑charge, and the associated monetary cost and revenue, while respecting all physical, contractual,
and safety constraints.

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; major manual amendments applied)
