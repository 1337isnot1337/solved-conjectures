# Unrestricted uncrossing: a second pass

Status: research. No lower bound growing with $`q`$ has been proved for arbitrary outer-party maps, and no subpolynomial-overhead conversion has been constructed. The results below identify two exact limitations of possible approaches on the full tensor semiring; they do not merely test a scalar countermodel.

Throughout the field is $`\mathbb C`$. All tensor products are regrouped by the named four parties. Write

```math
X_q=U_{ABC}(q)U_{ABD}(q),\qquad
Y_q=U_{ABCD}(q)U_{AB}(q).
```

The source-only question is whether

```math
U_{ABCD}(r_q)X_q\ \geq\ Y_q
\qquad\text{with}\qquad r_q=q^{o(1)}
```

is possible asymptotically, allowing a degeneration followed by its usual subexponential interpolation overhead. The existing determinant-pencil proof rules out $`r_q=1`$ and every common full-unit catalyst. Its square-map determinant factorization does not apply when a unit is attached only to the source.

## 1. Relevant new spectral construction and its direct evaluation

Alman, Li and Pratt, *The edge of the asymptotic spectrum of tensors*, [arXiv:2604.01386v2](https://arxiv.org/html/2604.01386v2), Corollary 3.16, characterizes asymptotic multilinear commutative rank as a minimum over a closed subset of the normalized spectrum. Their Theorem 3.22 proves that higher-order spectral points exist beyond the known quantum points and their regroupings. These are genuine spectral constructions; assuming quantum completeness would therefore be incorrect.

For distinct retained parties $`P,Q`$, define $`c_{P,Q}(T)`$ as the maximum matrix rank obtained by contracting each of the other two parties separately with a covector. Equivalently it is the matrix rank over the rational-function field in the two independent covector alphabets. This equality follows because a nonzero maximal minor is nonzero on a nonempty Zariski open set over $`\mathbb C`$. Write

```math
\widetilde c_{P,Q}(T)
=\lim_{n\longrightarrow\infty}c_{P,Q}(T^{\otimes n})^{1/n}.
```

Directly, both $`X_q`$ and $`Y_q`$ have $`c_{A,B}=q^2`$, and both have $`c_{P,Q}=q`$ for every other pair. These are the maximum ranks permitted by the retained local dimensions, so the equalities persist on every mixed product $`X_q^kY_q^\ell`$. Thus direct evaluation of this newly characterized rank does not separate the two tensors.

For the spectral subset that dominates $`\widetilde c_{A,B}`$, every point $`F`$ has $`F(U_{AB}(q))=q`$. Inclusion of the subset-unit supports and full-unit normalization then give

```math
F(U_{ABC}(q))=F(U_{ABD}(q))=q,
\qquad F(X_q)=F(Y_q)=q^2.
```

This last observation applies only to that specified spectral subset; it is not a statement about all higher-order points.

## 2. Arbitrary tensor multipliers do not make commutative rank detect the conversion

### Theorem

For every four-party complex tensor $`T`$, every $`q\geq1`$, and every retained pair $`P,Q`$,

```math
c_{P,Q}(X_qT)\ \geq\ c_{P,Q}(Y_qT).                 \tag{1}
```

Consequently the same inequality holds with $`c`$ replaced by $`\widetilde c`$. It also survives adding any common tensor, any number of tensor powers, and finite polynomial combinations with nonnegative integer coefficients. These tests therefore cannot prove that source-only overhead must grow, even though they permit arbitrary auxiliary tensors rather than only wires and units.

### Proof for the pair $`A,B`$

Let $`M(c,d)`$ be the matrix obtained from $`T`$ by contracting its $`C,D`$ factors. A contraction of $`X_qT`$ produces a block-diagonal matrix whose $`q^2`$ blocks are

```math
M(c_i,d_j),\qquad 1\leq i,j\leq q.
```

Every block has rank at most $`c_{A,B}(T)`$, and choosing all $`c_i=c_*`$ and all $`d_j=d_*`$ at a maximizing pair attains this rank in every block. Thus $`c_{A,B}(X_qT)=q^2c_{A,B}(T)`$.

For $`Y_qT`$, the blocks are $`M(c_\ell,d_\ell)`$, each repeated $`q`$ times. The same argument gives $`c_{A,B}(Y_qT)=q^2c_{A,B}(T)`$.

### Proof for the pair $`A,C`$

Now let $`M(b,d)`$ be the matrix on the $`A,C`$ factors of $`T`$ after contracting $`B,D`$. Define

```math
\alpha_q=\max_{b_1,\ldots,b_q,d_1,\ldots,d_q}
\mathop{\mathrm{rank}}
\begin{pmatrix}M(b_1,d_1)\\ \vdots\\M(b_q,d_q)\end{pmatrix},
```

and let $`\beta_q`$ be the same maximum subject to $`d_1=\cdots=d_q`$. Clearly $`\beta_q\leq\alpha_q`$.

In $`X_qT`$, the source label $`i`$ is shared by the retained $`A,C`$ factors. It gives $`q`$ diagonal blocks, each a vertical stack indexed by $`j`$. The covector on $`B`$ may depend independently on $`(i,j)`$ and the covector on $`D`$ may depend on $`j`$. Every stack therefore has rank at most $`\alpha_q`$, and all $`q`$ stacks can attain $`\alpha_q`$ using the same maximizing choices. Hence $`c_{A,C}(X_qT)=q\alpha_q`$.

In $`Y_qT`$, the public label $`\ell`$ gives $`q`$ diagonal blocks. Within one block, the private $`AB`$ index gives a vertical stack of $`q`$ matrices $`M(b_{\ell,s},d_\ell)`$. Thus $`c_{A,C}(Y_qT)=q\beta_q`$. This proves (1). Swapping $`A,B`$ or $`C,D`$ supplies the pairs $`A,D`$, $`B,C`$, and $`B,D`$.

### Proof for the pair $`C,D`$

Let $`M(a,b)`$ now be the matrix on the retained $`C,D`$ factors. Define

```math
\gamma_q=\max_{a_1,\ldots,a_q,b_1,\ldots,b_q}
\mathop{\mathrm{rank}}\left(\sum_{s=0}^{q-1}M(a_s,b_s)\right).
```

The contracted matrix of $`Y_qT`$ is block diagonal with $`q`$ blocks of precisely this form. Thus $`c_{C,D}(Y_qT)=q\gamma_q`$.

The contracted matrix of $`X_qT`$ is an unrestricted $`q`$ by $`q`$ block matrix, with its $`(i,j)`$ block equal to $`M(a_{ij},b_{ij})`$. Choose $`q`$ matrices $`M_s=M(a_s,b_s)`$ whose sum has rank $`\gamma_q`$. Let $`\zeta`$ be a primitive $`q`$th root of unity. For scalars $`z_0,\ldots,z_{q-1}`$, choose the block-circulant specialization

```math
\mathcal M_{ij}=z_{j-i}M_{j-i},
\qquad i,j\in\mathbb Z/q\mathbb Z.
```

Each scalar is absorbed into the corresponding $`a_{ij}`$, so this is an allowed contraction of $`X_qT`$. The Fourier transform on the block indices makes $`\mathcal M`$ block diagonal, with diagonal blocks

```math
\sum_{s=0}^{q-1}\zeta^{hs}z_sM_s,
\qquad h=0,\ldots,q-1.
```

A $`\gamma_q`$-minor of $`\sum_s z_sM_s`$ is a nonzero polynomial, since it is nonzero at $`z_s=1`$. Rescaling its variables by $`\zeta^{hs}`$ gives a nonzero polynomial for every $`h`$. Their product is nonzero, so one choice of the $`z_s`$ makes every block have rank at least $`\gamma_q`$. By the definition of $`\gamma_q`$, none can have larger rank. Therefore $`\mathop{\mathrm{rank}}\mathcal M=q\gamma_q`$, proving (1).

### Closure of the limitation

Replace $`q`$ by $`q^n`$ and $`T`$ by $`T^{\otimes n}`$ in (1). The identities $`X_q^{\otimes n}=X_{q^n}`$ and $`Y_q^{\otimes n}=Y_{q^n}`$ give the regularized inequality by taking $`n`$th roots. Commutative rank is additive on full direct sums, since its contracted matrix is block diagonal and the covectors on different blocks are independent. Hence one may add common terms. Expanding powers of such direct sums, applying (1) to each term, and adding the inequalities proves the stated closure under polynomial combinations.

This theorem does **not** prove that every spectral point in the minimizing set obeys uncrossing. An inequality between minima, even after the tested operations, must not be silently replaced by a pointwise inequality between all their minimizers. The theorem is a limitation of the stated rank tests.

## 3. A covariant family retaining all four parties

Multilinear commutative rank is not the only available test. For $`k\geq1`$, project $`T^{\otimes k}`$ to

```math
\Lambda^k A\otimes\Lambda^k B\otimes\Lambda^k C\otimes\Lambda^k D
```

by alternation independently at the four parties, and let $`E_k(T)`$ be the flattening rank of the resulting tensor across $`\Lambda^k B`$ versus the other three factors. These projections commute with the $`k`$th tensor powers of arbitrary local linear maps, including rectangular maps. Therefore $`E_k`$ is restriction-monotone. Its entries are polynomial in $`T`$, so rank semicontinuity also makes it degeneration-monotone. No product or additivity law is asserted for $`E_k`$.

### Exact formula

For $`1\leq k\leq q`$,

```math
E_k(X_q)={q\choose k}^{\!2}k!,\qquad
E_k(Y_q)={q\choose k}q^k.                            \tag{2}
```

More generally,

```math
E_k(U_{ABCD}(r)X_q)
=[z^k]\left(\sum_{j=0}^{q}{q\choose j}^{\!2}j!z^j\right)^r. \tag{3}
```

To prove these formulas, write the source support as the edges $`(i,j)`$ of a complete bipartite graph, with both $`A,B`$ carrying the entire edge label and $`C,D`$ carrying its endpoints. A term survives the $`C,D`$ alternations exactly when its $`k`$ edges form a matching. Its $`A`$ and $`B`$ exterior basis labels are that matching itself. Different matchings have different $`A`$ labels, so the nonzero rows in the $`B`$ flattening are linearly independent. The coefficient of each matching is nonzero in characteristic zero: changing the common ordering contributes four permutation signs, whose product is one. There are $`{q\choose k}^2k!`$ matchings.

For $`Y_q`$, alternation at $`C,D`$ instead requires $`k`$ distinct public labels. Each may independently choose any of the $`q`$ private $`AB`$ labels. The same $`A`$-label argument gives independence, proving the second formula. A full source unit of size $`r`$ makes $`r`$ disjoint copies of the source bipartite graph; multiplying their matching-generating polynomials proves (3).

These are actual finite obstructions with unrestricted maps. For $`k\geq2`$, the ratio in (2) is

```math
\frac{E_k(Y_q)}{E_k(X_q)}
=\frac{q^k}{q(q-1)\cdots(q-k+1)}>1.
```

Taking $`k=q`$ gives $`q^q/q!`$. With a common unit of size $`r`$, taking $`k=rq`$ gives source rank $`(q!)^r`$ and target rank $`q^{rq}`$, again obstructing conversion. This independently reconstructs the common-unit conclusion already proved by determinant pencils.

### Exact failure after source-only overhead two

Despite the large ratio at $`r=1,k=q`$, this entire family gives no obstruction after attaching a unit of size two to the source. In fact, for every $`k\leq q`$,

```math
E_k(U_{ABCD}(2)X_q)\ \geq\ 2^k E_k(Y_q).             \tag{4}
```

There are $`2q^2`$ edges in two disjoint copies of $`K_{q,q}`$. After choosing an ordered matching of $`i`$ edges, at most $`i(2q-1)`$ edges have been deleted by their endpoints. For $`0\leq i<k\leq q`$, the number of choices for the next edge is therefore at least

```math
2q^2-i(2q-1)\ \geq\ 2q(q-i).
```

Counting ordered matchings and dividing by $`k!`$ proves

```math
E_k(U_{ABCD}(2)X_q)
\geq\frac{(2q)^kq(q-1)\cdots(q-k+1)}{k!}
=2^k{q\choose k}q^k.
```

For $`k>q`$, the target exterior factor $`\Lambda^k C`$ is zero. This proves the limitation for every degree in this family, not just for the small degrees searched numerically.

The companion `check_four_party_constraints.py` independently constructs the four exterior projections and computes their ranks over the rationals for small parameters. It also checks every labeled cut of the tetrahedral tensors. These finite checks corroborate the formulas; the all-degree statements are proved above.

## 4. What this pass has and has not changed

The arbitrary-multiplier theorem rules out an unrestricted class of commutative-rank tests for proving a positive uncrossing overhead exponent. The exterior-covariant calculation proves finite obstructions but also proves that this whole covariant family stops obstructing after a constant source overhead. Neither result settles the source-only conversion with arbitrary mixing at $`C,D`$.

The other concrete four-party target is the tetrahedral conversion

```math
\prod_{|H|=3}U_H(q)\ \gtrsim\ \prod_{|e|=2}U_e(q)
\qquad(H,e\subseteq\{A,B,C,D\}).
```

[TETRAHEDRAL_OVERHEAD.md](TETRAHEDRAL_OVERHEAD.md) proves its exact equivalence with $`\omega_{\mathbb C}=2`$ and bounds its operational overhead. Finite covariant obstructions do not settle this asymptotic conversion. Any further claim must either construct the subexponential-overhead map or give a multiplicatively valid asymptotic obstruction.
