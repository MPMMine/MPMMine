# Cutting Stock Problem

In many production settings a manufacturer receives demand for several different product widths *w₁, w₂, …, wₙ* (encoded
as the vector **W**) together with required quantities *d₁, d₂, …, dₙ* (encoded as the vector **D**). The raw material
consists of large reels that all share a common breadth *B*.  
The firm may acquire at most *R* such reels; a binary symbol **Uⱼ** indicates whether reel *j* is actually taken into
service.

For each pair *(i, j)*, a non‑negative integer **Kᵢⱼ** denotes how many pieces of type *i* are cut from the selected
reel *j*. The model imposes two fundamental links:

* **Physical capacity link** – the number of cuts of any single commodity on a given reel cannot exceed its innate
  ceiling, denoted by the symbol **Mᵢ** = ⌊ B / wᵢ ⌋. Consequently  
  *Kᵢⱼ* ≤ *Mᵢ*·**Uⱼ**.

* **Width feasibility link** – for every reel that is used the total breadth occupied by all pieces placed on it must
  remain under *B*. This is expressed as  
  Σ₍i=1..n₎ (*Kᵢⱼ* · wᵢ) ≤ B·**Uⱼ**.

The demand of each product family has to be satisfied or exceeded across all reels, which translates into  
Σ_{j=1}^{R} *Kᵢⱼ* ≥ *dᵢ*.

To eliminate symmetric allocations a monotonicity tie‑breaker forces the decision variables to respect  
**U₁** ≥ **U₂** ≥ … ≥ **U_R**.

Finally, a derived lower bound on reel usage can be imposed: the sum of all binary activations must meet or surpass a
computed threshold obtained by dividing total required breadth Σᵢ (*dᵢ*·wᵢ) by *B* and rounding upward.

The optimisation objective is to minimise the overall number of reels selected, i.e., to minimise Σⱼ **Uⱼ**, thereby
reducing waste while guaranteeing that all customer orders are fulfilled.

[//]: # (Generated using nemotron-3-nano:latest from D001 description.en.md and model.mzn; minor manual amendments applied)
