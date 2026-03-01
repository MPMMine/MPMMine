# Cutting‑Stock Planning

In many production and logistics environments, a large commodity—such as a roll of paper or a sheet of metal—must be
divided into smaller pieces that satisfy a set of customer requests. The challenge is to devise cutting patterns that
honour every demand while leaving as little unused material as possible, which is equivalent to using the fewest master
rolls.

## Mathematical Model

Let

- **I = {1,…,n_items}** be the set of distinct product types.
- **J = {1,…,max_rolls}** index the master rolls that may be employed.
- **W** denote the fixed width of each master roll.
- For each *i* ∈ **I**:
    - **w_i** is the width of product *i*.
    - **d_i** is the required quantity of product *i*.
    - **m_i** = ⌊W / w_i⌋ is the maximum number of copies of item *i* that can physically fit on a single roll.

Define binary variables

- **u_j ∈ {0,1}**: 1 if roll *j* is used, 0 otherwise.

Define integer variables

- **c_{ij}**: number of copies of item *i* cut from roll *j* (bounded by *m_i* when roll *j* is used).

The model is constrained by:

1. **Physical Capacity**  
   $$
   \forall i\in I, \forall j\in J:\quad c_{ij} \le m_i\,u_j
   $$
   (a roll cannot contain more items than physically possible).

2. **Width Limit**  
   $$
   \forall j\in J:\quad \sum_{i\in I} c_{ij}\,w_i \le  W\,u_j
   $$
   (total width of items on a roll cannot exceed the roll’s width).

3. **Demand Satisfaction**  
   $$
   \forall i\in I:\quad \sum_{j\in J} c_{ij} \ge  d_i
   $$
   (every customer request is met).

4. **Symmetry Breaking**  
   $$
   \forall j\in J\setminus\{max\_rolls\}:\quad u_j \ge  u_{j+1}
   $$
   (orders rolls in decreasing usage to reduce equivalent solutions).

5. **Redundant Lower Bound on Total Number of Rolls**  
   $$
   \sum_{j\in J} u_j \ge \Bigl\lceil \frac{\sum_{i\in I} d_i\,w_i}{W} \Bigr\rceil
   $$
   (ensures the number of rolls is at least enough to cover the total required width).

The **objective** is to minimize the total number of master rolls used:

$$
\min \sum_{j\in J} u_j
$$

This formulation guarantees that all demands are satisfied with the smallest possible waste.

[//]: # (Generated using gpt-oss:latest from D001 description.en.md and model.mzn; major manual amendments applied)
