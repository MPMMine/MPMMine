# Golomb ruler problem

A Golomb ruler may be defined as a set of m integers $0 = a_1 < a_2 < ... < a_m$ such that the $m(m-1)/2$
differences $a_j - a_i, 1 <= i < j <= m$ are distinct. Such a ruler is said to contain m marks and is of length $a_m$.
The objective is to find optimal (minimum length) or near optimal rulers. Note that a symmetry can be removed by adding
the constraint that $a_2 - a_1 < a_m - a_{m-1}$, the first difference is less than the last.

There is no requirement that a Golomb ruler measures all distances up to its length - the only requirement is that each
distance is only measured in one way. However, if a ruler does measure all distances, it is classified as a *perfect*
Golomb ruler.

[//]: # (The original description from CSPLib prob006 striped out of application examples and references to other problems)
