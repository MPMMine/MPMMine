# Lost Baggage Distribution  

A company operates `nV` vans that must collect and deliver lost or delayed baggage from `X` airport (treated as city 1) to `nC` customer locations each evening. The contract requires every delivery to be completed within `T` minutes. The aim is first to use as few vans as possible, and then, among those minimal‑van solutions, to minimise the longest travel time experienced by any van.  

The travel times between any two locations are given by an `nC × nC` matrix `D`, where `D[i,j]` is the minutes needed to travel from location `i` to location `j`. Location 1 is the depot.  

**Decision variables (symbols)**  
- `x[i,j,k]` = 1 if van `k` travels directly from location `i` to location `j`  
- `y[i,k]` = 1 if location `i` is visited by van `k`  
- `z[k]` = 1 if van `k` is actually used  
- `M` = the maximum total travel time of any used van  

**Constraints**  

1. A van is considered used only if it visits at least one city: `y[i,k] ≤ z[k]` for all `i, k`.  
2. The total travel time of a van cannot exceed the allowed limit: $\(\sum\_{i,j} D[i,j]·x[i,j,k] ≤ T\)$ for each van `k`.  
4. Every city except the depot must be served by exactly one van: $\(\sum\_{k} y[i,k] = 1\)$ for all `i ≠ 1`.  
5. The depot is visited by each van that is used: $\(\sum\_{k} y[1,k] ≥ \sum\_{k} z[k]\)$.  
6. Flow conservation: if a van enters a city it must leave it, and vice‑versa:  
   $\(\sum\_{i≠j} x[i,j,k] = y[j,k]\)$ and $\(\sum\_{i≠j} x[j,i,k] = y[j,k]\)$ for all `j, k`.  
7. Sub‑circuit (subtour) elimination is enforced through a successor array that creates a single closed route for each used van.  
8. Symmetry breaking: for each `k = 1…nV‑1`, the number of visited cities by van `k` is at least that of van `k+1`.  

**Objective**  
Minimise  

$$
\text{sum}(z)·w + M,
$$

where `w = T + 1` is a penalty weight and `M` is the largest journey time among the vans.  

With these elements the model selects the smallest fleet and, subject to that, the most balanced schedule.

[//]: # (Generated using nemotron3:33b from D001 description.en.md and model.mzn; major manual adjustments applied)
