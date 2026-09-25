# Manpower Planning  

A firm faces a three‑year horizon and must determine how to adjust its labour pool in order to meet projected staffing needs while keeping the number of dismissals as low as possible.  The workforce is divided into three skill categories (unskilled, semi‑skilled, skilled).  Initial staffing levels for each category are given in `init_strength`, and future demand for each skill in each year is recorded in `req`.  

## Decision variables  

* **Recruitment** – the number of new hires that can be added in the beginning of the year *i* for each skill *s* is denoted `r_i(s)`. The number of workers at the end of the year *i* with skill *s* is saved as `t_i(s)`.
* **Retraining** – the count of unskilled workers turned into semi‑skilled in year *i* is `a_i(US→SS)`, the count of semi‑skilled workers upgraded to skilled is `a_i(SS→SK)`, and the counts of downgrades (skilled→semi‑skilled, skilled→unskilled, semi‑skilled→unskilled) are `d_i(SK→SS)`, `d_i(SK→US)`, `d_i(SS→US)`.  
* **Redundancy** – the number of employees removed in year *i* for skill *s* is `red_i(s)`.  
* **Short‑time** – the number of workers placed on reduced‑hour schedules in year *i* for skill *s* is `sh_i(s)`.  
* **Overmanning** – the surplus staff kept beyond the required level in year *i* for skill *s* is `ov_i(s)`.  

All variables are bounded by the limits supplied in the tables `max_recruit`, `max_retrain_unskilled`, `max_overmanning`, `max_short_time`, and by the fractions `downgrade_dropout` and `promotion_limit`. There is a natural wastage of labor. A fairly large number of workers leave during their first year. After this, the rate is much smaller. Taking this into account, the wastage rates can be found in the table `retention_existing` and `retention_new`.

## Continuity and labour flow  

For each year *i* = 1…T and each skill *s* the workforce at the end of the year must satisfy  

```
t_i(s) =  (1‑downgrade_dropout)·d_i(prev→s)          % workers that stay after a downgrade/promotion
        + retention_existing(s)·t_{i‑1}(s)          % existing workers who remain
        + retention_new(s)·r_i(s)                  % newly recruited workers of this skill
        - red_i(s)                                 % dismissals
        - a_i(prev→s)                              % promotions
        ± other transition terms (retraining, downgrades) as appropriate
```

The exact algebraic expressions are omitted for brevity, but they enforce that the stock of each skill evolves consistently from one period to the next, accounting for natural turnover, new hires, retraining, downgrading (with the extra wastage factor), and redundancies.  

## Constraints  

* **Recruitment caps** – `r_i(s) ≤ max_recruit(s)` for all years and skills.  
* **Retraining limits** – the number of unskilled workers converted to semi‑skilled cannot exceed `max_retrain_unskilled` per year, and the number of semi‑skilled workers promoted to skilled cannot be larger than `promotion_limit·t_i(SKILLED)`.  
* **Overmanning ceiling** – the sum of overmanning across all skills in any year is at most `max_overmanning`.  
* **Short‑time limits** – `sh_i(s) ≤ max_short_time` for each skill and year.  
* **Production balance** – the effective output of each skill must meet demand:  

```
t_i(s) - ov_i(s) - short_time_efficiency·sh_i(s) = req_i(s)
```

* **Cost accounting** – redundancy incurs a cost `redundancy_cost(s)` per worker, short‑time work incurs `short_time_cost(s)` per worker per year, overmanning incurs `overmanning_cost(s)` per worker per year, and retraining costs are `retrain_cost(1)` for US→SS and `retrain_cost(2)` for SS→SK.  

## Objective  

The firm’s declared goal is to **minimise total redundancy**, i.e. minimise  

$$
Σ_{i=1..T} Σ_{s∈Skills} red\_i(s)
$$

subject to all constraints above.  

The model therefore decides the optimal mix of hiring, retraining, dismissals, short‑time assignments and excess staffing over the planning horizon, ensuring that the company can meet its future staffing requirements while keeping the number of terminations as low as possible.

[//]: # (Generated using nemotron3:33b from D001 description.en.md and model.mzn; minor manual adjustments applied)
