# Efficient Template Allocation Problem

This issue originates from a color printing company that produces diverse items using thin board, such as packaging for
food products and advertising inserts. A common request involves fulfilling orders for specific amounts of several such
variants.

Each variant requires identical-sized board pieces, which are cut from larger mother sheets. Each mother sheet is
printed using a template. The template has a fixed capacity, symbolized by S, allowing it to accommodate up to S
different designs at once. The challenge is to determine the number of distinct templates, denoted as t, and for each
template, which variations to include and how many times to use it, represented by R, the number of production runs or
copies.

The total output must satisfy the demand for each variation, d[i], while adhering to operational constraints. Symmetry
breaking is employed to handle cases where variations have identical demand values or similar demand patterns, reducing
redundant solutions.

The goal is to minimize the total number of production runs, sum(R), thereby reducing material usage and waste.

[//]: # (Generated using deepseek-r1:latest from D001 description.en.md and model.mzn; major manual amendments applied)
