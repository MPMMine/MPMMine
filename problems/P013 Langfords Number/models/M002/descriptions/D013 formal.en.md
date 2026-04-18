# Langford’s Sequence Construction

The Langford problem for a given integer **k** asks us to build a linear list of length **2k** that contains two copies
of each integer from **1** to **k**.  
The key property is that for every number **i**, the two occurrences of **i** are separated by exactly **i** other
elements.  
In other words, if the first appearance of **i** is at position **p**, the second one must appear at position **p + i +
1**.

## Modelling the Problem

We introduce two arrays over the domain **1 … 2k**:

* **position** - a permutation of the indices.  
  `position[i]` gives the position in the final sequence where the first copy of number **i** will be placed.

* **solution** - the actual sequence to output.  
  `solution[pos]` is the integer that occupies the slot `pos` in the final arrangement.

### Core Constraints

1. **Distance constraint** - for every `i` in `1 … k`
   ```
   position[i + k] = position[i] + i + 1
   ```
   This ensures the required gap of `i` numbers between the two copies of `i`.

2. **Mapping constraint** - each element of `position` must be reflected in `solution`:
   ```
   solution[ position[i] ]     = i
   solution[ position[k + i] ] = i
   ```

3. **All-different positions** - the `position` array must be a permutation of `1 … 2k`
   ```
   all_different(position)
   ```

4. **Symmetry breaking** - to cut the search space, enforce that the first element of the final sequence is smaller than
   the last one:
   ```
   solution[1] < solution[2k]
   ```

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
