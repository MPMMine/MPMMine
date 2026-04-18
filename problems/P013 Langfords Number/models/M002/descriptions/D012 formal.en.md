# Langford’s Arrangement Challenge

The task, known as Langford’s problem **L(k)**, is to place two copies of each integer from **1** to **k** into a single
sequence of length **2 k**.  
For every integer **i** the two occurrences must be exactly **i + 1** positions apart, meaning that exactly **i** other
numbers lie between them.

## Encoding as a Mathematical Programming model

* **Parameters**
    * `k` - the upper bound of the set
    * `positionDomain = 1..2*k` - the index range of the sequence

* **Variables**
    * `position[1..2*k]` - a permutation of the index range, mapping the two copies of each number to positions
    * `solution[1..2*k]` - the value that occupies each position (range **1..k**)

* **Core Constraints**
    * For each `i` in `1..k`
        * `position[i + k] = position[i] + i + 1` (the two copies are spaced correctly)
        * `solution[position[i]] = i` (the first copy carries value `i`)
        * `solution[position[k + i]] = i` (the second copy also carries value `i`)
    * `all_different(position)` (all positions are distinct)
    * `solution[1] < solution[2*k]` (symmetry‑breaking rule)

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
