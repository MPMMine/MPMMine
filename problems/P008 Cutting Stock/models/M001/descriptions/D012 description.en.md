# Optimizing the Cutting of Raw Material Rolls

A production facility processes standard master rolls to create smaller components for various customer orders. Each
master roll has a fixed width, denoted by W, and the facility must cut it into segments of different types. Customer
requests specify K categories of items, where each category i requires pieces of width w_i, and the total quantity
needed for category i is d_i.

The objective is to determine a cutting plan that satisfies all order demands while minimizing the total number of
master rolls consumed. This minimization strategy helps reduce material costs and minimize waste from unused portions of
the rolls.

Key considerations include the physical constraints of the cutting process. For instance, the maximum number of times an
item can be cut from a single roll is limited by its width, calculated as the floor of the roll width divided by the
item width. Additionally, the sum of the widths of all items cut from one roll must not exceed the roll width, ensuring
efficient use of the material. Symmetry-breaking rules may be applied to improve computational efficiency of solving,
and an auxiliary constraint may require that the total number of rolls is sufficient to cover the combined width
requirements of all items.

[//]: # (Generated using deepseek-r1:latest from D010 description.en.md and model.mzn; minor manual amendments applied)
