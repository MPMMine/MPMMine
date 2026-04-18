# Progressive Party Problem

The problem is to timetable a party at a yacht club. This specific instance involves **12 boats** and is scheduled over **5 time periods**.

Certain boats are to be designated hosts, and the crews of the remaining boats in turn visit the host boats for several successive half-hour periods. The crew of a host boat remains on board to act as hosts while the crew of a guest boat together visits several hosts.

Every boat can only hold a limited number of people at a time (its capacity) and crew sizes are different. For this problem, the specific boat data is:

*   **Crew Sizes:** `[2, 2, 2, 2, 4, 4, 4, 1, 2, 2, 2, 3]`
*   **Boat Capacities:** `[6, 8, 12, 12, 12, 12, 12, 10, 10, 10, 10, 10]`

The total number of people aboard a boat, including the host crew and guest crews, must not exceed the capacity. A guest boat cannot not revisit a host and guest crews cannot meet more than once. The problem facing the rally organizer is that of minimizing the number of host boats.
