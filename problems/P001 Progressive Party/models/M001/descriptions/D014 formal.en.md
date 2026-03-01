# Progressive Party Problem

Given a collection of vessels, each identified by an element of a symbolic set **𝔅**, and a fixed number of discrete
time slots represented by a symbolic set **ℰ**. Each vessel carries its own crew size (`crew[·]`) and can hold at most
`cap[·]` people simultaneously. The organizer must pick a subset **Hosts ⊆ 𝔅** that will act as eternal anchors for the
party.

During every slot of a schedule, each vessel is required to be in the company of exactly one member of **Hosts**. If the
vessel itself belongs to **Hosts**, it remains anchored to its own hull; otherwise it maneuvers through successive
anchor points supplied by host hulls. At each slot `t∈ℰ` and for every hull `b∈𝔅`, a variable assignment determines the
specific host that `b` visits (`visit[b,t] ∈ Hosts`).

When a particular vessel `h` is hosting, the total number of people onboard must stay within its capacity: the sum of
all crew sizes of vessels assigned to it at that slot cannot exceed `cap[h]`. Moreover, no two distinct hulls may share
an anchor point more than once throughout all slots; i.e., for any pair `{k,l}` with `k≠l`, the count of slots where
they meet (`visit[k,t]=visit[l,t]`) is limited to one.

To curb permutation redundancy a symmetry‑breaking rule orders the rows of the assignment matrix lexicographically
across consecutive time steps.  
The optimization goal minimizes the cardinality of **Hosts** (`|Hosts|`).

In symbolic notation this can be expressed as:

- `visit : 𝔅 × ℰ → Hosts`
- `∀h∈Hosts, t∈ℰ: Σ_{b∈𝔅} [visit[b,t]=h]·crew[b] ≤ cap[h]`
- `∀k,l∈𝔅, k<l: Σ_{t∈ℰ} [visit[k,t]=visit[l,t]] ≤ 1`
- Lexicographic monotonicity across periods,
- Objective: minimize `|Hosts|`.

Thus, the problem seeks a minimal set of permanent anchors while respecting capacity limits and pairwise exclusivity
across all temporal stages.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
