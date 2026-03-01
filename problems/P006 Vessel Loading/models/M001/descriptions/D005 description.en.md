# Container Placement Problem on a Vessel Deck

Vessels transport cargo units between sites. The deck surface is a rectangle. These cargo units are three-dimensional
rectangular shapes, arranged in a single stratum. They are oriented parallel to the deck's boundaries. The nature of the
cargo contents classifies each unit into a specific group. Certain groups impose minimum spacing requirements between
units, measured either horizontally or vertically on the deck.

The core challenge in this cargo arrangement problem is to ascertain whether a set of items can be placed on the deck
without any overlap or breach of the spacing rules. This scenario can be framed as fitting a collection of rectangular
prisms into a larger rectangle, under given constraints.

Additionally, real-world loading procedures introduce a sequential constraint. Placement starts from the bottom-right
area, and each subsequent item must be positioned to contact either the deck's right edge or an adjacent item to the
left, and similarly, to the deck's top edge or a previously placed item below it.

[//]: # (Generated using deepseek-r1:latest from D001 description.en.md and model.mzn; minor manual amendments)
