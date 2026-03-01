# Portfolio Optimization with Budget Constraint

An entity with a finite budget aims to maximize the total return from selecting investments. The problem involves `n`
distinct assets, each asset `i` (for `i` ranging from 1 to `n`) characterized by a profit `p_i` and a size `s_i`. The
investor must allocate funds such that the sum of `s_i * x[i]` for all `i` does not surpass the budget `c`, and the
allocation `x[i]` for each asset `i` is a real number between 0 and 1. The objective is to determine the optimal
fractional allocation that maximizes the total profit, represented by the sum of `p_i * x[i]`.

[//]: # (Generated using deepseek-r1:latest from D008 description.en.md and model.mzn)
