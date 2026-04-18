# Template Design Problem

This challenge emerges from a colour printing company that manufactures various products from thin board, including
cartons for human and animal food and magazine inserts. Products, such as food items, often have multiple variations (
e.g., flavours) with similar overall designs but differ in minor aspects like text or colour. For instance, two
variations of a cat food carton may only differ in the flavour text ('Chicken Flavour' on a blue background vs. 'Rabbit
Flavour' on a green background). A typical order includes multiple quantities of several design variations. Since each
variation has identical dimensions, we can predetermine the exact number of items that can be printed on each mother
sheet of board, whose size is largely determined by the printing machinery. Each mother sheet is printed from a
template, consisting of a thin aluminium sheet etched with designs for several variations. The goal is to decide how
many distinct templates to produce and which variations, along with their quantities, to include on each template.

Each carton design is made from an identically sized piece of board, allowing multiple cartons to be printed on each
mother sheet. Several different designs can be printed simultaneously on the same mother sheet. If there are more slots
in each template than variations, it would be possible to fulfill the order using just one template; however, this
approach generates a significant amount of waste. To minimize waste, we can utilize multiple templates. The challenge is
to create template plans that reduce waste for $\Delta$ templates, where $\Delta$ represents the number of distinct
templates.

We have $\Gamma$ variations, and each variation $\gamma\in\Gamma$ requires $\Psi_\gamma$ quantities to be printed. Each
template has $\Sigma$ slots, and we need to allocate these slots to the variations. We aim to minimize the total
production by optimizing the allocation of slots to variations across the templates.

[//]: # (Generated using llama3.3:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
