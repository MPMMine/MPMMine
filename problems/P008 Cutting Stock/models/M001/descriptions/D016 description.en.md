# Optimising the Cutting of Aluminium Profiles for Window Frames

A workshop that fabricates aluminium window‑frame profiles receives long, standard extrusion bars from a supplier. These
bars have a fixed length, denoted **$L$**. For every customer order the workshop is required to produce several distinct
types of frame components.  
For a component type $i$ we must cut pieces of length **$l_i$**, and the order demands a total of **$d_i$** such pieces.

Because the bars are a costly resource, the workshop wants to cut them as efficiently as possible. Whenever a bar is
divided, the leftover fragment is considered **waste** and is normally discarded if it is too short to be reused.

The planning problem is to decide how many bars to use and where to cut them so that:

1. **Demand satisfaction** – at least $d_i$ pieces of every type $i$ are produced.
2. **Material utilisation** – the number of bars employed is as small as possible.

---

## Symbolic model description

* **Parameters**
    * $n$ – number of distinct component types (items).
    * $m_{\max}$ – an upper bound on the number of bars that can be considered.
    * $W$ – the width (length) of a single bar.
    * $\text{len}[i]$ – the required length of an item of type $i$ $(i=1..n)$.
    * $\text{dem}[i]$ – the demanded count of items of type $i$.

* **Derived data**
    * $\text{maxCuts}[i] = \lfloor W / \text{len}[i] \rfloor$ – the maximum number of pieces of type $i$ that can
      physically fit on one bar.

* **Decision variables**
    * $u_j \in \{0,1\}$ for $j=1..m_{\max}$ – indicates whether bar $j$ is used.
    * $c_{i,j}$ for $i=1..n,\; j=1..m_{\max}$ – number of pieces of type $i$ cut from bar $j$.

* **Constraints**

    1. **Physical capacity**  
       $c_{i,j} \le \text{maxCuts}[i] \cdot u_j$ for all $i,j$.  
       (You cannot cut more pieces of a type than a bar can physically hold.)

    2. **Bar width**  
       $\sum_{i=1}^{n} c_{i,j}\,\text{len}[i] \;\le\; W \cdot u_j$ for all $j$.  
       (The total length of pieces cut from a bar must not exceed its length.)

    3. **Demand fulfilment**  
       $\sum_{j=1}^{m_{\max}} c_{i,j} \;\ge\; \text{dem}[i]$ for all $i$.  
       (All required pieces must be produced.)

    4. **Symmetry breaking**  
       $u_j \ge u_{j+1}$ for all $j=1..m_{\max}-1$.  
       (Ensures that used bars are considered in order, reducing equivalent solutions.)

    5. **Redundant but useful** – a lower bound on the number of bars  
       $\sum_{j=1}^{m_{\max}} u_j \;\ge\; \left\lceil \frac{\sum_{i=1}^{n} \text{dem}[i]\;\text{len}[i]}{W} \right\rceil$.  
       (At least enough bars are required to cover the total demanded length.)

* **Objective**  
  Minimise $\sum_{j=1}^{m_{\max}} u_j$ – the total count of bars used.

[//]: # (Generated using gpt-oss:latest from D010 description.en.md and model.mzn; minor manual amendments applied)
