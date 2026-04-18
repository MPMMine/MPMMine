# Template Design

The problem originates in a colour‑printing plant that manufactures a range of lightweight containers (e.g., snack
cartons, magazine inserts) from thin board. Each container design is identical in size and shape; what distinguishes the
variants are only minor textual or colour changes. An order therefore specifies several distinct designs together with
their required quantities.

Because each carton occupies the same footprint on the printing plate, a certain number of slots can be marked on a
single sheet before feeding it to the press. One logical approach would be to place all required variants onto a single
sheet; this would certainly satisfy demand but would generate large amounts of waste printouts. The proposed strategy is
to employ several separate templates, each bearing a selection of variant patterns, so that overall board consumption is
reduced.

More formally, we define three groups of entities with symbolic names:

* **%SLOTS%** - an integer representing how many individual slots are inscribed on any given template;
* **%TEMPLATES%** - an integer denoting the number of distinct templates to be produced;
* **%VARIETIES%** - an integer indicating the total count of different container designs that must be supplied;

and a corresponding demand vector **%DEMANDS[i]%** for each design *i*.

Decision variables are defined as follows:

* **%SLOTS_PER_DESIGN_IN_TEMPLATE[i,j]** tells how many positions allocated on template *j* belong to design *i*;
* **%PRESSURE[j]** represents the number of times template *j* will be pressed during production.

The formulation comprises:

1. **Slot‑allocation constraint** - each produced template must exhaust all its marked spots: the sum over designs
   placed on any given template equals %SLOTS%.
2. **Demand‑fulfilment constraint** - for every design *i*, the aggregate supplied copies (the product of how many times
   it appears on a template and the number of presses of that template) must meet or exceed its required quantity.
3. **Production limits** - an upper and lower bound is imposed on the total number of printed cards across all
   templates.
4. **Symmetry‑breaking constraints** - logical conditions that prevent equivalent arrangements of designs with identical
   demand values from being counted more than once.
5. **Objective function** - minimise the total number of presses across all templates.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; major manual amendments applied)
