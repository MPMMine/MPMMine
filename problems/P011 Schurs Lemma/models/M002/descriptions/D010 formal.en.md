# Problem statement

You have a collection of $\texttt{balls}$ distinct items, each identified by an index $1,\dots,\texttt{balls}$, and a
set of $\texttt{boxes}$ containers.  
An assignment is a function

$$
\texttt{box}:\{1,\dots,\texttt{balls}\}\longrightarrow\{1,\dots,\texttt{boxes}\},
$$

which places every ball into exactly one box.  
The assignment is *valid* only if it never places three distinct balls that satisfy the linear relation $x+y=z$ inside
the same box.

In other words, for every pair of indices $i$ and $j$ with $1\le i < j\le\texttt{balls}$ such
that $i+j\le\texttt{balls}$, at least one of the following must hold:

* $\texttt{box}[i]\neq\texttt{box}[j]$,
* $\texttt{box}[i]\neq\texttt{box}[i+j]$, or
* $\texttt{box}[j]\neq\texttt{box}[i+j]$.

The goal is to find any assignment that satisfies this constraint, or to prove that none exists.

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn)
