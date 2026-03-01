# Optimizing Extruded Aluminum Sections Production

A manufacturing facility specializes in **producing extruded aluminum sections**. The operation begins with receiving
continuous **master rolls** from a supplier. These master rolls must be cut into specific, shorter segments required by
customer orders.

Each customer order requests several distinct **item types**. For item type *i*, the required segment has a specific *
*dimension** denoted by **w_i**, and the total number of segments needed for this type is **q_i**.

Given the high cost of the master rolls, the facility aims to optimize the cutting process. Every time a master roll is
cut, some portion remains unused. This unused portion is considered **waste**, particularly if it is too small for
practical reuse.

The primary planning objective is to determine the optimal way to cut the master rolls to ensure:

* The exact required quantity of segments for each item type *i* is produced.
* The total number of master rolls consumed is minimized.

In essence, the goal is to find a cutting plan that fulfills all production orders while minimizing material usage,
thereby controlling costs and reducing scrap.

[//]: # (Generated using deepseek-r1:latest from D010 description.en.md and model.mzn; minor manual amendments applied)
