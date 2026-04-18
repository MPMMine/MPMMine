In order to correct the Fzn_Ozn File in the "File Conversion Pipeline" from LPP-Utilities 

M001:

Delete: lines that redefine variables: `3`.

M002:

Delete: lines that redefine variables: `3, 4`.

Save and reload from disk.

On the infeasibility of the instances where $k \equiv 1 \lor k \equiv 2\ (mod\ 4)$ 

1. If we sum up every position index in the array, the total sum is:

$$\sum\limits_{j=1}^{2k} j = \frac{2k(2k+1)}{2} = k(2k + 1)$$

2. If we sum up the position indices from the prespective of the pairs of numbers the total sum is:

$$ \sum\limits_{i=i}^{k}[p_i + (p_i + i + 1)] = \sum\limits_{i=i}^{k} (2p_i + i + 1)$$

3. The sums must be equal:

$$ k(2k + 1) = \sum\limits_{i=i}^{k} (2p_i + i + 1) $$

$$ k(2k + 1) = 2\sum\limits_{i=1}^k p_i + \sum\limits_{i=1}^k i + \sum\limits_{i=1}^k 1$$

$$2k^2 + k = 2\sum\limits_{i=1}^k p_i + \frac{k(k+1)}{2} + k$$

$$2k^2= 2\sum\limits_{i=1}^k p_i + \frac{k(k+1)}{2}$$

4. Both sides must be even, so $k(k+1)$ must be divisible by $4$.

* if: $k = 4n$: $\Longrightarrow$ $4n\cdot(4n+1)$ is divisible by 4

* if: $k = 4n+1$: $\Longrightarrow$ $(4n+1)\cdot(4n+2)$ is NOT divisible by 4

* if: $k = 4n+2$: $\Longrightarrow$ $(4n+2)\cdot(4n+3)$ is NOT divisible by 4

* if: $k = 4n+3$: $\Longrightarrow$ $(4n+3)\cdot(4n+4)$ = $4\cdot(4n+3)(n+1)$ is divisible by 4

Q.E.D.
