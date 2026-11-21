# Standard Simplex conjecture: low-correlation scope audit

Checkpoint dated 21 November 2026. **Status: primary literature, the expanded six-archive pass, the independent supplemental comparison, and the broader native-text residual completed.** The written partial theorem and its mathematical reviews are available in [SMALL_CORRELATION.md](SMALL_CORRELATION.md). This is a bounded prior-work audit, not a claim of worldwide priority or a full-conjecture resolution.

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
| Heilman, [On the Propeller Conjecture](https://www.stevenheilman.org/~heilman/papers/prop26.pdf), dated 26 October 2026, Theorem 1.1 and Sections 1–1.2 | Unrestricted first-moment maximum with three nonempty sectors; distinguishes prescribed masses and finite-correlation noise stability | Does not prove the balanced finite-correlation theorem. Its status discussion does not acknowledge the earlier public balanced first-moment manuscript used here |
| Heilman, [Stable Gaussian minimal bubbles](https://doi.org/10.1007/s00526-026-03408-z), Corollary 1.11 and preceding paragraph | An asymptotic comparison with an error term for $`1/2<\rho<1`$, approaching Gaussian perimeter as $`\rho\uparrow1`$ | The phrase “small noise” in its heading is not the low-correlation regime or the exact comparison proved here |
| `mxym/math`, [Equal Gaussian cells: the sharp simplex first-moment theorem](https://github.com/mxym/math/blob/4a51ff772a566451627b9ff41f6248518561d9d4/research/gaussian-balanced-simplex-all-k/paper.md), dated 8 October 2026 | The sharp balanced first-moment extremum for all cell counts, with equality and a covariance-deficit integral; explicitly says it is not finite-correlation noise stability | Credited prior input. Its complete written argument was checked; the current theorem is a proposed subsequent deduction |

The pinned first-moment manuscript is unrefereed public research. Its existing extremum and covariance identities are not claimed as new. The current peer-agent reviews are mathematical checks, not external acceptance of that source or of the new deduction.

The earlier direct primary-source copies and hashes are recorded in [PRIOR_AUDIT.md](PRIOR_AUDIT.md) and [STABILITY_PRIOR_AUDIT.md](STABILITY_PRIOR_AUDIT.md). A fresh download of the current unversioned [arXiv PDF](https://arxiv.org/pdf/2608.00333) is byte-identical to the version already read: 572,830 bytes, SHA-256 `225a538b41d36176f70f166df6f412e6459826f08048393ba317cc6d8c1ee25b`. This checks the currently served PDF; it is not a complete reconstruction of arXiv version history. The current abstract-page web request failed, and that failure is not used as status evidence.

Two current author copies were also downloaded and read at the statements and scope discussions. [The July 31 hardness manuscript](https://www.stevenheilman.org/~heilman/papers/plur.pdf) has 572,526 bytes and SHA-256 `26444da2747fb4cff4a08ba5b4ce78704915a2e87fd9a6786360f2986505c165`; its Section 1.4 again leaves four or more cells largely open. [The October 26 propeller manuscript](https://www.stevenheilman.org/~heilman/papers/prop26.pdf) has 476,204 bytes and SHA-256 `13f5ddf89e2358c8fafa50e8f5ec16891555a31f182231bfe2751a06bb69e947`. Its discussion of constrained first moments as open is a status statement, not a mathematical objection to the separately inspected October 8 `mxym/math` argument. Neither its propeller theorem nor its status wording is substituted for checking that dependency.

## Current public searches

Both web engines were used on the exact name and on variants including “regular simplex small correlations,” “standard simplex all low correlation,” “balanced first-moment noise simplex,” and “noise stability every number small.” The stronger engine was used for current-status verification. The relevant returns were the primary three-candidate papers, the recent Gaussian maxima/weak-simplex papers already compared in the first-moment audit, and the distinct near-one minimal-bubble result above. No exact earlier all-cell low-correlation theorem was identified in those results. Broad queries also returned unrelated optimization, Gaussian covariance estimation, and voting discussions; they were not treated as evidence about the claim.

The fresh global GitHub issue queries were:

- `is:issue "standard simplex" "correlation"`: thirteen returned issues. Two are the current repository's own research issues; the other returned bodies concern neural-network Gram matrices, coupon collection, software, or unrelated research. No exact theorem was identified in the returned bodies. Not every comment of every unrelated issue was exhaustively read.
- `is:issue "gaussian-balanced-simplex-all-k"`: zero returned issues.
- `is:issue "simplex" "small correlations"`: six returned issues, including arXiv feed aggregations and unrelated software/research discussions. In the three repeated October 6, 2023 feed bodies, the matched small-correlation passage is about synthetic images for data-free quantization. Search terms can also match issue comments, which were not exhaustively read for every unrelated issue. This is a lead screen, not a proof of absence from all public issues.

The initial exact-source and original-conjecture issue searches remain recorded in [PRIOR_AUDIT.md](PRIOR_AUDIT.md). A result's absence from a catalog or query is not used as a mathematical premise.

## Expanded direct archive pass

The reproducible [scan_low_correlation_prior.py](scan_low_correlation_prior.py) searches six separately downloaded, pinned public archives. It reads native UTF-8 bodies, converts PDF text, expands ZIP/gzip/tar payloads, and joins recognized split compressed bodies. It never executes archive code. Text is normalized with Unicode NFKC and then casefold. The exact regular expressions and all bounds are part of the script.

The source snapshots are the same six pinned commits listed in [PRIOR_SCAN.json](PRIOR_SCAN.json). The expanded patterns include original identifiers, Standard Simplex/plurality, author names, balanced Gaussian/centroid terminology, low-correlation language, and first-moment stability. The compact [LOW_CORRELATION_SCAN.json](LOW_CORRELATION_SCAN.json) records counts, matched paths, text hashes, conversion records, and limitations without redistributing full manuscripts.

| Pinned archive | Native UTF-8 bodies | Converted PDFs | Embedded UTF-8 bodies | Main-pass matching bodies |
|---|---:|---:|---:|---:|
| Trure | 75,410 | 0 | 0 | 83 |
| Principia | 1,453 | 274 | 13 | 2 |
| AIM | 4,624 | 144 | 2,028 | 85 |
| `mxym/math` | 23,631 | 192 | 17,721 | 493 |
| ArtificialZeng | 14,105 | 472 | 33 | 23 |
| OpenAI/math | 173,622 | 789 | 0 | 164 |

These are processed bodies, not distinct mathematical papers. Duplicated source/PDF/release copies are counted separately. The primary pass has 292,845 native UTF-8 bodies, 1,871 converted PDFs, and 19,795 embedded UTF-8 bodies. Two ArtificialZeng PDFs are textless knight-tour figures and remain explicit exceptions; all 789 OpenAI PDFs have nonempty text.

The independent [supplemental audit](low-correlation-supplement/SUPPLEMENTAL_SCOPE.md) applies broader literal terms, including standalone plurality, noise stability, Gaussian simplex, and two additional source identifiers. It reads all 144 AIM PDFs plus 2,029 embedded text bodies and all 789 OpenAI PDFs. Its 91 matched bodies have explicit reading scopes and classifications. Its larger gzip bound expands the additional AIM Freudenthal certificate JSON omitted by the main 16 MiB bound; that body has no target match.

The completed [native-text residual](LOW_CORRELATION_NATIVE_RESIDUAL.json), reproduced by [scan_low_correlation_native_residual.py](scan_low_correlation_native_residual.py), applies those broader literal terms to all 292,845 native UTF-8 bodies with NFKC, casefold, and collapsed whitespace. It finds 239 additional matching bodies: 106 Trure, 14 Principia, 14 AIM, 21 mxym, 17 ArtificialZeng, and 67 OpenAI. Of these, 179 are the literal substring “near independence” inside “linear independence,” checked against the saved bodies. The remaining records are classified individually: circular-word reconstruction, finite-qubit repair, Gaussian-problem cross-references, already inspected first-moment provenance, popular matchings, Boolean/finite-field plurality decoding, binary cuts, diluted-spin pressure, and arithmetic or Ising correlations. No new exact optimizer theorem occurs in the inspected statements. The residual has no native-entry size failure; non-UTF-8 coverage remains the separate bounded pass above.

[LOW_CORRELATION_ARCHIVE_SCOPE.md](LOW_CORRELATION_ARCHIVE_SCOPE.md) states the semantic comparisons. The potentially relevant exact claims include the credited all-cell first-moment theorem, a finite-noise additive envelope, comparisons only against equiangular planar fans, prescribed-mass first-moment bounds, the unrestricted propeller theorem, and binary cut/information inequalities. None is silently treated as an earlier arbitrary balanced-partition optimizer theorem.

The main scanner limits a single entry to 256 MiB, gzip expansion to 16 MiB, and recursive depth to eight; every skipped binary, size limit, empty PDF, or conversion failure is recorded. The independent supplemental pass uses a 256 MiB gzip bound. AIM's remaining 124 binaries are NumPy arrays and two figures. OpenAI's remaining 113 binaries are 110 mutually-unbiased-bases data files and three figures. Their contents were not semantically inspected merely because their paths identify a different subject.

The `mxym/math` main log has 18 gzip-size limits, five initial split-chunk gzip errors, and 35 binary records. Four Bapat split groups are subsequently joined and decoded; the quadratic-orders joined archive still exceeds the gzip bound. The retained raw records are not all independent missing payloads. The potentially ambiguous three `simplex-upper`/`simplex-lower` proof graphs were traced through the finalization README to their exact written upper/lower theorems: they concern Euclidean projection-body/pyramid volume defects and maximum inscribed simplexes. The [scope note](LOW_CORRELATION_ARCHIVE_SCOPE.md) gives the immutable links and hashes. Those compressed payloads remain unsearched. Other size-limited paths concern APPT, proof-graph/extraction records, and related archived certificates. The Gaussian four-cell rigidity figure is unconverted; its textual theorem and proof source were read. ArtificialZeng retains 15 gzip-size limits, 99 binary records, and the two textless knight-tour figures. These limits are not erased by assigning subjects from file names. No claim of exhaustive binary/OCR coverage is made.

## Bounded conclusion

No earlier instance of the exact all-cell low-positive-correlation theorem was found in the primary statements and matched archive bodies inspected. This does not prove absence from all public or unpublished sources. The first-moment theorem is an explicit prior dependency, and the old small-correlation literature already explains why first-moment stability is relevant. The current proof is a proposed subsequent deduction with three mathematical reviews, not an assertion of external acceptance. The Standard Simplex conjecture remains unresolved in this work, and the campaign resolution count is unchanged.
