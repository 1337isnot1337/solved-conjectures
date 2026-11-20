# Prior-resolution exclusion: Simon's Le Roy conjecture

## Decision

This target is excluded from the repository's count of newly resolved conjectures. A complete earlier disproof of Simon's exact equivalence has now been located and read. The mathematical arguments retained here remain valid; their initial priority assessment was incomplete.

The explicit construction at $\beta=13/30$ and its beta-product extension are retained as additional structure for an already resolved conjecture. No claim of priority for that extension is made here.

## Exact prior source and dates

- Author printed in the source: **Principia Math In Progress**.
- Title: *A counterexample family to Simon's Le Roy-type criterion*.
- Document date: **11 September 2026**.
- MathDB identifier: **349140**.
- Repository: `PrincipiaMathOrg/math-solutions`.
- Full source: [pinned TeX document](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-349140/mathdb-349140-solution.tex).
- Pinned repository revision: `47371706c400c79d06e3fb62190fcf6f7a725c85`.
- Source blob: `3add335341ab6fe6b4d16cf98e5acd113fc01104`.
- The GitHub commit metadata dates that revision to **27 October 2026 at 05:36:01 UTC**. This establishes that the complete document was present by that date. It is not a claim about the first commit that introduced the file.

The full TeX proof was inspected on 20 November 2026. No formal-verification claim is used in this assessment.

## Exact match to the named conjecture

The earlier source states the same function and the same universal equivalence as Simon's Section 3:

```math
F_{\alpha,\beta}^{(\gamma)}(z)
=\sum_{n=0}^{\infty}\frac{z^n}{\Gamma(\beta+\alpha n)^\gamma},

```

```math
F_{\alpha,\beta}^{(\gamma)}(-x)\text{ completely monotone for }x>0
\quad\Longleftrightarrow\quad
z+\gamma(z^{\beta-\alpha}-z^\beta)\leq1
\quad(0<z<1).

```

Its theorem fixes $\alpha=1/3$ and $\gamma=2$, defines

```math
\beta_c=\max_{0<y<1}
\frac13\left(1+\frac{\log((1+y+y^2)/2)}{\log y}\right),

```

and proves $1/3<\beta_c<1/2$. It then proves complete monotonicity for every $\beta$ in some nonempty interval $(\beta_c-\varepsilon,\beta_c)$, although Simon's scalar inequality fails throughout that interval. This is a full disproof of the universal equivalence. An explicit numerical value of $\varepsilon$ is unnecessary.

This is the same family as the density-perturbation argument independently developed in this repository. It is not merely a general gamma-ratio example or a result about the convexity of a threshold.

## Mathematical audit of the earlier proof

The following steps were checked in the complete earlier manuscript.

1. Substituting $z=y^3$ changes Simon's criterion into $1+y+y^2\geq2y^{3\beta-1}$. The direction of the logarithmic inequality and the maximum defining $\beta_c$ are correct. The maximum is attained in the interior, is larger than $1/3$, and is smaller than $1/2$.

2. The signed beta-integral density has Mellin transform
   $H_\beta(s)=\Gamma(s+1/3)\Gamma(s+2/3)\Gamma(s+1)/\Gamma(s+\beta)^2$.
   The polynomial under the integral is
   $P_\beta(t)=t^2+(2\beta-3)t+(\beta-1)^2$.
   Absolute Fubini applies for $\mathop{\mathrm{Re}}s>-1/3$.

3. Moving the Mellin inversion contour from $\mathop{\mathrm{Re}}s=0$ to $-1/2$ crosses only the pole at $-1/3$. The residue is positive:
   $\Gamma(1/3)\Gamma(2/3)/\Gamma(\beta-1/3)^2$.
   The exponential vertical decay from the gamma quotient gives a remainder uniformly bounded by $M_I x^{-1/2}$ on compact parameter intervals. This proves uniform positivity near zero. The integral is positive for $x\geq3$ because $P_\beta(t)>0$ there.

4. At $\beta_c$, the logarithm of the Mellin transform has a nonnegative Lévy density. A finite compound-Poisson component is split off with a jump density positive on a negative half-line. Stirling growth of the remaining positive exponential moments forces its independent remainder to have unbounded upper support. The one-jump component consequently yields a strictly positive continuous density minorant at every real point. This justifies pointwise strict positivity at the threshold, not merely almost-everywhere nonnegativity.

5. The positive uniform endpoint bounds and the positive minimum on a compact middle interval survive a small change in $\beta$. Thus the signed density remains positive below $\beta_c$.

6. With $X=3Y^{1/3}$, gamma triplication gives
   $\mathop{\mathrm{E}}X^s=\Gamma(1+s)\Gamma(\beta)^2/\Gamma(\beta+s/3)^2$.
   The entire exponential-moment series gives the exact Laplace representation of $F_{1/3,\beta}^{(2)}(-x)$. This proves complete monotonicity throughout the counterexample interval.

No mathematical gap was found in these steps. This is an internal audit of the written proof, not a report of external peer review.

## Relationship to the retained explicit argument

The earlier manuscript does not certify $\beta=13/30$. It leaves explicit parameters and direct positive product representations as further tasks. The retained Dufresne construction supplies an exact positive law at $13/30$ and proves complete monotonicity for every larger $\beta$.

That difference does not restore the required open status of Simon's conjecture. The full conjecture was already disproved by the earlier interval theorem. The research record and exact verifier are retained, but the named target is no longer counted as a new resolution.

## Search correction

The earlier web and citation searches did not expose this manuscript. GitHub code search for the exact primary-source identifier `2012.11018` located it immediately in the public proof archive. Searches for the author's name or broad phrases alone were insufficient.

Future target selection must include exact source identifiers, conjecture numbers, formulas, and names in public proof repositories before mathematical work is classified as a new result. The searches remain bounded; a negative search is never proof of priority.
