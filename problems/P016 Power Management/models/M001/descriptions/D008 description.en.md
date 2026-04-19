# Power Management

A residential energy‑management system that integrates photovoltaic panels, a battery bank, and a hybrid inverter must construct an optimal schedule to minimise the household’s operating expense.  
The system is assumed to operate in on‑grid mode under a net‑energy billing arrangement, where the purchase and sale tariffs change over time.  
Time is divided into a finite set of periods \(P\) (usually every few minutes); the tariff schedule for each period is known 24–48 h in advance, and may be negative, in which case exporting is disallowed.

Energy consumption is forecasted for each period, and a production forecast is derived from weather data.  
The inverter can throttle production below the estimate on demand, and a safety buffer is required to cover both excess consumption and undersupply of generation.

### Battery and Efficiency Parameters

For the storage system the following parameters are defined:

| Symbol | Meaning |
|--------|---------|
| \(\text{soc}_{\min}\), \(\text{soc}_{\max}\) | Minimum and maximum state‑of‑charge limits (kWh) |
| \(\text{soc}_{0}\) | Initial SoC at the beginning of the horizon |
| \(\text{soc}_{f}\) | Mandatory lower bound on the final SoC |
| \(\eta_{\text{c}}\), \(\eta_{\text{d}}\) | Charging and discharging efficiencies (output‑to‑input ratio) |
| \(\eta_{\text{s}}\) | Storage efficiency between successive periods |
| \(c_{\text{charge}}\) | Cost per charge‑cycle (kWh) |

The charge‑cost is derived from the battery’s nominal cycle life, nominal capacity, and the unit sell price, but the model treats it as a constant.

Peak‑shaving limits constrain the maximum amount that can be sold, charged, or discharged in any single period:

\[
S_{p} \le \text{shave}_{\text{sell}}, \qquad
Ch_{p} \le \text{shave}_{\text{charge}}, \qquad
D_{p} \le \text{shave}_{\text{discharge}}
\]

### Decision Variables

For every period \(p \in P\) the scheduler chooses:

| Symbol | Unit | Constraint |
|--------|------|------------|
| \(P_{p}\) | kWh | \(0 \le P_{p} \le 999\) |
| \(B_{p}\) | kWh | \(0 \le B_{p} \le 999\) |
| \(S_{p}\) | kWh | \(0 \le S_{p} \le \text{shave}_{\text{sell}}\) |
| \(Ch_{p}\) | kWh | \(0 \le Ch_{p} \le \text{shave}_{\text{charge}}\) |
| \(D_{p}\) | kWh | \(0 \le D_{p} \le \text{shave}_{\text{discharge}}\) |
| \(SoC_{p}\) | kWh | \(\text{soc}_{\min} \le SoC_{p} \le \text{soc}_{\max}\) |
| \(C_{p}\) | monetary units | cost incurred in period \(p\) |
| \(E_{p}\) | monetary units | revenue earned in period \(p\) |

The total cost and total earnings are defined as

\[
C_{\text{tot}} = \sum_{p \in P} C_{p}, \qquad
E_{\text{tot}} = \sum_{p \in P} E_{p}
\]

### Model Constraints

1. **Production limit**  
   \[
   P_{p} \le \text{prod\_est}_{p}\quad \forall p
   \]

2. **Energy balance**  
   \[
   \text{cons}_{p} + \text{excess}_{\text{cons}} + Ch_{p} + S_{p}
   = P_{p} - \text{undersupply}_{\text{prod}}
   + \eta_{\text{d}}\;D_{p} + B_{p}
   \]

3. **Exclusive choices**  
   \[
   \text{not}\bigl(S_{p} > 0 \;\&\; B_{p} > 0\bigr),\qquad
   \text{not}\bigl(Ch_{p} > 0 \;\&\; D_{p} > 0\bigr)\quad \forall p
   \]

4. **State‑of‑charge evolution**  
   \[
   SoC_{p} =
   \begin{cases}
     \text{soc}_{0}\,\eta_{\text{s}} + \eta_{\text{c}}\;Ch_{p} - D_{p} & p = \min(P)\\[4pt]
     SoC_{p-1}\,\eta_{\text{s}} + \eta_{\text{c}}\;Ch_{p} - D_{p} & \text{otherwise}
   \end{cases}
   \]
   and the final SoC satisfies  
   \[
   SoC_{\max} \ge \text{soc}_{f}
   \]

5. **Cost and earnings**  
   \[
   C_{p} = \text{price}_{\text{buy},p}\;B_{p} + \frac{c_{\text{charge}}}{\eta_{\text{c}}}\;Ch_{p},\qquad
   E_{p} = \text{price}_{\text{sell},p}\;S_{p}
   \]

### Objective

Minimise the net operating cost:

\[
\min \; C_{\text{tot}} - E_{\text{tot}}
\]

The resulting schedule prescribes, for each period, the amounts of production, purchase, sale, charging, discharging, the battery’s state‑of‑charge, and the associated monetary cost and revenue, while respecting all physical, contractual, and safety constraints.

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn)
