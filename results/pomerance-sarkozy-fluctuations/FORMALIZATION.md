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

The growing-window CRT/Bonferroni comparison, limiting Gaussian law,
second moment, process limits and rare deviations are not yet checked
here. This does not address the separate exact collision count (F(X)).

[Strict build, all-owned audit and independent replay receipt](verification/finite-prime-tails/receipt.json)
