# Refinery Product Mix

The goal of this problem is to determine the best blend of available crude oils – the *Crude Slate* – that maximises net
profit for a refinery.
The refinery receives a set of crude types
$$
\text{Crudes} = \{1,\dots ,n\},
$$
and must decide how many barrels of each type to process.

Each crude $i\in\text{Crudes}$ is characterised by:

| Symbol                                     | Meaning                                                                   |
|--------------------------------------------|---------------------------------------------------------------------------|
| $c_i$                                      | purchase cost per barrel                                                  |
| $s_i^{\max}$                               | maximum supply (barrels available)                                        |
| $\mathbf{y}_i = (y_{i,g},y_{i,j},y_{i,h})$ | yields of the three products (gasoline, jet fuel, heating oil) per barrel |
| $\sigma_i$                                 | sulfur content per barrel                                                 |
| $\ell_i$                                   | labor hours needed per barrel                                             |

The refinery has global operational limits:

| Symbol                                                   | Meaning                                       |
|----------------------------------------------------------|-----------------------------------------------|
| $C_{\text{cap}}$                                         | total distillation capacity (barrels per day) |
| $B_{\text{bud}}$                                         | daily procurement budget                      |
| $L_{\text{max}}$                                         | maximum labour hours                          |
| $\Sigma_{\text{max}}$                                    | maximum total sulfur emission                 |
| $\mathbf{p} = (p_g,p_j,p_h)$                             | market prices for the three products          |
| $\mathbf{q}^{\min} = (q_g^{\min},q_j^{\min},q_h^{\min})$ | contractual minimum production volumes        |

### Decision Variables

For each crude $i$ we choose a non‑negative processing quantity
$$
x_i \in [0, 100 000].
$$

### Constraints

1. **Individual Supply** – $x_i \le s_i^{\max}$ for all $i$.
2. **Capacity** – $\sum_{i} x_i \le C_{\text{cap}}$.
3. **Sulfur Cap** – $\sum_{i} x_i \sigma_i \le \Sigma_{\text{max}}$.
4. **Labor** – $\sum_{i} x_i \ell_i \le L_{\text{max}}$.
5. **Budget** – $\sum_{i} x_i c_i \le B_{\text{bud}}$.
6. **Contractual Minimums** – For each product $p$,
   $$
   \sum_{i} x_i y_{i,p} \ge q_p^{\min}.
   $$
7. **Chemical Stability** – a fixed fraction $ \alpha $ of the total blend must be crude 1:
   $$
   x_{1} \ge \alpha \sum_{i} x_i.
   $$

### Objective

The refinery earns revenue by selling the three products, and pays for the raw crudes.
The net profit to maximise is
$$
\sum_{i}\sum_{p} x_i y_{i,p} p_p - \sum_{i} x_i c_i.
$$

By satisfying all of the above constraints while pushing this objective to its highest possible value, the refinery
obtains the **Optimal Crude Slate** – the mixture of crudes that delivers the greatest financial return under the given
operational, environmental, and contractual conditions.

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
