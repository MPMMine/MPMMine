# Golomb Ruler formulation

A feasible ruler is described by a strictly increasing list of `M` integer positions, beginning at 0:

```
0 = p_1 < p_2 < … < p_M .
```  

From this set we obtain `_D = M*(M-1)/2` pairwise gaps `p_j - p_i` (`i<j`).
All these gaps must be different, so the arrangement holds `M` marks and its total length equals the last mark value.

The aim is to minimise this final position, thereby obtaining an optimal or near‑optimal ruler.  
To eliminate symmetric mirror solutions we may enforce that the first gap be smaller than the last gap:

```
(p_2 - p_1) < (p_M - p_{M-1}).
``` 

There is no requirement that every integer distance up to the span be covered; when a ruler does cover all such
distances it is called *perfect*.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; major manual amendments applied)
