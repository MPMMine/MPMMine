# Workforce Optimization Planning

As a result of technological advancements and changing market conditions, a firm needs to restructure its labor force over a planning horizon of `T` years. The goal is to transition from unskilled roles to more specialized skill sets. The initial staff levels for each category are recorded in `init_strength`, and the projected yearly demand for each skill level is documented in `req`.

The company can manage its workforce through recruitment, professional retraining, redundancy, or short-time employment. Various costs are associated with these actions, including retraining costs, redundancy payments, overmanning expenses, and short-time working costs.

Attrition occurs naturally: existing employees are retained at a rate of `retention_existing`, whereas new recruits are subject to a `retention_new` retention rate. Note that those promoted to skilled roles are also subject to the `retention_existing` rate during their transition year. There has been no recent recruitment and all workers in the current labor force have been employed for more than one year.

New hiring is restricted by a maximum of `max_recruit` per skill category. For retraining, a maximum of `max_retrain_unskilled` unskilled workers can be upgraded to semi-skilled each year. The number of semi-skilled employees promoted to skilled status is constrained by a `promotion_limit` fraction of the existing skilled workforce.

It is also possible to downgrade employees to lower skill levels. When this happens, a `downgrade_dropout` fraction of those workers will exit the company, a loss that is in addition to standard attrition.

The company is permitted to maintain a surplus of employees, provided the total overmanning across all categories does not exceed `max_overmanning`. Furthermore, up to `max_short_time` employees per skill category can be assigned to short-time work, where each such person fulfills `short_time_efficiency` of the production requirements of a standard full-time employee.

The organization's primary goal is to **minimize the total number of redundant workers**.

[//]: # (Generated using gemma4:26b from D001 description.en.md and model.mzn; minor manual adjustments applied)
