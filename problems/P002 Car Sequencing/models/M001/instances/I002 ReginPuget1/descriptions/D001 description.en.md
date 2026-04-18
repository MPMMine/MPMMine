# Car Sequencing Problem

A `100` cars are to be produced.
They are not identical, because `22` options are available as variants on the basic model. 
The total production target for each variant is: `[6, 10, 2, 2, 8, 15, 1, 5, 2, 3, 2, 1, 8, 3, 10, 4, 4, 2, 4, 6, 1, 1]`
The assembly line has different stations which install `5` various options (air-conditioning, sun-roof, etc.). 
The presence or absence of an option for each car variant is defined below: 

```
[|1, 0, 0, 1, 0,
|1, 1, 1, 0, 0,
|1, 1, 0, 0, 1,
|0, 1, 1, 0, 0,
|0, 0, 0, 1, 0,
|0, 1, 0, 0, 0,
|0, 1, 1, 1, 0,
|0, 0, 1, 1, 0,
|1, 0, 1, 1, 0,
|0, 0, 1, 0, 0,
|1, 0, 1, 0, 0,
|1, 1, 1, 0, 1,
|0, 1, 0, 1, 0,
|1, 0, 0, 1, 1,
|1, 0, 0, 0, 0,
|0, 1, 0, 0, 1,
|0, 0, 0, 0, 1,
|1, 0, 0, 0, 1,
|1, 1, 0, 0, 0,
|1, 1, 0, 1, 0,
|1, 0, 1, 0, 1,
|1, 1, 1, 1, 1|];
```

These stations have been designed to handle at most a certain percentage of the cars passing along the assembly line. 
Furthermore, the cars requiring a certain option must not be bunched together, otherwise the station will not be able to cope. 
Consequently, the cars must be arranged in a sequence so that the capacity of each station is never exceeded. 
This capacity of the station is defined by blockSize - `[2, 3, 3, 5, 5]`, and maxCars in a block - `[1, 2, 1, 2, 1]`
For instance, if a particular station can only cope with at most half of the cars passing along the line, 
the sequence must be built so that at most 1 car in any 2 requires that option. 
