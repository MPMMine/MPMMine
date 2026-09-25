# Decentralization  

A corporate organization intends to shift certain divisions away from the Home City. Each possible move comes with a quantified benefit (e.g., lower housing, incentives, recruitment costs), while every pair of divisions incurs a communication expense that varies with the cities they occupy. The goal is to choose a city for each division so that the overall yearly cost—communication expenses minus the total benefits—is minimized. No city may host more than a predetermined number of divisions (the capacity limit applies to all cities, including the Home City).

**Mathematical formulation**  
- Sets: `DEPT` (divisions) and `CITY` (possible locations)  
- Parameter `max_dept`: the maximum number of divisions any city may host  
- Parameter `benefits[dept, city]`: monetary benefit obtained if *dept* is placed in *city*  
- Parameter `comm_quantity[dept, dept]`: communication intensity between two divisions  
- Parameter `comm_cost[city, city]`: communication expense when the two divisions reside in the given cities  
- Decision variable `loc[dept]`: city assigned to each division  

**Constraints**  
For every city *c* in `CITY`: 

$$
\sum\_{d \in DEPT} \mathbf{1}\bigl(loc[d] = c\bigr) \le max\\_dept
$$

ensuring the capacity limit is respected.

**Objective**  

$$
\text{total\\_cost}= \sum_{\substack{i \in DEPT \\ k \in DEPT \\ i < k}} \bigl(comm\\_quantity[i,k] \times comm\\_cost[loc[i],\\,loc[k]]\bigr) \\;-\\; \sum\_{i \in DEPT} benefits[i,\\,loc[i]]
$$  

The model seeks the assignment `loc` that minimizes `total_cost`.

[//]: # (Generated using nemotron3:33b from D001 description.en.md and model.mzn)
