# Standard Simplex conjecture: low-correlation scope audit

Checkpoint dated 21 November 2026. **Status: bounded literature comparison completed; expanded archive pass in progress.** The written partial theorem and its mathematical reviews are available in [SMALL_CORRELATION.md](SMALL_CORRELATION.md). No first-discovery or full-conjecture resolution claim is made at this checkpoint.

## Exact claim being compared

For every fixed integer $`q\ge3`$, there is a positive $`\rho_q`$, independent of $`d`$, such that the central regular-simplex partition uniquely maximizes $`S_\rho`$ among all equal-mass measurable $`q`$-partitions in every $`d\ge q-1`$, for all $`0<\rho\le\rho_q`$.

This is a low-correlation statement, $`\rho\downarrow0`$. It is not the small-noise limit $`\rho\uparrow1`$. It does not impose hyperstability or additional regularity, and it is not a statement about one prescribed cell count. It remains only part of the original all-correlation conjecture.

## Primary comparisons read

| Primary source | Exact relevant scope | Comparison |
|---|---|---|
| Isaksson--Mossel, [arXiv:0903.3362v3](https://arxiv.org/pdf/0903.3362v3), Conjecture 1.4 | Balanced positive-correlation maximum and free-mass negative-correlation minimum, all permitted dimensions and cell counts | Original target, not a proof |
| Heilman, [Euclidean partitions optimizing noise stability, arXiv:1211.7138v2](https://arxiv.org/pdf/1211.7138v2), Section 8 | Identifies balanced first-moment stability as a missing ingredient for extending the positive small-correlation argument beyond three cells | A roadmap and conditional discussion; it does not contain the present all-cell finite-correlation theorem |
| Heilman--Tarter, [Three candidate plurality is stablest for small correlations](https://doi.org/10.1017/fms.2021.56) | Dimension reduction and three-candidate small-correlation comparison | Does not establish arbitrary cell count |
| Heilman, [Hyperstable Sets with Voting and Algorithmic Hardness Applications](https://arxiv.org/pdf/2209.11216v1) | Conditional variational classification involving hyperstability | The extra hypothesis is not assumed or derived in the current proof |
| Heilman, [Sharp Hardness for MAX-3-CUT and Quantum MAX-CUT, arXiv:2608.00333v1](https://arxiv.org/pdf/2608.00333v1), Theorems 7.1/A.1 and Section 1.4 | Three-cell negative range down to $`-1/2`$ and balanced positive range up to $`2/5`$; the future-work section explicitly leaves four or more cells largely open | Current broad three-cell range, not an arbitrary-cell theorem |
| Heilman, [Stable Gaussian minimal bubbles](https://doi.org/10.1007/s00526-026-03408-z), Corollary 1.11 and preceding paragraph | An asymptotic comparison with an error term for $`1/2<\rho<1`$, approaching Gaussian perimeter as $`\rho\uparrow1`$ | The phrase “small noise” in its heading is not the low-correlation regime or the exact comparison proved here |
| `mxym/math`, [Equal Gaussian cells: the sharp simplex first-moment theorem](https://github.com/mxym/math/blob/4a51ff772a566451627b9ff41f6248518561d9d4/research/gaussian-balanced-simplex-all-k/paper.md), dated 8 October 2026 | The sharp balanced first-moment extremum for all cell counts, with equality and a covariance-deficit integral; explicitly says it is not finite-correlation noise stability | Credited prior input. Its complete written argument was checked; the current theorem is a proposed subsequent deduction |

The pinned first-moment manuscript is unrefereed public research. Its existing extremum and covariance identities are not claimed as new. The current peer-agent reviews are mathematical checks, not external acceptance of that source or of the new deduction.

The direct primary-source copies and their hashes are recorded in [PRIOR_AUDIT.md](PRIOR_AUDIT.md) and [STABILITY_PRIOR_AUDIT.md](STABILITY_PRIOR_AUDIT.md). A fresh web request to the current arXiv abstract page for `2608.00333` failed with a disabled-page error; the local full version read is explicitly v1. That failed request is not evidence that no later version exists.

## Current public searches

Both web engines were used on the exact name and on variants including “regular simplex small correlations,” “standard simplex all low correlation,” “balanced first-moment noise simplex,” and “noise stability every number small.” The stronger engine was used for current-status verification. The relevant returns were the primary three-candidate papers, the recent Gaussian maxima/weak-simplex papers already compared in the first-moment audit, and the distinct near-one minimal-bubble result above. No exact earlier all-cell low-correlation theorem was identified in those results. Broad queries also returned unrelated optimization, Gaussian covariance estimation, and voting discussions; they were not treated as evidence about the claim.

The fresh global GitHub issue queries were:

- `is:issue "standard simplex" "correlation"`: thirteen returned issues. Two are the current repository's own research issues; the other returned bodies concern neural-network Gram matrices, coupon collection, software, or unrelated research. No exact theorem was identified in the returned bodies. Not every comment of every unrelated issue was exhaustively read.
- `is:issue "gaussian-balanced-simplex-all-k"`: zero returned issues.
- `is:issue "simplex" "small correlations"`: six returned issues, including arXiv feed aggregations and unrelated software/research discussions. This is a lead screen, not a proof of absence from all public issues.

The initial exact-source and original-conjecture issue searches remain recorded in [PRIOR_AUDIT.md](PRIOR_AUDIT.md). A result's absence from a catalog or query is not used as a mathematical premise.

## Expanded direct archive pass

The new reproducible [scan_low_correlation_prior.py](scan_low_correlation_prior.py) searches six separately downloaded, pinned public archives. It reads native UTF-8 bodies, converts PDF text, expands ZIP/gzip/tar payloads, and joins recognized split compressed bodies. It never executes archive code. Text is normalized with Unicode NFKC and then casefold. The exact regular expressions and all bounds are part of the script.

The source snapshots are the same six pinned commits listed in [PRIOR_SCAN.json](PRIOR_SCAN.json). The expanded patterns include original identifiers, Standard Simplex/plurality, author names, balanced Gaussian/centroid terminology, low-correlation language, and first-moment stability. A second reviewer is checking a supplemental residual with further broad terms, including standalone noise-stability and Gaussian-simplex phrases.

At this checkpoint, the fresh scan has completed Trure, Principia, AIM, `mxym/math`, and ArtificialZeng and is processing OpenAI/math. Completed conversion counts are 274 Principia PDFs, 144 AIM PDFs, 192 mxym PDFs, and 472 ArtificialZeng PDFs. Actual matching bodies still require semantic classification; a completed conversion is not itself a completed prior-resolution audit.

The main scanner limits a single entry to 256 MiB, gzip expansion to 16 MiB, and recursive depth to eight; every skipped binary, size limit, empty PDF, or conversion failure is recorded. An independent supplemental pass uses a larger gzip bound for AIM/OpenAI. These scope differences will be reconciled in a later committed audit. No claim of exhaustive binary/OCR coverage is made.

## Provisional conclusion

The exact sources read do not contain the present all-cell low-correlation theorem. The first-moment theorem is an explicit prior dependency, and the old small-correlation literature already explains why first-moment stability is relevant. The complete current proof is published as a proposed partial deduction while the expanded prior-art pass finishes. The Standard Simplex conjecture remains unresolved in this work, and the campaign resolution count is unchanged.
