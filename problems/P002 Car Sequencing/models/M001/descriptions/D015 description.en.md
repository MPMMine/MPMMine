# Vehicle Assembly Sequencing Puzzle

A collection of transport units will be produced; each unit draws from a distinct configuration class because of
optional equipment such as climate control or panoramic roof panels. The manufacturing line is composed of ordered
stations that mount these pieces of equipment. Every station has been sized to support only a limited share of the
overall throughput, and any two units sharing a particular piece of equipment must not be concentrated in an oversized
cluster; otherwise the associated station would be forced beyond its design limit. Therefore, a linear ordering of
chassis must be found that never breaches a station’s quota.

The abstract specification introduces the following symbolic constructs:

* **C** – index set representing each configuration class
* **O** – index set enumerating every optional feature (station)
* **P** – index set denoting positions in the final line order

* An assignment `x[p] ∈ C` that places exactly one class at each position, guaranteeing that the total number of
  occurrences of each class matches a pre‑specified tally variable.
* For every optional feature *o*, a sliding window length denoted by the symbolic parameter **Wₒ** during which no more
  than **Mₒ** installations of that feature are permitted; this enforces the capacity ceiling captured by *maxCars[o]*.
* A auxiliary indicator `y[o,p]` that signals whether feature *o* is active at position *p*; it must be set consistently
  with the mandatory option pattern encoded in a table linking classes to their required features.

All constraints interlock: exact class counts are satisfied, every sliding block respects its designated capacity, and
feature usage follows the prescribed design blueprint. The problem is NP‑complete.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
