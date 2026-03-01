# Sequencing of Heterogeneous Vehicles on a Fixed‑Length Production Line

The system must manufacture a fleet that consists of several distinct **vehicle classes**.  
For each class *c* an integer demand **d(c)** specifies how many units of that class are required – all these demands
together fill the entire line.  
A binary matrix **R(c,o)** records whether option *o* must be installed on any unit belonging to class *c*.

The production line contains a fixed set **S** of positions (slots) numbered consecutively from the first up to the
last; each slot will receive exactly one vehicle class. Decision variables **xₛ ∈ {1,…,|C|}** tell which class is placed
at position *s*.

Adjacent binary auxiliary variables **b(o,s) ∈ {0,1}** indicate whether option *o* is turned on in slot *s*. These
auxiliaries must obey two groups of rules.

1. **Feature consistency** – for every class *c*, option *o* and slot *s* the binary flag has to match the pre‑specified
   requirement:  
   `b(o,s) = R(xₛ, o)`.

2. **Interval capacity limits** – each option can be handled only in blocks whose length is bounded by a symbolic
   interval size **ℓ_o**. Within any feasible starting slot the total number of activated instances of that option may
   not exceed its allocated capacity **u_o**:  
   *The sum of `b(o,j)` over all slots *j* that lie inside a contiguous stretch beginning at some position and extending
   for length ℓ_o does not exceed u_o*. This formulation is written for every option *o, o∈O* and for each possible
   start of such a block.

3. **Global demand compatibility** – after any fixed number *p* of complete intervals for option *o* has been scheduled,
   the remaining part of the line must still be able to accommodate the rest of the required instances. In symbols:  
   *For each non‑negative integer p the left‑hand tail of slots that can start a new interval must contain at least
   enough activated flags `b(o,j)` to satisfy `demand(o) – p·u_o`*. This restriction links the pattern of activated
   positions to the overall demand vector.

All assignments **xₛ** and auxiliary values **b(o,s)** must simultaneously satisfy:

* The total number of slots assigned to class *c* equals its required amount `d_c`.
* Every block defined by option *o* respects the capacity ceiling `u_o` that we introduced.
* The activated flag pattern exactly mirrors the requirement matrix **R**.
* After eliminating any scheduled complete intervals, enough slack slots remain to meet the leftover portion of every
  demand entry.

The aim is to finy any feasible schedule.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
