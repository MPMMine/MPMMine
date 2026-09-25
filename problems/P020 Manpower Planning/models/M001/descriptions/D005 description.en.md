# Workforce Strategic Planning

A company is adjusting its personnel strategy to accommodate significant shifts. The introduction of new equipment is reducing the demand for unskilled workers while increasing the need for semi-skilled and skilled staff. Additionally, a projected economic decline will lower the demand for all skill levels. The projected labor needs for the upcoming $T$ years are specified in `req`, with the starting workforce provided in `init_strength`.

The company must decide on its policies regarding:
1. Recruitment,
2. Retraining,
3. Redundancy,
4. Short-time working.

Natural staff turnover is accounted for using `retention_existing` for established employees and `retention_new` for new hires.

There has been no recent recruitment and all workers in the current labor force have been employed for more than one year.

New hires are subject to annual limits per skill level, defined by `max_recruit`.

Skill transitions are possible:
- Unskilled employees can be retrained to become semi-skilled, up to a maximum of `max_retrain_unskilled` per year.
- Semi-skilled employees can be promoted to skilled status, though this is limited to a `promotion_limit` fraction of the current skilled workforce.
The expenses for these training programs are listed in `retrain_cost`.

Staff can also be downgraded to lower skill levels. A fraction `downgrade_dropout` of these demoted workers will leave the company, which is an additional loss beyond natural turnover.

The costs associated with redundancies are provided in the `redundancy_cost` table.

The company may maintain a total surplus of workers across all categories, up to a limit of `max_overmanning`, with the associated costs found in `overmanning_cost`.

For each skill category, up to `max_short_time` employees may be placed on short-time work. Such employees contribute a productivity level of `short_time_efficiency` relative to a full-time worker. The costs for this arrangement are documented in `short_time_cost`.

The company’s goal is to **minimize the total number of redundancies** over the planning horizon.

[//]: # (Generated using gemma4:26b from D001 description.en.md and model.mzn; minor manual adjustments applied)
