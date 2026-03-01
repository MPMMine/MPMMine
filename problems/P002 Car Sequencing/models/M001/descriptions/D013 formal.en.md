# Car Sequencing Problem

A production line must assemble a fleet of cars that differ by optional equipment such as air‑conditioning, sun‑roof,
etc. Let

- $\mathcal C =\{1,\dots ,n_{\text{classes}}\}$ be the set of car classes,
- $\mathcal O =\{1,\dots ,n_{\text{options}}\}$ the set of optional features,
- $\mathcal S =\{1,\dots ,n_{\text{cars}}\}$ the sequence positions (slots).

For each class $c\in\mathcal C$ we are given the quantity $q_c$ of cars to be produced.  
A binary matrix $\text{opt}[c,o]$ indicates whether option $o$ is required by class $c$.

Each option $o$ has an associated **block size** $b_o$ (the length of a contiguous segment of the line that a station
can process at once) and a **maximum capacity** $m_o$ (the largest number of cars bearing that option that may appear
inside any block of length $b_o$).  
Let $\text{need}_o = \sum_{c} q_c\,\text{opt}[c,o]$ denote the total number of cars that will require option $o$.

## Decision variables

- $s_s \in \mathcal C$ for every slot $s\in\mathcal S$ specifies which class occupies that slot.
- $f_{o,s}\in\{0,1\}$ indicates whether option $o$ is active in slot $s$.

The model imposes the following constraints:

1. **Class counts**  
   $\forall c\in\mathcal C:\;\;\sum_{s\in\mathcal S}\mathbf{1}[s_s=c] = q_c$.

2. **Block capacity**  
   $\forall o\in\mathcal O,\;\forall s\in\{1,\dots ,n_{\text{cars}}-b_o+1\}:\;
   \sum_{j=s}^{s+b_o-1} f_{o,j}\;\le\; m_o$.

3. **Feature consistency**  
   $\forall o\in\mathcal O,\;\forall s\in\mathcal S:\;
   f_{o,s} = \text{opt}[s_s,o]$.

4. **Global requirement per option**  
   For each option $o$ and each integer $k$ with $1\le k\le \text{need}_o$,
   $\sum_{s=1}^{\,n_{\text{cars}}-k\,b_o}\! f_{o,s}
   \;\ge\; \text{need}_o - k\,m_o$.
   This guarantees that the cumulative number of cars needing option $o$ outside the first $k$ blocks is at least what
   remains after saturating those blocks.

An objective is to find a feasible schedule.

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; major manual amendments applied)
