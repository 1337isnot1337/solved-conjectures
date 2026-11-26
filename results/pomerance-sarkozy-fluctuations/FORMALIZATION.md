# Lean scope for Pomerance–Sárközy's fluctuation conjecture

This is partial Lean verification of the existing [written proof](PROOF.md).
The underlying counting function is the one in §3 of the
[primary paper by Erdős, Pomerance and Sárközy](https://combinatorica.hu/~p_erdos/1987-15.pdf).

Lean defines the literal function using Mathlib's set of distinct prime
factors. It reindexes its exact count by the offsets (n-m) and proves
the deterministic near-threshold comparison used in §3 of the written
proof. The comparison assumes the two stated finite tail controls.

For an arbitrary finite set of primes, Lean proves the shifted
prime-factor factorial tail bound in equation (2). The proof selects
actual distinct prime witnesses, bounds the union of their prime-product
multiples by exact quotient floors, and proves the factorial estimate
for the reciprocal-weight subset sum by a marked-subset bijection.
The arithmetic probability is the exact ratio on a finite interval,
with the sample-length condition for the factor two stated explicitly.

The [CRT checkpoint](../../lean/Conjectures/PomeranceSarkozyCRTCheckpoint.lean)
counts an actual residue class in every consecutive sample window.
The count differs by at most one from the uniform expectation. For
compatible incidence subsets the arithmetic event is a single class
modulo the product of the actual primes. The independent model is a
literal uniform product of finite residue choices, with the prescribed
coordinate count checked by a dependent-product bijection.
Incompatible incidence events have zero mass in both models.
Thus the inclusion-probability discrepancy is at most the reciprocal
of the sample size, which is the finite estimate in equation (5).
Lean also checks the pointwise truncated alternating-binomial kernel.

The [finite window comparison](../../lean/Conjectures/PomeranceSarkozyArithmeticTV.lean)
turns those inclusion estimates into a quantitative bound for the sum
of absolute differences of the actual arithmetic and independent atom
probabilities (twice total variation). Lean checks the summation over
small atoms, controls larger atoms by next-rank inclusions, and bounds
the amplification factor by (2M+1)^R for M possible incidences and
truncation rank R. The bound includes the explicit next-rank factorial
remainder and the binomial multiple of the reciprocal sample size.

Lean also checks the two distribution comparisons in §2. The
[independent-residue tuple comparison](../../lean/Conjectures/PomeranceSarkozyLiteralPrimeTuples.lean)
uses the actual finite residue sample spaces and splits the literal
incidence mask by prime. For each coordinate, the categorical to
Bernoulli total-variation cost is bounded by H(H-1)/p². The finite
product bound sums these costs. The
[Bernoulli to Poisson comparison](../../lean/Conjectures/PomeranceSarkozyPoissonTuple.lean)
uses the full Mathlib Poisson law on the natural numbers. The
single-coordinate total variation is exactly b(1-exp(-b)), at most b².
The product estimate covers countable observation spaces.

The [joint Poisson count-law checkpoint](../../lean/Conjectures/PomeranceSarkozyPoissonCountCheckpoint.lean)
identifies the actual product measure of the independently summed
Poisson offsets, with no truncation of the integer support. Lean
checks countable atomic pushforward contraction and proves the
Bernoulli sum-law comparison with the resulting independent Poisson
count vector. It also verifies all Poisson falling-factorial moments,
the centered second moment, the survival-sum identity, and the
reciprocal-square upper bound at a positive prime cutoff.

The [literal arithmetic-to-Poisson comparison](../../lean/Conjectures/PomeranceSarkozyActualCountEvents.lean)
now connects the whole finite chain. The arithmetic law is the
pushforward of the exact finite uniform sample by the vector of
shifted prime-divisibility counts. The categorical and Bernoulli
encodings agree with those counts on their full supports, and the
Poisson endpoint is the product of the actual Poisson sum laws. Lean
bounds the discrepancy for every event of this vector by the
explicit CRT–Bonferroni error plus 2H²/y, where H is the number of
offsets and y is the positive prime cutoff.

The asymptotic application of this estimate, the arithmetic Gaussian
law, second moment, process limits and rare deviations remain. This does not
address the separate exact collision count `F(X)`.

[Strict build, all-owned audit and independent replay receipt](verification/finite-prime-tails/receipt.json)

[CRT and independent residue replay](verification/literal-crt-inclusions/receipt.json)

[Finite-window total-variation replay](verification/finite-window-tv/receipt.json)

[Residue, Bernoulli and Poisson comparison replay](verification/residue-poisson-comparisons/receipt.json)

[Joint Poisson count law and moments replay](verification/poisson-count-law/receipt.json)

[Literal arithmetic-to-Poisson event comparison replay](verification/literal-arithmetic-poisson-law/receipt.json)

## Threshold identities

Lean checks two analytical reductions used for the transfer from
prime-factor counts to the fluctuation law. The
[near-threshold bound](../../lean/Conjectures/PomeranceSarkozyNearThresholdBand.lean)
shows that the sum of two-sided band probabilities is at most 2B+1
for a normalized law on natural numbers. The
[tail-product identity](../../lean/Conjectures/PomeranceSarkozyTailCross.lean)
reindexes the variance term by the positive difference of two atom
indices. Neither identity assumes a local limit theorem, and neither
establishes the Gaussian limit or the arithmetic density-one claim.

[Threshold identities replay](verification/threshold-identities/receipt.json)

## Reciprocal-prime input

The [prime-reciprocal checkpoint](../../lean/Conjectures/PomeranceSarkozyMertensRemainder.lean)
checks the bounded-error estimate for the prime reciprocal sum minus
log log x, uniformly for x at least two. It starts from the finite
Mangoldt divisor count, removes prime-power extras by a geometric
interval bound, and proves the Abel summation formula and the explicit
logarithmic-kernel integrals. This is a supporting prime-mean estimate
for the existing conjecture, not a new named result or a proof of its
arithmetic limiting law.

[Reciprocal-prime estimate replay](verification/prime-reciprocal-bound/receipt.json)

## Poisson difference limit

For two independent Poisson draws with rate b tending to infinity,
Lean checks that their difference divided by √b converges weakly to
the centered normal distribution of variance 2. The proof uses the
actual product measure, its exact characteristic function
exp(2b(cos t − 1)), the sine limit, and Lévy convergence. This is
a probabilistic input to §4 of the written proof. It does not by
itself prove convergence of the absolute first moment, the
threshold-count variance asymptotic, or an arithmetic Gaussian law.

[Poisson difference limit replay](verification/poisson-difference-normal/receipt.json)

## Non-identical Bernoulli array

Lean verifies an explicit Fourier error for a finite row of centered,
independent Bernoulli variables, proportional to the cube of the
frequency and the actual total variance. It then proves convergence
of the row characteristic functions when the scale grows and the
scaled variance converges. This verifies a general Gaussian input
to the stronger theorem in §4, not the limiting variance of the
specific arithmetic statistic or its distribution.

[Bernoulli-array Fourier replay](verification/bernoulli-array-fourier/receipt.json)

## Shifted tail and positive-part limit

For the [exceedance-process supplement](PROCESS.md), Lean verifies the
exact integer diagonal-overlap sum as a shifted positive difference
of two independent atom indices. It also verifies a measure-level
limit for moving positive-part expectations under weak convergence
and an eventual uniform second-moment bound. These are supporting
identities for the covariance kernel. They do not yet certify
convergence of the arithmetic process, tightness, or the Brownian
corollary.

[Shifted tail and positive-part replay](verification/shifted-tail-tools/receipt.json)
