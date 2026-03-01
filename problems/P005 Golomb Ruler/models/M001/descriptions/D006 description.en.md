# Optimal Marks Ruler Challenge

Consider a ruler characterized by a collection of `m` integer positions, ordered strictly and starting from `0`. These
positions, denoted `a_1` through `a_m`, must satisfy `a_1 = 0` and `a_i < a_j` for any `i < j`. The ruler's overall
extent, its length, is given by `a_m`.

The core requirement is that every pairwise distance between any two marks, calculated as `a_j - a_i` for
`1 <= i < j <= m`, must be unique. There are `m(m-1)/2` such distances.

The primary objective is to identify rulers that achieve the smallest possible length (`a_m`) or come very close to it.
A ruler that measures every integer distance up to its full length is called a perfect ruler.

To address potential symmetry issues and reduce the search space, we impose a specific constraint: the distance between
the first two marks (`a_2 - a_1`) must be strictly less than the distance between the last two marks (`a_m - a_{m-1}`).

The task involves finding such rulers and verifying that all the differences between marks are indeed unique.

[//]: # (Generated using deepseek-r1:latest from D001 description.en.md and model.mzn; major manual amendments applied)
