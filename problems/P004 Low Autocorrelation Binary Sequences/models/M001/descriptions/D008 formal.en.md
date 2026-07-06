# Low Autocorrelation Binary Sequences

We need to generate a binary sequence, $X_j$, with a length of $N$ where each element $X_j$ is either $+1$ or $-1$. The
goal is to design this sequence so that the statistical relationships between consecutive elements are as weak as
possible. Specifically, we measure this relationship using autocorrelations, denoted as $R_m$. $R_m$ is calculated as
the sum of the products of pairs of elements spaced $m$ positions apart,
namely $R_m = \sum_{j=1}^{N-m} X_j * X_{j+m}$. Our objective is to reduce the sum of the squares of these
autocorrelation values. Thus, we want to minimize $E = \sum_{m=1}^{N-1} R_m^2$.

[//]: # (Generated using gemma3:latest from D001 formal.en.md and model.mzn; major manual amendments applied)
