# Marked Ruler Challenge

Consider a ruler characterized by a collection of *n* distinct integers, with the smallest being 0 and the others
strictly increasing. The ruler's extent is defined by its largest mark. The ruler's uniqueness property requires that
every pairwise difference (the gap between any two marks) appears exactly once. A ruler achieving all integer distances
from 1 up to its extent is designated a *perfect* ruler.

The core task involves discovering rulers that minimize their extent for a fixed number of marks *m*. An additional
stipulation prevents certain symmetric configurations by ensuring the gap between the first two marks is not larger than
the gap between the last two marks.

[//]: # (Generated using deepseek-r1:latest from D001 description.en.md and model.mzn; major manual amendments applied)
