# The first Turán determinant of the inverse Kazhdan–Lusztig polynomial

Let $`Q_M(x)=\sum_j c_j x^j`$ be the ordinary, unnormalized inverse Kazhdan–Lusztig polynomial of a matroid. For every prime power $`q\ge17`$, the simple rank-five matroid $`M_q`$ from the [dual Chow construction](../caiolo-ferroni-hoster/COUNTEREXAMPLE.md) satisfies

```math
c_1^2 \lt c_0 c_2,\qquad
\frac{c_1^2}{c_0 c_2}\sim\frac{18}{q}\quad(q\to\infty).
```

This answers the unnumbered universal question at the end of Badalov’s §8. Badalov had already disproved Gao and Xie’s log-concavity conjecture and realized arbitrary finite nonempty sets of negative determinants at indices at least two. His examples have a positive first determinant. Rank five is the smallest possible rank for a first-index failure, since the degree of $`Q_M`$ is strictly less than half the rank. The construction uses finite fields to define its blocks and makes no representability claim for the coalesced matroid. [Badalov, §8](https://arxiv.org/html/2609.13417#S8) · [Gao and Xie, Theorem 1.2 and Conjecture 4.2](https://arxiv.org/pdf/2007.15349)

## The flag counts

The cited construction starts with the rank-five truncation of the direct sum of the projective geometry of an eight-dimensional vector space over $`\mathbb F_q`$ and the free matroid on $`m=q^4`$ points. It coalesces $`b=q^{16}`$ blocks, each consisting of a geometric four-space and one free point. Distinct blocks intersect in rank at most three. Independent four-sets therefore belong to at most one block. The construction proof establishes the matroid axioms and shows that the flats through rank three are unchanged. Each block replaces one geometric rank-four flat and $`L={4\brack3}_q`$ old hyperplanes consisting of a geometric three-space and one free point. Its proper flats have the same lower ranks as the product of a four-dimensional subspace lattice and a one-point Boolean lattice. All other hyperplanes keep their lower intervals. Bérczi, Coron, Eur and Li introduced the coalescence and rank-metric-code construction used here. [Construction and verification](../caiolo-ferroni-hoster/COUNTEREXAMPLE.md) · [Bérczi–Coron–Eur–Li, §4.2](https://arxiv.org/html/2610.17135#S4.SS2)

Write $`T(d,h;S)`$ for the number of flags of rank set $`S`$ in the product of the subspace lattice of dimension $`d`$ and the Boolean lattice on $`h`$ elements. Put $`T(d,h;\varnothing)=1`$. Selecting the largest flat, of rank $`v=\max S`$, gives

```math
T(d,h;S)=\sum_{i=\max(0,v-h)}^{\min(d,v)}
 {d\brack i}_q {h\choose v-i}T(i,v-i; S\setminus\{v\}).
```

For $`S\subseteq R=\{1,2,3,4\}`$ let $`A_S`$ count the corresponding flags of $`M_q`$. If $`4\notin S`$ then $`A_S=T(8,m;S)`$. Otherwise put $`S'=S\setminus\{4\}`$. The hyperplane replacements above give

```math
A_S=T(8,m;S)+b\bigl(T(4,1;S')-T(4,0;S')-L T(3,1;S')\bigr).
```

## Coefficients of the ordinary inverse polynomial

For subscripts abbreviate a set of ranks by its increasing string. The coefficient formulas in rank five are

```math
c_0=\sum_{S\subseteq R}(-1)^{\# S}A_S,
```

```math
c_1=-A_1+A_{12}-A_{123}+A_{13}+A_{234}-A_{24}-A_{34}+A_4,
```

```math
c_2=A_{12}-A_{14}-A_2-A_{23}+A_{24}+A_3.
```

Here is a recurrence to derive and reproduce the formulas. Gao–Xie reciprocity in rank $`r`$ reads

```math
(-x)^rQ_M(1/x)
=\sum_{F}(-1)^{d}Q_{M\mid F}(x)
\sum_{G\supseteq F}\mu(F,G)x^{\mathrm{rk}(G)-d},
\qquad d=\mathrm{rk}(F).
```

For $`0\le j\lt r/2`$, take degree $`r-j`$. A lower coefficient of degree $`k`$ can contribute only if $`g=\mathrm{rk}(G)=r-j+d-k`$. The flat $`F`$ is proper by the degree bound, and $`g>d`$. For each subset $`U`$ of the ranks strictly between $`d`$ and $`g`$, the strict chains from $`F`$ to $`G`$ with intermediate ranks $`U`$ contribute sign $`(-1)^{1+\#U}`$ to the Möbius function. Append these ranks to each flag of the lower coefficient, appending $`d`$ when $`d>0`$ and $`g`$ when $`g\lt r`$. Multiply its weight by $`(-1)^{r+d+1+\#U}`$. Starting with rank zero equal to one gives the displayed formulas. [Gao–Xie, Theorem 1.2](https://arxiv.org/pdf/2007.15349) · [Exact flag-weight derivation](verify.py)

## Exact witness and sign throughout the family

At $`q=17`$ the three coefficients are, in ascending degree,

```math
(1367432169863264385040621589,\,
 236827334118626401257039561,\,
 43971319705548460332837139).
```

Their first determinant equals $`-4040610930973941995066729476797524541048570545321150`$. This one integer computation settles the universal question.

For the family, the fixed-lower-index binomials in $`q^4`$ and the Gaussian coefficients are polynomials over the rationals. Substitute the flag formulas and expand $`c_0c_2-c_1^2`$ at $`q=17+s`$. All 44 coefficients in degrees zero through 43 are strictly positive. Thus the determinant is negative throughout the claimed range. The leading terms of $`c_0,c_1,c_2`$ are $`q^{22},3q^{21},q^{21}/2`$ respectively, giving the asymptotic ratio. The exact expansions can be regenerated from the formulas above by the first verifier. The independent review also obtains the sign using the binomial-polynomial basis and an independent ordinary-KL calculation. [Exact symbolic verifier](verify.py) · [Independent review](REVIEW.md)

Cinna Davis recorded the original deduction for [issue #299](https://github.com/1337isnot1337/solved-conjectures/issues/299). The existing matroid and dual Chow theorems have separate Lean verification. This inverse-polynomial supplement has independent internal mathematical review and exact arithmetic checks. It is unrefereed and has no Lean verification.
