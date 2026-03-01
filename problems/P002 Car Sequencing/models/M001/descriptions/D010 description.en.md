# Assembly Line Scheduling Problem

A variety of vehicles are being manufactured, each with unique configurations due to different options offered as
enhancements to the standard model. An assembly line processes these vehicles through various stations that install
these options (like air conditioning or sunroofs). Each station has a capacity limit, and to avoid bottlenecks, cars
requiring a specific option must not be grouped together at a station. Therefore, the sequence of vehicles on the
assembly line must be carefully arranged to ensure each station's capacity is never exceeded. For instance, if a
particular station can handle at most half the vehicles passing through, the sequence must be structured such that no
more than one vehicle in every two requires that option. This problem is known to be NP-complete (Gent, 1999).

[//]: # (Generated using gemma3:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
