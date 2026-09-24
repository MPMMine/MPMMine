# Lost Baggage Distribution  

A small firm operates **`v`** vans and has contracts with airlines to retrieve misplaced luggage from the London region, departing airport **`X`** each evening at 6 p.m. The contract requires that every customer’s luggage be delivered within **`T`** minutes. The firm needs a quick model to determine the smallest number of vans to employ and to assign each customer to a van, specifying the visiting order. There is no van capacity limit; any luggage that fits the time window can be carried. After finding the minimal fleet, the goal is to minimise the longest travel time among the vans.  

The travel times (in minutes) between every pair of locations are given in a matrix **`D`**. For convenience, airport **`X`** is treated as location 1.  

**Symbols**  

- `v` – number of available vans (integer)  
- `n` – number of delivery locations (integer, includes the airport)  
- `T` – time limit (integer minutes)  
- `D[i,j]` – travel time from location i to location j (integer)  
- `start` – the airport location (taken as 1)  

**Decision variables (symbolic)**  

- `use[k]` – 1 if van k is employed, 0 otherwise (binary)  
- `visit[i,k]` – 1 if location i is served by van k (binary)  
- `travel[i,j,k]` – 1 if van k travels directly from i to j (binary)  
- `max_route` – the greatest total travel time of any used van (integer)  

**Constraints (worded)**  

1. A van is considered used only if it visits at least one location.  
2. The sum of travel times along a van’s route must not exceed `T`.  
3. Every location except the airport must be served by exactly one van.  
4. The airport is visited by all employed vans.  
5. Flow conservation: if a van enters a location it must also leave it, ensuring a single tour per van.  
6. Subtour elimination: each van’s visits must form a single contiguous circuit (subcircuit) without disjoint loops.  
7. Symmetry breaking: higher‑indexed vans are required to serve at least as many locations as lower‑indexed ones.  

**Objective (symbolic)**  

- Minimise `Σ use[k]·(T+1) + max_route`, i.e., first minimise the number of vans, then the worst‑case route length.

[//]: # (Generated using nemotron3:33b from D001 description.en.md and model.mzn)
