# Refinery Blend Optimization Challenge

This scenario pertains to the strategic blending of crude oil types within a petroleum refinery. The core challenge
involves selecting the most profitable combination of available crude grades, considering their distinct
characteristics, costs, and constraints.

Each crude grade has unique properties. Some grades yield more desirable, less-polluting products (like gasoline or jet
fuel), while others have different yields and characteristics. Key factors include the variable market cost for each
crude, its limited availability, and the differing amounts of labor and energy required for refining.

The refinery manager faces a selection of `n` distinct crude types. The task involves two main decisions: choosing which
crudes to acquire and determining how much of each to process.

The refinery operates under stringent physical and regulatory limits. Using too much of a low-cost, high-sulfur crude
could exceed environmental sulfur limits or surpass labor capacity. Conversely, relying exclusively on expensive,
low-sulfur crudes might deplete the budget or fail to meet required production targets for specific products.

The objective is to find the optimal blend, the "Optimal Crude Blend," that maximizes overall net profit. Profit is
calculated as the total revenue from the finished products (Product A, Product B, Product C) minus the total cost of the
raw crudes used.

The solution must satisfy several critical constraints:

* **Resource Availability:** The amount of each crude processed cannot exceed its available supply and the refinery's
  overall capacity limit.
* **Operational Limits:** The total labor hours and the total procurement budget must not be exceeded.
* **Environmental Standards:** The total sulfur content from the blend must remain within a specified maximum limit.
* **Product Requirements:** Minimum production targets for specific products must be met.
* **Chemical Stability:** A specific rule regarding the proportion of certain crudes (e.g., Crude Type 1) in the mix
  must be adhered to.

The decision variables represent the quantity of each crude type to process. The constraints govern the practical limits
and requirements of the refining operation, ensuring the solution is feasible and compliant. The objective function
quantifies the financial outcome, guiding the search for the best possible blend.

[//]: # (Generated using deepseek-r1:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
