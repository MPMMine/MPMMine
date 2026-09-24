# Luggage Distribution Logistics

A logistics firm with `num_vans` vehicles is tasked with delivering delayed baggage from a central airport (the first of `num_cities` total locations) to various customer sites. Each delivery must be completed within a maximum of `t_limit` minutes, with no allowance made for drop-off times. There are no capacity restrictions on the vehicles. The travel times between all locations are specified in the `dist_m` matrix.

The objective is to find the minimum number of vehicles necessary to fulfill all deliveries. Once this minimum is established, the secondary objective is to minimize the maximum travel time among all active vehicles.

The model determines which vehicles are utilized (`use[k]`), which specific locations are visited by each vehicle (`visit[i, k]`), and the sequence of direct travel between locations (`travel[i, j, k]`). It enforces that every destination is visited exactly once, that all routes are continuous and free of isolated loops, and that every vehicle's total travel duration remains within the `t_limit`. Additionally, the model ensures that higher-indexed vehicles are assigned an equal or smaller number of stops than lower-indexed ones to avoid symmetry.

[//]: # (Generated using gemma4:26b from D001 description.en.md and model.mzn)
