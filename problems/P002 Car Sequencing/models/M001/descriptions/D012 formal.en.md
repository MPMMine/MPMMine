# Car Sequencing Problem – Reformulated Description

A production line is tasked with assembling a fleet of cars that are not all identical; each car can belong to a *class*
and may carry a subset of optional equipment (air‑conditioning, sun‑roof, etc.). The line contains a series of
*stations*, each of which can process only a limited fraction of the cars that pass by. Consequently, the cars must be
arranged into a sequence such that, for every station, the proportion of cars requiring its option never exceeds its
capacity. For instance, a station can process at most $m_o$ cars in any window of size $b_o$ (the *block size* for
option $o$).

The problem is NP‑complete (Gent 1999).

## Parameters

* **Classes**: $C = \{1,\dots,|C|\} $  
  Number of cars required from each class: $q_c$.

* **Options**: $O = \{1,\dots,|O|\} $  
  For each option $o\in O$:
    * block size $b_o$ (the maximum number of consecutive positions inspected)
    * maximum cars per block $m_o$ (the station’s capacity in that block)

* **Feature matrix**: $r_{c,o}\in\{0,1\}$ indicating whether class $c$ requires option $o$.

* **Derived counts**:  
  $n_o=\sum_{c\in C} q_c\,r_{c,o}$ – total number of cars that need option $o$.

## Decision Variables

* **Slot assignment**:  
  $a_s \in C$ for each slot $s\in S=\{1,\dots,|S|\}$ (here $|S|=\sum_{c} q_c$) – the class placed in slot  $s$.

* **Setup matrix**:  
  $x_{o,s}\in\{0,1\}$ for each $o\in O, s\in S$ – whether option $o$ is active in slot $s$.  
  (By construction $x_{o,s}=r_{a_s,o}$.)

## Constraints

1. **Class multiplicity** – every class appears the required number of times:

   $\forall\,c\in C: \sum_{s\in S}\mathbf{1}_{\{a_s=c\}} = q_c$.

2. **Block capacity** – for every option $o$ and every starting position $t$ of a block of size $b_o$:

   $\forall\,o\in O, \forall\,t\in \{1,\dots,|S|-b_o+1\}: \sum_{s=t}^{t+b_o-1} x_{o,s} \le m_o$.

3. **Feature consistency** – the setup variables must reflect the class requirements:

   $\forall\,o\in O, \forall\,s\in S: x_{o,s} = r_{a_s,o}$.

4. **Global option balance** – the remaining unscheduled cars for each option must still be accommodated:

   $\forall\,o\in O, \forall\,i\in\{1,\dots,n_o\}: \sum_{s=1}^{|S|-i\,b_o} x_{o,s} \ge n_o - i\,m_o$.

## Objective

The goal is to find a schedule adhering to these constraints.

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; major manual amendments applied)
