# Template Design Problem

This problem is encountered in a color printing company that manufactures various products from thin board, including
packaging for human and animal food and magazine inserts. Food products, for example, are often sold as a basic brand
with several variations (usually flavors). The packaging for such variations typically has the same overall design,
particularly the same size and shape, but differs in a small portion of the text displayed and/or in color. For
instance, two variations of a cat food carton may only differ in that one has 'Chicken Flavour' printed on a blue
background, while the other has 'Rabbit Flavour' printed on a green background. A typical order consists of various
quantities of several design variations. Since each variation is identical in dimension, we know in advance exactly how
many items can be printed on each mother sheet of board, whose dimensions are largely determined by the dimensions of
the printing machinery. Each mother sheet is printed from a template, consisting of a thin aluminum sheet on which the
design for several of the variations is etched. The challenge is to decide, firstly, how many distinct templates to
create, and secondly, which variations, and how many copies of each, to include on each template.

Each design of carton is made from an identically sized and shaped piece of board. Many cartons can be printed on each
mother sheet, and several different designs can be printed simultaneously on the same mother sheet. If there are more
slots in each template than there are variations, it would be possible to fulfill the order using just one template.
However, this creates a significant amount of waste card. We can reduce the amount of waste by using more templates. The
problem is therefore to produce template plans that will minimize the amount of waste produced, for one template, two
templates, and so on.

The problem involves determining the number of slots allocated to each variation in each template, the number of
pressings of each template, and the total production. The goal is to minimize the total production while ensuring that
enough of each variation is printed and that the number of slots occupied in each template is equal to the number of
slots per template. Additionally, there are constraints to break the symmetry between variations with the same demand
and pseudo symmetry constraints to limit the surplus of each variation and the surplus of the first k variations. The
implied constraints on the surplus and the run length are also considered to improve the performance of the model.

[//]: # (Generated using mistral-small3.2 from D001 description.en.md and model.mzn; minor manual amendments applied)
