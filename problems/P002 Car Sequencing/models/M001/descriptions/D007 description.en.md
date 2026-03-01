# Car Sequencing Problem

This problem involves arranging a sequence of cars on an assembly line, where each car belongs to a specific class (
determined by its required features). The goal is to find a sequence that satisfies several constraints derived from the
production process.

## Key Elements

* **Car Classes:** There are `n_classes` distinct types of cars, each defined by a unique combination of features. Each
  car class requires a specific set of features.
* **Features (Options):** There are `n_options` different features that can be optionally included or excluded in the
  cars. Each feature is either present or absent for every car.
* **Feature Configuration:** The `optionsRequired` array defines, for each car class, which features must be included.
  This array specifies the feature set for each car class.

## Constraints

1. **Class Quantity:** The sequence must contain exactly `carQuantities[c]` cars of class `c` for each car class `c`.
2. **Feature Block Limit:** For each feature `o`, there is a maximum number (`maxCars[o]`) of consecutive cars that can
   have this feature active (`setup[o,s] = 1` for a block of cars). This is related to the `blockSize[o]` which
   determines the length of the window over which the constraint is checked. No window of `blockSize[o]` consecutive
   cars can have more than `maxCars[o]` cars with feature `o` active.
3. **Feature Consistency:** The features present in a car must match the features required by its class. For a car at
   position `s`, its class `slot[s]` determines which features `options` should be active (
   `setup[o,s] = optionsRequired[slot[s],o]`).
4. **Feature Requirement Fulfillment:** The total number of cars with a specific feature `o` (
   `numberOfCarsWithGivenOption[o]`) must be met. This requires that the sum of cars with `o` active, spread across the
   sequence, reaches the required number, considering the maximum allowed per block (`maxCars[o]`).

## Complexity

This problem is known to be computationally difficult (NP-complete).

The task is to find a sequence (a permutation) of the car classes (respecting their quantities) that satisfies all the
above constraints regarding feature consistency, block limits, and required feature counts.

[//]: # (Generated using deepseek-r1:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
