# Bus Driver Scheduling

The task can be seen as a **set‑partitioning challenge**.  
Imagine a collection of elementary work pieces that must be performed, and a wide pool of candidate operating periods (
shifts). Every candidate shift embraces a particular subset of the work pieces and is assigned a uniform expense.

## Goal

Choose a group of shifts such that each work piece appears in exactly one selected shift (forming a partition). Among
all such partitions, the primary objective is to use as few shifts as possible; the monetary cost of the chosen shifts
is irrelevant because it is constant across all options.

## Conditions

Internally the problem is encoded with a few symbolic components:

* `🅃` – the set of work pieces that need coverage.
* `🅂 = {𝑆₁, 𝑆₂, …, 𝑆ₘ}` – the family of candidate shift sets, each 𝑆ᵢ being a subset of 🅃.
* `𝑥 = (x₁, x₂, …, xₘ)` – binary selectors where `xᵢ = 1` means shift 𝑆ᵢ is taken and `0` otherwise.
* `🅇` – an auxiliary counter that aggregates the chosen selectors, i.e., the total number of shifts selected.

Constraints enforce that every work piece is covered exactly once by the selected shifts, and that the auxiliary counter
respects a predefined lower bound. The optimization directive seeks the smallest possible value of the counter, thereby
minimizing the cardinality of the chosen shift family.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; major manual amendments applied)
