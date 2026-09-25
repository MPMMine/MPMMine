# Workforce Scheduling

An organisation faces shifting staffing demands over the coming `T` years. The introduction of advanced equipment means a greater demand for skilled and semi-skilled personnel, while the demand for unskilled labour decreases. Furthermore, a projected economic slowdown in the immediate year will suppress demand across every skill tier. The projected staffing needs spanning the next three periods are stored in the tables `init_strength` and `req`.

The organisation must determine its strategy over this multi-period horizon regarding:
1. Hiring new staff,
2. Upskilling or cross-training,
3. Redundancy,
4. Reduced-hours arrangements.

A baseline attrition of the workforce exists. A comparatively high share of employees departs within their initial year of service; beyond that, the departure rate drops substantially. The relevant survival proportions are captured in `retention_existing` and `retention_new`.

No hiring has occurred recently, and every current employee has already completed their first year of tenure.

External hiring is subject to per-period caps for each skill tier, specified in `max_recruit`.

Upskilling from unskilled to semi-skilled is bounded by `max_retrain_unskilled` individuals per period. Promoting semi-skilled workers to skilled status is also constrained: no more than a `promotion_limit` proportion of the current skilled headcount may be promoted in any given period, since part of the training occurs on the job. The associated training expenditures are recorded in the `retrain_cost` table.

Downgrading to a lower skill tier is permitted, but a `downgrade_dropout` proportion of such demoted employees subsequently leave the organisation at no additional expense. (This departure is separate from the baseline attrition noted earlier.)

Severance payments for redundant workers are documented in the `redundancy_cost` table.

The organisation may carry up to `max_overmanning` surplus employees in aggregate across all tiers beyond what is operationally required; the per-employee per-period cost of this surplus is listed in `overmanning_cost`.

A maximum of `max_short_time` employees per skill tier may be placed on reduced-hours status. The per-employee per-period expense of this arrangement appears in `short_time_cost`.

A worker on reduced hours contributes the equivalent of `short_time_efficiency` of a full-time worker toward meeting production targets. The organisation's stated goal is to **minimise total redundancies** across the entire planning horizon. What operational plan achieves this objective?

[//]: # (Generated using qwen3.8:27b from D001 description.en.md and model.mzn; minor manual adjustments applied)
