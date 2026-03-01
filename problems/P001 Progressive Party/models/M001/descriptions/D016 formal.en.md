# Distributed Gathering Problem

A yacht‑club rally must be organized so that a subset of vessels serves as fixed bases while the crews of all other
vessels travel among those bases during several equal intervals (half‑hour slots).

- Certain boats are declared **base** units; every remaining vessel moves from one base to another in each slot, staying
  together with the permanent crew of the visited base for that interval.
- Every craft can accommodate only up to a fixed limit (`CAP[b]`), and each vessel carries its own specific onboard
  staff size (`CRW[b]`); therefore, at any slot the sum of all people present on a particular base—its own staff plus
  the crews of all boats presently visiting it—must stay within `CAP[h]`.
- A non‑base craft may stop at a given base only once, and no two distinct vessels may be together on the same base more
  than one occasion throughout the entire schedule.

Formally, let **B** be the collection of all boats and **T** the set of time slots. Decision symbols are:

- `HOST ⊆ B` the set of boats that act as bases;
- `VIS[ b , t ] ∈ HOST` indicates which base boat `b` visits during slot `t`; therefore every entry of the table must
  belong to `HOST`.
- An auxiliary integer `NUMS = |HOST|`, representing the total number of bases used.

Key requirements translated into constraints are:

1. **Self‑hosting:** a base always hosts itself in each slot, i.e., `(b∈HOST) ⇔ VIS[b,t] = b`.
2. **Capacity enforcement:** for any base `h` and slot `t`, the aggregate crew load of all boats that visit `h` must
   respect its capacity: ` Σ_{b∈B} [ VIS[b,t]=h ]·CRW[b] ≤ CAP[h]`.
3. **Uniqueness of pair meetings:** for every pair `{k,l}` of distinct vessels, the number of slots where they share a
   host is at most one: ` Σ_{t∈T} [ VIS[k,t]=VIS[l,t] ] ≤ 1`.
4. **Symmetry breaking:** successive columns of the visit table are ordered lexicographically.

The goal is to minimise `NUMS`, thereby using as few bases as possible under all stated conditions.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; major manual amendments applied)
