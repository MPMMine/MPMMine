# Progressive Party Problem

The problem is to timetable a party at a yacht club. Currently, there are **5 boats** (`n_boats = 5`) and the event spans **4 successive half-hour periods** (`n_periods = 4`).

Certain boats are to be designated hosts, and the crews of the remaining boats in turn visit the host boats in lexicographical order for several successive half-hour periods. The crew of a host boat remains on board to act as hosts while the crew of a guest boat together visits several hosts.

Each boat has a specific capacity: Boat 1 can hold **6 people**, Boat 2 can hold **8 people**, and Boats 3, 4, and 5 can each hold **12 people** (`capacity = [6, 8, 12, 12, 12]`). Crew sizes also vary: Boats 1 through 4 each have a crew of **2 people**, while Boat 5 has a crew of **4 people** (`crew = [2, 2, 2, 2, 4]`).

The total number of people aboard a boat, including the host crew and guest crews, must not exceed its capacity. A guest boat cannot revisit a host, and guest crews cannot meet more than once. The problem facing the rally organizer is that of minimizing the number of host boats.
