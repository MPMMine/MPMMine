# Vehicle Production Problem

A set of vehicles, each with distinct characteristics, must be manufactured. The production line consists of various
stations, denoted as $\Omega$, which install specific features such as air-conditioning or sun-roofs. Each
station $\omega \in \Omega$ has a limited capacity, represented by $\beta_\omega$, and can only handle a certain
percentage of vehicles passing through the line. Furthermore, vehicles requiring a particular feature cannot be grouped
together, as this would exceed the station's capacity. Therefore, the vehicles must be sequenced in such a way that each
station's capacity is not exceeded. For instance, if a station can only handle at most half of the vehicles, the
sequence must ensure that at most one vehicle in any two requires that feature.

The problem involves arranging the production sequence to meet the requirements of $\kappa$ vehicle classes, each with
its own set of mandatory features defined by the $\rho$ matrix. The sequence must also adhere to the capacity
constraints of each station, ensuring that the number of vehicles with a specific feature does not exceed the maximum
allowed, denoted as $\beta_\omega$. Additionally, the production line must produce the correct number of vehicles for
each class, as specified by the $\gamma$ array.

The goal is to find a sequence that satisfies these conditions. This problem has been shown to be NP-complete,
indicating that the running time of traditional solving algorithms increases rapidly as the size of the input grows.

[//]: # (Generated using llama3.3:latest from D001 description.en.md and model.mzn; major manual amendments applied)
