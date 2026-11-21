# Chollet auxiliary rank bound: prior-consequence audit

Date: 20 November 2026 (America/Chicago). Reviewer: `minc_regular`.

## Correction to the contribution claim

The auxiliary assertion under review is

```math
\operatorname{per}(C\circ\overline C)<(\operatorname{per}C)^2
 \quad\text{if }\operatorname{rank}C=r\ge5,\ n\ge r^2,
```

for a complex correlation matrix of order $`n`$.

An existing permanent approximation theorem already implies the entire part
with $`r\ge23`$, and also all sufficiently large orders for each smaller rank.
Combining that theorem with the published untilted sphere bound extends
this prior-consequence coverage to every $`r\ge18`$.
Its consequence at $`r\ge64`$ is stronger than the checkpoint's bound
$`\exp(-19n/100)`$. The infinite tail must therefore be attributed as a
consequence of prior work. The residual not covered by the conservative
criteria below consists of finitely many rank/order pairs with
$`5\le r\le17`$. No priority is certified for that residual, and none of this
resolves the full Chollet conjecture or counts as a whole MINC result.

## Source theorem and its rank parameter

Chenyang Yuan and Pablo A. Parrilo, *Maximizing products of linear forms, and
the permanent of positive semidefinite matrices*, online 2021,
[DOI 10.1007/s10107-021-01616-3](https://doi.org/10.1007/s10107-021-01616-3).
The [author-hosted primary PDF](https://chenyang.co/assets/pdfs/Yuan-Parrilo2021_Article_MaximizingProductsOfLinearForm.pdf)
contains the needed statements in Lemmas 3.2 and 4.2, Theorem 4.4, and
Section 4.1. It treats arbitrary complex Hermitian positive semidefinite
matrices. With

```math
R(A)=\min\{\operatorname{per}D:D\text{ diagonal},\ D\succeq A\},
 \qquad L_s=H_{s-1}-\log s,
```

the theorem gives

```math
\operatorname{per}A\ge \frac{n!}{n^n}e^{-nL_s}R(A).
 \tag{1}
```

Here $`s`$ is the rank of an optimizer in the equivalent problem

```math
R(A)=\max_{X\succeq0,\ \operatorname{tr}X=n}
       \prod_{i=1}^n v_i^*Xv_i,\qquad A=(v_i^*v_j)_{ij}.
 \tag{2}
```

Section 4.1 explicitly states that this optimizer may have rank at most
$`\operatorname{rank}A`$. This is an auxiliary convex-program rank, and does
not reduce extremizers of Chollet's ratio to extreme correlation matrices.

## Consequence for the self-conjugate ratio

The following is a deduction from (1) and (2); it is not a theorem stated in
that source under the name Chollet.

Put $`P=\operatorname{per}C`$, $`Q=\operatorname{per}(C\circ\overline C)`$,
and $`R=R(C)`$. If diagonal $`D\succeq C`$, the Schur product theorem gives

```math
D-C\circ\overline C=(D-C)\circ\overline C\succeq0,
```

because $`C_{ii}=1`$. Monotonicity of the permanent on the positive
semidefinite cone consequently gives $`Q\le\operatorname{per}D`$, and hence
$`Q\le R`$. In a rank-$`r`$ Gram representation, the feasible choice
$`X=(n/r)I_r`$ in (2) gives $`R\ge(n/r)^n`$.

The sequence $`L_s`$ is increasing: its increment is
$`1/s-\log(1+1/s)>0`$. Since $`s\le r`$, define

```math
\alpha_{n,r}=\frac{n!}{n^n}e^{-n(H_{r-1}-\log r)}.
```

Equation (1) implies $`P\ge\alpha_{n,r}R`$. Therefore

```math
\frac Q{P^2}\le\frac1{\alpha_{n,r}^2R}
 \le \left(\frac{n^n}{n!}\right)^2
       \left(\frac{e^{2H_{r-1}}}{nr}\right)^n
 <\left(\frac{e^{2+2H_{r-1}}}{nr}\right)^n.
 \tag{3}
```

The strict last inequality follows from
$`\log n!>n\log n-n`$, obtained by integrating $`\log x`$ from 1 to $`n`$.
Thus an immediate sufficient condition is

```math
n\ge T_r:=\frac{e^{2+2H_{r-1}}}{r}.
 \tag{4}
```

In particular, for $`n\ge r^2`$, (3) gives

```math
\frac Q{P^2}<e^{-n\Psi(r)},
 \qquad \Psi(r)=3\log r-2H_{r-1}-2.
 \tag{5}
```

For integer $`r\ge2`$,

```math
\Psi(r+1)-\Psi(r)
 =3\log(1+1/r)-2/r
 \ge1/r-3/(2r^2)>0.
```

Here $`\log(1+x)\ge x-x^2/2`$ follows by differentiation for $`x\ge0`$.
The companion rational checker proves
$`\Psi(23)>1/50`$ and $`\Psi(64)>51/50`$. Consequently all
$`r\ge23,n\ge r^2`$ are prior consequences, with an even stronger
$`Q/P^2<e^{-51n/50}`$ for $`r\ge64,n\ge r^2`$.

The earlier theorem of Anari, Gurvits, Oveis Gharan and Saberi,
[*Simply Exponential Approximation of the Permanent of Positive Semidefinite
Matrices*](https://ieee-focs.org/FOCS-2017-Papers/3464a914.pdf), FOCS 2017,
Theorem 1, gives $`P\ge e^{-n(1+\gamma)}R`$. The same deduction supplies the
weaker condition $`n/r\ge e^{2+2\gamma}`$; the rank-dependent refinement in
(1) improves this. Both sources predate the 2026 sphere-tilt work.

## Residual scope after the old sufficient criterion

The following integers are $`N_r=\lceil T_r\rceil`$, verified by rational
logarithm intervals. The displayed residual intervals are conservative:
the non-relaxed factorial bound in (3), other old bounds, or already known
structured results may cover additional pairs.

| Rank $`r`$ | Prior criterion covers every $`n\ge N_r`$ | Possible residual within $`n\ge r^2`$ |
|---:|---:|---:|
| 5 | 96 | 25–95 |
| 6 | 119 | 36–118 |
| 7 | 142 | 49–141 |
| 8 | 166 | 64–165 |
| 9 | 189 | 81–188 |
| 10 | 212 | 100–211 |
| 11 | 236 | 121–235 |
| 12 | 259 | 144–258 |
| 13 | 282 | 169–281 |
| 14 | 306 | 196–305 |
| 15 | 329 | 225–328 |
| 16 | 353 | 256–352 |
| 17 | 376 | 289–375 |
| 18 | 399 | 324–398 |
| 19 | 423 | 361–422 |
| 20 | 446 | 400–445 |
| 21 | 470 | 441–469 |
| 22 | 493 | 484–492 |

This is a comparison of theorem ranges, not a new list of solved cases.

### A further direct combination of published bounds

Ma's Lemma 3.1 gives $`P\ge(r)_n e^{-nH_{r-1}}`$, without a spectral tilt.
From $`Q\le R\le P/\alpha_{n,r}`$ we obtain

```math
\frac Q{P^2}\le
 \frac1{\alpha_{n,r}(r)_n e^{-nH_{r-1}}}.
 \tag{6}
```

Write the logarithm of the denominator as

```math
B_r(n)=\log n!+\log(r)_n-n\log n+n\log r-2nH_{r-1}.
```

Its exact increment satisfies

```math
\begin{aligned}
 B_r(n+1)-B_r(n)
 &=\log(r(n+r))-n\log(1+1/n)-2H_{r-1}\\
 &>\log(r(n+r))-1-2H_{r-1}.
 \end{aligned}
```

For each $`18\le r\le22`$, the checker certifies both
$`B_r(r^2)>0`$ and
$`\log(r(r^2+r))-1-2H_{r-1}>0`$. The right side of the increment bound
increases with $`n`$, so (6) proves every $`n\ge r^2`$ for those ranks.
Together with (5), this covers all $`r\ge18`$ as consequences of already
published inequalities. The rows 18–22 in the preceding table are therefore
removed from the possible residual. Smaller ranks may also have their
conservative interval shortened by (6); no optimal residual threshold is
asserted.

## Recent primary-source scope check

The focused audit also examined these sources and their directly relevant
statements. Search results alone were not used to infer a theorem.

* Yicen Ma, [arXiv:2609.37461v1](https://arxiv.org/html/2609.37461v1),
  28 September 2026. Theorem 1.2 treats rank at most four and order at least
  ten; Theorem 1.3 treats the order-nine rank-four tight case. Lemma 2.2,
  Lemma 3.1 and Proposition 3.2 give the Bregman interpolation, sphere
  identity and spectral tilt ingredients already used in our checkpoint.
  Sections 5–6 use polynomial densities and entropy. The general method
  must be credited; the source states no arbitrary-rank closure.
* Pant and Singh, [arXiv:2604.24192v2](https://arxiv.org/pdf/2604.24192),
  revised 18 September 2026, treats support classes and matrix joining.
  Its structural hypotheses do not follow from a bound on rank alone.
* Li, Zhao and Luo, [202608.2196](https://www.preprints.org/manuscript/202608.2196),
  31 August 2026, gives all complex PSD matrices through order six. Its
  stated order range does not include this residual.
* Lavi's [current Conjecture 30 page](https://yair-lavi.com/mincs-list/conjecture-30/index.html)
  records rank at most three in every order after Nowicki's October
  preprint, and newer support and Laplacian results. Its linked
  [quadratic-conjecture paper](https://yair-lavi.com/publications/quadratic-permanent-conjecture/paper.pdf)
  gives small-order results, not the arbitrary-rank range audited here.
* Sa-nguansin and Rodtes,
  [DOI 10.1080/03081087.2025.2588584](https://doi.org/10.1080/03081087.2025.2588584),
  treats parameterized annular conditions and order-five ridge matrices.
  The accessible primary abstract does not establish a rank-only result.

A search also located Scott Schubr's October 27, 2026 edition of
[*A quantitative Chollet inequality for rank-four matrices of order seven*](https://research.luminaryoddities.com/a-quantitative-chollet-inequality-for-rank-four-matrices-of-order-seven/v/2).
The primary-host search excerpt states a rank-four order-seven theorem, but
the full page redirected to an inaccessible host during this audit. This
is a source-access limitation, and that theorem was not checked here.

The search included both search engines, recent 2026 results, Ma's
references, and combinations of Chollet with bounded rank, effective rank,
rank five, square-root bounds, entropy, and the Yuan–Parrilo theorem.
Failure to locate the exact full auxiliary range is not a priority proof.
The established overlap (3)–(5) already requires a substantial attribution
correction.

## Exact check

Run `python chollet_rank_priority_audit.py`.
The checker uses the positive atanh series for logarithms and an explicit
geometric remainder. It checks only the scalar comparisons used above,
including the five endpoint and increment comparisons for (6);
the matrix argument is the written deduction. No matrix sampling or
finite-dimensional search is part of this audit.
