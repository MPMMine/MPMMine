# Progressive Party

The task concerns planning a progression of social gatherings for vessels at a maritime hub.  
A subset of vessels is designated as anchor points; every vessel, during each successive half‑hour interval, records the
anchor it will be hosted by. Anchor vessels retain self‑reference when they function as hosts. For any anchor in a given
interval, the total number of individuals present on that host—including its own permanent crew and those aboard all
vessels assigned to it at that moment—must not exceed the host’s capacity limit. Moreover, no pair of distinct vessels
may share the same anchor during more than one time slot. To eliminate inherent symmetries, the schedules in the
successive intervals are required to be ordered lexicographically. The objective is to reduce the cardinality of the
anchor set.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; major manual amendments applied)
