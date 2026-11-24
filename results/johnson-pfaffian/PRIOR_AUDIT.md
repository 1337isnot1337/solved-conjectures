# Johnson's conjecture: source and prior-resolution audit

Date: 21 November 2026.

## Conclusion within the inspected sources

No earlier complete proof or refutation of Johnson's Conjecture 7.1 was found in the primary literature, author materials, public GitHub searches, or seven public archive snapshots examined below. The proposed proof has separately passed an independent mathematical review in [ANALYSIS_REVIEW.md](ANALYSIS_REVIEW.md).

This is a bounded priority conclusion. The separate full-content checks of OpenAI/math and MColbrook/AIM are complete and found no exact prior resolution; their scope and limits are recorded in the [additional archive audit](https://github.com/1337isnot1337/solved-conjectures/blob/research/research/2026-11-21-aim-openai-priority/AUDIT.md). Those repositories were inspected separately from mxym/math. No absence claim is made about private work, unindexed sources, deleted repository history, or results stated in terminology not caught by the documented searches.

## 1. Exact target and current source

The source is William Johnson, *Pfaffian Positivity for Convex Kernels and Optimal Matching Bounds*, [arXiv:2610.24371v1](https://arxiv.org/abs/2610.24371v1), submitted 17 October 2026. The live arXiv abstract page, inspected on the audit date, lists only v1. The local primary PDF has SHA-256 f672f2ce55d8567c9b89a506140d101d783225effb7b8f6d6fcaa3d58cc49193.

Conjecture 7.1, printed page 14, asks for the following universal comparison: for every positive even order, every strictly increasing real node configuration, every positive nonincreasing log-convex function on the positive half-line, and every perfect matching, the Pfaffian of the associated skew distance matrix is at least that matching's product of positive kernel entries. The proposed proof addresses this entire statement.

The distinction from results already in the paper is substantive:

- Proposition 4.2 gives an endpoint deletion inequality for arbitrary nonnegative additive interval matrices.
- Theorem 1.1 gives the nested rainbow matching bound for all positive nonincreasing convex kernels.
- The source also proves the relevant Albouy–Moeckel nonvanishing assertions.
- Section 7 proves the four-point log-convex comparison and explains the reduction to noncrossing matchings, then leaves the arbitrary-order all-matching assertion conjectural.

The proposed contribution is the use of circular interval products and positive vertex scaling to move the endpoint inequality to every adjacent pair. Iterating that inequality proves the all-matching assertion. The imported endpoint theorem and the preceding nonvanishing results receive explicit credit; they are not counted as new results.

This is an unrestricted kernel and matrix-order theorem. It is not a finite-order extension, one parameter value, or a numerical case. Its scope is a general matching-product inequality for an infinite-dimensional class of kernels. That is the concrete significance claim; the package does not claim a new solution of the already settled nonvanishing problem.

## 2. Author materials and closest primary antecedent

### Author repository

The author's [public repository](https://github.com/wlpjohnson-math/convex-pfaffian-positivity-lean) has current master commit [e09d0d825c7609530eeb36f32965f35e2c7d8687](https://github.com/wlpjohnson-math/convex-pfaffian-positivity-lean/commit/e09d0d825c7609530eeb36f32965f35e2c7d8687), dated 17 October 2026 at 00:58:35 UTC. The repository metadata reports no later push. Its complete issue list is empty.

I read the [README at that commit](https://github.com/wlpjohnson-math/convex-pfaffian-positivity-lean/blob/e09d0d825c7609530eeb36f32965f35e2c7d8687/README.md) and the result table and additional-results sections of [PaperCorrespondence.md](https://github.com/wlpjohnson-math/convex-pfaffian-positivity-lean/blob/e09d0d825c7609530eeb36f32965f35e2c7d8687/docs/PaperCorrespondence.md). They document the diameter, rainbow, endpoint, and related algebraic results. They do not announce an all-matching log-convex theorem. No formalization was run or developed during this audit.

The source paper's identifier and title were also checked through both search engines and the current arXiv record. No later paper resolving Conjecture 7.1 appeared in those searches. A public author-organization listing endpoint was unavailable through the connector; this audit does not assert that every possible author repository has been enumerated.

### Ferrario's current revision

The closest earlier paper is D. L. Ferrario, *On Certain Pfaffians Connected with the Inverse Problem for Collinear Central Configurations*, [arXiv:2604.14827v2](https://arxiv.org/html/2604.14827v2), dated 2 September 2026. Checking only the April v1 would have been insufficient. The current PDF was downloaded from the [unversioned primary PDF endpoint](https://arxiv.org/pdf/2604.14827); its title page identifies v2. Its SHA-256 is 672f0b92f890a15c25a28a2813e3d6dfd1a2d569a3221fd4123bd710b8ef466e.

I inspected the matrix hypotheses in Definition 3.1, the all-three-matching comparison in Proposition 3.8, the parameterization, Theorem 4.4 and Corollary 4.5, and the kernel applications in Section 5. Proposition 3.8 is explicitly a four-by-four result. The coefficient positivity and general-kernel positivity theorems are restricted to even orders at most fourteen. They do not establish the arbitrary-order assertion proposed here.

## 3. Differently named possible antecedents

The search was not limited to Johnson's name. Additional queries covered Pfaffian inequalities for Kalmanson matrices, anti-Monge matrices, logarithmic Monge data, circular split systems, circular interval products, and planar-network or Ising correlation matrices. No source giving the required unrestricted kernel inequality was identified.

A relevant primary source is P. Galashin and P. Pylyavskyy, [*Ising model and the positive orthogonal Grassmannian*](https://arxiv.org/abs/1807.03282), also available as an [author-hosted PDF](https://www.math.ucla.edu/~galashin/papers/ising.pdf). I read its main correspondence, Section 3.4, and the realizability discussion following Question 3.24. Proposition 3.12 records Griffiths inequalities for Ising spin correlations; Theorem 3.14 expresses them through nonnegative minors. The statements require a boundary correlation matrix of a planar ferromagnetic Ising network, or the corresponding total-nonnegativity hypothesis. They do not assert that arbitrary log-convex distance kernels, or arbitrary exponentials of circular split data up to vertex factors, satisfy that hypothesis.

I also inspected M. Lis's [*On Boundary Correlations in Planar Ashkin–Teller Models*](https://academic.oup.com/imrn/article/2022/13/9909/6133625?guestAccessKey=32b23e37-6038-4eeb-ad26-9bef4fe37e86), especially the introduction and Section 4's Pfaffian identities. Its conclusions concern correlations of the specified spin models. No automatic identification of Johnson's kernel class is stated there.

There is a simple check against silently assuming such an identification. Take four cyclic vertices and two crossing circular splits, each with weight log 2. In the natural exponential split-distance normalization, the adjacent correlations are one-half and the two diagonal correlations are one-quarter. The corresponding four-point Pfaffian is seven-sixteenths. If these were zero-field Ising boundary correlations with the Pfaffian four-spin relation, the elementary Fourier expansion of the alternating spin pattern's indicator would give

```math
\mathop{\mathrm{Pr}}(+,-,+,-)
=\frac{1-4(1/2)+2(1/4)+7/16}{16}
=-\frac1{256}.
```

Thus even this natural normalization is not automatically a planar Ising correlation matrix. This observation does not rule out a different gauge construction, but such a construction would need a separate theorem; none was found in the inspected sources.

The Kalmanson and circular-split connection is a useful description of the proposed theorem's domain, not evidence of priority by itself. The known spin-model inequalities are credited as related antecedents, and are not imported into the proposed proof.

## 4. Web and GitHub searches

Both available web search engines were used. Representative query families were:

- the exact arXiv identifier and the full paper title;
- William Johnson, Pfaffian, log-convex, and Conjecture 7.1;
- Pfaffian, matching-product bound, every perfect matching, or all matchings;
- Pfaffian with Kalmanson, anti-Monge, circular split, circular interval, and logarithmic Monge;
- Pfaffian, Ising, boundary, product, and inequality.

The current-source queries also used a recent-period filter. Results led to the original paper, its author repository, Ferrario's paper, the spin-model literature, and unrelated Pfaffian identities or graph-counting questions. Search snippets and catalog status labels were not accepted as proofs of either openness or resolution. In particular, a MathDB page still labels the older nonvanishing conjecture open despite Johnson's primary theorem; it was not used to determine mathematical status.

Global GitHub issue searches returned the following useful checks. Counts refer to the completed responses on the audit date:

| Query family | Returned items | Assessment |
|---|---:|---|
| Exact paper title | 1 | This campaign's issue 211 |
| Johnson and Pfaffian | 11 | Campaign issues and unrelated research or feed entries |
| Pfaffian and log-convex | 3 | Issue 211 and unrelated factoring/cryptographic coordination |
| wlpjohnson | 1 | Trure issue 29296, using a crossing-parity lemma |
| Pfaffian and Kalmanson | 1 | This campaign's issue 211 |
| Pfaffian and logarithmic Monge | 0 | No indexed issue returned |
| Pfaffian and every matching | 9 | No matching kernel theorem found |
| Pfaffian and all matchings | 7 | No matching kernel theorem found |
| Pfaffian within Trure | 25 | Distinct Pfaffian identities, graph signs, or other conjectures |

The exact dotted-identifier issue query returned zero even though the current campaign issue contains it; therefore that query was not treated as a reliable absence test. The title and conceptual queries provide the cross-check.

I read the mathematical scope of [Trure issue 29296](https://github.com/the-omega-institute/trureturing/issues/29296), rather than treating its author-repository citation as a collision. It concerns crossing-sign and colored-edge transport and explicitly reuses an adjacent crossing-parity fact. It gives no log-convex kernel inequality. The broader Trure issue results agree with the distinct subjects found in the archive content screen below.

All 201 comments in this repository's Minc issue 139 were searched, as were the Simon issue 103 comments. The Pfaffian lead in the former concerns characteristic-three Hadamard permanents. All 157 comments in the external factoring coordination issue 8 were searched; its Pfaffian constructions concern polynomial profile identities, not this conjecture. The current campaign issue 156 and named issue 211 remain coordination records, not independent prior sources.

Global code searches were also used. The exact identifier returned six indexed files: five numerical-data coincidences and one arXiv metadata fixture, whose complete record was inspected. The combined Pfaffian/log-convex query returned forty files. Relevant-looking mathematical documents were opened: the Principia Hoggatt proof cites the Baxter Pfaffian–Toeplitz paper; the BrettRey triage file discusses that same paper; a Derek Blair manuscript treats king-graph tilings; a Lehmer-project review concerns integral realizations; and a spin-model source concerns Pfaffian relations. None supplies the target assertion. Other results were bibliographic feeds, corpora, or unrelated records. The Pfaffian/Kalmanson code search returned six bibliographic or corpus files, without an identified theorem of the required scope.

A code search restricted to xzwwwwww/math returned zero but had incomplete_results set to true. It is recorded as inconclusive, not as a completed archive screen. This limitation is not replaced by the separate completed OpenAI/math and AIM checks.

## 5. Full-content public archive screens

The files were read from the existing pinned downloads. Archived code was not executed. Native UTF-8 bodies were searched irrespective of filename; PDF text and compressed source were included as described below. The broad term Pfaffian was used in addition to the exact identifier, title, author variants, and characteristic interval terminology, so a numeric directory name did not conceal an otherwise named Pfaffian statement.

The native archive pins and their original coverage records are documented in the campaign's [Trure/mxym/AFTD audit](https://github.com/1337isnot1337/solved-conjectures/blob/research/research/campaign-20261121/TRURE_MXYM_AFTD_AUDIT.md), [Principia audit](https://github.com/1337isnot1337/solved-conjectures/blob/research/research/2026-11-21-principia-fulltext-audit/PRINCIPIA_FULL_TEXT_AUDIT.md), and [ArtificialZeng audit](https://github.com/1337isnot1337/solved-conjectures/blob/research/research/2026-11-21-artificialzeng-priority/AUDIT.md). The following is a new Johnson-specific content search of those bodies.

| Public source | Pinned commit | Johnson-specific coverage and outcome |
|---|---|---|
| the-omega-institute/trureturing | de22a48707da1c7a48d032909e821bd481947b45 | All 75,410 regular UTF-8 files; fifty broad matches, no exact identifier/title/author match |
| mxym/math | 4a51ff772a566451627b9ff41f6248518561d9d4 | 23,631 native UTF-8 files; 24,224 supplementary text records including 192 PDF extractions; 1,454 joined-split records; no relevant match |
| PrincipiaMathOrg/math-solutions | 47371706c400c79d06e3fb62190fcf6f7a725c85 | 1,453 native texts, 274 PDF texts, and thirteen ZIP text entries; six broad matching units, all unrelated |
| rainwangphy/aftd-platform | a92dfddb67e6569f576a813bc2079f5233540ac9 | Complete downloaded public database: 17,937 declarations, 6,424 open records, 1,647 literature records, and 79 news entries; thirteen unrelated records |
| ArtificialZeng/AI-Has-Taste | 65eb1f5a92a3a8b80c9e92187825ac9231f86fb2 | Algebra reviewer's new scan of all 14,105 regular UTF-8 bodies and 472 extracted PDF texts; no Pfaffian, exact-identifier, author-handle, or Kalmanson match |
| MColbrook/AIM | b2ec0fac559f532fc0ed04fce81deea0ce07c68b | All 4,624 native UTF-8 files, 144 PDF texts, and 2,029 embedded text entries; twelve native broad Pfaffian matches, no supplementary match; no exact prior resolution |
| OpenAI/math | 4eaee87548250b2682affda7d05d947c05554bae | All 173,622 native UTF-8 files and 789 nonempty PDF texts; 113 native and 26 PDF broad Pfaffian matches; no exact prior resolution |

The Trure hits were read by mathematical subject: normalized Pfaffian identities, planar matching signs, the Ishikawa–Koutschan Motzkin refutation, Callan's hafnian formula, involution-cycle identities, and Bose-selection Pfaffians. The two interval-phrase matches concern unrelated complexity or number-theory arguments. None states the target kernel comparison.

The only native mxym hit is an unrelated multiplicative interval in a harmonic-degree construction. Neither its compressed/PDF supplement nor its joined-split supplement produced any hit.

The Principia hits are Pfaff–Saalschütz identities and a Baxter Pfaffian–Toeplitz bibliography. The AFTD hits concern graph Pfaffian orientations, symbolic Pfaffian number, circular graph intervals, and unrelated rationale text. The actual matched declarations and source statements were inspected.

The ArtificialZeng scan and its exact results are preserved by the algebra reviewer in [the research scanner](https://github.com/1337isnot1337/solved-conjectures/blob/research/research/johnson-pfaffian/scan_artificial_prior.py) and [its report](https://github.com/1337isnot1337/solved-conjectures/blob/research/research/johnson-pfaffian/artificial-prior/matches.json). This report does not turn that independent scan into a claim that every binary byte was semantically searched.

The AIM and OpenAI source comparisons are recorded in the [coordinator's scope review](https://github.com/1337isnot1337/solved-conjectures/blob/research/research/2026-11-21-aim-openai-priority/ROOT_SCOPE.md) and [analysis scope review](https://github.com/1337isnot1337/solved-conjectures/blob/research/research/2026-11-21-aim-openai-priority/ANALYSIS_SCOPE.md). The closest OpenAI sources concern explicit trigonometric/hyperbolic honeycomb kernels and physical Ising boundary correlations. Their Fourier-weight, Gram-matrix, or physical-realization hypotheses do not supply the arbitrary positive decreasing log-convex distance-kernel theorem. The remaining matches concern graph orientations, algebraic/exterior Pfaffians, curvature estimates, or Pfaffian differential systems. Actual statements and hypotheses, including every Pfaffian occurrence in the three closest Ising PDFs, were compared. Neither snapshot has an exact Johnson identifier, author-handle, or Kalmanson match.

Both additional native archives were rescanned with Unicode NFKC followed by case folding: 4,624 AIM files and 173,622 OpenAI files. This produced zero additional target/file matches. The separate ArtificialZeng Johnson pass also uses NFKC followed by case folding. The local Principia/AFTD scanner records its own normalization in the companion JSON.

### Archive limitations

- Trure contains three skipped symlink entries; every regular UTF-8 file was read.
- mxym's compressed supplement initially reports split-stream fragments as undecodable or incomplete gzip. All seven joined streams were then processed successfully. The residual binary exclusions are the eighteen compiled-object/image/numerical files documented in the earlier campaign audit. No 256 MiB size limit or depth-eight recursion limit was reached.
- Principia's already extracted PDF texts cover all 274 PDFs in the pinned source tree. The scan also read all thirteen UTF-8 entries in its source ZIP. It is a current-tree screen, not an exhaustive search of deleted commits.
- AFTD coverage is the complete public database and news snapshots at the stated pin, not every historical repository object.
- ArtificialZeng retains the prior audit's binary exclusions: two textless knight-tour figure PDFs, binary arrays and images, and a one-MiB expansion cap for numerical gzip bodies. Those limits are explicit.
- AIM's 124 residual nontext entries are 122 numerical `.npy` arrays and two PNG diagrams. All 144 PDFs and 2,029 embedded text records were processed. OpenAI's 113 residual entries are 110 numerical mutually-unbiased-basis `.bin` files and three PNG diagrams. All 789 OpenAI PDFs produced nonempty text. No OCR was applied to images, and no numerical arrays were interpreted as prose. No 256 MiB expanded-entry or depth-eight recursion limit was reached in these two supplements.
- Text searches cannot exclude a mathematically equivalent theorem that is indexed under unrelated terminology and lacks all the searched words. The direct primary-antecedent review reduces this risk but cannot prove its absence.

## 6. Reproducible reading record

The companion PRIOR_SCAN.json records the archive counts, hashes, query counts, and local audit artifact names. The Johnson-specific local working directory is agent-analysis/johnson-priority. It contains the complete matching-file lists and the read-only scanners; the large public archives and copyrighted primary PDFs are not copied into the repository deliverable.

The source PDF hashes above identify the copies actually read. The Galashin–Pylyavskyy author PDF has SHA-256 bb7a95026b2a660432762c1cee3ca5aceb64a3a2dbd6032bdb7288a7f71e3a30. No assertion of mathematical novelty rests on a catalog's open/solved flag, a failed download, or an incomplete code-search response.


The [local index scanner](https://github.com/1337isnot1337/solved-conjectures/blob/research/research/johnson-pfaffian/scan_local_indexes.py) records the Principia/AFTD pass. It requires the separately downloaded archive working files; it is a literature-discovery aid, not a mathematical verifier.

Use `python3 research/johnson-pfaffian/scan_local_indexes.py --workspace /path/to/archive-workspace --output /path/to/audit-output` from the repository root. The workspace layout and required source inputs are recorded in `PRIOR_SCAN.json`; missing inputs are rejected rather than reported as an empty search.
