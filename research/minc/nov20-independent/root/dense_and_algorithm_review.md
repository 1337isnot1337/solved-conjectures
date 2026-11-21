# Review of the dense comparison and compound refinements

Reviewed 20 November 2026 (America/Chicago).

This records root's independent checks of three partial results. None
resolves a full numbered entry of Minc's list. Historical priority is
unverified.

## Dense normalized-permanent comparison

Target: [c6_dense_barycentric_comparison.md](../sign/c6_dense_barycentric_comparison.md).

The complementary regular bipartite graph has a decomposition into
perfect matchings by repeated Hall's theorem. Sampling uniformly from
that specified decomposition has the claimed mean. The proof does not
assume that a uniform random perfect matching has uniform edge marginals.

For $`B=A/k-J_n`$, $`D=(P-A/k)/(k+1)`$, and
$`\alpha=n/((n-k)(k+1))`$, the two identities are exactly

```math
\mathbb ED=-\alpha B,
\qquad
\mathbb E\|D\|_F^2=\alpha\|B\|_F^2.
```

The second identity follows from disjoint supports, and holds before
taking expectations. Each endpoint has squared norm
$`(n-k-1)/(k+1)`$, at most $`(n-k)/k`$. Convexity of the ball therefore
justifies both Hessian integrations. The comparison

```math
m-M/2=\frac{n}{2(n-1)}-\frac{39}{100}\ge\frac{11}{100}
```

has the correct sign and yields the displayed strict gap after multiplying
by $`d_n=n!/n^n`$. Taking a minimum preserves the inequality because at
least one matching is no worse than the finite average.

I reran the exact checker. The moment identities, endpoint norms, and
rational constants passed. The small diagnostic orders do not satisfy
the dense-band hypothesis; they are correctly used only to check formulas.

## One-pivot compound storage

Target: [one_pivot_storage.md](../compound/one_pivot_storage.md).

Setting the unrestricted block size to one in the previously reviewed
mixed-space action gives

```math
D_{n,k}=\sum_{j=0}^{\min(k,n-1)}\binom{n-1}{j}.
```

The child dimensions are bounded by the parent dimension. Processing one
child at a time gives at most $`n`$ active arrays. The symmetric-dimension
convolution bounds the sum of arithmetic work on each recursion level
by a polynomial times $`\binom{n+k-1}{k}`$, so the depth contributes
only an additional polynomial factor.

The interpolation repair is applied once to the original matrix
$`A+tI`$. Every recursive Schur complement then has valid leading pivots.
It is not a new interpolation at each recursive call, which would fail
to justify the stated time bound. The implementation uses this global
repair correctly.

For $`k\le n/2`$, each summand in $`D_{n,k}`$ is at most
$`\binom nk`$, giving the claimed input/output-scale polynomial storage
bound. The note correctly limits the claim to joint time and storage;
streaming entries also has low memory with a different time cost.

I reran all 75 rational action comparisons, including singular and
zero-leading-pivot inputs. They passed against independent permanent
enumeration.

## Block black-box characteristic polynomial

Target: [blackbox_compound_bound.md](../compound/blackbox_compound_bound.md).

I independently opened the primary sources:

- [Villard's 2003 habilitation](https://perso.ens-lyon.fr/gilles.villard/BIBLIOGRAPHIE/PDF/Hdr.pdf),
  Section 6.4, Lemma 6.4.3 and the block-search argument immediately
  following it. These give the stated characteristic-polynomial cost,
  with all invariant-factor multiplicities retained.
- [Amanov, van den Berg and Zuiddam, 2026](https://arxiv.org/html/2610.30054v1),
  Theorems 1.1 and 1.2. These give the square and rectangular exponents
  used in the optimization, over every field.

The tensor action has no missing factorial: a fixed input subset has
$`k!`$ ordered tuples, whose products sum to exactly one subpermanent.
Applying the rectangular bound with exponents $`(k-1,1,1)`$ gives
$`k+1/(4(k-1))`$, as stated.

The rectangular term dominates the polynomial-matrix term in the block
optimization because their difference is
$`(1-\beta^2)/(4\beta)\ge0`$. The derivative of the surviving
rectangular branch is $`1/2-1/(4\beta^2)`$, with its minimum at
$`\beta=1/\sqrt2`$. The other branch decreases with $`\beta`$.
Thus the two regimes and the value $`3/2+1/\sqrt2`$ follow.

For the second regime, improvement over the currently available dense
exponent $`9/4`$ is equivalent to
$`\sqrt{\varepsilon^2+2\varepsilon}>3\varepsilon`$, which holds
for $`0<\varepsilon<1/4`$. The growing-degree conclusion uses the
exact entropy inequality in the note, not its approximate decimal root.

The field-arithmetic algorithm remains Monte Carlo. This review does not
upgrade it to deterministic, Las Vegas, or a bit-complexity theorem.
It also does not remove the central growing-degree gap.

