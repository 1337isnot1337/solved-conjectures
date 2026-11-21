# Bernardi–Morales's delta-process conjecture

Lean status: the complete statement in this note now has strict source, all-owned axiom, and pinned stock-kernel verification. See the [formalization section](README.md#lean-formalization) for the exact definitions, endpoints and receipt. The combined package gate remains separate.

## The stronger event identity

This note proves Conjecture 28 in Bernardi and Morales, [*Some probabilistic trees with algebraic roots*](https://www.combinatorics.org/ojs/index.php/eljc/article/download/v23i2p36/pdf/), Electronic Journal of Combinatorics 23(2) (2016), P2.36, page 23. It is Conjecture 22 in [arXiv:1501.01135v1](https://arxiv.org/abs/1501.01135v1). The paper shows that this identity implies its delta-process tree-probability conjecture. The companion [PROOF.md](PROOF.md) gives an independent proof of that probability formula.

The argument below was developed by the parent research agent and independently checked by the analysis agent. The checks included a direct enumeration using the paper's event definitions, without relying on the adjugate representation used in the proof.

## 1. Exact event formulation

Fix $k\geq2$, $1\leq r\lt k$, a surjection $f:[k-1]\to[r]$, and a set $D\subseteq[k-1]$. Intervals are cyclic: $]i,j]$ contains the vertices strictly after $i$ up to and including $j$, while $]i,i]=\varnothing$.

For any subset $S\subseteq[k]$, including the full set, define the zero-one matrices

```math
(I_S)_{ij}=\boldsymbol1_{\{]i,j]\subseteq S\}},
\qquad
(J_S)_{ij}=
\begin{cases}
(I_S)_{ij},&i\ne j,\\
\boldsymbol1_{\{S=[k]\}},&i=j.
\end{cases} \tag{1}
```

For a tuple $\boldsymbol S=(S_1,\ldots,S_r)$ of arbitrary subsets, let $M^D(\boldsymbol S,f)$ be the ordinary numerical matrix obtained from the source's event matrix by taking event indicators:

```math
M^D_{ij}(\boldsymbol S,f)=
\begin{cases}
(J_{S_{f(i)}})_{i-1,j},& i\in D,\\
(I_{S_{f(i)}})_{ij},& i\in[k-1]\setminus D,\\
1,&i=k.
\end{cases} \tag{2}
```

The index $i-1$ is read cyclically, so $0$ means $k$.

Write $x^S=\prod_{i\in S}x_i$ and

```math
G(x)=\prod_{i=1}^k(1+x_i),\qquad
F(x)=G(x)-\prod_{i=1}^kx_i.
```

**Theorem.** For every fixed surjection $f$ and every $D\subseteq[k-1]$,

```math
\boxed{
\sum_{S_1,\ldots,S_r\subseteq[k]}
x^{S_1}\cdots x^{S_r}\det M^D(\boldsymbol S,f)
=F(x)^{r-1}x^D
 \prod_{j\in[k-1]\setminus D}(1+x_j).} \tag{3}
```

The sums on the left include full subsets. This distinction from the proper-subset model is necessary. The proof treats those subsets explicitly.

## 2. Cyclic adjugates

Let $Q_{i,i+1}=1$ with cyclic indices, all other entries zero. For a binary vector $s=(s_1,\ldots,s_k)$ representing $S$, put

```math
W_s=I-Q\mathop{\mathrm{diag}}(s_1,\ldots,s_k).
```

The determinant and adjugate are

```math
\det W_s=1-\prod_{i=1}^ks_i,
\qquad
\mathop{\mathrm{adj}}W_s
=\sum_{a=0}^{k-1}\bigl(Q\mathop{\mathrm{diag}}s\bigr)^a
=I_S. \tag{4}
```

The first equality follows by expanding the cyclic matrix determinant: only the identity permutation and the complete cycle contribute. For the second, $(Q\mathop{\mathrm{diag}}s)^k=(\prod_i s_i)I$. Multiplication by $W_s$ gives the first expression in (4) times the identity. The equality with the adjugate follows first where the determinant is nonzero and then as a polynomial identity. Entry $i,j$ of the displayed sum is the product of the indicators along the unique cyclic path $]i,j]$ of length at most $k-1$, proving the equality with $I_S$.

When $S$ is proper, $\det W_s=1$ and $I_S=W_s^{-1}$. When $S=[k]$, every entry of $I_S$ equals 1. The full-set matrix is not an inverse.

