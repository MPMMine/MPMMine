# Vessel Loading

The deck of a supply vessel is a rectangular area. A collection of cuboid containers must be laid out in a single layer,
each aligned with the deck’s sides. Every container *c* has a width $W_c$, a length $L_c$, and belongs to a
class $Cls(c)$. The classes interact through a separation table $S_{a,b}$ that specifies the minimal spacing required
between any two containers of classes *a* and *b*.

The loading decision problem asks whether all containers can be positioned on the deck of width *D*ₚₑ and length *D*ₗₑ
such that:

* **Orientation**  
  Each container can be placed in its original orientation ($o_c$ = 1) or rotated 90° ($o_c$ = 2). Consequently

$$
R_c = L_c + 
\begin{cases} 
W_c & \text{if } o_c=1, \\ 
L_c & \text{if } o_c=2 
\end{cases}
$$

$$
T_c = B_c + \begin{cases}
L_c & \text{if } o_c=1,\\
W_c & \text{if } o_c=2,
\end{cases}
$$

  where $L_c$, $R_c$, $B_c$, $T_c$ denote the left, right, bottom, and top coordinates of container *c*.

* **Non‑overlap with separation**  
  For any two distinct containers *c* and *k*,

$$
\begin{aligned}
&L_c \ge R_k + S_{Cls(c),Cls(k)} \lor \\
&R_c + S_{Cls(c),Cls(k)} \le  L_k \lor \\
&B_c \ge T_k + S_{Cls(c),Cls(k)} \lor \\
&T_c + S_{Cls(c),Cls(k)} \le  B_k .
\end{aligned}
$$

* **Loading sequence constraint**  
  Containers are driven onto the deck from the southeast corner. Each successive container must touch an existing
  container or a deck wall on its north side and on its west side, ensuring a feasible manoeuvre path.

If a set of positions satisfying all the above exists, the containers can be loaded; otherwise the instance is
infeasible.

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; major manual amendments applied)
