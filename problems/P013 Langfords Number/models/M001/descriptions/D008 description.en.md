# Constructing a Langford Arrangement

We are tasked with generating a specific arrangement of numbers. Consider a sequence where we have two copies of each
integer from 1 to *k*, forming a complete list [1, 1, 2, 2, ..., *k*, *k*]. The goal is to create a permutation of these
numbers such that a particular property holds: for every number *n* within this set, there must be exactly *n* other
numbers situated between the two instances of *n* within the arrangement. Furthermore, to address symmetry, it is required that the first element is strictly less than the last element.

[//]: # (Generated using gemma3:latest from D001 description.en.md and model.mzn; minor manual amendments applied; with added symmetry breaking information)
