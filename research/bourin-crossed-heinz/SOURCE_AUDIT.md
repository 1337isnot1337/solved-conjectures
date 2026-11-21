# Source and prior-status check

Checked 21 November 2026. This is a research-stage audit with the access and archive limits stated below. No full proof or disproof of the exact all-norm conjecture was found within this scope. That statement is not a claim of exhaustive literature coverage or a priority certificate for the partial lemmas in this directory.

## Binding statement and current primary papers

| Primary source | Exact relevant scope | Access in this check |
|---|---|---|
| J.-C. Bourin, *Matrix Subadditivity Inequalities and Block-Matrices*, arXiv:0805.1954v1; International Journal of Mathematics 20 (2009), 679–691, DOI10.1142/S0129167X09005509 | Question 4, printed page 6, asks the all-dimension, all-positive-exponent, all-unitarily-invariant-norm inequality recorded in the landing page. | [Original PDF](https://arxiv.org/pdf/0805.1954), exact question read. The paper contains other questions whose resolutions do not resolve this one. |
| F. Kittaneh and É. Ricard, *On a question of Bourin*, Linear Algebra and its Applications 710 (2025), 356–362, DOI10.1016/j.laa.2025.02.004 | Constant one for every unitarily invariant norm in the central interval $`1/4\leq t\leq3/4`$. | [Publisher record](https://doi.org/10.1016/j.laa.2025.02.004) and the precise statement in the current primary papers below. This checkpoint does not claim a fresh full-text read of its proof. |
| M. Sababheh and J.-C. Bourin, *Crossed-Heinz Inequalities*, arXiv:2610.04567v2, 12 November 2026 | All unitarily invariant norms and all parameters in dimension two. Proposition 2.1 also recalls the all-dimension trace-norm bound. Its abstract and introduction leave the full original problem open. | [Complete seven-page manuscript](https://arxiv.cnoctave.top/pdf/2610.04567) read. The earlier version's longer title should not be mistaken for another full solution. |
| Y. Tian and J. Xu, *Bourin's Crossed-Heinz Inequality in the Operator and Frobenius Norms*, arXiv:2611.22363v2, 18 November 2026 | Theorem 1.1 proves the operator-norm inequality for all dimensions and parameters; Theorem 1.2 proves the Frobenius inequality with a quantitative remainder. Neither asserts every unitarily invariant norm. | [Complete five-page manuscript](https://arxiv.cnoctave.top/pdf/2611.22363) read, including the contraction decomposition used for Theorem 1.1. Independently read by the combinatorics reviewer. |
| T. Bottazzi, R. Elencwajg, G. Larotonda, A. Varela, *Inequalities related to Bourin and Heinz means with a complex parameter*, Journal of Mathematical Analysis and Applications, DOI10.1016/j.jmaa.2015.01.046 | Refutes the stronger domination by the ordinary Heinz expression, and an individual-singular-value comparison. These are stronger assertions than the weak-majorization target. | [Publisher abstract](https://doi.org/10.1016/j.jmaa.2015.01.046) read; exact obstruction also identified in the two current manuscripts. No new full-text verification of that older counterexample is claimed here. |
| M. Hayajneh, S. Hayajneh, F. Kittaneh, *A Unitarily Invariant Norm Inequality for Positive Semidefinite Matrices and a Question of Bourin*, Results in Mathematics 78:158 (2023), DOI10.1007/s00025-023-01929-z | Studies exactly the sandwiched functional in `BRIDGES.md`, with complementary parameter, and proves the factor $`2^{1-4t}`$ for $`0\leq t\leq1/4`$. The constant-one endpoint yields a known Bourin parameter case. | [Publisher abstract](https://link.springer.com/article/10.1007/s00025-023-01929-z) and its first-page preview on [ResearchGate](https://www.researchgate.net/publication/371411091_A_Unitarily_Invariant_Norm_Inequality_for_Positive_Semidefinite_Matrices_and_a_Question_of_Bourin) read. The remaining eight pages were not obtained. |

The December 2024 book chapter *Norm Inequalities for Positive Semidefinite Matrices* appeared in search results with the last paper's formula inside its reference section. Inspection separated the cited 2023 article from the chapter itself. The formula is not attributed to the chapter's authors here.

The operator and trace bounds on a single expression do not interpolate into the missing Ky Fan bounds. A simultaneous linear map contractive on both endpoint Schatten norms would be a sufficient mechanism, but the particular spectral map in `BRIDGES.md` fails this condition. No existence or impossibility result for every possible such map is asserted.

## Search and repository coordination

The original title, “Bourin's conjecture,” “Bourin's question,” “crossed-Heinz,” the source identifiers, current author names, and the sandwiched formula were searched through both built-in search engines. Current primary revisions were read rather than relying on old open-problem summaries. The repository's current issue list was checked before reserving issue 214. A global issue query for “crossed-Heinz” produced a Trure item about a different fixed-input defect statement, not a proof of this target.

The general matrix target screen also encountered Qiyue Tang's *Lu–Wenzel Conjecture* manuscript, Hexagon:2611.00179v2. Its full primary Theorem 1 asserts that complete spectral conjecture, so Lu–Wenzel was excluded before computation. Lieb and Chollet were already reserved by the separate group in issue 139 and were not taken over.

## Bounded native archive scan

`scan_native_archives.py` applies Unicode NFKC normalization and case folding, then searches decoded UTF-8 bodies no larger than 20,000,000 bytes. It calls the shared bounded scanner in the adjacent Audenaert research directory. The patterns are

```text
crossed[\s\-–—]{0,5}heinz
0805[.]1954
2611[.]22363
2610[.]04567
bourin.{0,20}(?:question|conjecture)
```

The manifest in [ARCHIVE_SCAN.json](ARCHIVE_SCAN.json) records exact snapshot pins and counts. Native bodies are searched, not merely filenames or repository READMEs. Binary bodies, embedded compressed sources, entries exceeding the size limit, and PDFs needing extraction are outside this pass. The Trure tarball used here is the previously assembled native-text corpus, so its zero binary skips do not mean the original repository had no PDFs. Snapshot dates can precede the newest primary papers; this is additional source discovery, not proof of absence through the current day.

| Snapshot | UTF-8 bodies searched | Matching bodies | Entries skipped: size / NUL prefix / decode |
|---|---:|---:|---:|
| Trure | 75,410 | 112 | 0 / 0 / 0 |
| ArtificialZeng | 14,099 | 0 | 4 / 613 / 1 |
| mxym | 23,630 | 0 | 1 / 486 / 1 |
| AIM | 4,624 | 1 | 0 / 163 / 0 |
| OpenAI | 173,542 | 0 | 1 / 978 / 3 |
| Principia | 1,453 | 0 | 0 / 273 / 2 |

The direct Trure hit `Problems/bourin-2008-matrix-subadditivity-question-1.md` was read in full. It resolves Bourin's **Question 1**, about positive linear maps reflecting contractions and a concave functional-calculus norm inequality. Its map example is unrelated to Question 4's two-matrix powers. Other Trure hits repeat that dependency or concern other Bourin inequalities. The AIM hit is a source-filtered status-screen JSON containing an older MI02 snippet, not a proof. No exact-target resolution was found among the retrieved native matches. Full unmatched binary and compressed content has not been cleared for this target.

## Status of the deductions in this directory

The endpoint proofs were checked mathematically by two lanes, with the global Tian–Xu theorem explicitly imported. The two contraction failures have exact formulas and a supplementary rational replay. Their novelty has not been established. No new full-conjecture claim, independent named subproblem, formal verification, or resolution count follows from this checkpoint.
