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
| $c\_i$                                      | purchase cost per barrel                                                  |
| $s\_i^{\max}$                               | maximum supply (barrels available)                                        |
| $\mathbf{y}\_i = (y\_{i,g},y\_{i,j},y\_{i,h})$ | yields of the three products (gasoline, jet fuel, heating oil) per barrel |
| $\sigma\_i$                                 | sulfur content per barrel                                                 |
| $\ell\_i$                                   | labor hours needed per barrel                                             |

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
x\_i \in [0, 100 000].
$$

### Constraints

1. **Individual Supply** – $x\_i \le s\_i^{\max}$ for all $i$.
2. **Capacity** – $\sum\_{i} x\_i \le C\_{\text{cap}}$.
3. **Sulfur Cap** – $\sum\_{i} x\_i \sigma\_i \le \Sigma\_{\text{max}}$.
4. **Labor** – $\sum\_{i} x\_i \ell\_i \le L\_{\text{max}}$.
5. **Budget** – $\sum\_{i} x\_i c\_i \le B\_{\text{bud}}$.
6. **Contractual Minimums** – For each product $p$,

$$
\sum\_{i} x\_i y\_{i,p} \ge q\_p^{\min}.
$$

8. **Chemical Stability** – a fixed fraction $ \alpha $ of the total blend must be crude 1:

$$
x\_{1} \ge \alpha \sum\_{i} x\_i.
$$

### Objective

The refinery earns revenue by selling the three products, and pays for the raw crudes.
The net profit to maximise is

$$
\sum\_{i}\sum\_{p} x\_i y\_{i,p} p\_p - \sum\_{i} x\_i c\_i.
$$

By satisfying all of the above constraints while pushing this objective to its highest possible value, the refinery
obtains the **Optimal Crude Slate** – the mixture of crudes that delivers the greatest financial return under the given
operational, environmental, and contractual conditions.

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
