# Baggage Delivery Routing

A logistics firm is tasked with delivering delayed luggage from an airport to several customer locations. With a fleet of `num_vans` available and a total of `num_cities` locations to consider (where the airport is the `starting_location`), the company must plan efficient routes. All deliveries must be completed within a maximum time threshold, `t_limit`. The time required to move between any two locations is recorded in the `dist_m` matrix, and no extra time is allocated for drop-offs.

The primary objective is to minimize the total number of vans used, indicated by the `use` variable for each vehicle. Every customer location must be included in a `visit` by exactly one van. Once the minimum fleet size is established, the secondary objective is to minimize the `max_journey_time`, which represents the duration of the longest individual route.

The model must ensure that for every van, the `travel` paths form valid circuits starting and ending at the `starting_location`. There is no limit on the volume of baggage a van can carry. The solution should specify which vans are `use`d, which cities each van will `visit`, and the specific `travel` sequences between locations.

To break the symmetry vans are ordered and the `k`th van must visit at least the same number of cities as `k+1`th van.

[//]: # (Generated using gemma4:26b from D001 description.en.md and model.mzn; minor manual adjustments applied)
