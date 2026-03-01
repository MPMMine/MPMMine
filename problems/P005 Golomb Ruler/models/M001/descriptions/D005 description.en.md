# Golomb Ruler Challenge

A Golomb ruler is specified by a sequence of m distinct integers, with the initial integer fixed at zero and the
sequence strictly increasing. The set of all pairwise differences must be unique, ensuring no two pairs have the same
difference. The ruler's length corresponds to the maximum integer in the sequence. The primary objective is to minimize
this length, or find a ruler that is nearly optimal. To reduce symmetry, a constraint is applied that the first pairwise
difference is less than the last pairwise difference. Additionally, if the ruler measures every integer distance from 1
to its length, it is classified as a perfect Golomb ruler.

[//]: # (Generated using deepseek-r1:latest from D001 description.en.md and model.mzn; major manual amendments applied)
