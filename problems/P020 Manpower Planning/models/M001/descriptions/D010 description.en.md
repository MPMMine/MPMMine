# Manpower Planning  

A company is confronting a series of transformations that will alter its staffing requirements in the `T` years ahead. Installation of new machinery will lower the need for low‑skill labor while raising the demand for skilled and intermediate‑skill workers. Simultaneously, a downturn in trade is expected, which will shrink the overall workforce needed in every category. The estimated staffing needs for the forthcoming planning periods are stored in the tables `init_strength` and `req`.  

The firm must decide on the following policies over the planning horizon:  

1. **Recruitment** – hiring new staff from outside.  
2. **Retraining** – developing existing employees to higher skill levels.  
3. **Redundancy** – terminating employment of surplus workers.  
4. **Short‑time working** – reducing the working time of selected employees.  

Natural turnover is present: a substantial proportion of staff leave during their first year, after which the attrition rate declines. This pattern is captured by the tables `retention_existing` and `retention_new`.  

No recent external hiring has taken place, and all current employees have been with the organization for more than one year.  

External recruitment is possible, but the annual ceiling for each skill group is defined by the table `max_recruit`.  

Up to `max_retrain_unskilled` unskilled employees may be retrained each year to become semi‑skilled. The number of semi‑skilled workers that can be promoted to skilled in any year is limited to a proportion `promotion_limit` of the existing skilled workforce (training is conducted on‑the‑job). The cost of these training actions is recorded in `retrain_cost`.  

Demoting a worker to a lower skill level may cause a fraction `downgrade_dropout` of those employees to exit the firm, incurring no direct cost (this loss is additional to the normal turnover).  

Redundancy expenses are documented in `redundancy_cost`.  

The organization may maintain up to `max_overmanning` extra staff across the whole company; the extra cost per employee per year is specified in `overmanning_cost`.  

In each skill category, a maximum of `max_short_time` workers can be placed on reduced‑time schedules, with an annual cost per employee given in `short_time_cost`.  

A short‑time employee provides `short_time_efficiency` of the output of a full‑time employee.  

The firm’s primary objective is to **minimise redundancy**. How should the company act to achieve this?  

---  

**Key symbols**  

- `T` – planning horizon (number of years)  
- `Skill` – set of skill categories (e.g., unskilled, semi‑skilled, skilled)  
- `init_strength[s]` – initial headcount for skill `s`  
- `req[i,s]` – required headcount for skill `s` in year `i`  
- `retention_existing[s]` – proportion of existing workers of skill `s` that remain each year  
- `retention_new[s]` – proportion of newly hired workers of skill `s` that stay in the first year  
- `max_recruit[s]` – upper bound on recruitment of skill `s` per year  
- `max_retrain_unskilled` – maximum number of unskilled workers that can be retrained to semi‑skilled each year  
- `promotion_limit` – fraction of the skilled workforce that may be promoted to skilled status in a year  
- `downgrade_dropout` – fraction of workers leaving the firm after being demoted  
- `redundancy_cost[s]` – cost associated with redundancies for skill `s`  
- `overmanning_cost[s]` – extra cost per overmanned employee of skill `s` per year  
- `short_time_cost[s]` – cost per short‑time employee of skill `s` per year  
- `max_short_time` – upper limit on short‑time workers per skill category  
- `retrain_cost` - cost associated with retraining
- `short_time_efficiency` – productivity ratio of a short‑time employee relative to a full‑time one  

All decisions (recruitment, retraining, redundancy, short‑time placement, overmanning) are modelled as variables subject to the constraints described above, and the model seeks the policy that minimises the total redundancy count.

[//]: # (Generated using nemotron3:33b from D001 description.en.md and model.mzn; minor manual adjustments applied)
