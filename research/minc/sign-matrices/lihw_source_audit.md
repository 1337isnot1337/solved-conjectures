# Lih--Wang's conjecture: source audit and continuation state

Checked on 2026-11-20. No full proof or counterexample was obtained.
This note adds no conjecture resolution to the campaign count.

## Exact target

Let $`A\in\Omega_n`$, let $`J_n`$ have every entry $`1/n`$, and put
$`d_n=n!/n^n`$. With $`t=1-\alpha`$, Conjecture 34 is

```math
p_A(t):=\mathop{\mathrm{per}}(J_n+t(A-J_n))
\le d_n+t(\mathop{\mathrm{per}}A-d_n),\qquad 0\le t\le\tfrac12.
\tag{1}
```

Neither symmetry nor positive semidefiniteness is an assumption. A result
for one fixed order, a class of supports, or only a dimension-dependent
small interval is not the full target.

## Sources and exact scope

1. [Lavi's current C34 page](https://yair-lavi.com/mincs-list/conjecture-34/index.html)
   was refreshed. It still labels the general conjecture open. The page
   gives the complete order-four case, order-five mixtures of at most four
   permutations, restrictions on the support of a worst violation, and
   eventual validity for each fixed matrix after sufficiently large
   uniform blow-up. None is a full all-order result.
2. D. K. Udayan and K. Somasundaram,
   [Lih Wang's and Dittert's conjectures on permanents](https://www.degruyterbrill.com/document/doi/10.1515/spma-2024-0006/html),
   *Special Matrices* 12 (2024), 20240006,
   DOI 10.1515/spma-2024-0006. The published theorem statements were
   inspected. Theorem 2.1 treats order four; Theorem 2.2 treats order six
   under additional root hypotheses and on a restricted interval. The
   older arXiv abstract's broader order-six wording must not be used as a
   general theorem.
3. S.-G. Hwang,
   [Convexity of the permanent for doubly stochastic matrices](https://www.tandfonline.com/doi/abs/10.1080/03081089108818095),
   *Linear and Multilinear Algebra* 30 (1991), 129--134.
   The primary publisher abstract explicitly states the related
   conjecture that $`p_A`$ is strictly convex on $`[0,1/2]`$ for
   $`A\ne J_n`$, and proves the order-three case. The full 1991 paper was
   not retrieved in this pass. Its abstract is not evidence for a proof
   of radial convexity in arbitrary order. No new claim about equivalence
   of the two conjectures is made here.
4. Yair Lavi,
   [The Kopotun Subpermanent Transform Inequality](https://hexagonmath.org/pdf/2611.00201v1),
   manuscript dated 2026-10-11, deposited November 2026. Theorem 1.2,
   the centered estimate in Lemma 5.1, and Section 6 were inspected. Its
   full theorem is prior work, not a new campaign target. The quantitative
   estimates do not establish (1) at $`t=1/2`$; the calculation below
   identifies the loss.
5. I. M. Wanless,
   [The Holens--Djokovic conjecture on permanents fails!](https://users.monash.edu.au/~iwanless/papers/HolDjokLAA.pdf),
   *Linear Algebra Appl.* 286 (1999), 273--285,
   DOI 10.1016/S0024-3795(98)10177-5; and G.-S. Cheon and I. M. Wanless,
   [An update on Minc's survey of open problems involving permanents](https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf),
   *Linear Algebra Appl.* 403 (2005), 314--342,
   DOI 10.1016/j.laa.2005.02.030.
   The latter's Conjecture 12 discussion, printed page 326, explicitly
   records that $`\sigma_{n-1}(A)/\mathop{\mathrm{per}}A`$ cannot be bounded
   by any polynomial in $`n`$. It attributes the construction to the
   former paper. The original scan was opened, but its OCR is poor; the
   explicit order-22 matrix was not transcribed or used. The argument
   below uses the stated general obstruction, not a guessed matrix.

Searches included the exact conjecture and paper names, proof/counterexample
queries, and current 2026 status. This is a bounded source audit. No full
resolution was found in the inspected sources.

## Two exact forms of the missing inequality

Define

```math
q_k=\frac{\sigma_k(A)}{\binom nk^2 k!/n^k},\qquad 0\le k\le n.
```

Here $`q_0=q_1=1`$, and $`q_n=\mathop{\mathrm{per}}A/d_n\ge1`$. Selecting
the entries supplied by $`A`$ in the permanent gives

```math
\frac{p_A(t)}{d_n}
=\sum_{k=0}^n\binom nk t^k(1-t)^{n-k}q_k
=\mathbb E[q_K],\qquad K\sim\mathop{\mathrm{Bin}}(n,t).
\tag{2}
```

Thus the missing all-order statement is precisely

```math
\mathbb E[q_K-1]\le t(q_n-1),\qquad 0\le t\le\tfrac12.
\tag{3}
```

There is also a probability formulation that preserves all row and column
constraints. The polynomial

```math
f_A(z)=\prod_{i=1}^n\left(\sum_j a_{ij}z_j\right)
```

is the occupation generating function of independent categorical draws,
one draw from each row. Its expected occupation vector is $`(1,\ldots,1)`$
because the column sums are one. Its central coefficient is
$`\mathop{\mathrm{per}}A`$. Replacing each draw, independently, by a uniform
color with probability $`1-t`$ changes the generating function to

```math
f_A\left(tz+(1-t)\frac{\sum_jz_j}{n}\mathbf1\right)
=f_{J_n+t(A-J_n)}(z).
\tag{4}
```

Equation (1) is therefore a precise central-probability contraction under
this recoloring operation. General noise monotonicity is not available:
the weaker assertion $`p_A(t)\le p_A(1)`$ fails for some doubly stochastic
matrices near the far endpoint, by the Holens--Djokovic counterexamples.
No contraction theorem proving (3) or (4) was established here.

## What the existing stability note already excludes

The preceding note
[the stability obstruction](../inequalities/lihw_stability_obstruction.md) gives two exact failures
at $`A=(\mathbf1\mathbf1^T-I_3)/2`$: the relevant permanent pencil need
not be real-rooted, and the pointwise coefficient chord
$`q_k\le1+(k/n)(q_n-1)`$ is false. These failures were not retested by a
finite-order sweep.

For calibration, direct algebra at the same matrix gives

```math
\frac{p_A(t)}{d_3}=1+\frac38t^2-\frac14t^3,
\qquad
1+t(q_3-1)-\frac{p_A(t)}{d_3}
=\frac18t(1-t)(1-2t).
```

This is sharp at $`t=1/2`$, and explains why the requested half-interval
cannot be enlarged universally. It is old order-three information, not a
new result.

## A broader pointwise shortcut is also excluded

A tentative sufficient estimate considered in this pass was

```math
q_k-1\le\frac{k(k-1)}{(n-1)(n-2)}(q_n-1),\qquad n\ge3.
\tag{5}
```

If (5) held, (2) would give
$`p_A(t)/d_n-1\le[n/(n-2)]t^2(q_n-1)`$, enough for (1) in every
$`n\ge4`$. But (5) is false: at $`k=n-1`$ its coefficient is exactly
one, so it requires the false Holens endpoint $`q_{n-1}\le q_n`$.
An initial informal assessment that this coefficient exceeded one was
an arithmetic error and was corrected before publication.

More generally, no estimate

```math
q_{n-1}-1\le C(n)(q_n-1)
\tag{6}
```

with $`C(n)\ge1`$ bounded by a polynomial can hold universally. It would
imply

```math
\frac{\sigma_{n-1}(A)}{\mathop{\mathrm{per}}A}
=n^2\frac{q_{n-1}}{q_n}
\le n^2 C(n),
```

contradicting Wanless's result. Consequently a useful proof must retain
the small binomial weights of the near-top terms, or exploit additional
joint information about the coefficient sequence. Allowing a polynomial
amount of pointwise slack does not fix the problem.

## Why the Kopotun estimates do not reach the midpoint

Write $`X=A-J_n`$, $`r^2=\lVert X\rVert_F^2`$, and $`Q_n=I_n-J_n`$.
Theorem 1.2 of Lavi's paper gives, at $`k=n`$,

```math
\frac{\mathop{\mathrm{per}}A}{d_n}
\ge \exp\left(\frac{7r^2}{12n^2}\right).
\tag{7}
```

Its centered estimate and the permanent expansion give, for $`t\ge0`$,

```math
\frac{p_A(t)}{d_n}\le1+\beta_n(t)r^2,\qquad
\beta_n(t)=\frac1{n-1}
\left(\frac{\mathop{\mathrm{per}}(J_n+tQ_n)}{d_n}-1\right).
\tag{8}
```

The second-degree term alone yields

```math
\beta_n(t)\ge\frac{n}{2(n-1)}t^2.
```

For (7) and (8), by themselves, to prove the chord uniformly as
$`r^2\downarrow0`$, they would need
$`\beta_n(t)\le7t/(12n^2)`$. At the midpoint they instead satisfy

```math
\beta_n(1/2)\ge\frac{n}{8(n-1)}>
\frac7{24n^2},\qquad n\ge2.
\tag{9}
```

The last inequality is equivalent to $`3n^3>7(n-1)`$, which is immediate
for $`n\ge2`$. This is a precise failure of these particular bounds to
overlap; it does not show the target inequality false.

For reference, (8)'s midpoint constant has the exact expression

```math
\beta_n(1/2)=\frac1{n-1}
\left(2^{-n}\sum_{j=0}^n\frac{n^j}{j!}-1\right).
```

This comes from selecting identity entries in
$`J_n+\tfrac12Q_n=(I_n+J_n)/2`$. The useful scale in the Kopotun proof
is $`t=1/(n+1)`$, rather than a fixed half-segment.

## Continuation boundary

No full C34 result is claimed. The remaining mathematical task is to
prove (3) with its actual binomial weights for every doubly stochastic
matrix, or to construct an exact matrix and parameter violating it.
Ordinary real-rootedness of the interpolation, polynomial pointwise
control of the near-top matching coefficients, an unproved radial
convexity assertion, and the existing small-transform Frobenius estimates
are not valid substitutes for that task.

## Further primary inputs checked

The later source pass inspected Suvrit Sra's [31 October 2026 manuscript](https://hexagonmath.org/pdf/2611.00118v1), particularly Theorem 2.1, Lemma 2.2, and Corollary 5.3. Its monotone quantity is the minimum total correlation of a permutation law with prescribed marginals. The explicit quadratic permanent remainder depends on the smallest matrix entry and vanishes on the boundary when the degree exceeds two. It is not a proof of the half-segment chord inequality.

The [face entropy note](../combinatorial/face_entropy_reformulation.md) and its independent review make the remaining distinction exact: `log per A = -I(A) + KL(nu_A || mu_A)`. Pair averaging controls `I`, while this nonnegative residual also varies. On each fixed Birkhoff face, minimizing the permanent is exactly equivalent to maximizing `I`, with the same optimizers. The reformulation supplies no concavity or interior-attainment theorem.

Carptopus's [7 October 2026 technical draft](https://github.com/Carptopus/MathExplore-Notes/blob/master/research/lih-wang-endpoint-and-cycle-products/manuscript.md) states a sufficient endpoint condition `per A >= 2^(2-n)` for all nonnegative row-stochastic matrices, and several cycle-forest results. The theorem statement and the one-collision envelope were inspected. These are partial domains, and no assertion of external verification of the complete draft is made here. The condition is not universal: `d_n < 2^(2-n)` for every `n>=2`, so it does not cover all matrices even near the uniform matrix.

Both web search engines and the current catalogue were rechecked for a full resolution. No full proof or counterexample was found in the inspected sources. These newer inputs therefore remain credited prior work and possible tools; they do not change the target or the resolution count.
