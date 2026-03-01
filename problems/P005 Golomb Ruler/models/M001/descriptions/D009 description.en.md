# Golomb Ruler Optimization

The Golomb ruler problem involves constructing a set of ‘m’ distinct integers, denoted as $a_1, a_2, ..., a_m$
where $0 = a_1 \le a_2 \le ... \le a_m$, such that the differences between every pair of these integers are unique. A
ruler composed of these integers possesses a length equal to $a_m$. The challenge is to discover the minimal or near
minimal ruler configuration. A special case, known as a ‘perfect’ Golomb ruler, occurs when the ruler measures all
possible distances up to its length. Problem symmetry can be eliminated by requiring that the initial difference must be
smaller than the final difference.

[//]: # (Generated using gemma3:latest from D001 description.en.md and model.mzn; major manual amendments applied)