The source's two event matrices also satisfy

```math
(J_S)_{i-1,j}=s_i(I_S)_{ij}. \tag{5}
```

For $j\ne i-1$, the interval $]i-1,j]$ is $\{i\}\cup]i,j]$. For $j=i-1$, the right side requires every vertex to belong to $S$, agreeing with the special diagonal definition of $J_S$.

Thus (2) uses row $i$ of $I_{S_{f(i)}}$, multiplied by $s_i$ when $i\in D$, and has a fixed last row of ones.

## 3. A row-replacement lemma that includes the singular case

Let $A\subseteq[k-1]$ be a nonempty set of selected rows. Fix all other rows in a matrix $R$, whose last row is $\boldsymbol1^T$. Let $U=A\cap D$.

For a binary vector $s$, form $T_s$ by taking row $i$ from $I_S$ for $i\in A$ and from $R$ otherwise, then multiplying each selected row $i\in U$ by $s_i$. Put $A^c=[k]\setminus A$.

**Lemma.** Suppose the $s_i$ are independent Bernoulli variables with parameters $q_i$. Put

```math
W_q=I-Q\mathop{\mathrm{diag}}(q_1,\ldots,q_k),\qquad
\Delta=\det W_q=1-\prod_{i=1}^kq_i,
```

and assume $\Delta\ne0$. Let $\overline T$ retain the rows of $R$ outside $A$ and use row $i$ of $W_q^{-1}$ inside $A$, multiplied by $q_i$ when $i\in U$. Then

```math
\mathbb E\det T_s=\Delta\det\overline T. \tag{6}
```

**Proof.** First omit the factors $s_i$ on the selected rows, and call the resulting matrix $T_s^0$. We claim the exact binary identity

```math
\det T_s^0
=\det\bigl((RW_s)[A^c,A^c]\bigr). \tag{7}
```

If $S$ is proper, multiply $T_s^0$ by $W_s$. The selected rows become the standard rows $e_i^T$, while the other rows become those of $RW_s$. Since $\det W_s=1$, expanding along the selected standard rows proves (7). The sign is positive because the same index set is removed from rows and columns.

If $S=[k]$, a selected row of $T_s^0$ equals $\boldsymbol1^T$, as does the last row. Hence the left side of (7) is zero. On the right, the last row of $RW_s$ is $\boldsymbol1^T(I-Q)=0$, and that row is retained because $k\notin A$. The right side is also zero. Thus (7) holds even at the singular full-set matrix.

Restore the marked row factors. Equation (7) gives

```math
\det T_s
=\left(\prod_{i\in U}s_i\right)
 \det\bigl((RW_s)[A^c,A^c]\bigr). \tag{8}
```

Column $j$ of $RW_s$ is column $j$ of $R$ minus $s_j$ times column $j-1$ of $R$. The determinant on the right of (8) therefore depends only on the variables $s_j$ with $j\in A^c$, and is affine in each of them. These variables are disjoint from those in the prefactor. Independence and multilinearity in the columns yield

```math
\mathbb E\det T_s
=\left(\prod_{i\in U}q_i\right)
 \det\bigl((RW_q)[A^c,A^c]\bigr). \tag{9}
```

Finally, multiply the unmarked version of $\overline T$ by $W_q$ and expand along its selected standard rows. Now the multiplication contributes $\det W_q=\Delta$. Restoring the factors $q_i$ shows that the right side of (9) is $\Delta\det\overline T$. This proves (6). ∎

The nonempty condition on $A$ is used when $S=[k]$. It is supplied by surjectivity in the next step. The proof never assumes that $I_S$ itself is an inverse or determinant preserving at a full subset.

## 4. Replace the colors and evaluate the determinant

For each color $\ell\in[r]$, sample a vector $s^{(\ell)}$ with independent Bernoulli coordinates of parameters $q_1,\ldots,q_k$. All colors are independent.

Apply the lemma to the nonempty row set $A=f^{-1}(\ell)$. Condition on the other colors while doing so. The last row remains $\boldsymbol1^T$ throughout. Each replacement contributes a factor $\Delta$. After all $r$ replacements, the first $k-1$ rows are the corresponding rows of

```math
K=\mathop{\mathrm{diag}}(v_1,\ldots,v_k)W_q^{-1},
\qquad
v_i=
\begin{cases}
q_i,&i\in D,\\
1,&i\notin D,
\end{cases}
```

