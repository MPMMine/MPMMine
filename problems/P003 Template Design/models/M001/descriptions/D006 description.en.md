# Template Design Problem

This problem originates from a color printing company specializing in thin board products, such as packaging for food
items and printed materials. The company produces standardized-sized packaging where variations exist primarily in
printed text or color schemes. For example, different flavors of cat food might share identical carton dimensions but
feature distinct text and color combinations.

Each production order requires specific quantities of multiple design variations. The core challenge involves
efficiently arranging printing templates to minimize material waste. Each template is a thin aluminium sheet that
contains patterns for multiple variations. Each printing operation uses a template to produce several identical items
from a larger mother sheet.

The problem requires determining two key aspects: (1) which variations should be included on each template, and (2) how
many copies of each variation should be produced per template. The primary objective is to minimize waste generated from
unused space in the templates across different production scenarios involving 1 template, 2 templates, etc.

Each variation requires identical board dimensions, allowing precise calculation of how many items can be produced from
each mother sheet. While it may be technically possible to fulfill orders using a single template, this approach creates
significant waste. The challenge is to strategically increase the number of templates to reduce overall waste.

The solution involves developing template configurations that minimize the unused material from printing templates
across various production scales. Each template must contain exactly slots, and the system must ensure sufficient
quantities of each variation are produced while maintaining minimal waste.

[//]: # (Generated using deepseek-r1:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
