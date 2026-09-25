# Workforce Planning

An organization faces shifting demands on its human resources over the coming years. The introduction of automated equipment means that fewer low-skill laborers will be needed while the demand for medium and high-skill personnel increases. Concurrently, an economic slowdown is projected for the immediate year, diminishing the total headcount required across every skill tier. The projected staffing needs for each planning period are recorded in the datasets `init_strength` (initial workforce composition) and `req` (future demands per period and skill level).

Over the planning horizon of `T` periods, the organization must determine decisions on:
1. Hiring new staff,
2. Reskilling existing personnel,
3. Terminating employment (layoffs),
4. Reduced-hours contracts.

A natural attrition exists in the workforce. A notably high proportion of employees depart during their first year of employment; thereafter the departure rate drops substantially. The corresponding retention factors are captured in `retention_existing` (for tenured staff) and `retention_new` (for first-year hires), each indexed by skill tier.

No hiring has occurred recently, and the entire current workforce has more than one year of tenure with the company.

External hiring is bounded: the maximum number of new hires permissible per skill category in any single period is given by `max_recruit`.

Reskilling is permitted under specific caps. Up to `max_retrain_unskilled` low-skill workers may be upskilled to medium-skill each period. The upskilling of medium-skill workers to high-skill is restricted to at most `promotion_limit` fraction of the high-skill workforce at that time, since some instruction is delivered in the workplace. The per-person cost of each reskilling path is stored in the `retrain_cost` array.

Demotion to a lower skill tier is also feasible in three directions (high→medium, high→low, medium→low), but `downgrade_dropout` fraction of such demoted employees subsequently quit the organization at no cost to the company. This additional loss is on top of the natural attrition described earlier.

Severance payments per skill level are recorded in the `redundancy_cost` array.

The organization may carry up to `max_overmanning` surplus employees company-wide beyond what is required, with per-employee per-period costs listed in the `overmanning_cost` array.

Up to `max_short_time` workers per skill level may be placed on reduced-hours contracts in any period. The per-employee per-period cost is in `short_time_cost`.

A reduced-hours employee contributes only `short_time_efficiency` of the productive output of a full-time counterpart.

The governing balance for each period and each skill tier states that the total employed headcount, minus the overmanning surplus, minus the effective contribution of reduced-hours staff (scaled by `short_time_efficiency`), must exactly equal the required headcount for that period and skill.

The workforce at the end of each period is determined by: the retained tenured staff from the prior period, plus retained new hires made that period, plus retained newly retrained workers (who are subject to tenured-staff retention since they may depart immediately), minus any demotions out of that tier, minus any layoffs.

The organization's stated goal is to **minimise the total number of layoffs** across all periods and all skill tiers. What operating policy achieves this?

[//]: # (Generated using qwen3.8:27b from D001 description.en.md and model.mzn)
