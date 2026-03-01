# Vessel Loading Problem

The deck is represented as a planar rectangle aligned with compass directions.
Each container occupies a single layer and has the shape of a rectangular solid; its faces are parallel to the edges of
the deck. A container’s class—identified by its content—determines required separation distances from containers of
certain other classes, enforcing minimum gaps measured either parallel or perpendicular to the length axis.

The loading decision problem asks whether all containers can be placed on this deck without intersecting one another and
while respecting every prescribed gap. This formally reduces to fitting a set of rectangles into the larger rectangular
domain under extra positional constraints.

In practice the placement follows a fixed sequence that starts at the southeast corner. Containers arrive **one after
another**, and each newly introduced unit must be positioned so that it touches either an already placed container or a
deck wall on its north side and also on its west side. This rule forces a build‑up that expands outward from the
reference corner.

## Formal entities

- `D_W` – overall width of the deck,
- `D_L` – overall length of the deck,
- `C_NB` – total number of containers to be positioned,
- `K_NB` – count of distinct container classes,
- `WIDTH[c]` – intrinsic east–west dimension of container *c*,
- `LEN[c]` – intrinsic north–south dimension of container *c* (the two values are exchanged when the unit is rotated),
- `CLASS[c]` – class identifier attached to container *c*,
- `SEP[a,b]` – allowed minimum inter‑class distance between any pair belonging to classes *a* and *b*,
- `LEFT[c]`, `RIGHT[c]`, `BOTTOM[c]`, `TOP[c]` – planar coordinates of the respective lateral limits of each container
  within the deck expanse,
- `ORI[c]` – binary orientation selector (upright or rotated ninety degrees).

### Core constraints

#### Shape determination for each unit

There exists an orientation symbol for every container such that its active east–west span equals one component of its
intrinsic dimensions chosen by the orientation flag, while its north–south span equals the complementary component;
consequently `RIGHT[c]` is derived from `LEFT[c]` plus this east‑west span and `TOP[c]` follows similarly from
`BOTTOM[c]`.

#### Non‑overlap and required gaps

For any pair of distinct containers *c* and *k*, at least one of the following must hold: the horizontal intervals
separate by a gap that meets the prescribed separation, or the vertical intervals separate analogously with equal regard
for the same separation value. These conditions guarantee that no two units intersect and that every mandated
inter‑class spacing is satisfied throughout the deck surface.

#### Sequential adjacency requirement

When containers are ordered according to their arrival sequence, each newly placed unit must exhibit a contiguous
contact on its northern edge with either another already positioned container or with the western boundary of the deck;
simultaneously it must share a contacting segment along its western edge with some previously placed element or with
that same boundary. This adjacency enforces expansion outward from the initial corner.

The formulation seeks only a feasible arrangement satisfying all earlier conditions; such a configuration confirms that
the given set of containers can be loaded onto the specified deck while respecting class‑based spacing rules.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
