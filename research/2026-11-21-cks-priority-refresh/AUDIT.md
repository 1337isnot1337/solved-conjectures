# Chen–Khare–Sahi source recheck

Date: 21 November 2026 UTC. Scope: the October 2026 Sra manuscript newly rediscovered through the AIM archive. This is a source-scope addendum, not a new mathematical result.

## Conclusion

Suvrit Sra's *On majorization inequalities for normalized Jack and Macdonald polynomials* does not resolve the Muirhead-semiring assertion refuted by the campaign's Chen–Khare–Sahi package. The exact October manuscript was already read and distinguished in the package's original `SOURCE_AUDIT.md`; this check retrieves its current author-hosted PDF and compares the actual statements again.

The closest theorem is especially relevant: its Exact Certificate 4.1 proves the ordinary evaluation inequality for the same partitions `(4,2,0)` and `(4,1,1)`, for all parameters in the open unit square. That theorem is compatible with failure of membership in the specified semiring. The campaign must not describe this pointwise inequality as newly disproved or newly unresolved.

## Primary copy and retrieval record

- [Author-hosted PDF](https://suvrit.github.io/papers/jackratio/jackratio-v1.pdf), retrieved successfully on 21 November 2026.
- [Hexagon copy, identifier 2610.00725v1](https://hexagonmath.org/pdf/2610.00725v1), read through the built-in web PDF extraction. This identifier is cited here as a Hexagon identifier; this check does not establish an arXiv record with that identifier.
- [Author's preprint page](https://suvrit.github.io/papers/jackratio/), previously checked in the original source audit.
- Local author-PDF size: **607,845 bytes**.
- SHA256: **`1c1c128f84ce4c0f7f769988c74f25d8da87d486601aef7c66bec9043c4f92c6`**.

The author PDF was converted with `pdftotext -layout`. Its definitions and the statements below agree with the Hexagon extraction. A separate direct Python request for the Hexagon PDF returned HTTP 403; that failed download is not being represented as the source of the saved bytes. No visual-page inspection is claimed in this addendum.

## Exact scope comparison

| Source passage | Statement inspected | Effect on the campaign claim |
|---|---|---|
| Sra, printed page 1, equation (1.2) and assertion (M) | The Macdonald polynomial is normalized by its value at the all-ones vector. Assertion (M) compares the values of two normalized polynomials on positive vectors whenever their partitions are ordered by majorization. | The normalization agrees with the campaign. The conclusion is an inequality between values, rather than semiring membership. |
| Sra, printed page 2 | The text explicitly distinguishes (M) from the stronger positivity assertions in Chen–Khare–Sahi Conjecture 5. Theorem 1.2 is rank two; the discussion credits the original authors with the stronger Muirhead-cone result in that rank. | The stronger algebraic assertions are acknowledged separately; they are not silently identified with (M). |
| Sra, printed page 8, equations (4.1)–(4.3), Exact Certificate 4.1 | For three variables, substitute `x=((1+u)(1+v),1+v,1)`, with nonnegative `u,v`. The cleared gap for `(4,2)` and `(4,1,1)` has nonnegative coefficients in this chamber parametrization, with exact tensor-Bernstein certificates in the parameters. Hence the evaluation inequality holds throughout the positive orthant. | A nonnegative expansion after this nonsymmetric chamber substitution does not supply a decomposition into the normalized symmetric monomial polynomials and their majorization differences that generate the Muirhead semiring. It does not contradict the campaign's separator. |
| Sra, printed page 9, Exact Certificate 4.2 | The same evaluation method proves (M) in three variables for all partition sizes at most eight. | This extends the evaluation theorem, not the semiring theorem. |
| Sra, printed page 11, Section 7 | Remaining cases of the general evaluation assertion are listed. | No claim of a full Macdonald semiring resolution appears. |

The target is [Chen–Khare–Sahi, Conjecture 5](https://arxiv.org/html/2509.19649v2#S5), condition `(2')` in the numbered equivalence: for every admissible parameter pair, the normalized difference belongs to the Muirhead semiring. The campaign's exact separator at `q=1/10`, `t=9/10` addresses that condition. It does not refute the distinct condition `(3)` concerning ordinary evaluation positivity. The original definitions of all semiring generators and the exhaustive degree-six generator reduction are checked in the proof and its independent reviews.

A full-text search of the fresh Sra extraction has no occurrence of the word `semiring`. This is only supporting evidence; the actual definitions and theorem statements above determine the scope comparison.

## Priority disposition

No priority exclusion follows from this rediscovered source. The original audit correctly included the October 2026 paper as a close earlier result and credited its stronger-than-needed evaluation theorem for the same partition pair. This addendum records reproducible bytes and the precise reason its certificate is not a prior proof or refutation of the semiring assertion. It does not establish exhaustive global publication priority.