and the last row is $\boldsymbol1^T$. Call this final matrix $M_q$. Thus

```math
\mathbb E\det M^D(\boldsymbol S,f)=\Delta^r\det M_q. \tag{10}
```

Multiplication of $M_q$ by $W_q$ turns row $i\in[k-1]$ into $v_ie_i^T$. Its last row becomes

```math
\boldsymbol1^TW_q=(1-q_1,\ldots,1-q_k).
```

Expansion along the first $k-1$ diagonal rows gives

```math
\Delta\det M_q
=(1-q_k)\prod_{i\in D}q_i.
```

Combining this with (10) proves

```math
\mathbb E\det M^D(\boldsymbol S,f)
=\Delta^{r-1}(1-q_k)\prod_{i\in D}q_i. \tag{11}
```

## 5. Membership coefficients and the conjecture

Set $q_i=x_i/(1+x_i)$. One can first take all $x_i>0$, so every probability and inverse used above is defined. The probability weight of a subset is then $x^S/G(x)$, and

```math
\Delta=\frac{F(x)}{G(x)}.
```

Multiplying (11) by $G(x)^r$ gives

```math
G(x)^r\Delta^{r-1}(1-q_k)\prod_{i\in D}q_i
=F(x)^{r-1}x^D\prod_{j\in[k-1]\setminus D}(1+x_j).
```

This proves (3) for positive $x_i$. Both sides of (3) are polynomials, so it proves the polynomial identity without restrictions on the indeterminates.

For the original membership vector $\boldsymbol p$, define $\mathcal S_{\boldsymbol p,r}$ as the set of tuples of arbitrary subsets with those counts. Define $\mathcal R_{\boldsymbol p,r}$ by requiring every subset to be proper, as in [PROOF.md](PROOF.md). The coefficient of $x^{\boldsymbol p}$ on the right of (3) is

```math
N_D=\#\{\boldsymbol S\in\mathcal R_{\boldsymbol p,r}:
 k\notin S_1,\ D\subseteq S_1\}. \tag{12}
```

Indeed, the factor $x^D\prod_{j\in[k-1]\setminus D}(1+x_j)$ enumerates the choices for the distinguished first subset, while $F^{r-1}$ enumerates the other proper subsets.

The probability determinant in the source is the expectation of the determinant of the numerical event-indicator matrix. This follows directly from its Leibniz expansion: each product of indicators is the indicator of the corresponding intersection of events. Taking coefficients in (3), dividing by $|\mathcal S_{\boldsymbol p,r}|$, and averaging over the surjections therefore gives

```math
\mathbb P\det(M^D)
=\frac{N_D}{|\mathcal S_{\boldsymbol p,r}|}
=\frac{|\mathcal R_{\boldsymbol p,r}|}{|\mathcal S_{\boldsymbol p,r}|}
\mathbb P\bigl(k\notin S_1,\ D\subseteq S_1
 \mid\boldsymbol S\in\mathcal R_{\boldsymbol p,r}\bigr). \tag{13}
```

This is the full published Conjecture 28. It holds before averaging over surjections, for each fixed surjection separately. The conditional-probability notation in (13) assumes $\mathcal R_{\boldsymbol p,r}\ne\varnothing$, as in the source setting; the polynomial identity (3) and the count (12) require no such restriction. ∎

## Relation to the tree identity

The source obtains its delta event matrix by summing the matrices in (2) over $D$, with sign $(-1)^{|D|}$ in the determinant expansion. Summing the right side of (3) with those signs gives

```math
F(x)^{r-1}
\sum_{D\subseteq[k-1]}(-1)^{|D|}x^D
\prod_{j\in[k-1]\setminus D}(1+x_j)
=F(x)^{r-1}\prod_{j=1}^{k-1}\bigl((1+x_j)-x_j\bigr)
=F(x)^{r-1}.
```

This recovers the tree-count polynomial for surjections, consistent with the independent Schur-complement proof. Both results belong to the same named conjecture investigation; the stronger identity and its specializations are not counted as extra named conjectures.

## Exact check

Run `python verify_events.py` from this directory. The verifier implements (1)–(2) literally and computes signed integer determinants. It compares every membership coefficient with (12) for 342 pairs $(f,D)$ and 438,952 subset-tuple determinants: all $r\lt k$ through $k=4$, and $(k,r)=(5,2)$. All comparisons passed. No adjugate or Bernoulli identity is used by that verifier, and no part of the proof relies on the finite range checked.
