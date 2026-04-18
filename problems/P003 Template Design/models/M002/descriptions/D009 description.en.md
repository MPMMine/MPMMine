# Carton Design Problem

This challenge concerns a printing business that produces a range of packaging products from thin board, including boxes
for food and promotional materials. These items are typically uniform in design but vary in text and colour. A typical
order involves multiple quantities of several distinct design types. Since each type of design uses a board segment of a
consistent size and shape, we can determine beforehand precisely how many items can be printed on each substantial board
sheet, which is largely defined by the constraints of the printing machinery. Each substantial board sheet is printed
upon using a template, consisting of a compact aluminium sheet bearing the design for a multitude of variants. The goal
is to decide the optimal number of unique templates to create and which design variations, alongside the quantity of
each, should be included on each template.

To minimize waste, it's necessary to produce a template plan that reduces the excess production. This can be achieved by
using more templates. The challenge is to determine the ideal number of template designs.

[//]: # (Generated using gemma3:latest from D001 description.en.md and model.mzn; major manual amendments applied)
