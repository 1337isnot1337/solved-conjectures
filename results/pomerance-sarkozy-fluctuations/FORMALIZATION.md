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

The asymptotic specialization, Gaussian law, second moment, process
limits and rare deviations remain. This does not
address the separate exact collision count `F(X)`.

[Strict build, all-owned audit and independent replay receipt](verification/finite-prime-tails/receipt.json)

[CRT and independent residue replay](verification/literal-crt-inclusions/receipt.json)

[Finite-window total-variation replay](verification/finite-window-tv/receipt.json)
