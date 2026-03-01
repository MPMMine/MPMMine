# Progressive Party Problem

The aim is to plan a sequence of gatherings on a fleet of yachts.  
A subset of vessels is chosen to act as hosts; the crews of all other vessels visit these hosts during a chain of
consecutive half‑hour slots.  
A host vessel stays on board for the entire sequence while a visiting crew accompanies it.  
Each boat has a limited berth capacity, and the total number of people on a host (its own crew plus all visiting crews)
must not exceed that capacity.  
A visiting crew may not return to the same host, and any two crews may share a host at most once.  
The organizer seeks to minimise the number of host vessels.

## Formal model

* $B$ – the set of boats, $|B| = n_{\text{boats}}$
* $T$ – the set of time slots, $|T| = n_{\text{periods}}$
* $\text{cap}_{b}$ – capacity of boat $b \in B$
* $\text{crew}_{b}$ – crew size of boat $b \in B$
* $H \subseteq B$ – the set of selected host boats
* $\text{visit}_{b,t} \in H$ for every $b \in B,\, t \in T$ – the host that boat $b$ visits at slot $t$

### Decision‑variable constraints

1. **Host consistency** – if $b \in H$ then $\text{visit}_{b,t}=b$ for all $t$, otherwise $\text{visit}_{b,t}$ is one of
   the hosts.
2. **Capacity constraint** – for each host $h \in H$ and slot $t$,
   $\sum_{b \in B}\bigl[\text{visit}_{b,t}=h\bigr]\;\cdot\;\text{crew}_{b}\;\le\;\text{cap}_{h},$
   where $[\cdot]$ evaluates to 1 when the condition holds, 0 otherwise.
3. **Unique encounters** – for any two distinct boats $k$ and $l$,
   $\sum_{t \in T}\bigl[\text{visit}_{k,t}=\text{visit}_{l,t}\bigr]\;\le\;1.$
4. **Symmetry breaking** – the rows of the visit matrix are lexicographically non‑increasing:
   $\text{visit}_{\,\cdot,1}\;\le_{\text{lex}}\;\text{visit}_{\,\cdot,2}\;\le_{\text{lex}}\;\dots$

### Objective

Minimise $|H|$, the number of hosts.  
The resulting schedule is a matrix whose columns correspond to the $T$ consecutive half‑hour periods and whose entries
are host indices.

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
