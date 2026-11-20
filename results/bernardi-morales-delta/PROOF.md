# Bernardi–Morales's delta-process conjecture

## Statement and source

Bernardi and Morales state the conjecture as Conjecture 27 in *Some probabilistic trees with algebraic roots*, Electronic Journal of Combinatorics 23(2) (2016), P2.36, page 23, DOI [10.37236/4954](https://doi.org/10.37236/4954). It is Conjecture 21 in [arXiv:1501.01135v1](https://arxiv.org/abs/1501.01135v1).

Fix integers $k\geq2$ and $r\geq1$. Write $[k]=\{1,\ldots,k\}$, with its cyclic order. For a proper subset $S\subsetneq[k]$, define $\delta(i,S)=i$ when $i\in S$. When $i\notin S$, define $\delta(i,S)$ to be the next element of $[k]\setminus S$ after $i$ in cyclic order. A singleton complement therefore gives a fixed point.

For $\boldsymbol p=(p_1,\ldots,p_k)\in\mathbb Z_{\geq0}^k$, let

```math
\mathcal R_{\boldsymbol p,r}
=\left\{(S_1,\ldots,S_r): S_\ell\subsetneq[k],\quad
\sum_{\ell=1}^r\boldsymbol1_{\{j\in S_\ell\}}=p_j
\text{ for every }j\in[k]\right\}.
```

The set $\mathcal R_{\boldsymbol p,0}$ consists of the empty tuple if $\boldsymbol p=\boldsymbol0$, and is empty otherwise. Given a map $f:[k-1]\to[r]$, let $G_\delta(\boldsymbol S,f)$ have arcs

```math
i\longrightarrow\delta(i,S_{f(i)}),\qquad i\in[k-1].
```

Every nonroot vertex has one outgoing arc, while $k$ has none. Thus this graph is a tree exactly when every forward orbit reaches $k$.

**Theorem.** For every fixed map $f:[k-1]\to[r]$,

```math
\#\{\boldsymbol S\in\mathcal R_{\boldsymbol p,r}:
 G_\delta(\boldsymbol S,f)\text{ is a tree}\}
=|\mathcal R_{\boldsymbol p,r-1}|. \tag{1}
```

In particular, if $1\leq r\lt k$, $\mathcal R_{\boldsymbol p,r}$ is nonempty, $\boldsymbol S$ is uniform in that set, and $f$ is an independent uniform surjection, then

```math
P_\delta(\boldsymbol p,r)
=\frac{|\mathcal R_{\boldsymbol p,r-1}|}
 {|\mathcal R_{\boldsymbol p,r}|}. \tag{2}
```

Equation (2) is the full published tree-probability conjecture. The fixed-map assertion (1) is stronger: neither surjectivity nor the inequality $r\lt k$ is needed. The companion [EVENT_PROOF.md](EVENT_PROOF.md) proves the separate, stronger event-determinant Conjecture 28. This file gives the tree identity its own proof.

## 1. The cyclic Laplacian and elimination

All matrices have rows and columns indexed by $[k]$ unless specified otherwise. For row and column sets $I,J$, use $M[I,J]$ with indices in increasing order. Empty determinants equal 1.

Let $Q$ be the matrix with $Q_{i,i+1}=1$, with subscripts taken cyclically modulo $k$, and all other entries zero. Set

```math
L=I-Q.
```

For a nonempty set $C\subseteq[k]$, let $L_C$ be the Laplacian of the cyclic successor on $C$, extended by zero rows and columns on $[k]\setminus C$. Explicitly, its row at $i\in C$ is $e_i^T-e_{\mathop{\mathrm{next}}_C(i)}^T$. If $C$ is a singleton, this is the zero matrix. In particular, the row of $L_{[k]\setminus S}$ at $i$ is $e_i^T-e_{\delta(i,S)}^T$.

**Lemma 1.** If $S\subsetneq[k]$ and $C=[k]\setminus S$, then

```math
\det L[S,S]=1,
```

and the Schur complement of $L[S,S]$ in $L$, on the remaining set $C$, is

```math
L[C,C]-L[C,S]L[S,S]^{-1}L[S,C]=L_C[C,C]. \tag{3}
```

**Proof.** The successor graph restricted to a proper subset $S$ is a union of directed paths. Consequently $Q[S,S]$ is nilpotent. Ordering each path along its direction makes $I-Q[S,S]$ triangular with diagonal 1, proving the determinant assertion.

The inverse of $I-Q[S,S]$ is the finite sum of powers of $Q[S,S]$. In the product $L[C,S]L[S,S]^{-1}L[S,C]$, a contribution from $i\in C$ to $j\in C$ records the unique successor path from $i$ to $j$ whose internal vertices lie in $S$. The product has coefficient $+1$ when this path has at least one internal vertex. An arc with no internal vertex is already recorded with coefficient $-1$ in $L[C,C]$. Subtracting the product therefore gives $I_C$ minus the cyclic-successor matrix on $C$. When $C$ is a singleton, the returning path cancels its diagonal entry. This proves (3). The same statement for $S=\varnothing$ uses empty-block conventions. ∎

## 2. A determinant generating identity

Introduce commuting indeterminates $x_1,\ldots,x_k$. Put

```math
X=\mathop{\mathrm{diag}}(x_1,\ldots,x_k),\qquad
x^S=\prod_{i\in S}x_i,
```

and

```math
F(x)=\sum_{S\subsetneq[k]}x^S
=\prod_{i=1}^k(1+x_i)-\prod_{i=1}^kx_i. \tag{4}
```

**Lemma 2.** For an arbitrary $k\times k$ matrix $Z$,

```math
\det\bigl(I+(X+Z)L\bigr)
=\sum_{S\subsetneq[k]}x^S
  \det\bigl(I+ZL_{[k]\setminus S}\bigr). \tag{5}
```

**Proof.** Expand the left side by multilinearity in its rows. The coefficient of $x^S$ is the determinant formed by taking row $i$ of $L$ when $i\in S$, and row $i$ of $I+ZL$ when $i\notin S$.

When $S=[k]$, that determinant is $\det L=0$. Otherwise put $C=[k]\setminus S$ and place the indices of $S$ first by applying the same permutation to rows and columns. This does not change the determinant. From each row $i\in C$, subtract the linear combination $\sum_{j\in S}Z_{ij}L[j,[k]]$ of the selected rows. The resulting block matrix is

```math
\begin{pmatrix}
L[S,S]&L[S,C]\\
Z[C,C]L[C,S]&I_C+Z[C,C]L[C,C]
\end{pmatrix}.
```

By Lemma 1 and the block determinant formula, its determinant is

```math
\det L[S,S]\,
\det\left(I_C+Z[C,C]
 \bigl(L[C,C]-L[C,S]L[S,S]^{-1}L[S,C]\bigr)\right)
=\det\bigl(I_C+Z[C,C]L_C[C,C]\bigr).
```

Because $L_C$ has zero rows and columns outside $C$, this is $\det(I+ZL_C)$. The coefficient of every $x^S$ agrees with the right side of (5). ∎

Taking $Z=0$ in (5) gives

```math
A:=I+XL,\qquad \det A=F. \tag{6}
```

Work for the moment over the rational-function field $\mathbb Q(x_1,\ldots,x_k)$, where $F\ne0$ and $A$ is invertible. Set

```math
H=LA^{-1}. \tag{7}
```

Factoring $A+ZL=(I+ZLA^{-1})A$ in (5) yields

```math
\frac1F\sum_{S\subsetneq[k]}x^S
\det(I+ZL_{[k]\setminus S})
=\det(I+ZH). \tag{8}
```

## 3. All minors, and the replacement of a block of rows

For any function $g$ of a proper subset define the normalized formal average

```math
\mathbb E_x g(S)=\frac1F\sum_{S\subsetneq[k]}x^Sg(S).
```

This notation is a linear functional on a finite sum. No analytic probability assumption on the indeterminates is needed.

**Lemma 3.** For all equally sized row and column sets $I,J\subseteq[k]$,

```math
\mathbb E_x\det\bigl(L_{[k]\setminus S}[I,J]\bigr)
=\det H[I,J]. \tag{9}
```

**Proof.** In (8), let all entries of $Z$ be independent indeterminates. The principal-minor expansion followed by Cauchy–Binet gives, for any matrix $M$,

```math
\det(I+ZM)
=\sum_{a=0}^k\ \sum_{\substack{I,J\subseteq[k]\\|I|=|J|=a}}
\det Z[I,J]\det M[J,I]. \tag{10}
```

The polynomials $\det Z[I,J]$ appearing here are linearly independent: their monomials have distinct sets of row indices and column indices for distinct pairs $(I,J)$. Equating their coefficients in (8) proves (9), after exchanging the names $I,J$. In particular, the size-one assertion gives $\mathbb E_x L_{[k]\setminus S}=H$. ∎

The all-minor property in (9) is commonly called the determinant-preserving property. Its general closure rules are known; see Dereziński, Liang and Mahoney, [arXiv:1912.04533v3](https://arxiv.org/abs/1912.04533v3), Definition 4 and Lemma 4. Here (5) proves that property for the cyclic matrices required by this conjecture. The following short argument supplies the precise closure step needed, without taking it as an external assumption.

**Lemma 4.** Suppose a square determinant has a specified set of rows taken from $L_{[k]\setminus S}$, with a fixed common set of columns. Its other rows are independent of $S$. Applying $\mathbb E_x$ to that determinant has the same effect as replacing the specified rows by the corresponding rows of $H$.

**Proof.** Expand the determinant along the specified rows. Each term is a signed product of a square minor of $L_{[k]\setminus S}$ and a complementary minor using the other rows. The latter factor is independent of $S$. Apply (9) to the former factor and sum the Laplace expansion again. ∎

It follows that independently averaged matrices can be replaced one color at a time, even when the different colors occupy several interspersed rows. Entrywise expectations alone would not justify this step; (9) for all row and column sets does.

## 4. The cofactor of the mean matrix

Let $\boldsymbol1$ be the all-ones column vector. The cycle Laplacian satisfies

```math
L\boldsymbol1=0,\qquad
\boldsymbol1^T L=0,\qquad
\mathop{\mathrm{adj}}L=\boldsymbol1\boldsymbol1^T. \tag{11}
```

Indeed, Lemma 1 gives a principal cofactor equal to 1, so $L$ has rank $k-1$. Its left and right nullspaces are spanned by $\boldsymbol1^T$ and $\boldsymbol1$. Hence the adjugate is a scalar multiple of $\boldsymbol1\boldsymbol1^T$, and the principal cofactor fixes that scalar at 1.

Since $A\boldsymbol1=\boldsymbol1$, the adjugate multiplication identity and (6)–(7) give

```math
\mathop{\mathrm{adj}}H
=\mathop{\mathrm{adj}}(A^{-1})\mathop{\mathrm{adj}}L
=\frac{A}{F}\boldsymbol1\boldsymbol1^T
=\frac1F\boldsymbol1\boldsymbol1^T. \tag{12}
```

Writing $R=[k-1]$, we therefore have

```math
\det H[R,R]=\frac1F. \tag{13}
```

## 5. A fixed map and the tree indicator

Fix $f:[k-1]\to[r]$. For a tuple of proper subsets $\boldsymbol S=(S_1,\ldots,S_r)$, form the $(k-1)\times(k-1)$ matrix $B_f(\boldsymbol S)$ whose row at $i\in R$ is row $i$ of $L_{[k]\setminus S_{f(i)}}$, restricted to the columns in $R$. Thus its row is $e_i^T-e_{\delta(i,S_{f(i)})}^T$, after deleting the root column.

We have the elementary indicator identity

```math
\det B_f(\boldsymbol S)
=\boldsymbol1_{\{G_\delta(\boldsymbol S,f)\text{ is a tree}\}}. \tag{14}
```

To see this directly, if the graph contains a directed cycle, the rows indexed by that cycle sum to zero. A loop supplies a zero row. Either way the determinant is zero. If there is no directed cycle, every vertex reaches $k$. Order the nonroot vertices by their distance from $k$, and apply the same order to rows and columns. The matrix becomes triangular with diagonal 1, so its determinant is 1. This also proves (14) without invoking the matrix-tree theorem.

Apply the formal product average $\mathbb E_x^{\otimes r}$, giving each $S_\ell$ its own independent sum with weight $x^{S_\ell}/F$. The word independent refers to this product of finite sums; the sets will be conditioned on the membership counts only at the end.

For each color $\ell$, use Lemma 4 on the row set $f^{-1}(\ell)$. Replace the rows belonging to that color by the corresponding rows of $H$. Other colors are fixed during this step. A color with no assigned rows simply contributes the average of 1. After all $r$ replacements, the matrix is $H[R,R]$. Equations (13)–(14) give

```math
\frac1{F^r}\sum_{S_1,\ldots,S_r\subsetneq[k]}
x^{S_1}\cdots x^{S_r}
\boldsymbol1_{\{G_\delta(\boldsymbol S,f)\text{ is a tree}\}}
=\frac1F.
```

Clearing denominators proves the polynomial identity

```math
\boxed{
\sum_{S_1,\ldots,S_r\subsetneq[k]}
x^{S_1}\cdots x^{S_r}
\boldsymbol1_{\{G_\delta(\boldsymbol S,f)\text{ is a tree}\}}
=F(x)^{r-1}.} \tag{15}
```

The coefficient of $x_1^{p_1}\cdots x_k^{p_k}$ on the left counts the trees in (1). By (4), its coefficient on the right is $|\mathcal R_{\boldsymbol p,r-1}|$. This proves (1).

When $r\lt k$, averaging (1) over surjections gives (2). Finally, the map that deletes an empty first set is a bijection from the tuples in $\mathcal R_{\boldsymbol p,r}$ with $S_1=\varnothing$ to $\mathcal R_{\boldsymbol p,r-1}$. Thus the ratio in (2) also has the interpretation stated in the source. ∎

## 6. Color-weight refinement

Summing (15) over all maps $f$, with weight $\prod_{i=1}^{k-1}t_{f(i)}$, gives

```math
\sum_{S_1,\ldots,S_r\subsetneq[k]}
x^{S_1}\cdots x^{S_r}
\det\left[\left(\sum_{\ell=1}^r t_\ell L_{[k]\setminus S_\ell}\right)[R,R]\right]
=F(x)^{r-1}(t_1+\cdots+t_r)^{k-1}. \tag{16}
```

The determinant notation on the left means the determinant of the submatrix indexed by $R,R$ after taking the indicated sum. Its row-multilinear expansion is the sum over maps used above. In particular, prescribing color fiber sizes $n_1+\cdots+n_r=k-1$ gives the exact tree count

```math
\binom{k-1}{n_1,\ldots,n_r}\,|\mathcal R_{\boldsymbol p,r-1}|.
```

Positive fiber sizes recover surjections. Formula (16) and the fixed-map theorem are refinements of the same conjecture, not separate conjectures counted as additional results.

## Audit and verification

The parent research agent independently checked the source definition, Lemmas 1–3, the independent-color replacement, the adjugate evaluation, and coefficient extraction. The parent also proposed the fixed-map refinement, proved here by Lemma 4. The companion `verify.py` independently checks 71 fixed maps and 111,721 literal process pairs, along with 25 arbitrary-matrix instances of (5). Those finite calculations are checks of implementation and conventions; the proof above has no upper bound on $k$, $r$, or the membership counts.
