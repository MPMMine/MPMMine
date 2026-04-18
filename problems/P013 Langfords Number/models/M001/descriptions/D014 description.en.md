# Langford ordering

An ordering of `@K` consists of a permutation of the multiset that holds each identifier from `@1` up to `@K` twice.  
In this permutation, for every identifier `@i` there must be precisely `@i` other identifiers situated between its two
appearances.

The ordering is represented by a linear collection `@X` of length `@L`, each entry drawn from the set of symbols ranging
over `@1` through `@K`.  
The following conditions are required:

1. **Dual appearance rule** – each identifier `@i` occurs exactly twice somewhere inside `@X`.
2. **Spacing condition** – for every identifier `@i` there exists a location `@p` such that the entry at `@p` equals
   `@i` and the entry located `@p + @i + 1` also equals `@i`.
3. **Order breaking rule** – the first entry of `@X` must be smaller than its final entry.

The solver must produce any assignment of symbols to `@X` that satisfies all three constraints while regarding symmetric
solutions as distinct.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn)
