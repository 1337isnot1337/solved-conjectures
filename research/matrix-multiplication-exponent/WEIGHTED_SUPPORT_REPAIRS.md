# Weighted matrix multiplication: untwisting and a finite obstruction

Research note, 23 November 2026 (America/Chicago). All tensors and local
maps in this note are over $`\mathbb C`$. The weighted support consequence
is an existing theorem of Baitian Li. The lower bound below is an
independently checked adaptation of the one-puncture
Landsberg--Michałek argument; no originality claim is made. Neither
result determines the matrix multiplication exponent.

## 1. Exact scope of the weighted untwisting theorem

For positive integers $`E,H,L`$ and arbitrary coefficients
$`c_{ijk}\in\mathbb C\setminus\{0\}`$, define

```math
T(c)=\sum_{i=1}^{E}\sum_{j=1}^{H}\sum_{k=1}^{L}
c_{ijk}\,x_{ij}\otimes y_{jk}\otimes z_{ki}.
```

There are no other nonzero coefficients. Thus $`T(c)`$ has exactly the
standard matrix multiplication support. Li, *Semidirect sums of tensors
and the matrix multiplication exponent*,
[arXiv:2611.04175v1](https://arxiv.org/abs/2611.04175v1),
[ECCC TR26-298](https://eccc.weizmann.ac.il/report/2026/298/), Lemma 2.9
(printed page 10), proves

```math
T(c)\gtrsim M_{E,H,L}.
```

Here $`\gtrsim`$ is asymptotic local restriction. Equivalently, a full-unit
overhead of size $`2^{o(m)}`$ suffices to convert $`T(c)^{\otimes m}`$ into
$`M_{E,H,L}^{\otimes m}`$. The coefficients are fixed for the chosen
finite tensor; they need not factor as functions of pairs of indices.

The short proof is worth spelling out. For fixed $`j`$, the corresponding
slice $`T_j`$ uses its own X and Y spaces and the shared Z space. The
diagonal map $`z_{ki}\mapsto c_{ijk}^{-1}z_{ki}`$ identifies $`T_j`$ with
$`M_{E,1,L}`$. This map depends on $`j`$, so it cannot simply be applied
simultaneously to the original shared Z space. Li's Theorem 2.1 is
precisely the asymptotic untwisting result allowing such separate
isomorphisms. It gives

```math
T(c)\gtrsim W_{XY}(H)\otimes M_{E,1,L}=M_{E,H,L}.
```

For square size $`n`$, it follows that

```math
n^\omega=\widetilde R(M_n)
\le\widetilde R(T(c))\le\underline R(T(c))\le R(T(c)).
```

Taking the minimum rank among all choices of nonzero weights proves
$`\omega_s=\omega`$, which is Li's Corollary 2.10. It improves the older
comparison $`\omega\le(3\omega_s-2)/2`$. It does not say that all weighted
matrix multiplication tensors have the same asymptotic rank: the
established comparison is in one direction.

Theorem 2.1 follows from the polynomial separator in Li's Lemma 2.3,
multiplicative cancellation, and a tensor-power argument. Remark 2.4
identifies the separator with the one already used in the OpenAI
$`9/4`$ proof. Consequently this theorem is not, by itself, a new operation
outside the operational barrier audited in the companion notes.

## 2. A uniform border-rank lower bound for arbitrary nonzero weights

### Proposition

For every integer $`n\ge3`$ and every array
$`(c_{ijk})\in(\mathbb C\setminus\{0\})^{n^3}`$,

```math
\underline R(T(c))\ge 2n^2-n+1.                 \tag{1}
```

The proof uses the border-substitution theorem and the closedness of
the quotient rank-drop locus from Landsberg--Michałek,
*A $`2n^2-\log_2(n)-1`$ lower bound for the border rank of matrix
multiplication*,
[arXiv:1608.07486v1](https://arxiv.org/abs/1608.07486v1),
[author PDF](https://people.tamu.edu/~jml/LMsubmmult160825.pdf),
Lemma 2.2 and Proposition 2.3. Their §3 supplies the compressed Koszul
construction. The support argument needed for arbitrary weights is
proved here; no genericity assumption on the weights is used.

### Step 1: one coordinate can be removed at a cost of one

Write $`A=\mathbb C^{n^2}`$ with basis $`x_{ij}`$, and use the analogous
bases for $`B,C`$. The A-flattening of $`T(c)`$ has independent columns:
different pairs $`(i,j)`$ have disjoint nonzero support in $`B\otimes C`$.
Thus the tensor is A-concise.

Put $`r=\underline R(T(c))`$. Border substitution gives a nonzero vector
$`a\in A`$ such that

```math
\underline R\bigl(T(c)/\langle a\rangle\bigr)\le r-1.
```

The set of projective vectors with this property is closed and
invariant under the A-projection of the tensor's stabilizer. Every
weighted tensor under consideration has the following diagonal torus
in its stabilizer:

```math
x_{ij}\mapsto s^{ni+j}x_{ij},\qquad
y_{jk}\mapsto s^{-j}y_{jk},\qquad
z_{ki}\mapsto s^{-ni}z_{ki},\qquad s\ne0.
```

The three exponents sum to zero on each tensor monomial. The A-weights
$`ni+j`$, for $`1\le i,j\le n`$, are pairwise distinct. Therefore the
projective limit of the orbit of $`a`$, as $`s\to0`$, is a coordinate
vector: the coordinate of least weight among its nonzero components.
Closedness yields a coordinate $`x_{i_0j_0}`$ with the same rank-drop
property. Relabel the i and j indices so it is $`x_{n1}`$. This relabelling
may change the weights, but preserves their nonvanishing and the
support class. No permutation is assumed to stabilize the original
weighted tensor.

Let $`T'`$ be the quotient by $`x_{n1}`$. It is the weighted matrix
multiplication tensor with all $`n`$ monomials containing $`x_{n1}`$ removed,
and

```math
r\ge 1+\underline R(T').                       \tag{2}
```

### Step 2: the compressed Koszul matrix is triangular by support

Let $`V`$ have basis $`e_1,\ldots,e_{2n-1}`$. Project the remaining A
coordinates by $`x_{ij}\mapsto e_{i+j-1}`$, and call the resulting tensor
$`T''\in V\otimes B\otimes C`$. The Koszul flattening is

```math
K_{T''}:B^*\otimes\bigwedge^{n-1}V
\longrightarrow C\otimes\bigwedge^n V,
```

```math
y_{jk}^*\otimes e_S
\longmapsto
\sum_{\substack{1\le i\le n\\(i,j)\ne(n,1)}}
c_{ijk}\,z_{ki}\otimes(e_{i+j-1}\wedge e_S).
```

It is a direct sum of $`n`$ square blocks, indexed by $`k`$. Each has

```math
N=n\binom{2n-1}{n-1}
```

rows and columns. Temporarily restore the omitted coordinate. The
columns of one block are indexed by pairs $`(S,j)`$, where
$`S\subseteq[2n-1]`$ has size $`n-1`$ and $`1\le j\le n`$. Rows are
indexed by pairs $`(P,i)`$, where $`P=\{p_1<\cdots<p_n\}`$ and
$`1\le i\le n`$.

Pair row $`(P,i)`$ with column

```math
\left(P\setminus\{p_i\},\ 1+p_i-i\right).       \tag{3}
```

This is a bijection. In fact, given $`(S,j)`$, let $`p`$ be the j-th
smallest element of $`[2n-1]\setminus S`$. Put $`P=S\cup\{p\}`$ and
$`i=p-j+1`$. Then $`p=p_i`$ and (3) recovers $`(S,j)`$. Also
$`1\le1+p_i-i\le n`$ because $`i\le p_i\le n+i-1`$.

Order the rows by lexicographic order of the following length-$`n+1`$
tuple:

```math
\kappa(P,i)=(-p_1,\ldots,-p_i,-2n,-p_{i+1},\ldots,-p_n).
```

Order the paired columns in the same way. In the column paired with
$`(P,i)`$, the indicated row has coefficient
$`\pm c_{i,\,1+p_i-i,\,k}\ne0`$. Every other nonzero entry occurs at
a strictly earlier row in this order. Here is the check.

For an alternative output row index $`h`$, put
$`j=1+p_i-i`$ and $`p'=h+j-1=p_i+h-i`$. Its subset is
$`P'=(P\setminus\{p_i\})\cup\{p'\}`$; the entry vanishes if
$`p'\in P\setminus\{p_i\}`$.

If $`h<i`$, then $`p'\ge p_h`$. Equality would make the entry vanish.
For a nonzero entry, $`p'>p_h`$, so the first h elements of $`P'`$ and
$`P`$ coincide. The shorter marked prefix h makes
$`\kappa(P',h)<\kappa(P,i)`$, since the sentinel $`-2n`$ is smaller than
every $`-p_j`$.

If $`h>i`$, then $`p'>p_i`$. Removing $`p_i`$ and inserting $`p'`$ preserves
the first $`i-1`$ entries and increases the i-th entry of the sorted
subset. Negating this entry again gives
$`\kappa(P',h)<\kappa(P,i)`$.

Thus the matrix is triangular with the explicitly nonzero pivot for
every row. The argument is independent of all values of the weights.

Now remove the terms with $`(i,j)=(n,1)`$. A diagonal pivot is removed
exactly when $`i=n`$ and $`1+p_n-n=1`$, that is, when
$`P=\{1,\ldots,n\}`$. This removes exactly one pivot from each k-block.
Other removed entries cannot spoil triangularity. Deleting the affected
row and its paired column leaves an $`(N-1)`$-square triangular submatrix
with all diagonal entries nonzero. Consequently

```math
\mathop{\mathrm{rank}}K_{T''}\ge n(N-1).         \tag{4}
```

### Step 3: convert the flattening rank to border rank

For a rank-one tensor, this Koszul map has rank at most
$`D=\binom{2n-2}{n-1}`$. Matrix rank is subadditive and its upper bounds
are closed. Hence every tensor of border rank at most s has Koszul
rank at most $`sD`$. Since projection cannot increase border rank,
(4) gives

```math
\underline R(T')\ge
\left\lceil\frac{n(N-1)}{D}\right\rceil
=\left\lceil 2n^2-n-\frac nD\right\rceil.
```

For $`n\ge3`$, $`D>n`$. For example $`\binom42=6>3`$, and the ratio
$`D_{n+1}/D_n=2(2n-1)/n`$ grows faster than $`(n+1)/n`$.
The last ceiling is therefore $`2n^2-n`$. Combining it with (2) proves
(1). For $`n=2`$, this calculation only gives six; that case must not be
included in (1) on the basis of this proof.

## 3. Consequence for Sun's one-bit quotient construction

The [quotient audit](SUN_SOURCE_CERTIFICATE_AUDIT.md) deletes all 64 feature-zero
graft directions from the exact source maps in
[Sun, arXiv:2610.13971v1](https://arxiv.org/pdf/2610.13971v1),
§§3.2--3.3, (9.18)--(9.20), and Appendix A.6. The remaining source
has border rank at most

```math
64(14\cdot5+4\cdot4+7\cdot2+5\cdot4+7)=8128.
```

Even weakening the target from exact $`M_{64}`$ to an arbitrary tensor
with exactly its support and nonzero coefficients cannot repair those
same source maps: (1) gives

```math
\underline R(T(c))\ge2\cdot64^2-64+1=8129>8128.
```

This excludes a support-correct weighted output from the **same
deleted-graft quotient source**. It does not exclude the full
8192-direction source with different maps, arbitrary weighted
constructions of cost $`2n^2`$, or a different unbounded family with
support-correct maps. A successful such family would still imply
$`\omega=2`$ by Li's untwisting theorem.

## 4. An extension to edge-weighted graph tensors

Here the term weighted means arbitrary nonzero coefficient weights, not
different edge dimensions. Let G be any finite loopless graph with one
tensor party at each vertex and positive integer dimension $`q_e`$ on
each edge. For an assignment $`a=(a_e)`$ of an index to every edge,
the local basis vector at v is indexed by $`(a_e:e\ni v)`$. Define

```math
T_G(c)=\sum_a c_a\bigotimes_{v\in V(G)}
e_{(a_e:e\ni v)},\qquad c_a\ne0.
```

Then

```math
T_G(c)\gtrsim T_G(1).
```

This follows from the powered partial-sum inequality already proved in
[multiple-party separator note](MULTIPLE_PARTY_SEPARATOR.md), and spectral duality. Fix a normalized point F,
write $`F(W_e(r))=r^{d_e}`$, and induct on the number of edges. For an
edge $`e=uv`$, fixing its index writes $`T_G(c)`$ as a partial direct sum
of $`q_e`$ tensors: their u and v spaces are disjoint, while all other
parties are shared. Each summand is a weighted full-support graph tensor
on $`G-e`$. By induction, each has value at least
$`C=\prod_{f\ne e}q_f^{d_f}`$.

If $`d_e>0`$, partial-sum superadditivity gives

```math
F(T_G(c))^{1/d_e}\ge\sum_{a_e=1}^{q_e}
F(T_{G-e}(c|a_e))^{1/d_e}\ge q_e C^{1/d_e}.
```

Thus $`F(T_G(c))\ge q_e^{d_e}C=F(T_G(1))`$. If $`d_e=0`$, restrict to
one summand and use the same conclusion. The edge-free base case is a
nonzero rank-one tensor. When G has only two vertices, the partial direct sum is a full direct
sum and ordinary additivity supplies the same step. This proves the
inequality for every normalized F and therefore the asymptotic restriction.

The argument makes no finite restriction claim or reverse comparison.
The later [general free-set separator](GENERAL_FREE_SET_SEPARATOR.md)
proves the needed partial-sum inequality with the full subset-unit
charge for any free set of at least two parties. Its Section 5 extends
this induction to arbitrary hypergraphs with nonempty edges, including
one-endpoint edges by projection. Empty edges must be excluded because
invisible index assignments can cancel.

## 5. The partial-support relaxation and its exact asymptotic criterion

Let $`\mathcal S\subseteq[n]^3`$, and now allow

```math
T=\sum_{(i,j,k)\in\mathcal S}c_{ijk}x_{ij}y_{jk}z_{ki},
\qquad c_{ijk}\ne0.
```

There must still be no terms outside matrix multiplication support.
Put $`m=|\mathcal S|`$. Li's Theorem 2.11 states, for every
$`\tau\ge2/3`$, that $`V_\tau(T)\ge m^\tau`$. Here $`V_\tau`$ is the
supremum over all positive integer tensor powers and all direct sums
of rectangular matrix multiplication tensors obtained by degeneration,
of the n-th root of the sum of their volumes raised to $`\tau`$.
It does not require a fixed fraction of the full support or any
factorization of the nonzero coefficients.

At $`\tau=\omega/3`$, Schönhage's asymptotic sum inequality bounds
$`V_{\omega/3}(T)`$ above by $`\widetilde R(T)`$. Therefore, if
$`m>1`$ and $`\underline R(T)\le r`$,

```math
m^{\omega/3}\le V_{\omega/3}(T)
\le\widetilde R(T)\le r,
\qquad
\omega\le\frac{3\log r}{\log m}.                \tag{5}
```

Consequently, an unbounded sequence of sizes n and legally constructed
partial weighted tensors with

```math
|\mathcal S_n|=n^{3-o(1)},\qquad
\underline R(T_n)\le n^{2+o(1)}
```

would prove $`\omega=2`$. In particular, a fixed positive support density
$`|\mathcal S_n|\ge c n^3`$ is enough. The full-support lower bound (1)
does not rule out such a family.

The allowed source cost need not stay below $`2n^2`$. For example, suppose
an actual construction on sizes $`n_k=4^kn_0`$ established

```math
r_{k+1}\le16r_k+C n_k^2(1+k)^a
```

for fixed $`C,a\ge0`$. Dividing by $`n_{k+1}^2=16n_k^2`$ and summing gives
$`r_k=O(n_k^2(1+k)^{a+1})=n_k^{2+o(1)}`$.
Likewise a verified support recurrence

```math
m_{k+1}\ge64m_k-C' n_k^2(1+k)^b
```

loses at most a summable amount of normalized density, since its k-th
normalized loss is $`O((1+k)^b/n_k)`$. If the initial density exceeds
the sum of these losses, the family retains positive density.
Both recurrences require actual local maps, control of all off-cycle
coefficients, and a family of source states on which the next step
acts. An invertible scalar address matrix or a count of fresh labels
does not establish either recurrence.


