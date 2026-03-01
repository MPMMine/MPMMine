# Carton Production Planning Problem

This scenario involves a printing firm that creates various packaging products, including cartons for food and
magazines. These cartons share a common design template, differing primarily in the printed text and color. For
instance, a cat food carton might have ‘Chicken Flavor’ on one template in blue and ‘Rabbit Flavor’ on another in green.
The company needs to determine the optimal number of distinct template designs to manufacture and the appropriate
quantities of each design to include on each template, aiming to minimize material waste. Mother sheets of board, shaped
by the printing machinery, hold multiple carton designs. To reduce waste, the firm can utilize several templates. The
challenge is to determine the ideal number of templates to use, and the specific quantities of each design to print on
each template, thereby minimizing waste.

Each carton design utilizes a board piece of fixed dimensions. Numerous cartons can be printed on a single mother sheet,
and various designs can be printed simultaneously on the same sheet. If the number of design slots on a template exceeds
the demand for the various carton types, a single template can fulfill the entire order, leading to significant waste.
To mitigate this, the firm can employ multiple templates. The objective is to establish a template plan that minimizes
waste, considering the use of one, two, or more templates.

[//]: # (Generated using gemma3:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
