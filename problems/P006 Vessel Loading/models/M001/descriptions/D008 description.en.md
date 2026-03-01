# Container Placement Challenge

A cargo vessel needs to load containers onto its deck. The deck’s dimensions are rectangular, and containers are
arranged in a single layer, oriented parallel to the deck’s sides. Each container’s contents classify it, and certain
container types necessitate specific distances between them, either horizontally or vertically, to ensure safe
transport.

The objective is to determine if a given collection of containers can be positioned on the deck without any overlaps and
respecting all the required separation boundaries. This problem resembles arranging a collection of rectangles within a
larger rectangle, subject to certain restrictions.

Furthermore, the loading process is governed by a sequence, requiring that each container be placed so that it shares a
boundary with another container or the deck’s edge - specifically, to the north and west of the previous container.

[//]: # (Generated using gemma3:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
