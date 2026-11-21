# Standard Simplex: negative-correlation scope and prior-work audit

Audit dated 21 November 2026. The comparison target is the proposed partial theorem in [NEGATIVE_CORRELATION.md](NEGATIVE_CORRELATION.md). The current primary-source and public-search comparison is complete within the limits below. The [independent negative-specific archive comparison](NEGATIVE_ARCHIVE_COMPARISON.md) is also complete within its stated scope. The completed positive-correlation audit is not substituted for this negative comparison.

## Exact claim and original scope

For each fixed integer $`q\ge3`$, the claim is that there exists $`t_q>0`$, independent of ambient dimension, such that the central regular-simplex partition uniquely minimizes $`S_{-t}`$ among **all** measurable $`q`$-partitions of $`\mathbb R^d`$ for every $`d\ge q-1`$ and $`0\lt t\le t_q`$. Cell masses are unrestricted and empty cells are permitted.

This is only a neighborhood of zero on the negative side. It is not the full negative interval, the full Standard Simplex conjecture, a fixed-cell theorem, or a classification conditional on hyperstability.

The exact original source is Isaksson–Mossel, [arXiv:0903.3362v3](https://arxiv.org/pdf/0903.3362v3), Conjecture 1.4, printed page 2. Its positive clause assumes balance. Its negative clause reverses the inequality without assuming balance. The conjecture fixes $`\rho\in[-1,1]`$ and $`3\le q\le n+1`$. The range $`[-1/(q-1),1]`$ appearing later in the paper belongs to the discrete plurality formulation and its invariance principle; it is not an additional restriction on the Gaussian clause.

The stored original PDF was read directly at that statement and surrounding definitions. It has 456,179 bytes and SHA-256 `0139d6227302dea3696bfd9af1d09ec6f17bf2d377cbc3e2807e5ccd96eb315e`. A fresh web request for the original versioned PDF returned a disabled-fetch error. That failure is not used as status evidence; the independently retained primary copy supplies the exact text.

## Primary statements compared

| Source | Statement and hypotheses read | Comparison with the present partial theorem |
|---|---|---|
| Isaksson–Mossel, [0903.3362v3](https://arxiv.org/pdf/0903.3362v3), Conjecture 1.4 | All admissible cell counts and dimensions; unrestricted masses for negative correlation | Original conjecture, not a resolution |
| Heilman, [Euclidean partitions optimizing noise stability, 1211.7138v2](https://arxiv.org/pdf/1211.7138v2), Theorems 7.2–7.4 and Section 8 | The positive small-correlation method and a failure of an auxiliary derivative-functional extremum at negative correlation | Theorem 7.4 concerns the auxiliary functional $`\psi_\rho`$, not a counterexample to minimizing $`S_\rho`$. The present proof controls $`S_{-t}`$ directly |
| Heilman–Tarter, [Three candidate plurality is stablest for small correlations](https://doi.org/10.1017/fms.2021.56), Section 7 | A bilinear negative-correlation formulation, with fixed common cell masses for its two partitions, and dimension reduction | The formulation and reduction do not identify an arbitrary-cell optimizer; they are not an all-cell small-negative theorem |
| Heilman, [Hyperstable Sets with Voting and Algorithmic Hardness Applications](https://www.stevenheilman.org/~heilman/papers/hyper.pdf), Section 7 and Theorem 7.9, with the main conditional statements | Bilinear minimizers with corresponding cell masses equal have dimension at most the number of cells minus one; further classifications require hyperstability and concern three or four cells | Dimension reduction does not prove the remaining optimizer statement. No hyperstability assumption is present in the current theorem |
| Heilman, [Three candidate plurality is stablest for correlations at most 1/10](https://www.stevenheilman.org/~heilman/papers/corthreev3.pdf), dated 10 August 2023, Theorem 1.5 | Three-cell comparison in every ambient dimension, with unrestricted masses on its stated small negative interval; the displayed theorem includes $`-.0234\le\rho<0`$ | The three-cell negative case was already proved. It is not claimed as a new special case here |
| Heilman, [Sharp Hardness for MAX-3-CUT and Quantum MAX-CUT](https://www.stevenheilman.org/~heilman/papers/plur.pdf), dated 31 July 2026, Theorem 7.1, printed page 21, and Section 1.4 | Every measurable three-cell partition in every dimension at least two, $`-1/2\le\rho<0`$, no mass restriction; four or more cells are separately discussed as largely open | A stronger range for three cells, not an arbitrary-cell theorem |
| Heilman, [On the Propeller Conjecture](https://www.stevenheilman.org/~heilman/papers/prop26.pdf), dated 26 October 2026, Theorem 1.1 and introductory scope discussion | An unrestricted first-moment maximum, attained with three nonempty sectors, with finite-correlation and prescribed-mass questions distinguished | This does not imply the negative-noise minimum: its leading mass term is different. It is not imported as a balanced extremum |

The source distinction in the older negative obstruction matters. Differentiating the noise functional and proving an optimizer for the differentiated expression would be one route to a noise theorem, but failure of that auxiliary route is not a refutation of the original noise comparison. The present proof uses weighted potential and Hermite estimates in the exact undifferentiated noise identity.

The 2022 bilinear reduction is also stronger than a mere fixed-mass calculation in its own direction: it permits the common mass profile to vary while requiring the two partitions to have matching profiles. That existence/dimension statement still leaves the geometric minimizer unidentified. The proposed result here concerns one partition paired with its reflection through the negative noise identity; it does not claim the full bilinear conjecture.

### Current source access and versions

The current author copy `plur.pdf` was opened afresh through the web tool, and its Theorem 7.1 and future-work discussion were read. Its already retained local copy has 572,526 bytes and SHA-256 `26444da2747fb4cff4a08ba5b4ce78704915a2e87fd9a6786360f2986505c165`. The corresponding currently served unversioned [arXiv PDF](https://arxiv.org/pdf/2608.00333) was downloaded in the immediately preceding audit and is byte-identical to the inspected v1: 572,830 bytes, SHA-256 `225a538b41d36176f70f166df6f412e6459826f08048393ba317cc6d8c1ee25b`. This is a current-copy check, not a reconstruction of every version-history event.

The current author `hyper.pdf` was also opened afresh, and the actual Section 7 formulation, Theorem 7.9, and conditional scope were read. The stored primary source copy used in the component audit has SHA-256 `5172a14e41bdad1d370b1e1073427a64b09920cfebaacc68bc2d7ba87f9a21c1`. The stored three-cell small-correlation source has SHA-256 `984d6bf038f1281a4b427c7d7bdce7aa98e9044fed196b9628ece21780215ac3`; the older Euclidean-partitions source has SHA-256 `5e5fe4c3cca5db6c46293bebf70e27e4958cff853ff6c4390e7892848424fcf3`.

No source-status sentence is used as a mathematical premise. In particular, the current author's status discussion does not acknowledge the separate October 2026 public first-moment manuscript used below. That omission neither verifies nor disproves the latter argument.

## Explicit prior dependency

The all-cell balanced first-moment extremum and covariance identities are from the prior unrefereed [mxym/math manuscript dated 8 October 2026](https://github.com/mxym/math/blob/4a51ff772a566451627b9ff41f6248518561d9d4/research/gaussian-balanced-simplex-all-k/paper.md). Its written argument was read and checked before the current positive and negative deductions. It explicitly stops before finite-correlation noise optimality.

The present proof uses that balanced theorem only after an explicit proportional balancing operation, or through the local unequal-mass assignment estimate with its mass-error term. It does not assume a global unrestricted first-moment theorem. Existing three-cell results and existing first-moment results are credited inputs or overlaps, not new results counted by this campaign.

## Negative-specific public searches

Both web engines were used afresh for the negative statement. Queries and returned GitHub issue metadata are recorded in [NEGATIVE_PRIOR_SEARCH.json](NEGATIVE_PRIOR_SEARCH.json). Representative query terms include:

- “standard simplex” with “negative,” “small,” and “all partitions”;
- “regular simplex” with “negative correlations” and “arbitrary number”;
- “Gaussian noise stability” with “small negative” and “partitions”;
- “simplex” with “unrestricted” and “negative correlation”;
- “standard simplex” with “negative,” “four,” and “theorem.”

The stronger engine used a 365-day freshness parameter for current-status checks. The relevant returned primary sources were the original/three-cell statements, the bilinear dimension-reduction paper, and the hyperstable conditional paper. The broader second-engine variants also returned unrelated simplex optimization, correlation statistics, and Gaussian-maxima/weak-simplex discussions. Those are not evidence about the exact partition optimizer. A catalog's open label was used only as a source lead, not as proof that no earlier theorem exists.

Five global GitHub issue queries returned 68, 95, 31, zero, and 14 records, respectively. The query metadata distinguishes the broader comment-capable searches from those restricted to title/body. Titles and potentially relevant body passages were screened; apart from this repository's own target record, the substantive matched uses of “standard simplex” concerned topology, spectral-volume calculations, ordinary probability simplexes, linear programming, or unrelated research. A “Gaussian partition” lexical match was an API name for a random graph generator. No earlier exact theorem was identified in the returned passages. Not every comment of every unrelated issue was read, and the zero-result query is not treated as proof of absence.

## Direct archive scope

The six pinned archives and their decoding limits remain those of [LOW_CORRELATION_PRIOR_AUDIT.md](LOW_CORRELATION_PRIOR_AUDIT.md) and [LOW_CORRELATION_SCAN.json](LOW_CORRELATION_SCAN.json). They include 292,845 native UTF-8 bodies, 1,871 PDF conversions, and 19,795 embedded UTF-8 bodies in the main pass, with the separate AIM/OpenAI supplement and broader native residual documented there.

The independent [NEGATIVE_ARCHIVE_COMPARISON.md](NEGATIVE_ARCHIVE_COMPARISON.md) rereads 22 relevant archive bodies and four primary texts, with exact paths, hashes, and reading scopes in [NEGATIVE_PRIOR_REREAD.json](NEGATIVE_PRIOR_REREAD.json). It checks the AIM unrestricted-mass negative record, three-cell and conditional results, the credited balanced first-moment theorem, the positive-only mass envelope, positive fan-only comparisons, and the unrestricted propeller objective. The mass-envelope source explicitly excludes its monotone-remainder argument at negative correlation. Its scope and the unequal prescribed-mass translated-simplex counterexample therefore do not settle the current central-simplex minimum. No new all-archive scan is claimed by reusing these bodies.

The existing byte, gzip, depth, binary, textless-figure, and split-payload limits remain in force. They are not erased by the negative-specific comparison, and the audit does not claim exhaustive OCR or binary coverage.

## Current bounded conclusion

No earlier exact all-cell, dimension-independent small-negative-correlation theorem was found in the primary statements, public-search passages, and negative-specific archive bodies read. This is a proposed deduction from explicitly credited prior first-moment inputs, with mathematical review separate from priority. It does not resolve the full Standard Simplex conjecture, does not change the campaign resolution count, and does not assert worldwide first discovery or external acceptance.

