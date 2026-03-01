# Golomb ruler challenge

A Golomb ruler is a sequence of **m** integer marks  
$a_1, a_2, \dots , a_m$ with  
$a_1 = 0$ and $a_1 < a_2 < \dots < a_m$.  
The set of all pairwise gaps

$\{a_j - a_i \mid 1 \le i < j \le m\}$

must consist of distinct values.  
The ruler contains **m** marks and its total length is $a_m$.  
The goal is to find rulers with the smallest possible length, or close to it.  
A common symmetry breaking rule is to require the first gap to be smaller than the last one, i.e.  
$a_2 - a_1 <  a_m - a_{m-1}$.

There is no requirement that every integer distance up to the total length appears among the gaps; a ruler that does is
called a *perfect* Golomb ruler.

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; major manual amendments applied)
