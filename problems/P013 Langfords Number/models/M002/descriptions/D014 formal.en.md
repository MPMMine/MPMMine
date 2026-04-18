# Langford’s sequence challenge

Langford’s challenge L(K) asks to interleave two copies of the symbols 1…K such that, for each symbol I, the second
occurrence is placed exactly I plus one positions after the first one.

The formal formulation introduces a symbolic set PosSet that represents all admissible positions, and two decision
variables:

* PosVar indexed by PosSet, indicating where each occurrence is positioned, and
* SolArr also indexed by PosSet, storing the actual value placed at each position.

Constraints are expressed as follows:

* For every I belonging to the value domain, the positions of its two copies satisfy PosVar[second(I)] =
  PosVar[first(I)] + I + 1, and the corresponding entries of SolArr at those positions are both equal to I;
* All entries of PosVar are required to be distinct;
* A symmetry‑breaking rule forces the first entry of SolArr to be smaller than its last entry.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
