# AIM and OpenAI full-content priority audit

Date: 21 November 2026.

## Finding and scope

No additional prior resolution of the campaign's current twelve proposed resolutions or Johnson's pending Conjecture 7.1 was identified in the two public snapshots inspected here. The two already confirmed Principia collisions, Fang–Zhang–Zhao and Sun–Zhao, remain withdrawn. This audit supplies no reason to restore either one.

The conclusion is limited to the documented sources and comparisons. It is not a proof that no earlier argument exists. All campaign results remain unrefereed proposed proofs or disproofs, with mathematical correctness and priority reviewed separately.

This audit was added after discovering that `openai/math` is a distinct repository from the previously inspected `mxym/math`. The AIM catalogue also contained a lead to Sra's Macdonald manuscript that required a fresh statement-level comparison. Catalogue status labels were not accepted as evidence of mathematical resolution or openness.

The fifteen target families consist of the twelve results admitted at the start of this audit, the two withdrawn families, and Johnson's candidate. The exact identifiers and broader terminology searched are preserved in [targets.json](targets.json). The earlier full-content audits of Principia, Trure, mxym, AFTD, and ArtificialZeng remain separate records; this report does not replace or enlarge their stated coverage.

## Pinned source coverage

| Source | Commit | Complete native UTF-8 bodies | Supplementary text records | Broad matching files or records |
|---|---|---:|---:|---:|
| [MColbrook/AIM](https://github.com/MColbrook/AIM/tree/b2ec0fac559f532fc0ed04fce81deea0ce07c68b) | `b2ec0fac559f532fc0ed04fce81deea0ce07c68b` | 4,624 | 144 PDF extractions and 2,029 embedded text records | 127 native; 39 supplementary |
| [openai/math](https://github.com/openai/math/tree/4eaee87548250b2682affda7d05d947c05554bae) | `4eaee87548250b2682affda7d05d947c05554bae` | 173,622 | 789 PDF extractions | 1,349 native; 120 supplementary |

Every regular native file was attempted as UTF-8 regardless of extension or filename. The full decoded body was searched; a numeric directory or an uninformative filename did not exclude it. Matching bodies were retained in full for semantic review. The shorter line excerpts in the match index were discovery aids, not substitutes for reading plausible theorem statements.

The native pass initially used Unicode case folding. A second pass rescanned **all 178,246 native UTF-8 files** after Unicode NFKC normalization and case folding. It found zero additional target/file matches. PDF and embedded-text extraction used case folding; the scoped reviews record their further normalized searches of retained matches. No claim is made that every mathematical equivalent can be detected by this string configuration.

Archive byte identities:

- AIM: 76,167,876 bytes; SHA-256 `ce1e24640f6996977e868b03c865c565a077d919406a2b5561d2f3febb643f4d`.
- OpenAI: 896,084,751 bytes; SHA-256 `4fee0780fe7cfa1bf7bdd9043e947b70e91ed9727bbecf08adc664d868d22f55`.

[coverage.json](coverage.json) records the per-target counts, complete residual binary paths, short-PDF records, conversion bounds, and hashes of the complete local manifests and match indexes. The large archives and third-party paper bodies are not copied into this repository.

## Exact-target comparisons

The counts below are broad keyword matches, including false positives. They are not counts of prior solutions. Native and supplementary columns overlap in mathematical content because a manuscript may have both source text and a PDF.

| Target | AIM native / supplement | OpenAI native / PDF | Scope finding |
|---|---:|---:|---|
| McCrea | 19 / 1 | 5 / 4 | Fixed-perimeter spectral geometry, random maps, or Franklin-name references; no fixed-perimeter partition crossover theorem. |
| López Pouso–Segura | 0 / 0 | 15 / 5 | Modified-Bessel XY weights, Sobolev multipliers, and unrelated reciprocal derivatives; no source Bessel-zero weight sequences. |
| Vishnyakova | 3 / 2 | 63 / 0 | Ordinary Pochhammer factors and geometric radius phrases; no outer-disk theorem for the conjectured transform. |
| Lyon | 43 / 14 | 842 / 23 | Lyons, Delyon, city names, code identifiers, and numerical substrings; no gamma-median monotonicity theorem. |
| Ferreira–Simon | 2 / 3 | 2 / 1 | Other Ferreira authors or unrelated analysis; no beta-prime convolution identity. |
| Roos–Seiringer | 29 / 17 | 47 / 20 | Quantum many-body citations, harmonic analysis, and other Roos names; no radial Dirichlet-kernel sign theorem. |
| Gröchenig | 10 / 2 | 41 / 24 | L-function zero densities, nodal geometry, local systems, or finite-degree Gaussian polynomials; no target upper-density inequality for totally positive translates. |
| Han–Sabag–Kostina–Hassibi | 1 / 0 | 0 / 0 | A different noisy-feedback capacity citation in AIM; no matching sparse-encoder optimization assertion. |
| Chen–Khare–Sahi | 17 / 1 | 103 / 15 | Symmetric-function references, author homonyms, and numeric substrings. Sra's relevant evaluation-positivity result is explicitly distinguished below. |
| Dospolova–Germanskov–Zaporozhets | 2 / 0 | 72 / 3 | Finite-dimensional projection bodies, curvature, or numerical substrings; no GB-compact intrinsic-volume realization theorem. |
| Kovalev | 11 / 8 | 6 / 3 | Planar homeomorphisms, harmonic annuli, or a different Kovaleva author; no matrix Hardy-duality assertion. |
| Brown–Mol | 0 / 0 | 0 / 0 | No source identifier or subtree-polynomial/translated-annulus phrase match. Earlier partial diameter-three work remains credited. |
| Johnson | 12 / 0 | 113 / 26 | Special strip kernels, physical Ising correlations, algebraic Pfaffians, or graph orientations; no unrestricted log-convex all-matching theorem. |
| Fang–Zhang–Zhao, withdrawn | 0 / 0 | 81 / 0 | Embedded numeric identifiers only in OpenAI. The confirmed earlier Principia disproof remains binding. |
| Sun–Zhao, withdrawn | 0 / 0 | 69 / 0 | Embedded numeric identifiers only in OpenAI. The confirmed earlier Principia disproof remains binding. |

Four separately written semantic reviews provide the actual source paths, nearby theorem statements, distinctions, and review limits:

- [Analysis scope](ANALYSIS_SCOPE.md): Roos–Seiringer, Dospolova–Germanskov–Zaporozhets, Ferreira–Simon, Lyon, and three close Ising/Pfaffian antecedents.
- [Algebra scope](ALGEBRA_SCOPE.md): Chen–Khare–Sahi, Vishnyakova, and the withdrawn Fang–Zhang–Zhao claim.
- [Combinatorics scope](COMBINATORICS_SCOPE.md): McCrea, López Pouso–Segura, Han–Sabag–Kostina–Hassibi, Gröchenig, and the withdrawn Sun–Zhao claim.
- [Root scope](ROOT_SCOPE.md): Kovalev, Brown–Mol, and Johnson, including the special honeycomb Fourier/Gram comparisons and general Pfaffian-looking bounds.

### Sra and the Macdonald semiring

The AIM lead points to Sra, *On majorization inequalities for normalized Jack and Macdonald polynomials*, [Hexagon 2610.00725v1](https://hexagonmath.org/abs/2610.00725v1). Its exact Certificate 4.1 proves ordinary evaluation positivity for the same pair of partitions used in the campaign's counterexample. It does so after a sorted-chamber substitution. That does not establish membership in the stronger symmetric Muirhead semiring.

The actual primary manuscript distinguishes the stronger Chen–Khare–Sahi assertions on printed page 2. The fresh author-PDF retrieval, page-level comparison, hash, and limitations are recorded in the [committed Sra refresh](../2026-11-21-cks-priority-refresh/AUDIT.md) and [algebra review](ALGEBRA_SCOPE.md). The semiring separator is compatible with Sra's evaluation theorem. This audit therefore makes no new priority exclusion on that basis.

### Johnson and general-looking Pfaffian antecedents

The closest OpenAI papers compare specified odd rational/trigonometric kernels using explicit Fourier measures, Schur's Pfaffian identity, or confluent Gram determinants. Their hypotheses do not include every positive nonincreasing log-convex distance kernel. The Ising papers require physical correlation matrices or a particular reciprocal-distance continuum kernel. No theorem supplying the missing realization or kernel-class inclusion was found. The direct primary-source and earlier-archive comparisons remain in Johnson's separate priority audit.

The candidate's imported endpoint theorem and kernel uncrossing reduction are already in Johnson's source paper and remain credited. The proposed new step is the circular-interval complement scaling that permits adjacent-pair deletion at every cut.

## Conversion and exclusion limits

All **933 PDFs** in the two snapshots produced nonempty text. There were no recorded PDF conversion failures, empty text outputs, archive expansion failures, or size/depth-limit hits. The supplement imposed a 256 MiB per-entry bound and archive depth eight; those remain explicit reproducibility settings.

AIM retains 124 unconverted binary entries: two PNG figures and 122 NumPy arrays within compressed numerical data. The figures belong to a Robin-domain counterexample and a Heun-star construction. The arrays belong to Lotka–Volterra Fourier certificates and Freudenthal potential calculations. The matching mathematical source text was searched, but the binary payloads were not interpreted.

OpenAI retains 113 unconverted binary entries: 110 numerical `.bin` files in the dimension-six mutually-unbiased-bases package and three PNG figures belonging to a matrix Lieb–Thirring manuscript and a randomized k-server manuscript. These payloads were not interpreted or visually audited. No split `.gz`/base64 archive names were found in the complete native path inventory.

The short text extractions were inspected for missing-paper risk. AIM's four PDFs shorter than 2,000 characters are figure PDFs. OpenAI has 30 such PDFs: 27 figures and three one-page withdrawal notices. The latter were extracted and read directly: the Kuga–Satake-correspondence, split-abelian-eightfold Weil-class, and K3-product Hodge manuscripts explicitly withdraw their claimed proofs after a sign error. These are unrelated to the fifteen targets. A successful text extraction is not an endorsement of any archive manuscript.

No OCR was applied. Figures and mathematical notation can contain information not recovered by text extraction. These are pinned current-tree audits, not searches of every deleted commit, private draft, or unindexed source. A proof stated under different terminology and containing none of the searched terms can be missed. The direct comparison of plausible theorem hypotheses reduces that risk without eliminating it.

## Reproduction

The scripts read source material and never execute archived code. They require Python's standard library and Poppler's `pdftotext`. Run from this directory:

```sh
python3 scan_archive.py aim MColbrook/AIM b2ec0fac559f532fc0ed04fce81deea0ce07c68b
python3 scan_supplement.py aim
python3 scan_archive.py openai openai/math 4eaee87548250b2682affda7d05d947c05554bae
python3 scan_supplement.py openai
python3 scan_normalized_residual.py aim openai
```

The native script downloads each pinned public archive if it is absent, records its SHA-256, and writes complete local manifests. The supplement expands supported compressed formats and converts PDFs, recording every unresolved entry. The normalization pass verifies its native text-file counts against the first manifest and records only newly added target/file matches. Reproducing these searches supports the stated coverage; semantic comparison of the actual mathematics remains necessary.
