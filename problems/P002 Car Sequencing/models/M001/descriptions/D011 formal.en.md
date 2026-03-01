# Car Sequencing Problem

Let

- $C$ be the set of car classes,
- $O$ the set of optional features,
- $S$ the sequence of positions on the line.

For each class $c∈C$ we know the required quantity $Q[c]$.  
The binary matrix $R[c,o]$ tells whether a car of class $c$ needs feature $o$.  
Each feature $o$ has a window size $B[o]$ and a limit $M[o]$ of cars with this feature within any position of this
window.

We introduce decision variables

- $s[i] ∈ C$ for every position $i∈S$, describing the class of the car placed at that position,
- $x[o,i] ∈ {0,1}$ for all $o∈O$, $i∈S$, indicating whether feature $o$ is active at position $i$.

The model is built around the following constraints:

1. **Class‑balance** – every class appears the prescribed number of times:  
   $\forall c\in C: \sum_{i\in S}\mathbf 1_{s[i]=c}=Q[c].$

2. **Local capacity** – in any consecutive window of length $B[o]$, the number of cars that require feature $o$ cannot
   exceed $M[o]$:  
   $\forall o\in O, \forall i\in S\setminus\{1,\dots,B[o]-1\}:
   \sum_{j=i}^{i+B[o]-1}x[o,j]\le M[o].$

3. **Feature consistency** – the active‑feature vector at a position must equal the requirement of the class placed
   there:  
   $\forall o\in O, \forall i\in S:
   x[o,i]=R[s[i],o].$

4. **Symmetry break through balancing** – for every feature $o$, the cumulative number of cars produced so far that
   need $o$ must be at least the total required amount minus what can be produced in the future:  
   $\forall o\in O, \forall t\in\{1,\dots, \sum_{c \in C} (Q[c] \cdot R[c,o]) \}:
   \sum_{i\in S}x[o,i] \ge
   \sum_{c \in C} (Q[c] \cdot R[c,o])-t\cdot M[o].$

The objective is merely to find a feasible sequence.

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; major manual amendments applied)
