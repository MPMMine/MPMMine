# Template Planning Problem

A printing company produces various items from thin board, such as cartons and magazine inserts. These products often
have similar designs but differ in small details like text or color. Orders typically consist of multiple design
variations in different quantities. The goal is to determine the optimal number of templates to create and which design
variations to include on each template.

Each design has a fixed size and shape, allowing multiple items to be printed on a single mother sheet. However,
printing multiple designs on one sheet can result in significant waste. To minimize waste, the company aims to create
template plans that optimize production for 1, 2, or more templates.

The process involves allocating slots on each template to different design variations and determining the number of
times each template should be printed. The total production must fall within a specified range, and the surplus should
be minimized. Additionally, enough of each design variation must be produced.

The objective is to find the optimal template plan that minimizes waste while meeting production requirements for a
variable number of templates, design variations, and slots per template.

[//]: # (Generated using llama3.3:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
