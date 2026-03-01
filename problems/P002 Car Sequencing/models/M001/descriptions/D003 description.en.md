# Vehicle Production Sequencing Problem

A set of $\gamma$ vehicles, each with distinct attributes, must be manufactured. The production line comprises various
stations that install specific features, such as $\alpha$, $\beta$, and other optional components. These stations have
limited capacity, allowing them to handle only a certain proportion of vehicles passing through the line. To avoid
overloading the stations, vehicles requiring a particular feature cannot be clustered together. For instance, if a
specific station can accommodate at most two out of consecutive three vehicles on the line, the sequence should be
constructed such that no more than two vehicles in any three consecutive vehicles require that feature.

The problem involves arranging the production sequence to meet these constraints while considering the requirements
of $\delta$ different vehicle classes, each with its own demand $\gamma_\delta$ and set of mandatory
features $\theta_\delta$ set. The goal is to determine a sequence that satisfies all constraints, ensuring that each
station's capacity is respected and vehicles are produced according to their class specifications.

The production line has $\epsilon$ stations, each capable of handling a limited number of vehicles with specific
features. The $\phi$ array defines the total number of vehicles that must be produced with a given class $\delta$.

[//]: # (Generated using llama3.3:latest from D001 description.en.md and model.mzn; major manual amendments applied)
