# Progressive Party Problem
The problem is to timetable a party at a yacht club.

Certain boats are to be designated hosts, and the crews of the remaining boats in turn visit the host boats in lexicographical order for several successive half-hour periods. The crew of a host boat remains on board to act as hosts while the crew of a guest boat together visits several hosts. Every boat can only hold a limited number of people at a time (its capacity) and crew sizes are different. The total number of people aboard a boat, including the host crew and guest crews, must not exceed the capacity. A guest boat cannot not revisit a host and guest crews cannot meet more than once. The problem facing the rally organizer is that of minimizing the number of host boats.

### Problem Instance Data
For this specific instance of the problem, we are working with the following parameters:

*   **Total Boats (`n_boats`)**: There are **7** boats participating.
*   **Time Periods (`n_periods`)**: The party is scheduled over **6** successive time periods.
*   **Boat Details**: The crew size and maximum capacity for each of the 7 boats are defined as follows:

| Boat # | Crew Size | Capacity |
| :----: | :-------: | :------: |
|   1    |     2     |    6     |
|   2    |     2     |    8     |
|   3    |     2     |    12    |
|   4    |     2     |    12    |
|   5    |     4     |    12    |
|   6    |     4     |    12    |
|   7    |     4     |    12    |
