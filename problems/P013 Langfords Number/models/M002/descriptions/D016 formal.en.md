# Symbolic Langford arrangement

We must arrange two copies of each identifier from the set denoted by `<K>` in a linear sequence of length `<Length>`
such that the two copies of each identifier `i` are separated by exactly `i` other positions.  
The model defines a set of indices `<PosSet>`, an array `<Pos>` of variables indexed by `<PosSet>`, and a parallel array
`<Sol>` indexed by `<PosSet>` taking values from the identifier set.  
For every `i` the second occurrence must be placed at the location given by `<Pos>[i+<K>]` which equals `<Pos>[i]` plus
the gap defined by `i` plus one; additionally `<Sol>[<Pos>[i]] = i` and `<Sol>[<Pos>[i+<K>]] = i`, all entries of
`<Pos>` must be distinct, and a symmetry‑breaking condition requires `<Sol>[<PosFirst>] < <Sol>[<PosLast>]`.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
