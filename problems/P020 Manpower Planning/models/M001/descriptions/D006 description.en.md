# Staffing Optimization Plan

An organization is adapting to shifting operational requirements that change its labor needs over a period of $T$ years. New technology demands a higher proportion of skilled and semi-skilled staff, while a general economic contraction reduces overall worker requirements. The current workforce levels per skill category are listed in $init\\_strength$, and the forecasted needs for each year are provided in $req$.

The company must decide on several management actions:
1. External recruitment,
2. Employee retraining,
3. Redundancy/layoffs,
4. Implementation of short-time work.

Natural staff turnover occurs as part of the workforce cycle. Workers who have been with the company for more than one year have a retention rate of $retention\\_existing$, whereas the retention rate for newly recruited staff in their first year is $retention\\_new$. There has been no recent recruitment and all workers in the current labor force have been employed for more than one year.

There are limits on hiring, where the maximum number of new employees per skill level is $max\\_recruit$.

Upgrading employee skills is permitted through retraining. The transition from unskilled to semi-skilled is restricted to $max\\_retrain\\_unskilled$ workers annually. The number of semi-skilled workers promoted to skilled status is capped at a fraction $promotion\\_limit$ of the existing skilled workforce. The associated expenses for these programs are in $retrain\\_cost$.

Workers may also be downgraded to lower skill levels. During this process, a fraction $downgrade\\_dropout$ of those workers will depart the company, representing a loss beyond normal attrition.

Financial implications for laying off staff are found in $redundancy\\_cost$.

The company may maintain a total excess of $max\\_overmanning$ staff across all skill levels, with annual costs per category specified in $overmanning\\_cost$.

Additionally, up to $max\\_short\\_time$ employees in any skill category may be assigned to short-time work, with costs per category detailed in $short\\_time\\_cost$. A worker on short-time duty operates at an efficiency level of $short\\_time\\_efficiency$ relative to a full-time employee.

The goal is to **minimize the total number of redundancies** throughout the planning period.

[//]: # (Generated using gemma4:26b from D001 description.en.md and model.mzn; minor manual adjustments applied)
