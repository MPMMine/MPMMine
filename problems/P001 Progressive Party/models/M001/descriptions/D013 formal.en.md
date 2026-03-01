# Progressive Party Planning

The task is to organise a sequence of parties on a fleet of boats.  
Some boats are chosen to act as hosts; the crews of the remaining boats visit
the host boats for a set of consecutive half‑hour periods.
While a host’s crew stays aboard to run the party, a guest crew travels to
different hosts. Each boat can accommodate only a limited number of people,
so the total number of people aboard a host (its own crew plus any visiting
crew) must never exceed its capacity. A guest boat is not allowed to
return to a host it has already visited, and any two crews may meet at most
once during the entire schedule.

The organiser’s goal is to minimise the number of host boats.

---

## Formal model

Let

* $\mathcal{B}$ be the set of boats, $|\mathcal{B}| = n_{\text{boats}}$.
* $\mathcal{T}$ be the set of time periods, $|\mathcal{T}| = n_{\text{periods}}$.
* $\text{cap} : \mathcal{B}\rightarrow\mathbb{N}$ be the capacity of each boat.
* $\text{crew} : \mathcal{B}\rightarrow\mathbb{N}$ be the size of each boat’s crew.

Decision variables

* $H \subseteq \mathcal{B}$ – the set of host boats.
* $\text{visit}: \mathcal{B}\times\mathcal{T}\rightarrow \mathcal{B}$ – the boat that each
  crew visits at each time slot.

The model imposes the following constraints:

1. **Host membership**  
   $\forall b\in\mathcal{B}, \forall t\in\mathcal{T}:
   \text{visit}(b,t)\in H.$

2. **Hosts stay on themselves**  
   $\forall b\in\mathcal{B}, \forall t\in\mathcal{T}:
   (b\in H) \Longleftrightarrow \text{visit}(b,t)=b.$

3. **Capacity restriction**  
   $\forall h\in H, \forall t\in\mathcal{T}:
   \sum_{b\in\mathcal{B}}
   \mathbf{1}_{\{\text{visit}(b,t)=h\}} \text{crew}(b)
   \le \text{cap}(h).$

4. **Uniqueness of meetings**  
   $\forall k,l\in\mathcal{B}, k < l:
   \sum_{t\in\mathcal{T}}
   \mathbf{1}_{\{\text{visit}(k,t)=\text{visit}(l,t)\}}
   \le 1.$

5. **Symmetry breaking (lexicographic ordering)**  
   $\forall i\in\{1,\dots,n_{\text{periods}}-1\} :
   \text{visit}(\cdot,i)  \le_{\text{lex}} \text{visit}(\cdot,i+1).$

The objective is $\min |H|.$

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
