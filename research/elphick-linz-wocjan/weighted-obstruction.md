# Elphick–Linz–Wocjan conjecture: exact obstruction to the edge-weighted extension

Date: 2026-11-24. Coordination: [issue #314](https://github.com/1337isnot1337/solved-conjectures/issues/314).

**Status: rigorous partial result / method obstruction. The original simple-graph conjecture remains open.** No Lean verification and no independent specialist review. The finite arithmetic below was checked using exact integer arithmetic. Priority of this particular obstruction has not been established.

## Target and literature check

For a finite nonempty simple graph $G$, write $r=\omega(G)$, $m=|E(G)|$, and $n^+(G)$ for the number of positive adjacency eigenvalues. The conjecture of Clive Elphick, William Linz and Pawel Wocjan, *Two conjectured strengthenings of Turán's theorem*, Linear Algebra Appl. 684 (2024), 23–36, is

```math
 \sum_{i=1}^{\min(r,n^+(G))}\lambda_i(A_G)^2\le 2m(1-1/r).
```


Primary sources: [arXiv:2101.05229](https://arxiv.org/abs/2101.05229), [journal DOI](https://doi.org/10.1016/j.laa.2023.12.010). The problem was placed fourth in Liu and Ning's survey of unsolved spectral graph problems, and strengthens the edge-count spectral Turán inequality.

The September 2026 paper by Gabriel Coutinho, Yinchen Liu, Thomás Jung Spier, Quanyu Tang and Shengtong Zhang, [*The Bollobás–Nikiforov inequality for nonnegative edge weights*](https://github.com/shengtongz/BN/blob/main/docs/sol.tex), proves the rank-two weighted version and expressly leaves this multi-eigenvalue conjecture untreated. The July 2026 [Liu–Tang–Zhang paper](https://arxiv.org/abs/2607.18044) addresses the distinct bound on total positive square energy in terms of vertex count rather than edge count. A dated search (2026-11-24) for the exact multi-eigenvalue inequality and weighted counterexamples found no earlier full resolution or this specific obstruction. This is not a guarantee of priority.

## Theorem (failure of the direct weighted extension)

For symmetric real $B$, define $F_k(B)=\sum_{i=1}^k(\max(\lambda_i(B),0))^2$, padding with zero if necessary. There exists a symmetric entrywise nonnegative integer matrix $B$ with zero diagonal and support graph of clique number exactly three such that

```math
 \frac{F_3(B)}{\|B\|_F^2}\ge\frac{278882}{416343}>\frac23.
```


Thus one cannot directly extend the recent weighted rank-two theorem to $k=\omega(G)$ for arbitrary nonnegative edge weights.

### Explicit certificate

Use indices 0 through 9. Set $X=ZZ^{\mathsf T}$ with

```math
 Z=\begin{pmatrix}
8&-1&-7
\\ -2&-8&-6
\\ -7&-1&-7
\\ -2&6&-8
\\ -5&-6&-7
\\ -5&4&-8
\\ 7&3&-7
\\ 3&6&-8
\\ 7&-5&-6
\\ 3&-8&-6
\end{pmatrix}.
```


The support graph $G$ has the following unordered edges:

```text
04 05 06 07 08 09
12 14 16 18 19
23 24 25
35 36 37 38
45 49
57
67 68
79
89
```


Set $B_{ij}=X_{ij}$ on those edges (in both orders) and $B_{ij}=0$ otherwise, including on the diagonal.

Every specified edge has positive weight. The 16 triangles, written in increasing vertex order, are

```text
045 049 057 067 068 079 089
124 149 168 189
235 245
357 367 368
```


None has a common adjacent fourth vertex, as follows directly from the displayed edge list (also exhaustively checked below). Thus $\omega(G)=3$. By construction $X\succeq0$ and $`\mathop{\mathrm{rank}}(X)\le3`$.

Direct integer arithmetic gives

```math
 S:=\|B\|_F^2=\langle B,X\rangle=278882,\qquad
T:=\|X\|_F^2=416343,\qquad
3S-2T=3960>0.
```


Here the Frobenius inner product and sums count both orders of each edge.

### Variational proof

Let $B$ be any real symmetric matrix, and let $X$ be positive semidefinite with rank at most three. Write the nonzero eigenvalues of $X$ in descending order as $\alpha_1,\alpha_2,\alpha_3\ge0$ (padding with zeros), and choose orthonormal eigenvectors $u_i$. By the Ky Fan variational principle, for $j=1,2,3$,

```math
 \sum_{i=1}^j u_i^{\mathsf T}Bu_i\le\sum_{i=1}^j\lambda_i(B).
```


Indeed, the rank-$`j`$ orthogonal projection onto these $u_i$, expressed in an eigenbasis of $B$, has diagonal entries in $[0,1]$ summing to $j$; their scalar product with the ordered eigenvalues is at most the sum of the largest $j$. Multiply the inequality for each $j$ by $\alpha_j-\alpha_{j+1}\ge0$ (where $\alpha_4=0$) and sum. It follows that

```math
 \langle B,X\rangle\le\sum_{i=1}^3\alpha_i\lambda_i(B)
\le\sqrt{F_3(B)}\sqrt{\sum_{i=1}^3\alpha_i^2}
=\sqrt{F_3(B)}\|X\|_F.
```


For our $B,X$, the inner product equals $S>0$, so squaring gives $F_3(B)\ge S^2/T$. Divide by $S$ and use $3S>2T$. This proves the theorem without evaluating numerical eigenvalues. In particular, $B$ must have at least three positive eigenvalues, since the weighted rank-two theorem would otherwise contradict the certified inequality.

### Consequence for the completely positive approach

The matrix used in the rank-two proof is

```math
 M(X)=X^{\circ2}+\sum_{i\lt j:X_{ij}<0}X_{ij}^2(e_i-e_j)(e_i-e_j)^{\mathsf T}.
```


Its total entry sum equals $T$ because all Laplacian corrections have total sum zero, and its off-diagonal entries on $E(G)$ equal $X_{ij}^2$, since the designated edge entries are positive. Hence $\langle A_G,M(X)\rangle=S>2T/3$. If $M(X)$ were completely positive, Motzkin–Straus applied to each nonnegative rank-one summand would imply the reverse inequality. So this $M(X)$ is not completely positive. Moreover every row of $Z$ has negative third coordinate, meaning that the Gram vectors lie in a common open half-space. The rank-two complete positivity theorem therefore also cannot be extended to rank three merely by replacing "half-plane" with "half-space."

## Why this does not resolve the unweighted conjecture

A vertex blowup with positive integer multiplicities $p_i$ has nonzero adjacency spectrum equal to that of $D A_G D$, where $`D=\mathop{\mathrm{diag}}(\sqrt{p_i})`$. This follows by representing the adjacency operator in the normalized indicator basis of the independent vertex classes; it is zero on the orthogonal complement. Moreover its squared Frobenius norm equals $`\|D A_G D\|_F^2`$. Rational approximation and homogeneity show that the simple-graph conjecture is equivalent to its restriction to all such positive diagonal scalings of simple adjacency matrices with real $D$. Zero weights follow by continuity, or by deleting zero-weight vertices. The converse is immediate by taking $D=I$.

Our $B$ is not a matrix of this form. On the four-cycle $0,4,1,6,0$ any diagonal scaling satisfies $B_{04}B_{16}=B_{14}B_{06}$, whereas the certificate gives $15\cdot4=60$ and $100\cdot102=10200$. Consequently the ordinary vertex blowup reduction cannot transfer the displayed matrix to a simple-graph counterexample. This does not exclude a different graph construction.

A numerical search optimized real diagonal scalings on the support and on thresholded edge subsets; it did not find a violation. This search is heuristic, not an upper bound or an exhaustive proof. The unweighted support itself has numerical $`F_3(A_G)/\|A_G\|_F^2`$ below $2/3$.

## Exact verification

Run [check.py](check.py) with Python 3. It uses only the standard library, checks the support, absence of any 4-clique, existence of a triangle, all integer sums, strict inequality, and obstruction to diagonal factorization. No numerical eigenvalue computation is used. The local run passed on 2026-11-24.

Discovery: random greedy maximal $K_4$-free supports, alternating projection onto nonnegative supported matrices and rank-three positive spectral parts, followed by integer rounding of the Gram vectors and exact validation. The weighted theorem and completely positive approach are credited to the authors above. No claim is made about first discovery of this particular counterexample.

Next mathematical task: determine whether a rank-constrained inequality can be proved specifically for diagonal scalings of unweighted adjacency matrices, or construct an actual simple graph that violates the original conjecture. The arbitrary-weight route is obstructed. No active reservation is asserted.
