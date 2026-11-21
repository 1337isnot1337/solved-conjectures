# Independent analysis review

Review date: 2026-11-21. Reviewed `PROOF.md`, `verify.py`, and the exact primary source. The proposed disproof passes the mathematical audit. Priority is a separate question addressed by `SOURCE_AUDIT.md`.

## Original statement and normalization

I independently read Chen–Khare–Sahi, [arXiv:2509.19649v2](https://arxiv.org/html/2509.19649v2), at the definition of the Muirhead semiring in Section 1, the normalization and positivity cones in Section 2, and the entire statement of Conjecture 5 in Section 5.

The generators are the normalized monomials $`M_\lambda=m_\lambda/m_\lambda(\mathbf1)`$ and their same-degree dominance differences. The semiring uses finite sums and finite products with nonnegative scalar coefficients. Its specialization in assertion $`(2')`$ is exactly the real semiring used in the proof. Both rational parameters lie strictly inside $`(0,1)`$, and $`(4,2,0)\succeq(4,1,1)`$. Refuting this implication disproves the complete equivalence in Conjecture 5. It does not refute evaluation positivity, which the writeup correctly distinguishes.

## Full cone coverage

The homogeneity reduction is valid. Projecting any proposed representation to degree six retains precisely the products of total degree six with their original nonnegative coefficients. One can also discard other degrees by the noncancellation argument in the proof.

Every finite dominance interval has saturated chains; telescoping reduces an arbitrary difference to cover differences. Products of ordinary normalized monomials have nonnegative monomial coefficients, so they reduce to nonnegative combinations of individual normalized monomials. No division or negative coefficient is introduced in either reduction.

Nonzero differences have degree at least two. The stated cover lists in degrees two through six are complete. The resulting counts are 27 products containing one cover difference, 10 containing two, and one containing three. This accounts for all products in the degree-six component, rather than a bounded search over possible representations.

I implemented the 38-product enumeration independently in `independent_cone_check.py`, without imports from the discovery scripts or the package verifier. Every rational value agrees with the displayed table. All 38 values and the seven pure monomial values are nonnegative. In particular, the several zero margins are exact and are not rounded tolerances.

## Independent polynomial identification

I inspected the difference-operator identity in Macdonald, *Symmetric Functions and Hall Polynomials*, second edition, Chapter VI, (4.15), and the rectangular-translation identity (4.17), using the [primary book PDF](https://math.berkeley.edu/~corteel/MATH249/macdonald.pdf). The sign of each cleared-denominator coefficient $`W_i`$, the eigenvalues, monic normalization, and triangular support in the package verifier are correct. Replaying `verify.py` passes both complete polynomial identities and all seven eigenvalue-distinctness checks.

As a genuinely separate identification, I recomputed both polynomials from the defining Hall inner product. This calculation uses all eleven partitions of six in the full symmetric-function space, applies exact Gram–Schmidt in a dominance-compatible total order, and only then specializes to three variables. It reproduces every coefficient in equation (6).

The standard-library implementation is `independent_orthogonality_check.py`. It imports neither the branching construction nor the eigenoperator certificate. It checks positive norm denominators and exact orthogonality during the construction. Its successful replay removes dependence on either of the other two coefficient-generation methods.

The orbit multiplicities in equation (4), both evaluations at $`\mathbf1`$, and the normalized functional subtraction are correct. The final value is exactly

```math
-\frac{4538292661539}{106631184392870}<0.
```

This contradicts the full cone inequality and completes the disproof.

## Saturation and the infinite translate family

The additional saturation assertion in Section 3 is valid. For each nonzero generator, remove the power of $`e_3=x_1x_2x_3`$ given by its smallest part. The residual generator has a nonnegative and nonzero restriction to $`x_3=0`$.

For a difference, dominance gives the needed order of smallest parts. If the second residual partition has positive last part, its boundary restriction vanishes and the first does not. If both have last part zero, the two distinct partitions give different monomial orbits in the remaining variables, so their restrictions do not cancel identically. Nonnegativity follows from Muirhead's inequality by continuity to the boundary.

A finite product of these residual generators remains nonzero on the boundary because the polynomial ring has no zero divisors; it is also nonnegative on the positive quadrant. Thus a finite nonnegative sum cannot cancel its lowest power of $`x_3`$. Divisibility by $`e_3^r`$ forces every product term to have at least that power. Dividing those terms leaves valid semiring expressions. This proves the asserted saturation and justifies every rectangular translate, with no bounded-degree extrapolation.

## Continuous parameter family

I independently derived the Hall–Littlewood expansions and the factored functional difference in `HALL_LITTLEWOOD.md` from Macdonald's six-term symmetrization formula. The normalization factors are $`v_{420}=1`$ and $`v_{411}=1+t`$. For every $`3/4\le t<1`$, the limiting functional value at $`q=0`$ is strictly negative. The Hall inner product supplies continuity into $`q>0`$, giving an additional parameter family inside the conjecture's domain.

The boundary calculation is not substituted for the exact interior example. Both the explicit rational point and the family argument are present, and they concern the same conjecture.

## Outcome

No mathematical correction is required. The essential argument is a finite exact algebraic certificate for a universal nonmembership assertion, followed by two analytic/algebraic family extensions. Floating linear programming appears only in candidate discovery and is not a premise of the proof. No Lean work is used.
