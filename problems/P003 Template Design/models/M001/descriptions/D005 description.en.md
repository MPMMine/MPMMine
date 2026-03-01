# Template Design Problem

This problem is based on a color printing company that produces diverse thin board items, such as cartons for human and
animal food and magazine inserts. Food products frequently include a base brand with multiple variants, like different
flavors. The packaging for these variants shares the same fundamental dimensions and shape, but differs in specific
elements, such as displayed text or background color. For example, one variant might have 'Chicken Flavor' printed on a
blue background, while another displays 'Rabbit Flavor' on a green background. A typical order specifies varying
quantities for several variants. Since all variants are identical in size, the number of items per large sheet is fixed
by the printing machinery's dimensions. Each large sheet is manufactured using a template-a thin aluminum sheet with
etched designs for several variants. The challenge is to determine the selection of variants to include in each of σ
templates, and the quantity of each variant to print per template.

Each variant's carton is cut from uniformly sized cardboard. Multiple cartons can be printed on a single large sheet,
and multiple variants can be printed simultaneously on the same sheet. If the template has more slots than there are
variants, the order can be fulfilled with just one template, but this leads to substantial waste. By increasing the
number of templates, waste can be reduced. The objective is to find template configurations that minimize waste for
different values of σ, from 1 to some maximum.

[//]: # (Generated using deepseek-r1:latest from D001 description.en.md and model.mzn; major manual amendments applied)
