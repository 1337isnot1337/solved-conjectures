# Statement correspondence for square-root Taylor sections

Statement and scope audit: passed. The full 21-module closure passed fresh strict compilation, all-owned declaration audit, and exact stock-kernel replay at 2026-11-24 18:05:10 UTC. This is one completed original square-root conjecture; the supplements listed below remain unformalized.

## Existing entry and exact target

The target existed before this work at `results/kovalev-zero-free`, discovery issue #444. The implementation uses the recorded proof at commit `6432592c03b24aed190ed7b3204ed942a40a8da4`, written proof SHA256 `3deeb1ba260ce9ce18d482f8d6911a2b4beabdfc1db0b8659a9bffd4d3901924`. Original proposer: Leonid V. Kovalev. Original statement: Conjecture 1.2 in *Sharp bounds for some segments of bounded power series*, arXiv:2507.04544v1, Section 1. The repo proof is recorded by Cinna Davis. The entry does not establish priority of its all-length resolution, and this formalization makes no stronger priority claim.

For each natural d > 2, each natural n, and each complex z with norm at most 1, the exact sum of the first n + 1 Taylor coefficients at zero of the branch sqrt(1 + w + ... + w^d), multiplied by powers z^k, is nonzero. The implementation also proves this for every positive geometric-polynomial length D, without any bound on n. All boundary points, including z = 1, are included. The original statement is the D = d + 1 specialization.

## Endpoint audit

`kovalev_conjecture` states the original d > 2 theorem with the coefficients written literally as `iteratedDeriv k (fun w => Complex.sqrt (sum i in range (d + 1), w^i)) 0 / k!`. There are no hypotheses about coefficient identification, branch identities, beta expectations, couplings, integrability, or a bound on section degree. `taylorSection_ne_zero` gives the stronger all-positive-length statement. `sectionPolynomial_ne_zero` gives nonvanishing of the finite coefficient formula used in the proof. These are one result from one existing entry.

The analytic coefficient bridge proves that the principal complex square root of the geometric polynomial is analytic near zero and equals 1 there. The formal coefficients are identified using genuine convergent binomial series and local branch uniqueness. This matches the branch normalized at zero in the source. No global product identity for principal square roots is assumed.

## Argument audit

The half-coefficients are the actual positive sequence A_0 = 1 and A_(k+1) = (k + 1/2)/(k + 1) A_k. The positive corrections c_(j+1) = A_j - A_(j+1) satisfy both exact telescoping sums. The index j in Lean starts at zero, so it corresponds to j + 1 in the written proof. The finite coefficient formula keeps all positive multiples (j + 1)D at most n, exactly j in range(n/D).

The beta remainder is a concrete Bochner integral against Mathlib’s `betaMeasure (M + 1) (1/2)`, not a sequence satisfying abstract bounds. Its support is the open unit interval, it is a probability measure, and its first moment is proved from its actual density. For every closed-disk z != 1, the real part of 1 - z is positive, so the resolvent norm is strictly less than 1 almost everywhere; strictness of the integral follows from positivity of the integral of the pointwise norm gap.

The geometric input is proved for the actual principal square root. A direct algebraic proof supplies the square-root specialization of the source’s general fractional-power diameter-disk lemma. Principal-branch quotient identities are proved with positive real parts and same-sign imaginary parts. The source’s pointwise coefficient 2/(1 + sqrt(v)) is enlarged to 2 - v using the resolvent norm bound. The resulting averaged coefficient is exactly 1 + (n - M)/(n + 1), so the same strict coefficient budget applies.

The probability coupling is proved directly: for positive real a, b, c, the product of the actual Beta(a,b) and Beta(a+b,c) measures, mapped by (v,t) -> vt/(1 - t + vt), equals Beta(a,c). The proof uses the explicit inverse Möbius map, its positive Jacobian, an Euler beta integral proved by substitution, the actual density marginal, and Tonelli’s theorem. No gamma-independence statement is assumed. Since the odds of the image equal v times the odds of t, this gives exactly the coupling required when a = M + 1, b = n - M, and c = 1/2.

The integral correction bridge differentiates the actual finite polynomial multiplied by sqrt(1 - z), along the segment t -> tz. For closed-disk z != 1, the entire real segment has radicand with positive real part, including its endpoints, so the actual derivative kernel is continuous and integrable there. The fundamental theorem of calculus and the proved beta normalizer give sqrt(1 - z) $`A^{[M]}(z)`$ = 1 - z^(M+1) R_M(z). This avoids an open-disk-only endpoint argument or an unproved limiting step.

The finite assembly uses n/D times D <= n and the positive coefficient budget to get a strict remainder bound below A_(n/D). The leading polynomial has norm at least the same A_(n/D), so its cancellation with z^(n+1) times the remainder is impossible on the punctured closed disk. At z = 1, a direct positive-real-part estimate for the finite polynomial proves nonvanishing. No division by z or cancellation of sqrt(1 - z) at z = 1 is used.

## Scope excluded

The written proof’s general exponent extension 0 < alpha <= 1/2 is not formalized here. The sharp arbitrary-segment consequence is not formalized here. The adjacent trigonometric Conjecture 1.3 is a distinct statement and is neither used nor claimed. No isolated numerical or fixed-length case is counted separately.

## Verification record

Checkpoint 001 already passed fresh source compilation, all-owned declaration audit including private declarations, and exact stock-kernel replay for the five foundational modules. It was correctly marked incomplete and counted as zero. The full candidate passed a fresh 21-module closure build, an all-owned audit over 291 declarations including 265 theorems and 6 private declarations, and an exact 21-module stock-kernel replay. All 31 required endpoints were present and proved. Only `propext`, `Classical.choice`, and `Quot.sound` are allowed. The final `checkpoint-002/receipt.json` binds source, compiled-object, audit/inventory, helper-script, compiler/checker, and log hashes; `verification-validation.json` independently rechecks the artifacts and regenerates the audit/inventory. The repository-wide aggregate and hosted/deployment states are recorded separately and must not be inferred from the scoped proof gate.
