# Cargo Arrangement Problem

Transportation of goods involves placing rectangular boxes on a flat surface. These boxes, categorized by their
contents, must be arranged in a single layer without overlap. Specific categories require a minimum gap between them,
either horizontally or vertically.

The goal is to determine if a set of boxes can fit on the given surface while respecting these spacing constraints. This
problem can be viewed as packing smaller rectangles into a larger one, subject to certain rules.

In real-world applications, the arrangement is further limited by the order in which the boxes are loaded. Starting from
the bottom-right corner, each box must touch another box or the edge of the surface from the top or from the left. The
challenge is to find an arrangement that satisfies all these conditions for a given set of boxes with varying sizes and
categories.

[//]: # (Generated using llama3.3:latest from D001 description.en.md and model.mzn; major manual amendments applied)
