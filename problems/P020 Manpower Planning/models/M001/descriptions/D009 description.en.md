# Manpower Planning  

A firm is facing a series of transformations that will change its staffing needs in the coming years. New equipment will favour more qualified personnel, while a projected decline in trade will cut overall labor demand. The anticipated workforce requirements for the next **T** periods are stored in the tables `init_strength` (current headcount) and `req` (future demand).  

The company must choose a policy for the following actions during the planning horizon:  

1. **Recruitment** – hiring new staff from the external labor market.  
2. **Retraining** – upgrading unskilled workers to semi‑skilled, and semi‑skilled workers to skilled, subject to capacity limits.  
3. **Redundancy** – terminating employees, incurring a cost that depends on the worker’s skill level.  
4. **Short‑time working** – reducing the effective working time of a limited number of employees, which lowers their productive contribution.  

## Natural labor turnover  

A substantial proportion of employees leave during the first year of employment; after that the attrition rate falls markedly. The complement of the resignation rates is captured in the tables `retention_existing` (steady‑state retention) and `retention_new` (first‑year retention). All existing staff have already completed at least one year of service, and no recent external hiring has taken place.  

## Decision variables  

| Symbol | Meaning |
|--------|---------|
| `t_strength[i, s]` | Total number of employees of skill `s` ( UNSK, SESK, SKILL ) at the end of year *i* |
| `u_recruit[i, s]` | Number of new hires of skill `s` introduced at the start of year *i* |
| `v_US_SS[i]` | Unskilled → semi‑skilled conversion in year *i* |
| `v_SS_SK[i]` | Semi‑skilled → skilled conversion in year *i* |
| `v_SK_SS[i]` | Skilled → semi‑skilled downgrade in year *i* |
| `v_SK_US[i]` | Skilled → unskilled downgrade in year *i* |
| `v_SS_US[i]` | Semi‑skilled → unskilled downgrade in year *i* |
| `w_redundancy[i, s]` | Employees of skill `s` made redundant in year *i* |
| `x_short[i, s]` | Workers of skill `s` placed on short‑time in year *i* (bounded by `max_short_time`) |
| `y_overmanning[i, s]` | Additional employees of skill `s` retained beyond the required headcount in year *i* (capped by `max_overmanning`) |

## Core constraints  

* **Workforce balance** – the headcount at the end of each year is built from the previous year’s stock, new hires, conversions, downgrades, natural attrition and redundancies. For each skill `s` and each year *i*:

  * Skilled: `t_strength[i, SKILL] = retention_existing[SKILL]·t_strength[i‑1, SKILL] + retention_new[SKILL]·u_recruit[i, SKILL] + (1‑downgrade_dropout)·v_SS_SK[i] – v_SK_SS[i] – v_SK_US[i] – w_redundancy[i, SKILL]`  

  * Semi‑skilled: `t_strength[i, SESK] = retention_existing[SESK]·t_strength[i‑1, SESK] + retention_new[SESK]·u_recruit[i, SESK] + (1‑downgrade_dropout)·v_SK_SS[i] + retention_existing[SESK]·v_US_SS[i] – v_SS_SK[i] – v_SS_US[i] – w_redundancy[i, SESK]`  

  * Unskilled: `t_strength[i, UNSK] = retention_existing[UNSK]·t_strength[i‑1, UNSK] + retention_new[UNSK]·u_recruit[i, UNSK] + (1‑downgrade_dropout)·(v_SK_US[i] + v_SS_US[i]) – v_US_SS[i] – w_redundancy[i, UNSK]`  

* **Recruitment caps** – the number of hires of any skill in a given year cannot exceed the limit defined in `max_recruit[s]`.  

* **Retraining ceiling for promotion** – the flow of semi‑skilled workers to skilled status in year *i* is limited to a fraction `promotion_limit` of the current skilled workforce: `v_SS_SK[i] ≤ promotion_limit·t_strength[i, SKILL]`.  

* **Retraining unskilled workers** - is capped at `max_retrain_unskilled` number of workers.

* **Over‑manning ceiling** – the total number of employees kept above the required level across all skills in year *i* may not exceed `max_overmanning`: `∑_s y_overmanning[i, s] ≤ max_overmanning`.  

* **Production requirement** – the effective output of year *i* must meet demand after accounting for short‑time efficiency: `t_strength[i, s] – y_overmanning[i, s] – short_time_efficiency·x_short[i, s] = req[i, s]` for every skill `s`.  

* **Short‑time limits** – the number of short‑time workers of each skill is bounded by `max_short_time`.  

## Objective  

The firm’s primary goal is to **minimise total redundancy**, expressed as  

```
total_redundancy = Σ_{i=1}^{T} Σ_{s∈Skill} w_redundancy[i, s]
```

and the model is solved as a minimisation problem:

```
solve minimize total_redundancy;
```

## Cost data (used for reporting, not for the optimisation objective)

* `retrain_cost` – unit cost of converting unskilled→semi‑skilled and semi‑skilled→skilled.  
* `redundancy_cost[s]` – cost associated with making a worker of skill `s` redundant.  
* `overmanning_cost[s]` – extra yearly cost per superfluous employee of skill `s`.  
* `short_time_cost[s]` – yearly cost per short‑time worker of skill `s`.  

These tables allow the analysis of total expenditure, but the optimisation itself focuses solely on reducing the number of redundancies.

[//]: # (Generated using nemotron3:33b from D001 description.en.md and model.mzn; major manual adjustments applied)
