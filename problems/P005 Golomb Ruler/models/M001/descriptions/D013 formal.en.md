# Golomb Ruler Challenge

A Golomb ruler is a sequence of $m$ integer marks  
$\text{mark}[1] = 0 < \text{mark}[2] < \dots < \text{mark}[m]$
such that every pairwise distance
$\text{differences}[k] = \text{mark}[j] - \text{mark}[i]\quad(1 \le i < j \le m)$
is unique. The ruler’s length is the value of the last mark, $\text{mark}[m]$.  
The objective is to minimise this length, or to find near‑optimal solutions.

A common symmetry‑breaking rule is to require that the first spacing be smaller than the last:
$\text{differences}[1] < \text{differences}[\tfrac{m(m-1)}{2}].$
There is no need for the ruler to cover every integer distance up to its length; it only has to avoid duplicate
differences. If every distance up to the length does appear, the ruler is called *perfect*.

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; major manual amendments applied)
