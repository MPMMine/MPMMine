# Finding Optimal Rulers

The problem involves constructing a Golomb ruler, which is a sequence of integers $a_1, a_2, ..., a_m$
where $0 = a_1 \le a_2 \le ... \le a_m$ such that the differences between any two consecutive integers in the sequence
are all unique. This collection of integers forms a ruler with $m$ markings and a total length equal to $a_m$. The goal
is to discover the shortest possible ruler that satisfies this condition. A special case is a *perfect* Golomb ruler,
where the ruler measures every possible distance between markings up to its maximum length. A constraint can be
introduced to remove symmetry, requiring the first difference within the ruler to be smaller than the last.

Instructions for building a model: Leverage inequalities to ensure the correct ordering of the integers and use an
`alldifferent` constraint to guarantee that all pairwise differences are distinct. The objective seeks the minimal
length of the ruler.

[//]: # (Generated using gemma3:latest from D001 description.en.md and model.mzn; major manual amendments applied)
