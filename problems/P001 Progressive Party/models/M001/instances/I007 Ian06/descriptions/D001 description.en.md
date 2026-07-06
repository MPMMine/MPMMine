# Progressive Party Problem

The problem is to timetable a party at a yacht club. In this specific instance, there are **10 boats** that will participate over **5 successive half-hour periods**.

Certain boats are to be designated hosts, and the crews of the remaining boats in turn visit the host boats in lexicographical order for the scheduled periods. The crew of a host boat remains on board to act as hosts while the crew of a guest boat together visits several hosts.

Every boat can only hold a limited number of people at a time (its capacity) and crew sizes are different. The specific data for the 10 boats is as follows:
*   **Capacities:** `[6, 8, 12, 12, 12, 12, 12, 10, 10, 10]`
*   **Crew Sizes:** `[2, 2, 2, 2, 4, 4, 4, 1, 2, 2]`

The total number of people aboard a boat, including the host crew and any visiting guest crews, must not exceed its capacity. Further constraints are that a guest boat cannot revisit a host, and guest crews cannot meet more than once. The problem facing the rally organizer is that of minimizing the number of host boats.
