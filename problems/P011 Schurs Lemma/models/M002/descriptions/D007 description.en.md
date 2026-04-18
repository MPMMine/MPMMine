# Distribute balls into containers

Distribute $n$ distinct balls, numbered from 1 to $n$, across $k$ distinct containers. The constraint dictates that we
must avoid scenarios where three balls $x$, $y$, and $z$ share a specific relationship: $x + y = z$. Specifically, no
single container should ever hold a set of three balls fulfilling this addition rule. Our goal is to find a valid
assignment of the balls to the containers that adheres to this restriction.

[//]: # (Generated using gemma3:latest from D001 description.en.md and model.mzn; major manual amendments applied)
