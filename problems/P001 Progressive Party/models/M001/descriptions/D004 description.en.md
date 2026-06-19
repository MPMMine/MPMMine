# Social Gathering Conundrum

The task is to organize a social event at a maritime club.

Certain vessels are chosen as reception centers, and the teams from the remaining vessels visit in lexicographical order these reception centers
for multiple consecutive half-hour slots. The team of a reception vessel stays on board to entertain while the team of a
visiting vessel collectively visits several reception centers. Each vessel has a limited capacity for the number of
people it can accommodate at any given time (its maximum occupancy), and the sizes of the teams vary. The total number
of individuals on board a vessel, including both the reception team and visiting teams, must not exceed its maximum
occupancy. A visiting vessel cannot revisit a reception center, and visiting teams cannot meet more than once. The
challenge for the event planner is to minimize the number of reception vessels required.

Let $\beta$ represent the set of vessels, $\tau$ represent the set of time slots, $c$ represent the capacity of each
vessel, and $s$ represent the size of each team. The goal is to find the optimal subset of vessels to serve as reception
centers, denoted as $\rho$, such that the number of vessels in $\rho$ is minimized, while ensuring that all constraints
related to vessel capacity, team meetings, and visit schedules are satisfied.

[//]: # (Generated using llama3.3:latest from D001 description.en.md and model.mzn with added symmetry breaking information)
