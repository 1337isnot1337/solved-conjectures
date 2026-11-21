# Lyon’s conjecture

Status: complete proposed computer-assisted proof; not formalized.

Complete proposed proof of the strict decrease of

```math
A(a)=2^{1/a}m(a)-a,\qquad a>0,
```

where $`m(a)`$ is the median of the unit-scale gamma distribution of shape $`a`$. This is the monotonicity conjecture retained in Lyon’s 2023 paper and explicitly still open in arXiv:2611.14429v1, November 2026.

The proof covers the entire positive half-line. The ranges $`a\le1/10`$ and $`a\ge7`$ are proved analytically. On $`[1/10,7]`$, an exact integer certificate proves 4258 median enclosures and uses convexity to verify the derivative inequality on 4256 adjacent real intervals. The certificate is an essential component of the proof. It is not a finite sampling claim, a proof of selected parameter values, or a Lean formalization.

## Files

- [PROOF.md](PROOF.md): statement, analytic tails, real-interval criterion, and all enclosure formulas.
- [verify.py](verify.py): standard-library verifier using integer endpoints and outward rounding.
- [medians.json](medians.json): proposed rational median brackets, all checked rather than trusted by the verifier.
- [SOURCES.md](SOURCES.md): source scope, prior-art search, and limitations.
- [ROOT_REVIEW.md](ROOT_REVIEW.md): independent analytic/code review and complete certificate replay.
- [ALGEBRA_REVIEW.md](ALGEBRA_REVIEW.md): independent proof review and successful exact certificate replay.

## Reproduce

```text
python3 verify.py
```

The first complete run passed all 4258 median brackets and all 4256 interval inequalities. The minimum certified interval margin was

```math
\frac{38316221661991044002598352939471477}
{340282366920938463463374607431768211456}>0.
```

The verifier also checks the elementary constant bounds used by the analytic tails. The certificate runs in about one to two minutes on the research container. No nonstandard Python packages are needed. Approximate quantiles were used only to propose the JSON brackets; the verifier independently proves every bracket with convergent series and signed remainder bounds.

## Status

Issue [#196](https://github.com/1337isnot1337/solved-conjectures/issues/196) records the reservation and proof checkpoints. Independent mathematical review and an independent exact certificate replay passed. The completed source audit found no earlier resolution, with its search limits recorded explicitly. The root reviewer independently checked the full proof and replayed the complete exact certificate. This package makes no separately counted claim about Lyon’s newer function $`C`$, beta-median bounds, or interpolation inequalities.
