# A counterexample at the first three interior Ehrhart values

**Claim.** There is an integer-decomposition-property (IDP) lattice polytope $P$ for which
```math
  |\mathop{\mathrm{int}}(2P)\cap\mathbb Z^D|^2
  <
  |\mathop{\mathrm{int}}(P)\cap\mathbb Z^D|\,
  |\mathop{\mathrm{int}}(3P)\cap\mathbb Z^D|.
```
In particular, the answer to [Ferroni–Higashitani, Question 5.12(a), arXiv:2307.10852v4](https://arxiv.org/html/2307.10852v4#S5.SS2) is yes, since IDP implies very ample and Ehrhart reciprocity identifies these counts with the absolute negative evaluations. The ratio of the product of the first and third counts to the square of the second is unbounded in this family. By the identity immediately preceding Question 5.12, the first three absolute coefficients of the associated toric $K$-polynomial also fail log-concavity. In v3, the same question is numbered 5.11(a). [Ferroni, arXiv:2609.10513v2, §§5–6](https://arxiv.org/html/2609.10513v2#S6) gave related counterexamples for ordinary Ehrhart counts and answered the unrestricted-index part (b) for interior counts, explicitly leaving (a) unresolved there.

## 1. A Cayley box over six columns

Fix a positive integer $m$, set $N=15m$, and use spatial coordinates $(x,y)\in\mathbb R^N\times\mathbb R^5$. At homogeneous degree $k$, write
```math
  b_i=y_i\quad (1\le i\le5),\qquad b_0=k-\sum_{i=1}^5y_i.
```
Define a cone $C$ by $b_j\ge0$ for $0\le j\le5$ and, for each $i=1,\ldots,5$, impose the bounds
```math
  0\le x_\ell\le b_0+b_i\quad\text{on }m\text{ coordinates},\qquad
  0\le x_\ell\le 2b_i\quad\text{on }2m\text{ other coordinates}.
```
Every coordinate belongs to exactly one block. Let $R$ be its degree-one slice in the original spatial lattice $M=\mathbb Z^{N+5}$.

The slice is the convex hull of the six boxes over the base vertices $b=e_j$, whose corners are integer. Indeed, for general $b$ of total one, the weighted Minkowski sum of these six boxes is the box with the displayed capacities, since this holds on each coordinate interval. So $R$ is a lattice polytope. It is full-dimensional: at $b_j=1/6$ all upper bounds are $1/3$, and choosing all $x_\ell=1/6$ makes every displayed inequality strict.

The same Minkowski sum description proves IDP in $M$ directly. At any positive integer degree $k$, an old-lattice point has integers $b_j\ge0$ with sum $k$. Take $b_j$ copies of the base vertex $e_j$. Split each integer $x_\ell$ among the $k$ corresponding integer capacity intervals; this is possible because its upper bound is the sum of their capacities. The allocations for different $\ell$ are independent. The resulting $k$ points lie in $R\cap M$ and sum to the original point.

Write $E(j)=|jR\cap M|$ for $j\ge0$ and $E(j)=0$ for $j<0$. Counting integer points in the same boxes gives
```math
  E(j)=\sum_{\substack{b_0+\cdots+b_5=j\\ b_i\ge0}}
  W(b)^m,\qquad
  W(b)=\prod_{i=1}^{5}(b_0+b_i+1)(2b_i+1)^2.
```
Here the binding $b_i\ge0$ is over integers. This Cayley-box count follows the construction in Ferroni's paper, using an additional copy of each singleton row and changing the number of columns.

## 2. Refine the lattice without losing IDP

Let $p=(1,\ldots,1)/6$ in the spatial space, let $\widetilde M=M+\mathbb Zp$, and put $g'=(p,1)$ in homogeneous coordinates. Take each of the original defining linear forms with its nonnegative sign: all six $b_j$, all $x_\ell$, and each upper bound minus $x_\ell$. Each such form $\lambda$ is integer-valued on $M\times\mathbb Z$, and
```math
  \lambda(g')=\frac16.
```
For the upper-bound forms, this follows because both kinds of row have sum two, so the capacity at $g'$ is $1/3$ and $x_\ell=1/6$.

At any integer degree $k$, the refined lattice splits uniquely into the six spatial cosets $rp+M$ for $r=0,\ldots,5$. In coset $r$, all the forms satisfy $\lambda\equiv r/6\pmod{\mathbb Z}$. For a point $v$ in the closed cone, this implies $\lambda(v)\ge r/6$ for all forms. Consequently $v-rg'$ belongs to the old lattice and the closed cone, at degree $k-r$. Conversely every old-lattice cone point of degree $k-r$ gives a point of $kR$ in coset $r$ by adding $rg'$.

This also proves IDP after refinement. Decompose $v-rg'$ into $k-r$ old degree-one points, and add $r$ copies of $g'$. The degree $k-r$ is necessarily nonnegative; at degree zero the only cone point is zero. The vertices of $R$ are still lattice points. Dilation preserves IDP, since a decomposition into $2k$ degree-one points can be paired into $k$ elements of $2R$. Thus $P=2R$ in $\widetilde M$ is IDP.

For interior points, all the same nonzero defining forms are strictly positive. For $1\le r\le5$ the least allowed value remains $r/6$. In coset zero the least allowed value is instead $1$, so subtract $6g'$ in that coset. The resulting bijections give
```math
  |\mathop{\mathrm{int}}(kR)\cap\widetilde M|
  =\sum_{r=1}^6 E(k-r)\qquad(k\ge1).
```
Consequently the first three interior counts for $P$ are $S_1,S_3,S_5$, where $S_t=\sum_{j=0}^t E(j)$. These are ordinary lattice polytopes: if desired, identify $\widetilde M$ with $\mathbb Z^{N+5}$ using the basis of the first $N+4$ standard unit vectors together with $p$.

## 3. Exact bounds on the three counts

At $j=1$ the choice $b=(1,0,0,0,0,0)$ gives $W=2^5=32$, and at $j=5$ the choice $b=(0,1,1,1,1,1)$ gives $W=18^5$. Thus
```math
  S_1\ge32^m,\qquad S_5\ge(18^5)^m.
```

At $j=3$ we can group the compositions by $b_0$ and the positive parts among $b_1,\ldots,b_5$:

| $b_0$ | Positive parts | $W$ |
|---:|:---|---:|
| 3 | none | 1024 |
| 2 | 1 | 2916 |
| 1 | 2 | 1600 |
| 1 | 1, 1 | 5832 |
| 0 | 3 | 196 |
| 0 | 2, 1 | 1350 |
| 0 | 1, 1, 1 | 5832 |

At $j=2$ the four possible weights are $243,432,75,324$, and the weights at $j=0,1$ are still smaller. Exactly 20 of the $\binom{9}{6}=84$ compositions of total at most three have weight $5832=18^3$ (the two maximizing rows in the table have multiplicities $\binom52$ and $\binom53$). All other 64 weights are at most $2916=18^3/2$. Therefore
```math
  S_3\le(20+64\cdot 2^{-m})(18^3)^m
\quad\text{and}\quad
  \frac{S_1S_5}{S_3^2}
  \ge
  \frac{(16/9)^m}{(20+64\cdot 2^{-m})^2}.
```
The bound tends to infinity. Already at $m=11$, the denominator is less than $21^2$ and $`16^{11}>21^2\,9^{11}`$, so the inequality is strict. The explicit witness has dimension $170$.

No numerical search or unverified normality test is needed for the witness. The accompanying script evaluates the counts with exact integers.

## 4. Optional strengthening: a regular unimodular triangulation

The witness $P$ even has a regular unimodular triangulation. In the original lattice, [Ferroni, Proposition 2.2](https://arxiv.org/html/2609.10513v2#S2) gives a regular unimodular triangulation of $R$, hence one on its boundary. No new lattice point from a nonzero coset can lie on the boundary: all defining forms would be positive, as shown above. In particular the original boundary simplices are still unimodular in their facet lattices, since any vector of $\widetilde M$ in the kernel of the corresponding facet form must lie in $M$.

Cone this boundary triangulation from $p$. For a maximal boundary simplex $\sigma$, choose a defining form $\lambda$ which is zero at the degree-one lifts of $\sigma$, and let $\lambda_{\mathrm{sp}}$ be its spatial linear part. Then $6\lambda_{\mathrm{sp}}$ is integer-valued on $\widetilde M$ and $6\lambda_{\mathrm{sp}}(p-v)=1$ for every vertex $v$ of $\sigma$. Thus $p-v$ generates the quotient by the facet lattice, so $`p*\sigma`$ is unimodular. To see regularity, retain the old boundary heights and give $p$ a sufficiently low height. The lower affine support of each boundary simplex within its facet extends through the lifted $p$; low enough height places this extension strictly below every lifted point off that facet other than $p$. There are only finitely many boundary simplices, so one height suffices for all of them.

Now integral dilation preserves regular unimodular triangulability, by [Haase–Paffenholz–Piechnik–Santos, Theorem 4.8](https://arxiv.org/html/1405.1687v3#S4.SS2). Hence $2R$ also has a regular unimodular triangulation.
