# Low Autocorrelation Binary Sequence

The challenge involves generating a sequence of binary digits, denoted as $X_j$, with a length of $N$. The goal is to
design this sequence to reduce redundancy by minimizing the correlations between successive digits. Each digit within
the sequence can be either +1 or -1. The correlation between the $j$-th and $(j+l)$-th digits, represented as $R_l$, is
calculated as the sum of the products of the corresponding digits within the sequence,
namely $R_l = \sum_{j=1}^{N-l} X_j * X_{j+l}$. We seek to minimize the total squared correlation value,
represented by the expression $T = \sum_{l=1}^{N-1} R_l^2$. Essentially, we aim to create a sequence where
adjacent digits are as independent as possible.

[//]: # (Generated using gemma3:latest from D001 formal.en.md and model.mzn; minor manual amendments applied)
