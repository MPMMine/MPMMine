# Template Design Optimization Problem

This challenge originates from a color printing company that manufactures various products from thin board, including
containers for human and animal food, as well as magazine inserts. Typically, food products are marketed under a basic
brand with multiple variations, such as different flavors. The packaging for these variations usually features the same
overall design, size, and shape but differs in a small portion of the displayed text and/or color. For instance, two
variations of a cat food container may differ only in that one features 'Chicken Flavour' on a blue background, while
the other has 'Rabbit Flavour' printed on a green background. A standard order consists of various quantities of several
design variations.

Given that each variation is identical in dimension, it is possible to determine in advance exactly how many items can
be printed on each mother sheet of board, whose dimensions are largely determined by the printing machinery's
dimensions. Each mother sheet is printed from a template, consisting of a thin aluminum sheet on which the design for
several variations is etched. The goal is to decide, firstly, how many distinct templates to produce, and secondly,
which variations and how many copies of each to include on each template.

Each container design is made from an identically sized and shaped piece of board. Many containers can be printed on
each mother sheet, and several different designs can be printed simultaneously on the same mother sheet. If there are
more slots in each template than there are variations, denoted as **ν**, it would be possible to fulfill the order using
just one template. However, this approach creates a significant amount of waste, represented by **ω**. To reduce **ω**,
multiple templates can be utilized.

The objective is to produce template plans that minimize **ω** generated for 1 template, 2 templates, and so on. The
number of slots per template is denoted as **S**, and the number of templates is represented by **t**. The task involves
determining the optimal allocation of variations to templates.

[//]: # (Generated using llama3.3:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
