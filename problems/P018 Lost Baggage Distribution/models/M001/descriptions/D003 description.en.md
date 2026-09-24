# Lost Luggage Allocation

A delivery firm operating a fleet of `num_vans` vehicles holds an agreement with several airlines to collect lost or delayed luggage for customers throughout the London region from airport `X` at 6 p.m. every evening. The agreement requires that every customer's luggage arrives within `t_limit` minutes of departure. The firm needs a rapidly solvable optimisation model for each evening that determines the fewest vans required, specifies which customers each van should serve, and defines the visiting sequence. There is no realistic cargo-capacity restriction on any vehicle; all luggage destined for delivery within the time window fits in a single van. Once the minimum fleet size is established, the solution should further minimise the longest travel duration experienced by any van.

For a given evening, the set of delivery destinations and the pairwise travel durations (in minutes) are provided in the `dist_m` matrix, where `dist_m[i,j]` denotes the travel time from location `i` to location `j`. No time is accounted for unloading at each stop. For convenience, airport `X` is designated as location index 1 (the `starting_location`).

The model uses binary decision variables: whether van `k` traverses the arc from city `i` to city `j` (`travel[i,j,k]`), whether van `k` stops at city `i` (`visit[i,k]`), and whether van `k` is dispatched at all (`use[k]`). The constraints ensure that:

- A van is flagged as in use only if it actually visits at least one destination;
- The cumulative travel time along any van's route does not exceed `t_limit`;
- Every delivery point (other than the airport) is assigned to exactly one van;
- The airport is included in the route of every van that is dispatched;
- Flow conservation holds at each intermediate stop for each van (the number of incoming arcs equals the number of outgoing arcs, consistent with whether the van visits that city);
- No subtours are formed within any van's route (enforced via a subcircuit constraint over successor assignments);
- Symmetry among identical vans is broken by requiring that, for consecutive van indices, the higher-indexed van serves no more stops than the lower-indexed one.

The overall objective is a lexicographic minimisation: first minimise the total number of vans dispatched (weighted by `t_limit + 1` to dominate the secondary term), and second minimise the maximum route duration across all active vans, where each van's duration is the sum of `dist_m[i,j]` over all arcs `(i,j)` in its route (excluding arcs whose destination is the starting location).

[//]: # (Generated using qwen3.8:27b from D001 description.en.md and model.mzn)
