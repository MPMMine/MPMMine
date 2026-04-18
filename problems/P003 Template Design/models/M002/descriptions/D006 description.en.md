# Template Design Challenge

This problem originates from a specialized printing company that manufactures diverse products from thin materials, such
as packaging for food items and promotional inserts. The company often handles food packaging, where a base product may
have multiple versions (for instance, different flavors). These variations typically share the same fundamental design,
including size and shape, but differ slightly in visual elements like text or color. Consider a scenario where two
carton designs for cat food differ only in the flavor name and background color, such as one featuring "Chicken Flavor"
on a blue background versus "Rabbit Flavor" on a green background.

A standard production order requires specific quantities for several of these design variations. Since each variation
uses the same dimensions, the number of items that can be printed on each large mother sheet is predetermined by the
sheet size, which is constrained by the printing equipment. Each mother sheet is produced using a template---a thin
aluminum sheet that contains the design layouts for multiple variations. The challenge is to determine the optimal
number of distinct templates, which variations to include on each template, and how many copies of each variation to
assign to each template, with the goal of minimizing waste material.

[//]: # (Generated using deepseek-r1:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
