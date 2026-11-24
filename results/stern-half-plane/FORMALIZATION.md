# Dilcher–Kidwai–Tomkins’s Stern-polynomial conjecture

## Status and exact target

The Lean formalization is incomplete. The four-module checkpoint proves the actual Stern recurrence and polynomial evaluation, the all-odd-index run representation, the Schinzel shift identity, and a finite continued-fraction reduction to an explicit common-parabola hypothesis. It does not prove the regional analytic estimates or the full zero-location conclusion and contributes zero completed results.

The source is Karl Dilcher, Mohammad Kidwai and Hayley Tomkins, *Zeros and irreducibility of Stern polynomials*, Publ. Math. Debrecen 90 (2017), Conjecture 3.1, printed page 413, [DOI 10.5486/PMD.2017.7620](https://doi.org/10.5486/PMD.2017.7620). The conjecture concerns every index at least two: every zero has real part strictly less than one. The constant index one has no zeros and is also included by the partial nonvanishing theorem. Index zero, whose polynomial is identically zero, is excluded.

The argument is this entry's [recorded proof](PROOF.md), originally committed as `6a2a2d00c8e352f0f07166fad96dcffa831f9552`. [Altizio, arXiv:2511.03847v1](https://arxiv.org/html/2511.03847v1), Theorems 3–4, supplies the cited run-formula and parabolic-element-set context. The source and original proposers are credited; the shift identity is due to Schinzel, and the run formula is credited to Reznick and Schinzel. The existing [audit](AUDIT.md) preserves the literature and priority limits. No new mathematical discovery or exclusive priority is claimed.

## Checked statements

The import root is [`Conjectures.SternHalfPlaneContinuant`](../../lean/Conjectures/SternHalfPlaneContinuant.lean). `sternPolynomial` is an integer-coefficient polynomial defined by the exact source recurrence, and `eval_sternPolynomial` proves that its complex evaluation is `stern`. The run-index existence theorem has no bound on the input index. The shift identity and continuant formula are proved from the recurrence rather than assumed.

For a fixed complex point $`z`$ and real parameter $`t`$, write $`G_a(z)=1+z+\cdots+z^{a-1}`$ and $`\rho_{ab}=z^a/(G_a(z)G_b(z))`$. The predicate `Parabolic t rho` is

```math
(1+t^2)|\rho|-(1-t^2)\Re\rho-2t\Im\rho\le\tfrac12.
```

`stern_ne_zero_of_parabolic` proves that if $`\Re z\ge1`$ and this inequality holds for every pair of positive integers $`a,b`$ with the same $`t`$, then $`S_n(z)\ne0`$ for every positive integer $`n`$. The proof checks the invariant half-plane and every continued-fraction denominator. The geometric sums are proved nonzero before division. The all-odd-index reduction and the even recurrence cover all positive indices.

The [independent review](LEAN_REVIEW.md) checks the statement against the primary sources, all four unchanged source hashes, and the scoped verification evidence.

## Remaining obligations

1. Prove the near-one analytic estimates and the common-parabola hypothesis for all positive run lengths in that region.
2. Formalize the compact-region certificate, its exact rounding and enclosure soundness, full box coverage, and the bound covering every omitted run length. The existing C++ certificate remains part of the written proof and is not a Lean theorem.
3. Prove the separate phased-matrix exterior argument and combine all three regions, with the boundary, real point and conjugation cases, into the full half-plane result. The common-parabola premise is not asserted to hold throughout the exterior region.

No later box-geometry, reciprocal, arithmetic or certificate drafts are included in this four-module receipt.

## Verification

All four frozen sources passed strict builds with warnings treated as errors. The complete owned/private audit checked 134 declarations, including 105 theorems, 14 private declarations and eight required endpoints. Only `propext`, `Classical.choice` and `Quot.sound` were permitted. The pinned stock checker replayed exactly the four-module local import closure. [Receipt](../../docs/verification/lean-stern-half-plane-partial-20261124-162051/receipt.json), [strict source receipts](../../docs/verification/lean-stern-half-plane-partial-20261124-162051/strict-source-receipts.json), and full logs preserve the evidence.

The scoped checks do not establish a repository-wide build, hosted-CI pass or website deployment. The separate aggregate dependency-artifact blocker remains tracked in [issue #563](https://github.com/1337isnot1337/solved-conjectures/issues/563).
