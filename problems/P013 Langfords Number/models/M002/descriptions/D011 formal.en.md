# Langford's Sequence Challenge

The Langford problem, denoted $L(k)$, asks for a linear ordering of two copies of each integer from $1$ to $k$.  
In the desired arrangement, if the first occurrence of an integer $i$ occupies position $p$, then the second occurrence
of that same integer must appear exactly $i+1$ places later, at position $p+i+1$.

The decision variables are

* $\text{position}$: a mapping from each of the $2k$ items to a distinct position in the sequence, and
* $\text{solution}$: the explicit sequence of length $2k$ where $\text{solution}[p] = i$ whenever the item $i$ is placed
  at position $p$.

The model enforces the core distance constraint  

$$
\forall i\in\{1,\dots,k\}:\quad \text{position}[i+k] = \text{position}[i] + i + 1,
$$

along with the consistency conditions that each position in $\text{solution}$ is filled with the correct integer.  
All positions must be distinct ( $\text{all\\_different}\(\text{position}\)$ ), and a simple symmetry‑breaking
rule $\text{solution}[1] < \text{solution}[2k]$ is added.

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
