# Baggage Distribution Problem

A logistics company manages a fleet of $N_V$ vehicles tasked with collecting delayed luggage from a central airport, $L_0$, and delivering it to various destinations. To satisfy contract requirements, every delivery must occur within a maximum timeframe of $T_{max}$. The company requires a model to first identify the minimum number of vehicles needed to complete all tasks. Once this minimum is determined, the model should then find a solution that minimizes the travel time of the vehicle with the most time consuming route.

The travel durations between all $N_C$ locations are provided in a matrix $M$. Every destination (excluding $L_0$) must be serviced by exactly one vehicle. There is no capacity constraint on the amount of luggage each vehicle can carry, and no time is allotted for the actual unloading process at the sites. For any vehicle used, the route must begin and end at $L_0$ and follow a continuous path to prevent the formation of disconnected subtours. Furthermore, to improve solving efficiency, the model ensures that vehicles are ordered so that every next vehicle dispatched visits a smaller number of stops.

[//]: # (Generated using gemma4:26b from D001 description.en.md and model.mzn; minor manual adjustments applied)
