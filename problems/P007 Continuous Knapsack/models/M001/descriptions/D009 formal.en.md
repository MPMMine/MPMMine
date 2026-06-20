# Portfolio allocation for a limited‑budget investor

A private investor has a fixed amount of money to spend and wishes to build a portfolio that yields the highest possible
total value.
The investor may acquire any amount of each company’s shares, but the total purchase price must stay within the
budget.  
For each company $c$ in the market set $C$ we know the maximum number of shares $a_c$ that can be bought and the unit
cost $p_c$.
Let $b$ denote the investor’s total budget.

In a compact optimization formulation we introduce symbolic elements:

- $n$ is the number of distinct investment options, and we define the index set $\text{OBJ}=\{1,\dots,n\}$.
- The parameter $\text{capacity}$ represents the budget $b$.
- Arrays $\text{profit}[i]$ and $\text{size}[i]$ store, respectively, the value contribution $p_c$ and the cost
  factor $a_c$ for option $i$.
- Decision variables $x_i\in[0,1]$ indicate the fraction of option $i$ that is selected.

The feasible region is described by the inequality  

$$
\sum\_{i\in\text{OBJ}} \text{size}[i] x\_i \le \text{capacity},
$$

ensuring that the total expenditure does not exceed the available budget.  
The objective function to be maximized is  

$$
\sum\_{i\in\text{OBJ}} \text{profit}[i] x\_i,
$$

which captures the aggregate value of the chosen shares.

[//]: # (Generated using gpt-oss:latest from D008 description.en.md and model.mzn; minor manual amendments applied)
