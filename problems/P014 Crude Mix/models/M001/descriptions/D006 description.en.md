# Refinery Blend Optimization Challenge

This scenario describes a complex industrial process within a petroleum refining operation. The core objective is to
determine the most profitable combination of crude oil types to utilize in a daily production run.

A refinery typically doesn’t process a single crude; instead, it works with a carefully selected blend, known as the
Crude Slate, comprised of multiple distinct crude oil grades. Each crude possesses unique characteristics – some are
“clean” and high-yielding for specific products like gasoline, while others are “dirty” and rich in elements like
sulfur. These varying qualities significantly impact their cost, labor requirements, and potential yield of desirable
products.

The refinery manager must decide how to best utilize a diverse selection of ‘n’ available crude oils. This involves both
choosing which crudes to purchase and determining the precise volume of each to incorporate into the daily refining
process.

The refinery operates under stringent constraints. Excessive use of inexpensive, high-sulfur crudes can lead to
environmental violations or strain operational capacity. Conversely, relying exclusively on premium, low-sulfur crudes
might exceed budgetary limitations or fail to meet mandatory production demands for key products such as heating oil.

The challenge is to find the optimal blend quantity for each crude type – the Ideal Crude Slate – to maximize overall
profit. This profit is calculated as the total revenue from finished products (Gasoline, Jet Fuel, Heating Oil) minus
the cost of the raw crudes. This optimal solution must simultaneously satisfy several limitations:

* **Resource Boundaries:** The quantity of each crude oil available and the refinery’s overall processing capacity must
  be respected.

* **Operational Restrictions:** Labor hours and the overall procurement budget are fixed limits.

* **Regulatory Compliance:** Sulfur emissions and product quality standards must be adhered to.

* **Market Commitments:** Minimum production targets for particular products are mandatory.

The goal is to identify the blend that delivers the greatest financial outcome, considering all these interconnected
factors.

[//]: # (Generated using gemma3:latest from D001 description.en.md and model.mzn)
