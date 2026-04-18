# Progressive Party Problem

The problem is to timetable a party at a yacht club for a fleet of **9 boats** over **5 successive half-hour periods**.

Certain boats are to be designated hosts, and the crews of the remaining boats in turn visit the host boats. The crew of a host boat remains on board to act as hosts, while the crew of a guest boat together visits several hosts.

Each of the 9 boats has a specific crew size and a maximum capacity. For this problem instance, the data is as follows:

*   **Crew Sizes:**
    ```
    [2, 2, 2, 2, 4, 4, 4, 1, 2]
    ```
*   **Boat Capacities:**
    ```
    [6, 8, 12, 12, 12, 12, 12, 10, 10]
    ```

The total number of people aboard a boat at any time, including the host crew and all guest crews, must not exceed that boat's capacity.

Several constraints apply to the schedule:
1.  A guest crew cannot revisit a host boat.
2.  The crews from any two guest boats cannot meet more than once.

The problem facing the rally organizer is to devise a schedule that satisfies all these conditions while **minimizing the total number of host boats**.
