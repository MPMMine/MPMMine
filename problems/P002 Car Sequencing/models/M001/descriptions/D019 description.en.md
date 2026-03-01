# Vehicle Assembly Sequencing Problem

A set of vehicles are to be manufactured; they are not identical, as various options are available as variations on the
base model. The assembly line features different workstations that install the various options (e.g., climate control,
sunroof). These workstations are designed to handle at most a certain proportion of the vehicles passing along the
assembly line. Additionally, vehicles requiring a specific option must not be grouped together, otherwise the
workstation will be unable to manage the workload. Consequently, the vehicles must be arranged in a sequence so that the
capacity of each workstation is never exceeded. For example, if a particular workstation can only handle at most half of
the vehicles passing along the line, the sequence must be constructed so that at most one vehicle in any two requires
that option. The problem has been proven to be NP-complete.

[//]: # (Generated using mistral-small3.2 from D001 description.en.md and model.mzn; minor manual amendments applied)
