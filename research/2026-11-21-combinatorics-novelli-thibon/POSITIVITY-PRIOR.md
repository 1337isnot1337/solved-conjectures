# Novelli–Thibon's Schur-positivity conjecture

Date: 21 November 2026. Research checkpoint connected to [issue 180](https://github.com/1337isnot1337/solved-conjectures/issues/180).

Status: a complete deduction of Conjecture 5.4 from the previously established fixed-descent LLT decomposition and general LLT positivity. This is substantial prior-theorem overlap, not a new LLT positivity theorem. It is not assigned a new named-resolution count. Independent review is pending.

## 1. Exact assertion and definitions

Novelli and Thibon, [arXiv:2502.09072v2](https://arxiv.org/html/2502.09072v2), Conjecture 5.4, assert that both commutative multi-parameter families defined in Definitions 5.1 and 5.3 have Schur coefficients in the nonnegative integer polynomial ring. The result applies to every partition.

Use the same French diagrams, top-down/left-right reading order, attacking graph and arm and leg conventions as in [the monomial-product proof](../../results/novelli-thibon/PROOF.md). Let $`U`$ be the nonbottom cells; for $`u\in U`$, let $`v(u)`$ be the cell below, $`a(u)`$ its arm, and $`\ell(u)=1+\mathop{\mathrm{leg}}(u)`$. For a positive-integer filling $`w`$, put

```math
D(w)=\{u\in U:w_u>w_{v(u)}\},\qquad
I_G(w)=\sum_{\{i,j\}\in E(G),\ i\lt j}[w_i>w_j],
\qquad a(D)=\sum_{u\in D}a(u).
```

The direct optional-edge cancellation in the monomial-product proof gives

```math
\widetilde H_\mu(X;q,\mathbf t)
=\sum_w q^{I_G(w)-a(D(w))}
\prod_{u\in D(w)}t_{\ell(u)}X^w.
\tag{1}
```

Passing from the permutation/fundamental expression to (1) preserves every strict comparison, since all its pairs occur in increasing reading order and equal entries standardize from left to right.

The corresponding local cancellation in Definition 5.1 is

```math
\frac{(1-tq^a)q^\delta+(tq^{a+1}-1)}{q-1}
=\begin{cases}tq^a,&\delta=0,\\1,&\delta=1.\end{cases}
```

Consequently the exact untilded convention is

```math
H_\mu(X;q,\mathbf t)
=\sum_w q^{I_G(w)-a(D(w))}
\prod_{u\in U\setminus D(w)}t_{\ell(u)}X^w.
\tag{2}
```

This derivation uses the defining equations (49) and (57) and avoids the ambiguity in the source's intermediate displayed expansion.

## 2. The credited fixed-descent decomposition

For a fixed set $`D\subseteq U`$, let

```math
F_{\mu,D}(X;q)=\sum_{D(w)=D}q^{I_G(w)}X^w.
```

Haglund–Haiman–Loehr, *A combinatorial formula for Macdonald polynomials*, JAMS 18 (2005), 735–761, Proposition 3.4 and equations (22)–(27), identify this function with the LLT polynomial indexed by one ribbon for each column of $`\mu`$:

```math
F_{\mu,D}(X;q)=\mathop{\mathrm{LLT}}_{R_\mu(D)}(X;q).
\tag{3}
```

Primary full text: [author manuscript, printed pages 7–8](https://sites.math.washington.edu/~billey/classes/symmetric.functions/haglund.haiman.loehr.pdf). The ribbon belonging to column $`c`$ has contents $`1,\ldots,\mu'_c`$ and a vertical step at content $`r`$ exactly when $`(r,c)\in D`$. Sending the entry in row $`r`$, column $`c`$ to that ribbon's content-$`r`$ cell gives a bijection with semistandard fillings of the ribbon tuple. Vertical ribbon steps impose the strict descents in $`D`$; horizontal steps impose the complementary weak inequalities. The LLT inversion pairs become precisely the same-row or upper-right/lower-left attacking pairs in $`\mu`$. This is the full fixed-descent identity, not merely an equality after summing over major indices.

Grojnowski and Haiman, [*Affine Hecke algebras and positivity of LLT and Macdonald polynomials*](https://math.berkeley.edu/~mhaiman/ftp/llt-positivity/new-version.pdf), manuscript dated 22 May 2007, Corollary 6.9 and the conclusion following Proposition 6.17 on printed page 18, prove general LLT Schur positivity. In the tuple/inversion convention of (3), this gives

```math
F_{\mu,D}(X;q)=\sum_\lambda f_{\lambda,\mu,D}(q)s_\lambda(X),
\qquad f_{\lambda,\mu,D}(q)\in\mathbb N[q].
\tag{4}
```

Both (3) and (4) are prior results and carry the essential positivity content.

## 3. The apparent negative powers are absent

For every filling, $`I_G(w)\ge a(D(w))`$. Here is a direct proof. For every pair $`u,z`$ in the same nonbottom row with $`z`$ strictly to the right of $`u`$, set $`v=v(u)`$. The graph contains the same-row edge $`u,z`$ and the cross-row edge $`z,v`$. For arbitrary entries,

```math
[w_u>w_z]+[w_z>w_v]-[w_u>w_v]\ge0.
\tag{5}
```

If the last indicator is 1, transitivity forces at least one of the first two to be 1; otherwise the assertion is immediate. Every nonbottom same-row edge and every cross-row attacking edge occurs in exactly one such pair. The subtracted terms sum to $`a(D(w))`$. The remaining bottom-row inversion indicators are nonnegative. This proves the bound, including repeated entries.

Thus every monomial coefficient of $`F_{\mu,D}`$ is divisible by $`q^{a(D)}`$. The degree-$`n`$ change of basis from monomial symmetric functions to Schur functions is an invertible integer matrix independent of $`q`$. Hence every $`f_{\lambda,\mu,D}`$ in (4) is also divisible by $`q^{a(D)}`$. Together with (4),

```math
q^{-a(D)}f_{\lambda,\mu,D}(q)\in\mathbb N[q].
\tag{6}
```

## 4. Full independent-parameter conclusion

Grouping (1) and (2) by $`D`$ now yields

```math
\begin{aligned}
\widetilde H_\mu
&=\sum_{D\subseteq U}\left(\prod_{u\in D}t_{\ell(u)}\right)
q^{-a(D)}\mathop{\mathrm{LLT}}_{R_\mu(D)},\\
H_\mu
&=\sum_{D\subseteq U}\left(\prod_{u\in U\setminus D}t_{\ell(u)}\right)
q^{-a(D)}\mathop{\mathrm{LLT}}_{R_\mu(D)}.
\end{aligned}
\tag{7}
```

Every summand has nonnegative polynomial Schur coefficients by (6). Multiplication by its parameter monomial and summation preserve this property. This proves the full assertion of Conjecture 5.4 for both defining conventions, with no bound on rows, columns or size. The same proof permits a separate independent parameter at every nonbottom cell.

## 5. Prior-work assessment

Lee–Oh–Rhoades, [*Haglund's conjecture for multi-t Macdonald polynomials*, arXiv:2203.04590v3](https://arxiv.org/pdf/2203.04590), equation (2.1), already define the cell-parameter family as the fixed-descent ribbon-LLT expansion. Their variable attached to a cell is raised to its leg-plus-one. Thus their parameter convention differs syntactically, but the expansion already retains each full descent set. The desired leg-grouped positivity is an immediate consequence of this expansion and general LLT positivity. The connection should be stated as a deduction of established stronger mathematics, with no claim to a new positivity mechanism.

The original 2025 manuscript and Novelli's 2025 talk still formulate the leg-grouped Schur-positivity assertion as conjectural. Exact-name searches found the original, the authors' pages and an open discovery-index entry; two targeted public proof-archive searches returned no matching proof. A broader GitHub code search was rate-limited on 21 November and has not yet been completed. Those findings do not erase the prior-theorem overlap above. This checkpoint is therefore kept separate from new-resolution counting pending review.
