# Finding Optimal Rulers

The Golomb ruler problem involves constructing a sequence of integers, denoted as $a_1, a_2, ..., a_m$
where $0 = a_1 \le a_2 \le ... \le a_m$, such that the differences between all pairs of elements are all unique. We aim
to determine the minimal length of such a ruler, which corresponds to the largest element in the sequence ($a_m$). A
ruler is considered "perfect" if it encompasses all possible distance measurements up to its maximum length. Symmetry
can be broken by requiring that the first difference within the ruler is less than the last difference.

[//]: # (Generated using gemma3:latest from D001 description.en.md and model.mzn; major manual improvements applied)
