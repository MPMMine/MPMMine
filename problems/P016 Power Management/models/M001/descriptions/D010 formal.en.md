# Home Energy Management Optimization

A residential energy system that combines solar panels, a battery storage unit, and a hybrid inverter must generate an
optimal operation plan that minimizes the total monetary burden on the household.  
The system works on‑grid under a net billing scheme where buying and selling tariffs change over time.  
Time is divided into a finite set of discrete periods, usually several minutes each, and each period is supplied with
its own buying and selling prices.

## Data

| Symbol                      | Description                                                                       |
|-----------------------------|-----------------------------------------------------------------------------------|
| $P$                         | Ordered set of periods (e.g., 1 … 96 for a 24‑hour horizon with 15‑minute slots). |
| $C[p]$                      | Forecasted electricity consumption in period *p* (kWh).                           |
| $\hat{P}[p]$                | Forecasted photovoltaic generation in period *p* (kWh).                           |
| $B_p$                       | Electricity purchase price in period *p* (€/kWh).                                 |
| $S_p$                       | Electricity sale price in period *p* (€/kWh).                                     |
| $E_{\text{excess}}$         | Safety buffer for possible extra demand over the horizon (kWh).                   |
| $E_{\text{deficit}}$        | Safety buffer for possible shortfall in generation (kWh).                         |
| $\underline{S}$             | Minimum allowable battery state‑of‑charge (kWh).                                  |
| $\overline{S}$              | Maximum allowable battery state‑of‑charge (kWh).                                  |
| $S_{\text{init}}$           | State‑of‑charge at the beginning of the horizon (kWh).                            |
| $S_{\text{final}}$          | Required lower bound on state‑of‑charge at the end of the horizon (kWh).          |
| $\eta_c$                    | Charge efficiency (output / input ratio).                                         |
| $\eta_d$                    | Discharge efficiency (output / input ratio).                                      |
| $\eta_s$                    | Storage efficiency between consecutive periods.                                   |
| $C_{\text{cost}}$           | Cost per unit energy that accounts for battery wear (€/kWh).                      |
| $\theta_{\text{sell}}$      | Peak‑shaving ceiling for energy sold in any period (kWh).                         |
| $\theta_{\text{charge}}$    | Peak‑shaving ceiling for charging power in any period (kWh).                      |
| $\theta_{\text{discharge}}$ | Peak‑shaving ceiling for discharging power in any period (kWh).                   |

## Decision Variables (for each period *p*)

* $p_p$ – actual production from the PV system (kWh).
* $b_p$ – quantity of grid purchase (kWh).
* $s_p$ – quantity of grid sale (kWh).
* $c_p$ – quantity of battery charging (kWh).
* $d_p$ – quantity of battery discharging (kWh).
* $S_p$ – battery state‑of‑charge at the end of period *p* (kWh).
* $C_{\text{cost}}[p]$ – monetary cost incurred in period *p* (€/).
* $E_{\text{earn}}[p]$ – revenue earned in period *p* (€/).

Total monetary terms:

* $\text{TotalCost} = \sum_{p\in P} C_{\text{cost}}[p]$.
* $\text{TotalEarn} = \sum_{p\in P} E_{\text{earn}}[p]$.
* The operating cost to be minimised is $\text{TotalCost} - \text{TotalEarn}$.

## Constraints

1. **Production limit**  
   $0 \leq p_p \leq \hat{P}[p]$ for all $p\in P$.

2. **Energy balance**  
   $$
   C[p] + E_{\text{excess}} + c_p + s_p = p_p - E_{\text{deficit}} + \eta_d d_p + b_p .
   $$

3. **Mutual exclusivity of buying and selling**  
   For every $p$, not both $s_p > 0$ and $b_p > 0$.

4. **Mutual exclusivity of charging and discharging**  
   For every $p$, not both $c_p > 0$ and $d_p > 0$.

5. **Battery dynamics**  
   $$
   S_p = \bigl(S_{p-1} \cdot \eta_s + \eta_c c_p - d_p \bigr) ,
   $$
   with $S_{\text{init}}$ as the value for the first period.

6. **State‑of‑charge bounds**  
   $\underline{S} \leq S_p \leq \overline{S}$ for all $p$.  
   $\displaystyle S_{\text{final}} \leq S_{|P|}$.

7. **Peak‑shaving limits**  
   $0 \leq s_p \leq \theta_{\text{sell}}$,  
   $0 \leq c_p \leq \theta_{\text{charge}}$,  
   $0 \leq d_p \leq \theta_{\text{discharge}}$ for all $p$.

8. **Cost calculation**  
   $C_{\text{cost}}[p] = B_p b_p + \frac{C_{\text{cost}}}{\eta_c} c_p$.

9. **Earnings calculation**  
   $E_{\text{earn}}[p] = S_p s_p$.

## Objective

Minimise  
$$
\sum_{p \in P} C_{\text{cost}}[p] - \sum_{p \in P} E_{\text{earn}}[p].
$$

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; major manual amendments applied)
