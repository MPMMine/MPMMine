# Lost Luggage Delivery Scheduling

A small firm operating a fleet of `num_vans` vehicles has an agreement with several airlines to collect lost or delayed luggage belonging to passengers in the greater London region from `X` airport every evening at 6 p.m. Under this agreement, every customer's luggage must be delivered to its destination within `t_limit` minutes of pickup. The firm needs a model that can be solved rapidly each night to determine (a) the fewest vehicles required and (b) which customer locations each vehicle should serve and in what sequence. There is no realistic cargo capacity constraint on any vehicle; all luggage that must be delivered within the deadline fits into a single vehicle. Once the minimum fleet size is established, the solution should further minimise the maximum completion time experienced by any single vehicle.

On a given evening, the delivery destinations and the travel durations (expressed in minutes) between every pair of locations are provided in the `dist_m` matrix. The time spent actually dropping off luggage at each stop is ignored. For simplicity, `X` (the airport) is taken as the first entry in the location list (index `1`).

There are `num_cities` locations in total, indexed from `1` to `num_cities`. The depot (airport) is location `1`. A binary decision variable `travel[i, j, k]` equals 1 when vehicle `k` drives directly from location `i` to location `j`. Another binary variable `visit[i, k]` equals 1 when location `i` is on the route of vehicle `k`. A binary variable `use[k]` equals 1 when vehicle `k` is dispatched at all.

The model must enforce the following conditions:

- A vehicle may only be marked as dispatched if it actually visits at least one location.
- The total travel time accumulated by any dispatched vehicle (summing over all arcs it traverses, excluding arcs into the depot) must not exceed `t_limit`.
- Every location other than the depot must be served by exactly one vehicle.
- The depot must appear on the route of every dispatched vehicle.
- Flow conservation: for each location and each vehicle, the number of incoming arcs equals the number of outgoing arcs, ensuring a continuous route.
- Subtour elimination: the arcs assigned to each vehicle must form a single continuous circuit, preventing disjoint cycles.
- Symmetry breaking: vehicles are ordered so that vehicle `k` is assigned no fewer locations than vehicle `k + 1`, for all `k` from `1` to `num_vans - 1`.

The objective is a lexicographic minimisation achieved by a single weighted expression: the primary term is the total number of vehicles dispatched, multiplied by a large penalty weight of `t_limit + 1`; the secondary term is the maximum total travel time among all dispatched vehicles. Minimising this combined expression first drives the fleet size down and, subject to that, reduces the longest individual delivery route.

Formulate and solve an optimisation model that selects the dispatch assignments, route sequences, and ordering of stops so as to satisfy all the constraints above while achieving the stated two-level minimisation.

[//]: # (Generated using qwen3.8:27b from D001 description.en.md and model.mzn; minor manual adjustments applied)
