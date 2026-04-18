# Refinery Blend Challenge (Optimal Crude Selection)

This problem is rooted in the petroleum refining domain, where the objective is to manage the intricate process of
converting raw materials into commercially viable energy products. A key element is the Crude Slate, which involves
combining various grades of crude oil to meet operational targets. Each crude grade has distinct characteristics, such
as yield profiles for different outputs, sulfur content, and cost structures, making the selection and blending process
complex.

The primary goal is to determine the best quantities for each of the n available crude types, referred to as the Optimal
Crude Slate, to maximize the overall net profit. This profit is defined as the total revenue from the finished products
minus the total cost of the raw materials. The challenge lies in balancing multiple factors, including economic
considerations, physical limits, and regulatory requirements.

Several constraints must be satisfied simultaneously. These include individual limits on the maximum quantity for each
crude type, a total capacity cap for the refinery's processing equipment, environmental sulfur emission restrictions, a
labor hour ceiling, and a financial procurement budget. Additionally, contractual obligations require meeting minimum
production levels for specific products, and there is a rule enforcing chemical stability in the blend, such as ensuring
one particular crude type makes up at least a certain percentage of the total mix.

The solution must navigate these elements to achieve the highest possible net profit while adhering to all specified
constraints.

[//]: # (Generated using deepseek-r1:latest from D001 description.en.md and model.mzn)
