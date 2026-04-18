# Crude Slate Optimization Problem (Refinery Product Mix)

This problem originates from the petroleum refining industry, where the goal is to manage the complex transition from raw materials to finished, marketable energy products. A refinery rarely processes a single type of "oil"; instead, it operates on a Crude Slate, which is a carefully selected blend of various global crude oil grades.

Each grade of crude oil possesses unique chemical characteristics. Some are "light and sweet" (high gasoline yield, low sulfur), while others are "heavy and sour" (high heating oil yield, high sulfur). Furthermore, these crudes differ significantly in price and the amount of specialized labor and energy required to refine them.

The refinery manager is presented with a diverse "basket" of n available crudes. The challenge is twofold: first, to determine which of these crudes to procure based on their varying market costs and availability, and second, to decide the exact quantity of each to blend into the daily production cycle.

A refinery is a system of intense physical and regulatory boundaries. Processing too much of a cheap, "dirty" crude may violate environmental sulfur caps or overwhelm the labor force required to manage the complex refining stages. Conversely, relying solely on premium, "clean" crudes might exhaust the daily procurement budget or fail to produce enough of a specific byproduct, like heating oil, required to fill storage commitments.

The problem is to determine the optimal quantity of each crude type to process—the Optimal Crude Slate—that maximizes the total net profit. This profit is defined as the total revenue from finished products (Gasoline, Jet Fuel, Heating Oil) minus the cost of the raw crudes. The solution must simultaneously satisfy a wide array of constraints:

* Supply and Capacity: Not exceeding the available quantity of each crude or the total mechanical throughput of the refinery.

* Operational and Financial: Staying within a fixed labor hour limit and a daily procurement budget.

* Environmental and Quality: Adhering to strict sulfur emission caps and ensuring the chemical stability of the final blend.

* Market Obligations: Meeting mandatory minimum production volumes for specific high-priority contracts.

[//]: # (Generated using Google Gemini 3 from model.mzn; minor manual amendments applied)
