# Portfolio Construction Problem

A private investor possesses a fixed amount of capital and wishes to assemble a stock portfolio that delivers the
greatest possible total value. The investor may acquire a fractional amount of each listed firm, limited only by the
shares that are available for purchase, so long as the total expenditure does not exceed the available budget.

Let **OBJ** denote the set of all firms, indexed from 1 to **n**.  
For every firm *i* ∈ **OBJ**:

- **size[i]** represents the monetary cost per unit of that firm’s stock.
- **profit[i]** denotes the value contribution per unit of that firm’s stock.

The investor’s budget is given by **capacity**.
Decision variables **x[i]** ∈ [0, 1] indicate the fraction of firm *i* that the investor decides to purchase (a value of
1 means the entire available quantity is bought).

The optimisation problem is formulated as follows:

**Constraint**  
$$
\sum_{i\in\text{OBJ}} \text{size}[i] \cdot x[i] \le \text{capacity}
$$

**Objective**  
$$
\text{maximise} \sum_{i\in\text{OBJ}} \text{profit}[i] \cdot x[i]
$$

The task is to determine the vector **x** that satisfies the budget constraint while maximizing the overall portfolio
value.

[//]: # (Generated using gpt-oss:latest from D008 description.en.md and model.mzn; minor manual amendments applied)
