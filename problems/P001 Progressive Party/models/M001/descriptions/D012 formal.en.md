# Progressive Party Problem

The task is to schedule a series of gatherings on a fleet of boats.  
A subset of the boats becomes **hosts**; the remaining boats act as **guests** and, over a number of successive
half‑hour slots, each guest visits a host boat.
The crew of a host stays on board to host, while the crew of a guest travels together to the hosts in each slot.
Every boat can accommodate only a limited number of people at once (its **capacity**), and the crews of different boats
may have different sizes.
Consequently, for every host $h$ and every time slot $t$ the total number of people aboard—that is, the sum of the crew
size of the host plus the crew sizes of all guests that visit $h$ at time $t$—must not exceed $capacity[h]$.

Guests are not allowed to revisit the same host more than once, and any two crews (whether host or guest) may not meet
in the same party more than once.
The organizer’s goal is to reduce the number of host boats as much as possible.

---

## Formalisation

| Symbol               | Meaning                                                     |
|----------------------|-------------------------------------------------------------|
| $n_{\text{boats}}$   | number of boats                                             |
| $n_{\text{periods}}$ | number of half‑hour periods                                 |
| $\text{Boat}$        | set $\{1,\dots,n_{\text{boats}}\}$                          |
| $\text{Time}$        | set $\{1,\dots,n_{\text{periods}}\}$                        |
| $\text{capacity}[b]$ | capacity of boat $b$                                        |
| $\text{crew}[b]$     | crew size of boat $b$                                       |
| $\text{hosts}$       | decision variable, a subset of $\text{Boat}$                |
| $\text{visit}[b,t]$  | decision variable: the host visited by boat $b$ at time $t$ |
| $\text{optVar}$      | number of hosts, objective variable                         |

### Constraints

1. **Host membership**  
   $\forall b \in \text{Boat}, t \in \text{Time}: \text{visit}[b,t] \in \text{hosts}$

2. **Hosts stay put**  
   $\forall b \in \text{Boat}, t \in \text{Time}: (b \in \text{hosts}) \Leftrightarrow \text{visit}[b,t] = b$

3. **Capacity limits**  
   $\forall h \in \text{hosts}, t \in \text{Time}:\
   \sum_{b \in \text{Boat}}\bigl[\text{visit}[b,t] = h\bigr] \cdot \text{crew}[b] \le \text{capacity}[h]$

4. **No repeat meetings**  
   $\forall k,l \in \text{Boat}, k < l:\
   \sum_{t \in \text{Time}}\bigl[\text{visit}[k,t] = \text{visit}[l,t]\bigr] \le 1$

5. **Lexicographic symmetry breaking**  
   $\forall i \in \{1,\dots,n_{\text{periods}}-1\}:\
   \text{lex\_lesseq}(\text{visit}[\;\cdot\;,i],\text{visit}[\;\cdot\;,i+1])$

### Objective

$\text{optVar} = |\text{hosts}|$ and minimise $\text{optVar}$

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; major manual amendments applied)
