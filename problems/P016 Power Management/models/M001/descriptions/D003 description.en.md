# Energy System Optimization

A residential energy management system involving solar panels, a battery storage unit, and an integrated inverter must
develop an optimal strategy to reduce household expenses. The system operates in a grid-connected mode with a net
metering arrangement, where electricity purchase and sale costs vary periodically. Each day is segmented into short time
intervals, with distinct costs assigned to each interval. Price information is often accessible 24 to 48 hours prior to
use. Importantly, selling prices can be negative, which prevents energy sales in such cases.

Based on historical usage data, a forecast for energy consumption is provided for each interval. Similarly, using
weather predictions, an estimate for energy generation from solar panels is available. The inverter includes features to
adjust output below the forecasted level as needed. The plan should incorporate buffer amounts for both
higher-than-expected consumption and lower-than-anticipated generation.

Throughout all intervals, the battery charge level (SOC) must stay within a specified range. The starting SOC is fixed,
and there is a minimum required SOC at the conclusion of the planning period. The efficiency of converting electricity
to charge the battery and from DC to AC during discharge is known. Additionally, the battery experiences some energy
loss over time, with an estimated efficiency between consecutive intervals. Charging cycles also affect the battery's
lifespan, and the cost per unit charge is derived from the battery's selling price, nominal cycle count, and capacity.

To avoid equipment overheating or damage, upper limits are applied to the amount of energy sold, charged, or discharged
in each interval.

For each interval, the plan must specify energy values for generation, purchases, sales, charging, discharging, the
resulting SOC, and the related financial costs and revenues.

In every interval, the balance between energy used, stored, sold, generated, and bought must be maintained. It is not
allowed to both purchase and sell energy in the same interval. Similarly, charging and discharging the battery cannot
occur simultaneously in the same interval.

The goal is to minimize the total operational expense, defined as the sum of all costs minus the sum of all earnings.

Let T be the set of time intervals for the planning horizon. For each interval t ∈ T, define g[t] as the energy
generation forecast, d[t] as the energy demand forecast, b[t] as the energy purchase price, s[t] as the energy sale
price. A safety margin for excess demand is denoted as M_d, and for under-generation, M_g.

Battery SOC constraints include a minimum SOC_min, maximum SOC_max, initial SOC_init, and final SOC_min_final. Battery
charging and discharging efficiencies are represented by η_c and η_d, respectively, and a storage efficiency η_s between
intervals. The cost per unit charge is given by c_c.

Peak shaving constraints are set by upper bounds U_s for sales, U_c for charging, and U_d for discharging.

For each interval t, decision variables include p[t] for generation, u[t] for purchases, v[t] for sales, ch[t] for
charging, di[t] for discharging, and soc[t] for SOC. Cost and earnings variables are c[t] and e[t].

Constraints include: generation[t] ≤ g[t], energy balance ensuring that demand plus excess margin plus charging plus
sales equals generation minus under-generation plus discharge efficiency times discharging plus purchases. Exclusive
choices between purchasing and selling, and between charging and discharging in the same interval. SOC dynamics with
soc[t] = soc[t-1] * η_s + η_c * ch[t] - di[t] for t > min(T), and soc[max(T)] ≥ SOC_min_final.

Costs are defined with c[t] including purchase and charging costs, and earnings e[t] from sales. Total cost is sum over
t of c[t], total earnings is sum over t of e[t], and the objective minimizes total cost minus total earnings.

[//]: # (Generated using deepseek-r1:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
