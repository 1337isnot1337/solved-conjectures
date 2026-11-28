# Kotesovec’s line-size asymptotic (OEIS A401948)

**Related earlier work.** The realizability criterion and the count were proved earlier, with a Lean 4 formalization, in [manman4/OEIS_04, `401/401948`](https://github.com/manman4/OEIS_04/tree/d4dc4cc68401bc378642ce118fe884f1c6fed5b2/401/401948), committed 10 November 2026. Cite that work for the criterion. The asymptotic and the exact prefactor are the contribution here. [Details](PROOF.md)

[Collection](../../README.md) · [Catalogue](../../CONTENTS.md) · [Verification](../../docs/verification.md) · [Lean status](../../docs/lean-status.md)

## Result

Václav Kotesovec proposed the exponential base and a numerical prefactor for Seiichi Manyama’s line-size sequence on 13 November 2026. The proof gives the sharp asymptotic and the exact prefactor. Szemerédi and Trotter had already proved the upper bound asked for in Erdős Problem 607 in 1983. [Original paper, Theorem 4](https://doi.org/10.1007/BF02579194). [OEIS A401948](https://oeis.org/A401948) · [Erdős Problem 607](https://www.erdosproblems.com/607).

## Proof and sources

Read [the proof](PROOF.md) for the original problem, assumptions, argument, and cited sources. These notes are unrefereed.

## Verification

Run from the repository root:

```bash
python3 results/erdos-607-line-sizes/verify.py
```

See [the verification guide](../../docs/verification.md) for dependencies and the distinction between computational checks and formal proofs.

## Formalization

The exact realizability criterion is proved for actual finite sets of real
plane points. The geometric construction, filling, padding, ordinary-line
theorem, and collinear cases give equality of the geometric record count
with the canonical tuple count for every natural n. The core/gap weight
equivalence is also checked. The Sylvester–Gallai dependency is a pinned
CC0 port with its license and provenance preserved.

The exact saddle constant, unique saddle, curvature, global phase bound,
and mean/variance identities have passed source, axiom, and independent
kernel checks. The exponential-series integral supplies the constant.

Canonical core/tail reconstruction, cumulative cost counting, and the exact
corrected finite Euler product are also checked. The Euler proof includes the
square-root factor and a uniform logarithmic error estimate on positive compact
ranges of the scaled core length. Its eight-module closure passed strict source,
the 122-theorem axiom audit, and independent kernel replay.

The exact coefficientwise formal generating function is now checked. Its
14-module closure passed strict source checking, a 496-theorem axiom audit,
and independent kernel replay. See the
[receipt](../../docs/line-size-generating-function-hosted-receipt.json).

The analytic generating function, absolute convergence, and exact Fourier
coefficient identity are now checked. The 39-module closure passed strict
sources, an 867-theorem standard-axiom audit, and independent kernel replay.
[Generating-function receipt](../../docs/verification/line-size-generating-evaluation-daa7d2c5.json).

The complete sharp asymptotic is also checked for the actual geometric count:

```math
F(n)\sim \frac{3}{16\sqrt{6\pi}\,A^{1/4}}\,
n^{-1/4}e^{2\sqrt{An}},\qquad
A=\frac{\pi^2}{12}+\frac{(\log 2)^2}{2}.
```

All finite-product limits, Fourier bounds, measurability, domination, lattice
steps, Gaussian integrals, and normalization identities are supplied by its
78-module closure. Strict sources, the 1,582-theorem standard-axiom audit, and
independent pinned-kernel replay passed.
[Asymptotic receipt](../../docs/verification/line-size-sharp-asymptotic-36b13722.json).

This completes the stated note. [Checked components](LEAN_PLAN.md) ·
[Exact formalized scope](../../docs/lean-status.md#complete-erdős-607-line-size-asymptotic).
