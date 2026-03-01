# Car Sequencing Problem

A number of cars are to be produced; they are not identical, because different options are available as variants on the
basic model. The assembly line has different stations which install the various options (air-conditioning, sun-roof,
etc.). These stations have been designed to handle at most a certain percentage of the cars passing along the assembly
line. Furthermore, the cars requiring a certain option must not be bunched together, otherwise the station will not be
able to cope. Consequently, the cars must be arranged in a sequence so that the capacity of each station is never
exceeded. For instance, if a particular station can only cope with at most a certain fraction of the cars passing along
the line, the sequence must ensure that the number of cars needing that station does not exceed this limit. This must be
done while accounting for the total number of cars and the different combinations of features they require.

The problem involves arranging a set of car classes, each with its own specific combination of features. The goal is to
create a sequence of cars such that:

1. The exact number of cars from each class is included.
2. For each feature, the cars requiring that feature are distributed in such a way that the maximum number of
   consecutive cars needing the same feature (the feature's block size) does not exceed the station's capacity (the
   maximum number allowed per block). This ensures features are not clustered too closely.

[//]: # (Generated using deepseek-r1:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
