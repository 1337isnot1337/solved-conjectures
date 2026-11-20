# Simon's Tricomi-Wronskian conjecture

Date: 20 November 2026. Status: research in progress; no resolution claimed. [Issue 103](https://github.com/1337isnot1337/solved-conjectures/issues/103).

## Exact target

Thomas Simon's *Produit Beta-Gamma et régularité du signe*, [arXiv:1207.6464](https://arxiv.org/pdf/1207.6464), Section 4.1, printed page 18, proposes strict decrease on the positive half-line of

```math
D^n_{b,d}(z)
=\det_{0\leq i,j\leq n}
\left[(d-n+j)_i\Psi(b,b+1-d+n-i-j,z)\right]
```

for every positive integer n and positive b,d above the staircase $`\mathcal E_n`$ defined in that paper. Here the Pochhammer symbol is rising. The source proves the subcase $`b\geq d>0`$ and records complete monotonicity when $`d>n`$. This research targets the entire proposed statement, not a fixed order.

The source's wording is an unnumbered plausibility assertion. The issue title is a descriptive author-and-object name, not an assertion that this exact name is standard. The [indexed author revision](https://math.univ-lille1.fr/~simon/Beta-Gamma.pdf), printed page 19, retains that assertion and the same known subcases. The published citation is *Studia Scientiarum Mathematicarum Hungarica* **51** (2014), 429–453, [DOI](https://doi.org/10.1556/SScMath.51.2014.4.1280).

For positive b,d the above-staircase condition is equivalent to

```math
\lfloor b\rfloor+\lfloor d\rfloor\geq n-1.
```

Indeed, if $`k\leq d<k+1`$, the highest staircase point strictly to the right of d has height $`n-k-1`$, unless k is already at least $`n-1`$. Thus the condition is exactly $`b\geq n-k-1`$. This equivalent test is used only to select diagnostic points.

## Analytic reductions

Set $`a=d-n`$ and, for fixed positive b,

```math
I_s(z)=\Psi(b,b+1-s,z)
=\frac1{\Gamma(b)}\int_0^\infty
e^{-zt}t^{b-1}(1+t)^{-s}\,dt.
```

This representation is valid for every real s and positive z. The elementary identities

```math
I_s'(z)=I_s(z)-I_{s-1}(z)
=-b\Psi(b+1,b+2-s,z)
```

follow by differentiation under the integral. The determinant entries are

```math
A_{ij}(z)=(a+j)_i I_{a+i+j}(z).
```

Consequently, its derivative is the negative of b times the sum of determinants obtained by replacing the parameter b by $`b+1`$ in exactly one column's Tricomi functions, leaving the Pochhammer factors unchanged. A sufficient route would be nonnegativity of every one-column replacement, with at least one strictly positive. That stronger statement has not been proved.

### Why the direct positive-moment argument stops

If $`a>0`$, gamma integration and Fubini give

```math
\Gamma(s)I_s(z)
=\int_0^\infty u^{s-1}e^{-u}(z+u)^{-b}\,du,
\qquad s>0.
```

Thus

```math
D^n_{b,d}(z)
=\frac{\det[M_{a+i+j}(z)]_{i,j=0}^n}
{\prod_{j=0}^n\Gamma(a+j)},
\qquad
M_s(z)=\int_0^\infty u^{s-1}e^{-u}(z+u)^{-b}\,du.
```

The Heine integral for this Hankel determinant has the squared Vandermonde, a positive measure, and factors $`\prod_k(z+u_k)^{-b}`$. It immediately yields complete monotonicity, but only when $`d>n`$. This is already a known source subcase. When $`a\leq0`$, its low-index moments diverge at zero. Analytic continuation of the formula does not make its measure positive and cannot be used as a proof in the remaining parameter range.

### Lowest-order identity

For n equal to one,

```math
D^1_{b,d}
=d\left(I_{d-1}I_{d+1}-I_d^2\right)+I_d^2.
```

The difference in parentheses is itself a Laplace transform of a nonnegative density. Symmetrizing the product integral gives the nonnegative factor

```math
\frac12\left(\frac{1+s}{1+t}+\frac{1+t}{1+s}-2\right)
=\frac{(s-t)^2}{2(1+s)(1+t)}.
```

Therefore the lowest-order determinant is completely monotone for all positive b,d. This observation is a consistency check and is not counted as a resolution of the full target.

### Source condensation recurrence

The source's Section 3.2 obtains by Sylvester condensation

```math
D^n_{b,d}D^{n-2}_{b,d}
=dD^{n-1}_{b,d-1}D^{n-1}_{b,d+1}
 +(n-d)(D^{n-1}_{b,d})^2.
```

That identity proves positivity in the relevant staircase induction. Strict decrease does not follow just by differentiating it: the division by $`D^{n-2}_{b,d}`$ contributes a term of the opposite sign. A proof along this route would need additional comparisons of logarithmic derivatives. No such comparison is established here.

## Bounded diagnostic

`probe.py` implements the defining determinant and its derivative through the integral identity for $`I_s'`$. At 70 decimal digits it completed 50 predetermined points at orders 2, 3, 4, and 6, with $`0<b<d\leq n`$ and the above-staircase condition. Every tested determinant was positive and every tested slope was negative.

This is floating-point evidence only. It establishes neither an exact finite certificate nor a general theorem. The diagnostic has a fixed small grid and no optimization or adaptive parameter search.

A separate three-point diagnostic examined the individual one-column replacements at $`z=1`$, for $`(n,b,d)=(2,1/4,7/4),(3,5/4,7/4),(6,9/4,13/4)`$. All signs were positive. This only motivates the proposed stronger minor inequality; it does not prove it.

## Prior-resolution screening and remaining gates

Both search engines have been used for the paper title, Simon with Tricomi and Wronskians, determinant monotonicity, complete monotonicity, conjectures, and later resolutions. The exact proposed assertion was found in the arXiv text and in a search-engine extract of the revised author PDF. Full retrieval of the latter failed through the web tool. A public-only Pyroam download attempt failed at the connector before execution; no downloaded copy is claimed.

The following adjacent papers require scope care:

| Paper | Inspected scope or access limit |
| --- | --- |
| Ismail–Simeonov, *Heine Representations and Monotonicity Properties of Determinants and Pfaffians*, [DOI10.1007/s00365-014-9262-2](https://link.springer.com/article/10.1007/s00365-014-9262-2), online 2014, journal 2015 | Primary publisher abstract and references inspected. It cites Simon. The full text was not retrieved, so this remains a material novelty gate. |
| Baricz–Ponnusamy–Singh, *Turán type inequalities for confluent hypergeometric functions of the second kind*, [arXiv:1409.1075](https://arxiv.org/pdf/1409.1075), journal 2016 | Primary main theorems concern scalar two-term Turán inequalities and quotient bounds. They do not state the all-order weighted determinant assertion. |
| Salazar, *Order-Moment Transport and Hankel Determinants in Special-Function Inequalities*, [arXiv:2606.31647](https://arxiv.org/abs/2606.31647) | Only the abstract is accessible. It includes Tricomi rays, so its full scope remains a material gate. |
| Conway, *An involution for recurrences of Tricomi and other special functions*, [arXiv:2610.39023](https://arxiv.org/abs/2610.39023) | Primary abstract concerns uniqueness of contiguous integrated recurrences; no determinant-monotonicity result is stated there. Its full PDF was not retrieved. |

No exact earlier resolution has been located, but these unresolved access limits preclude a strong novelty conclusion. No final result folder or claim of solution is justified at this stage.
