# Decentralization  

A sizable corporation intends to relocate a subset of its divisions from the current Host City. Each potential relocation site yields a quantified financial advantage (e.g., reduced housing expenses, fiscal incentives, streamlined hiring). Conversely, moving a division creates additional expenditure linked to inter‑division communication, and these communication costs have been estimated for every conceivable pairing of origin and destination cities.  

The objective is to determine the optimal assignment of each division to a city such that the net yearly expense—communication outlays minus the summed benefits of the chosen locations—is minimized.  

A key restriction is that no city (including the original Host) may accommodate more than a prescribed maximum number of divisions.  

---  

**Mathematical formulation (symbolic)**  

- Sets: `DEPT` (set of divisions), `CITY` (set of possible locations)  
- Parameter `max_dept`: upper bound on the number of divisions that may be placed in any single city  
- Parameter `benefits[i, c]`: monetary benefit obtained if division *i* is assigned to city *c*  
- Parameter `comm_quantity[i, j]`: estimated communication intensity between division *i* and division *j*  
- Parameter `comm_cost[c, d]`: communication expense incurred when division resides in city *c* and other division resides in city *d*  
- Decision variable `loc[i]`: city chosen for division *i* (variable from `CITY`)  
- Aggregate cost variable `total_cost` (to be minimized)  

**Constraints**  
- For every city *c*, the count of divisions assigned to *c* cannot exceed `max_dept`.  

**Objective**  
- Minimize `total_cost`, which equals the sum of all inter‑division communication expenses minus the sum of benefits collected from the selected locations.

[//]: # (Generated using nemotron3:33b from D001 description.en.md and model.mzn; minor manual adjustments applied)
