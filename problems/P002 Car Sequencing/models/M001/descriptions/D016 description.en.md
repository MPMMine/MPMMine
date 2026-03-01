# Algorithmic Problem Statement

A fleet of vehicles must be arranged along a production line where each unit belongs to one of several **classes**.
Vehicles of the same class share a fixed set of optional accessories, while other classes may have different
combinations. The line is divided into work‑stations, each dedicated to installing a particular accessory on the passing
units.

Every station has a designated capacity that limits how many cars fitted with its specific feature can appear
consecutively; otherwise the equipment would become overloaded. Moreover, because certain accessories must not be
clustered together, an additional rule prevents long runs of cars dependent on the same option. Consequently, a feasible
ordering is required in which:

* the total number of vehicles produced equals demand for each class;
* no contiguous segment longer than a permitted length contains more such units than allowed.

The combinatorial nature of the placement makes this task computationally hard (NP‑complete).

## Compact Mathematical Representation

Let `n_classes`, `n_options` and `n_cars` denote the numbers of distinct vehicle classes, accessories, and total cars
respectively. An array `carQuantities[class]` stores how many units belong to each class; a two‑dimensional matrix
`features[class, option]` encodes which options are mandatory for each class.

The assembly line is modeled as a sequence indexed by positions `pos = 1 … n_cars`. At each position the assigned *
*class** variable determines a corresponding row of the feature indicator.

Constraints required for any valid ordering are:

* **Exact allocation** – the total count of cars assigned to each class equals its prescribed quantity;
* **Cap segment limits** – for every option `o` and for every feasible window of length `blockSize[o]`, the sum of
  activation flags does not surpass `maxCars[o]`;
* **Feature consistency** – an indicator for option `o` at position `pos` equals the feature value prescribed by
  `features[assignedClass[pos], o]`;
* **Accumulation guarantees** – after a certain number of complete windows, the cumulative activation must be at least
  the remaining required installations minus what has already been placed in scheduled full windows.

The formulation seeks any ordering that respects all above restrictions without seeking an explicit objective value.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
