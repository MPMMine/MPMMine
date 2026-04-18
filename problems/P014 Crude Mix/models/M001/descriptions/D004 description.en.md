# Refinery Blend Optimization Challenge (Output Strategy Management)

This issue originates from the oil refining sector, where the focus is on navigating the intricate transformation from
fundamental resources to marketable energy items. Refineries seldom utilize just one type of crude; instead, they
operate using a Crude Combination, which is a deliberate mix of multiple international crude oil varieties. Each
category of crude has distinct chemical attributes, with some being "light and sweet" (generating more gasoline with
lower sulfur levels) and others being "heavy and sour" (producing more heating oil with higher sulfur content). These
sources also differ substantially in expense and the labor and energy needed for processing.

The operator of the facility is provided with a diverse collection of n crude types. The task has two components: first,
to choose which crudes to obtain based on their fluctuating purchase prices and stock availability, and second, to
specify the exact volumes for each to integrate into the daily production routine. A refinery functions as a system with
strict physical and regulatory constraints. Over-processing low-cost, "impure" crude could breach environmental sulfur
thresholds or surpass the workforce required for the complex refining operations. Conversely, depending exclusively on
high-grade, "clean" crudes might exhaust the daily procurement budget or lead to insufficient output of a particular
product, such as heating oil, to fulfill storage commitments.

The goal is to identify the best quantities for each crude category—the Optimal Crude Mixture—which maximizes the
overall net gain. This gain is defined as the difference between the income from selling the finished goods (like
Gasoline, Jet Fuel, and Heating Oil) and the expense of the raw materials. The solution must satisfy several constraints
simultaneously, including limits on individual crude availability and total processing capacity, adherence to fixed
labor hours and financial budgets, compliance with strict sulfur emission standards and chemical stability of the final
products, and fulfillment of mandatory minimum output levels for specific contracts.

[//]: # (Generated using deepseek-r1:latest from D001 description.en.md and model.mzn)
