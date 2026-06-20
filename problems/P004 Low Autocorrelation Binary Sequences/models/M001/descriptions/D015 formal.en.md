# Low Autocorrelation Binary Sequences Problem

Goal: Construct an indexed collection ⟨Sequence⟩ whose elements each equal +1 or –1.  
The size of this collection is governed by the symbolic variable **Length**.

For every shift value belonging to a set labelled **ShiftSet** (which runs through all positive integers strictly
smaller than Length), define a correlation term:

$\text{Correlation\\_shift} \\;=\\; \sum\_\{i=1}^{\langle offset\\_range \rangle} \text{Sequence}\_{\\,i}\\;\times\\;\text{Sequence}\_{\\,i+\text{shift}}$

where **offset_range** denotes the interval of indices still available after applying the shift.  
The overall quality metric is obtained by aggregating the squared correlations:

$\text{Energy}= \sum\_{\text{shift}\in\langle ShiftSet\rangle}(\text{Correlation}\_{\text{shift}})^{2}.$

We seek a configuration that yields the smallest possible **Energy**.

### Decision variables (symbolic view)

* A set ⟨Binary⟩ containing exactly the two permissible values, +1 and –1.
* An indexed family $\langle Sequence\_i\rangle\_{i=1}^{\text{Length}}$ with each component constrained to belong to
  ⟨Binary⟩.
* A scalar symbol **Result** defined as

$\text{Result}= \sum\_{\text{shift}\in\langle ShiftSet\rangle}\bigl(\text{Correlation}\_{\text{shift}}\bigr)^{2}.$

The optimisation criterion is therefore **minimise Result**.

In a final solution the entire sequence and its corresponding energy value are reported.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn)
