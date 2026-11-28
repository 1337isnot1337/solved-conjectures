# Checks on two attempted ways to remove the zero DAG

20 November 2026 (America/Chicago). These are obstructions to auxiliary arguments, not counterexamples to Brualdi's conjecture or to the structural theorem in `brualdi_structure.md`.

## Equal maximal minors are insufficient

At a global minimizer with a positive free row, every maximal minor of the other $(n-1)\times n$ rows equals the permanent. This condition, even together with positive doubly stochastic completion, does not rule out an additional acyclic zero.

For example, let

```math
R=\begin{pmatrix}
0&0&1/2&1/2
\\ 1/2&0&1/4&1/4
\\ 1/3&1/2&0&1/6
\end{pmatrix}.
```

Every row sums to one, and all four maximal permanents are $1/8$. Its column sums are $(5/6,1/2,3/4,11/12)$, so appending

```math
v=(1/6,1/2,1/4,1/12)
```

gives a doubly stochastic matrix with a positive last row and column. Its zero pattern is the prescribed three diagonal zeros and the single extra zero $(1,2)$. Its permanent is $1/8$, which exceeds $`\mathop{\mathrm{per}}U_4=1/9`$; it is not a global minimizer.

There is a general reason that the equal-minor condition is weak. Given an $(n-1)\times n$ nonnegative matrix whose maximal permanents $q_j$ are positive, multiply its $`j`$th column by $q_j$. The new maximal permanent obtained by deleting column $j$ is

```math
q_j\prod_{\ell\ne j}q_\ell=\prod_\ell q_\ell,
```

independent of $j$. Normalizing its rows afterwards preserves equality of all maximal permanents. Thus this equality can be arranged on many supports; the remaining cofactor conditions are essential.

## The inverse of the AF matrix need not have nonnegative off-diagonal entries

A possible source/sink argument would require inverse cofactor matrices to have nonnegative off-diagonal entries. This property fails even when each fixed row has exactly one zero, at distinct positions.

Take

```math
R=\begin{pmatrix}
20&0&4&402&2
\\ 139&29&0&2&107
\\ 1&54&2&0&2
\end{pmatrix}.
```

The permanental bilinear form obtained by adding two variable rows has coefficient matrix

```math
H=\begin{pmatrix}
0&86052&2346288&23460&23748
\\ 86052&0&154854&6376&111844
\\ 2346288&154854&0&131790&3031230
\\ 23460&6376&131790&0&31300
\\ 23748&111844&3031230&31300&0
\end{pmatrix}.
```

Every off-diagonal entry is the permanent of the corresponding three-column submatrix of $R$. The Bapat--Panov criterion applies, so $H$ is nonsingular with exactly one positive eigenvalue. Exact inversion gives

```math
(H^{-1})_{1,3}=-\frac{162181587284677}{1314230065622332596912}<0.
```

This does not rule out a special inverse-sign theorem at a global minimizer. It does rule out inferring that theorem solely from strict Alexandrov--Fenchel and the distinct missing diagonal positions.

## Remaining direction

The full stationary system includes constant cofactors in both the free row and free column, equality at every positive entry, and the one-sided inequalities at extra zero entries. Neither counterexample above satisfies that complete system. A valid DAG elimination must use more than the properties isolated here.
