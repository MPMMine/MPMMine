# Lost Luggage Delivery Routing

A logistics firm operating a fleet of `n_vans` delivery vehicles has an agreement with several airlines to collect lost or delayed luggage belonging to travelers in the Greater London region from airport `A` at 6 p.m. every evening. The agreement mandates that every customer's luggage must arrive at its destination within `T_limit` minutes of departure. The firm needs a rapidly solvable optimization model for nightly use that determines the fewest number of vehicles required, assigns each delivery destination to a specific vehicle, and specifies the visiting sequence for each vehicle. There is no practical load restriction on any vehicle; all parcels that must be delivered within the time window can fit in a single vehicle. Once the minimum fleet size is established, the model then seeks to reduce the longest individual vehicle travel duration.

On any given evening, the set of `n_cities` delivery destinations and the pairwise travel times (in minutes) between them are provided in a 2D matrix `dist`. No time is accounted for the actual act of dropping off parcels. For indexing convenience, the airport `A` is designated as the first location (index 1).

The formulation must satisfy the following structural requirements:

- **Vehicle activation:** A vehicle is considered active only if it visits at least one delivery point.
- **Time budget:** The cumulative travel time along each active vehicle's route must not exceed `T_limit`.
- **Unique assignment:** Every delivery destination (excluding the depot) is served by exactly one vehicle.
- **Depot visitation:** The starting airport is included in the route of every active vehicle.
- **Flow conservation:** For each vehicle and each location, the number of incoming legs equals the number of outgoing legs, and both equal the visitation indicator for that location.
- **Subtour elimination:** Each vehicle's assigned locations must form a single contiguous tour (no disconnected cycles), enforced via a successor-array and subcircuit condition.
- **Symmetry breaking:** Vehicles are ordered so that vehicle index `r` serves at least as many locations as vehicle index `r+1`, preventing equivalent re-indexings.

**Objective.** The combined goal is lexicographic: first, minimize the total count of active vehicles; second, subject to that minimum, minimize the maximum route duration across all active vehicles. This is achieved by forming a weighted sum in which the vehicle-count term is scaled by a factor of `T_limit + 1` (ensuring it dominates) and added to the maximum per-vehicle travel time.

[//]: # (Generated using qwen3.8:27b from D001 description.en.md and model.mzn; minor manual adjustments applied)
