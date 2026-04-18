# Crude Slate Mix Optimization

The petroleum refining sector manages a *crude slate*, a curated blend of several crude oil grades, rather than a single
feedstock. Each grade carries distinct physicochemical traits: some are light‑sweet (yielding a lot of gasoline and
having low sulfur), others are heavy‑sour (producing more heating oil but with higher sulfur). Their costs and the
labor/energy required for refining also differ.

A refinery receives a catalog of **n** available crudes. The task is two‑fold:

1. decide which crudes to purchase within market prices and supply limits, and
2. determine the exact volume of each crude to incorporate into the daily production schedule.

Because the refinery operates under strict physical, financial and environmental rules, a naive mix of inexpensive but "
dirty" crudes can breach sulfur limits or overwhelm staff, while relying solely on premium crudes may overshoot the
daily budget or fail to meet required by‑products such as heating oil.

The goal is to find the *Optimal Crude Slate* that maximizes total net profit, defined as revenue from finished
products (Gasoline, Jet Fuel, Heating Oil) minus the purchase cost of the raw crudes. The solution must satisfy a set of
constraints.

## Decision Variables

- $x_i$ – barrels of crude $i$ processed, for every $i \in \{1,\dots ,n\}$.

## Parameters

- $c_i$ – purchase price per barrel of crude $i$.
- $S_i$ – maximum barrels available of crude $i$.
- $y_{i,p}$ – yield (barrels of product $p$ per barrel of crude $i$).
- $s_i$ – sulfur units per barrel of crude $i$.
- $l_i$ – labor hours required per barrel of crude $i$.
- $C_{cap}$ – total refinery throughput capacity (barrels).
- $B_{max}$ – budget ceiling for crude procurement.
- $L_{max}$ – maximum labor hours allowed.
- $S_{max}$ – maximum allowed sulfur emission.
- $p_p$ – market price per barrel of product $p$.
- $R_{min,p}$ – contractual minimum production for product $p$.
- $ρ$ – required proportion of the first crude in the overall mix (given as 0.15 in the original model).

### Constraints

1. **Supply limits**  
   $$
   \forall i: x_i \le S_i
   $$

2. **Total capacity**  
   $$
   \sum_i x_i \le C_{cap}
   $$

3. **Sulfur cap**  
   $$
   \sum_i x_i s_i \le S_{max}
   $$

4. **Labor limit**  
   $$
   \sum_i x_i l_i \le L_{max}
   $$

5. **Budget constraint**  
   $$
   \sum_i x_i c_i \le B_{max}
   $$

6. **Contractual production minima**  
   $$
   \forall p: \sum_i x_i y_{i,p} \ge R_{min,p}
   $$

7. **Chemical stability rule (crude 1 proportion)**  
   $$
   x_1 \ge ρ \sum_i x_i
   $$

### Objective

Maximize the net profit:
$$
\max \Bigg( \sum_{i,p} x_i y_{i,p} p_p - \sum_i x_i c_i \Bigg)
$$

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
