# Workforce Planning

An enterprise faces structural shifts that will alter its staffing needs across an upcoming planning horizon of *T* periods. The introduction of advanced equipment calls for a reduced number of entry-level operatives while increasing demand for intermediate and highly qualified personnel. Concurrently, a projected economic contraction in the immediate term will suppress the required headcount across every skill tier. The anticipated staffing targets for each period are recorded in the data sets `init_strength` (current headcount) and `req` (period-by-period needs).

Over the course of the horizon *T*, management must determine its strategy for:

1. Hiring new personnel,
2. Upskilling or reskilling existing staff,
3. Terminating employment (redundancy),
4. Implementing part-time or reduced-hours arrangements.

There is an inherent attrition of the workforce. A comparatively high share of employees departs within their first year of tenure; thereafter the departure rate drops substantially. The period-specific survival probabilities are captured by `retention_existing` (for incumbent staff) and `retention_new` (for freshly hired staff in their first year).

At the outset, no hiring has occurred recently, so every member of the present workforce has been in post for longer than one year.

External hiring is constrained. In any single period, the number of new hires admissible in each skill tier is bounded above by `max_recruit`.

Upskilling is permitted within limits: at most `max_retrain_unskilled` entry-level workers may be reskilled to intermediate level each period. Promotion from intermediate to top level is further restricted—no more than a `promotion_limit` fraction of the top-level headcount in that period may be advanced, since part of the training is delivered on the job. The expenditure associated with each upskilling route is collected in `retrain_cost`.

Downgrading (moving a worker to a lower skill tier) is also feasible, but a `downgrade_dropout` fraction of those demoted will subsequently exit the organisation at no cost to the employer. This additional leakage is on top of the natural attrition described above. Downgrading is available from top to intermediate, top to entry-level, and intermediate to entry-level.

Severance payments vary by skill tier and are tabulated in `redundancy_cost`.

The firm may carry up to `max_overmanning` surplus employees in aggregate across all tiers; the associated annual expense per surplus employee in each tier is listed in `overmanning_cost`.

At most `max_short_time` employees in each skill tier may be placed on reduced-hours arrangements in a given period. The per-employee annual expense for such arrangements is stored in `short_time_cost`. A reduced-hours worker fulfils a `short_time_efficiency` share of a full-time worker's output.

The firm's stated goal is to **minimise the total number of redundancies** across the entire horizon. Determine the optimal sequence of hiring, reskilling, demotion, redundancy, overmanning, and reduced-hours decisions that achieves this objective while satisfying all production requirements.

[//]: # (Generated using qwen3.8:27b from D001 description.en.md and model.mzn)
