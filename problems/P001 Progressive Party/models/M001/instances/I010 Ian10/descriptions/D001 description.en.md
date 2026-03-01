## Progressive Party Problem

The problem is to timetable a party at a yacht club. In this specific instance, there are **14 boats** and the party is divided into **5 successive half-hour periods**.

Certain boats are to be designated hosts, and the crews of the remaining boats in turn visit the host boats for the scheduled periods. The crew of a host boat remains on board to act as hosts while the crew of a guest boat together visits several hosts.

Every boat has a specific crew size and a maximum capacity. The total number of people aboard a boat at any time, including its own crew and any visiting guest crews, must not exceed its capacity. The data for the 14 boats is as follows, where the i-th element in each list corresponds to the i-th boat:

*   **Crew Sizes:**
    ```
    crew = [2, 2, 2, 2, 4, 4, 4, 1, 2, 2, 2, 3, 4, 2];
    ```
*   **Capacities:**
    ```
    capacity = [6, 8, 12, 12, 12, 12, 12, 10, 10, 10, 10, 10, 8, 8];
    ```

The scheduling must also adhere to the following rules: a guest boat cannot revisit a host boat, and guest crews cannot meet more than once. The problem facing the rally organizer is that of minimizing the number of host boats required for the party.
