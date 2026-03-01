# Golomb Ruler Challenge

A **Golomb ruler** is a collection of $m$ integer positions  
$0 = \texttt{mark}[1] < \texttt{mark}[2] < \dots < \texttt{mark}[m]$
such that every pairwise difference
$\texttt{mark}[j] - \texttt{mark}[i] \quad (1 \le i < j \le m)$
occurs exactly once.  
The ruler contains $m$ marks and its length is $\texttt{mark}[m]$.  
The goal is to discover rulers of the smallest possible length (or near‑optimal ones).

**Symmetry removal**: impose the additional ordering on the first and last differences,
$\texttt{differences}[1] < \texttt{differences}[\texttt{last}],$
where $\texttt{differences}$ is the list of all pairwise differences.

A ruler that measures every integer distance from $1$ up to its length is called a **perfect** Golomb ruler; this
property is not mandatory.

Key elements:

- **Variables**
    - `mark[1..m]` – integer positions (first fixed to 0).
    - `differences[1..(m*(m-1))/2]` – all distinct pairwise distances.

- **Constraints**
    - Monotonicity of marks.
    - All differences must be different (`alldifferent`).
    - Symmetry-breaking inequality on the first and last differences.

- **Objective**
    - Minimize the last mark (`mark[m]`) to obtain the shortest ruler.

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; major manual amendments applied)
