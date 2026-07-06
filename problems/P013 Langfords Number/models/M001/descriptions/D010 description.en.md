# Constructing a Langford Arrangement

We are tasked with devising a sequence of arrangements where each element from the set {1, 2, ..., k} appears exactly
twice. This arrangement must satisfy a specific distance property: between any two identical elements, there must be a
precise number of intervening distinct elements.

Specifically, if we consider a particular number 'n' within the set, there must be exactly ‘n’ different numbers
situated between its two instances within the overall sequence. First number should be smaller than the last one.

[//]: # (Generated using gemma3:latest from D001 description.en.md and model.mzn; minor manual amendments applied; with added symmetry breaking information)
