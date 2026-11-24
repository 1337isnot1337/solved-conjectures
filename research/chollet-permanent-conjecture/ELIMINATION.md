# Chollet’s permanent conjecture

**Partial research.** A simultaneous elimination order with controlled fill proves Chollet’s inequality for pairs of complex positive semidefinite matrices of arbitrary order and rank. In particular, the self-conjugate inequality holds on every support graph of treewidth at most five. The unrestricted conjecture remains open. [Tracking issue #49](https://github.com/1337isnot1337/solved-conjectures/issues/49)

## Target and prior work

Chollet asks whether $\operatorname{per}(A\circ B)\le\operatorname{per}(A)\operatorname{per}(B)$ for all Hermitian positive semidefinite matrices $A,B$ of the same order. The self-conjugate case $B=\overline A$ for all $A$ implies the general case by applying Cauchy–Schwarz to the permutation monomials of the two factors. Li, Zhao, and Luo give a border-occupation proof through order six. Pant and Singh give structural cases and a one-point sum formula. The November 24, 2026 source screen found no unrestricted resolution and found no statement of the simultaneous fill criterion below. Priority for the criterion is provisional. [Chollet (1982)](https://doi.org/10.1080/00029890.1982.11995380) · [Li–Zhao–Luo, v1](https://www.preprints.org/manuscript/202608.2196/v1) · [Pant–Singh, v2](https://arxiv.org/abs/2604.24192v2) · [Lavi's status record](https://yair-lavi.com/mincs-list/conjecture-30/)

## Simultaneous fill criterion

For a Hermitian matrix, its support graph joins two distinct indices when their matrix entry is nonzero. Start with separate support graphs for $A$ and $B$ and choose one order of the indices. At each step, eliminate the current vertex from each graph, making its surviving neighbors a clique before deletion. Deleting a vertex with disjoint neighbor sets in the two current graphs requires **no fill in either graph** for this criterion. Otherwise, let $d,e$ be the respective numbers of current neighbors and require

```math
(d+1)^{1/d}(e+1)^{1/e}\ge 2.
```

**Theorem.** If the order meets this requirement at every step with a nonempty intersection of the two neighbor sets, then Chollet’s inequality holds for $A,B$. The same conclusion holds if the graphs used to certify the order are supergraphs of the actual support graphs.

For $B=\overline A$, an elimination order of width at most five gives the hypothesis because $6^{2/5}\gt 2$. Thus the self-conjugate inequality holds on every graph of treewidth at most five. Cauchy–Schwarz also proves the two-matrix inequality whenever both support graphs have treewidth at most five, even when they have no common width-five order. The asymmetric rule can handle pairs with much greater width on one side if they admit the same order. Here are some sufficient bounds for the numbers of neighbors at a shared step.

| First graph | Second graph |
| --- | --- |
| 1 | arbitrary |
| 2 | 21 |
| 3 | 10 |
| 4 | 7 |
| 5 | 5 |

The bounds apply row by row at successive steps. They follow by comparing $(d+1)^e(e+1)^d$ with $2^{de}$. The function $(d+1)^{1/d}$ decreases as $d$ increases, since $\log(1+d)\gt d/(1+d)$ for $d\gt0$.

## Proof

Use the empty permanent convention $\operatorname{per}(\varnothing)=1$. If some diagonal entry of either PSD matrix is zero, its entire row is zero by the $2\times2$ principal-minor inequalities, so both sides of the desired comparison vanish. At an elimination step with positive diagonals, normalize the departing diagonal in each factor to one by a positive diagonal congruence. This multiplies both sides of Chollet’s inequality by the same factor and preserves the support. Write the normalized matrices as

```math
A=\begin{pmatrix} A_0&x\\x^*&1\end{pmatrix},\qquad
B=\begin{pmatrix} B_0&y\\y^*&1\end{pmatrix}.
```

If the two current neighbor sets are disjoint, $x\circ y=0$ and $\operatorname{per}(A\circ B)=\operatorname{per}(A_0\circ B_0)$. The permanental Fischer inequality gives $\operatorname{per}(A)\ge\operatorname{per}(A_0)$ and $\operatorname{per}(B)\ge\operatorname{per}(B_0)$. Thus ordinary principal deletion in both matrices suffices, with no fill.

For a shared step, put $H=A_0-xx^*$ and $K=B_0-yy^*$, both PSD by the scalar Schur complement. Set $A_t=H+t xx^*$ and $B_u=K+u yy^*$. For two square PSD matrices $D_0,D_1$, the coefficients of $\operatorname{per}(D_0+tD_1)$ are nonnegative. The same holds for any finite sum of PSD matrices with distinct variables. In fact, choose Gram vectors for the summands in mutually orthogonal spaces. Symmetrize the tensor product of the sums of Gram vectors, with each vector scaled by the square root of its variable. Terms with different counts in the orthogonal spaces are orthogonal. The squared norm of the symmetrized tensor is the permanent up to the positive normalization, so its coefficients are squared norms up to the same factor. This is the occupation argument used by Li–Zhao–Luo.

Write

```math
\operatorname{per}(A_t)=\sum_k\alpha_k t^k,\qquad
\operatorname{per}(B_u)=\sum_l\beta_l u^l.
```

These degrees are at most $d$ and $e$, respectively. Every nonzero term using an entry of $xx^*$ uses a row with $x_i\ne0$, and a permutation uses each row at most once. The analogous statement holds for $yy^*$. Expansion by the last row and column gives

```math
\operatorname{per}(A)=\sum_k(k+1)\alpha_k,\qquad
\operatorname{per}(B)=\sum_l(l+1)\beta_l.
```

Indeed the extra terms involving the last row and column equal the derivative with respect to the rank-one coefficient at one, by permanent multilinearity.

Let $z=x\circ y$. The four matrices

```math
U=H\circ K,\quad V=(xx^*)\circ K,\quad T=H\circ(yy^*),\quad W=zz^*
```

are PSD by Schur's product theorem. Define the nonnegative coefficients $\gamma_{i,j,s}$ by

```math
\operatorname{per}(U+aV+bT+cW)=\sum_{i,j,s}\gamma_{i,j,s}a^i b^j c^s.
```

The two factors have different variables here. Since $(A\circ B)_0=U+V+T+W$ and the final border of $A\circ B$ is $z$, the same derivative identity yields

```math
\operatorname{per}(A\circ B)=\sum_{i,j,s}(s+1)\gamma_{i,j,s},\qquad
\operatorname{per}(A_t\circ B_u)=\sum_{i,j,s}t^{i+s}u^{j+s}\gamma_{i,j,s}.
```

Choose $t=(d+1)^{1/d}$ and $u=(e+1)^{1/e}$. For $0\le k\le d$ and $0\le l\le e$, the decreasing property gives $t^k\le k+1$ and $u^l\le l+1$. Thus $\operatorname{per}(A_t)\le\operatorname{per}(A)$ and $\operatorname{per}(B_u)\le\operatorname{per}(B)$. Since $t,u\ge1$ and $tu\ge2$, the mixed coefficients satisfy $t^{i+s}u^{j+s}\ge2^s\ge s+1$. Hence

```math
\operatorname{per}(A\circ B)
\le \operatorname{per}(A_t\circ B_u)
\le \operatorname{per}(A_t)\operatorname{per}(B_u)
\le \operatorname{per}(A)\operatorname{per}(B).
```

The middle comparison is the induction hypothesis. The matrices $A_t$ and $B_u$ are PSD and have support contained in the filled graphs after eliminating the vertex. Indeed, $A_t=A_0+(t-1)xx^*$ can add an edge only between two former neighbors of the eliminated vertex, and the same holds for $B_u$. At a disjoint step the supports are contained in the graphs by simple deletion. Continuing through the certified order to the scalar or empty case proves the theorem. If a larger support graph was used for certification, its fill still contains all actual entries. At a shared step with the actual neighbor sets disjoint, the shared-step inequalities remain valid with $W=0$.

For an arbitrary complete support the ordinary degrees increase with the order. This leaves the central unrestricted case outside the uniform mixed-coefficient comparison.
