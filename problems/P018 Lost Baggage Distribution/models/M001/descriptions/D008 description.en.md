# Lost Baggage Distribution  

A small logistics firm operates a fleet of `num_vans` vans and has contracts to retrieve and deliver lost or delayed baggage from an airport (location X) to a set of destinations in the London area. Each evening all deliveries must be completed within `t_limit` minutes. The firm needs a quick‑to‑solve model that tells it the smallest number of vans required and, using that number, assigns each van a route (order of visits) that minimises the longest travel time among the vans. There is no capacity restriction; any amount of baggage can be carried in a van.  

The input consists of a travel‑time matrix `dist_m` (size `num_cities × num_cities`) where `dist_m[i, j]` is the minutes needed to go from location i to location j; location X is treated as city 1.  

**Decision variables**  
- `travel[i, j, k]` = 1 if van k travels directly from city i to city j, 0 otherwise.  
- `visit[i, k]` = 1 if city i is visited by van k, 0 otherwise.  
- `use[k]` = 1 if van k is deployed at all, 0 otherwise.  

**Constraints**  
1. A van is counted as used only when it visits at least one city.  
2. The total travel time of any van must not exceed `t_limit`.  
3. Every city (except the start city) must be served by exactly one van.  
4. The start city is visited by all used vans.  
5. Flow conservation: if a van enters a city it must leave it, guaranteeing a single continuous tour per van.  
6. Sub‑circuit elimination via a successor array to prevent disjoint tours.  
7. Symmetry breaking: higher‑indexed vans are required to serve no more cities than lower‑indexed vans.  

**Objective**  
First minimise the number of vans used (`∑ use[k]`).  
Then, subject to that minimum, minimise the maximum journey time across all vans (`max_k ∑ dist_m[i, j] · travel[i, j, k]`).  

A weighted formulation is employed: `(∑ use[k]) · (t_limit + 1) + max_k ∑ dist_m[i, j] · travel[i, j, k]` to be minimised.

[//]: # (Generated using nemotron3:33b from D001 description.en.md and model.mzn; minor manual adjustments applied)
