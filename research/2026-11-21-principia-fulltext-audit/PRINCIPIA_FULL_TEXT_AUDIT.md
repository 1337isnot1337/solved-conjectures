# Principia full-text retrospective priority audit

Later correction, 21 November 2026: Gröchenig’s upper-density package was withdrawn after [a checked earlier public proof](../bounty-continuation-2026-11-21/grochenig-prior-resolution/) was found outside this bounded search. The observations below remain a historical record of the sources inspected; their no-match result does not support a current novelty claim for that package.

Date: 21 November 2026. Reviewer: campaign combinatorics lane. Corrected scope: the twelve previously admitted campaign targets, plus the pending Kovalev and Brown–Mol packages, and two additional targets from another group. This report supersedes earlier path-only checks of this archive for these sixteen targets.

**Scope correction.** The initial audit commit `e9fe0801549bcc8013df506c1b35646ef5717ca1` mistakenly substituted Chen–Kitaev–Zhang and Zhu for the campaign's McCrea and López Pouso–Segura entries. Its claim to cover the exact campaign fourteen was therefore premature. The parent review identified the mismatch. Both omitted targets have now been screened against the same complete archive, and plausible matches were read. The two unrelated-group targets remain as additional checks; `scan-metadata.json` now lists the fourteen campaign targets and two extras separately. The archive contents, hash verification, text-unit count, and two confirmed prior-resolution collisions are unchanged.

## Corrections required

Two exact prior resolutions are present in the public archive:

1. **Fang–Zhang–Zhao's infinite-log-convexity conjecture.** MathDB 368345 supplies the entire parameter-family disproof, including parameters four and five and every parameter at least six. The root and algebra lanes independently read that package and are handling its withdrawal from the new-result tally.
2. **Sun–Zhao's iterated-ratio conjecture.** MathDB 332483 supplies the same twelfth-ratio counterexample at retained indices 12, 13, and 14. I read the complete ordinary proof, compared the exact conjecture and cutoff, and independently replayed its integer certificate. It is a prior full resolution, not a different normalization or a positive finite special case.

The earlier campaign reports that found no collision in Principia were incomplete. Searching author names in archive paths missed numeric MathDB directories. The fact that those reports disclosed a path screen does not make the resulting novelty admission correct. Both claims must be excluded from the new-result count; the independent rediscoveries may remain as credited research notes.

No additional matching resolution was found for the other twelve campaign targets or for the two extra targets in the complete content search described below. This is a bounded result about this pinned archive, not a universal assertion that no prior proof exists anywhere.

## Snapshot and completeness checks

Repository: <https://github.com/PrincipiaMathOrg/math-solutions>.

The current public main commit was read through the GitHub ref API as

`47371706c400c79d06e3fb62190fcf6f7a725c85`.

A public codeload archive was downloaded and safely extracted. The downloaded archive has 27,705,738 bytes and SHA-256

`45f5605f49c9d99227901594a31cccc6d18d5096fd2d628ffbe2bba6c86e4600`.

Every one of the snapshot's 1,728 file blobs was checked against its Git object hash from the complete saved recursive tree. There were zero missing files and zero content mismatches. This verifies the downloaded contents against the pinned snapshot even though the download URL used the branch name.

The screen included every decodable native text file, all 274 PDF files after successful Poppler text extraction, and all 13 text entries inside the archive's one embedded source ZIP. No PDF extraction failed or produced fewer than 100 characters. There were 1,740 searched text units totaling 35,207,370 UTF-8 bytes; duplicate PDF/source representations are counted as separate units. The exact patterns and matching excerpts are retained in `full-text-search.json`; `scan.py` reproduces the content screen on the downloaded tree and extracted PDFs. `scan-metadata.json` records the counts and archive hash.

The search used source identifiers, author variants, and structural terms. It was a full-text keyword search followed by reading candidate claims, not a claim that every line of every unrelated proof was manually reviewed. No Lean compilation, proof verification, or formalization work was performed. Lean files were searched as ordinary source text for prior-work references only.

## Exact Sun–Zhao collision

Prior ordinary manuscript:

[An exact counterexample to the Catalan–Larcombe–French ratio conjecture](https://github.com/PrincipiaMathOrg/math-solutions/blob/34b8b155d7db464ad7306f70b16d3af9cee34501/site-backup/mathdb-332483/mathdb-332483-solution.tex).

The manuscript is attributed to Principia Math In Progress and dated 11 September 2026. More decisively, the complete file was publicly committed to this repository in commit

`34b8b155d7db464ad7306f70b16d3af9cee34501`,

whose GitHub commit date is **27 October 2026, 02:59:18 UTC**. The path history returned this single introducing commit, and the file at that exact commit was fetched and read. Thus priority does not depend on trusting the date printed in the manuscript. An attempted upstream-history request returned 404, so this audit does not claim that 27 October is the earliest appearance anywhere; it is the earliest public Git commit verified here and is already before this campaign.

The archived source SHA-256 is

`dc66805dd04003866eb1650f90a194cd4e9a7b873fe653d1e7dfa53ed1f2f505`.

The archive manifest identifies the original [Principia project](https://principia-math.com/projects/d4d56ad21ab6dd0fea1169ed69ed43bc), [source file](https://principia-math.com/api/ws/files/501e2dbb7626f9c1add050b88c13686b), and [PDF](https://principia-math.com/api/ws/files/6c9d49cf467f5c4fc6bc3c9740ad5894). The GitHub copy alone suffices for the verified chronology.

The exact recurrence is the same Catalan–Larcombe–French recurrence, beginning with one and eight. The ratio operator is indexed from zero; after twelve deletions, indices 12, 13, and 14 remain. The proof converts the failed log-convexity inequality into two positive integer products with binomial exponents and proves

```math
999999999814\,B<10^{12}A<999999999815\,B.
```

Both products have binary length 582,535. I independently generated the recurrence inputs and replayed both strict comparisons successfully. The prior statement refutes Sun–Zhao Conjecture 5.2 in precisely the form used by our package. The original published-source citation and the arXiv identifier are both explicit in its bibliography. The neighboring MathDB 332482 and 332484 papers concern the source's different Conjectures 5.1 and 5.3 and do not alter this exact overlap.

## Exact Fang–Zhang–Zhao collision

Prior ordinary manuscript:

[Hoggatt sums fail infinite log-convexity for every parameter at least four](https://github.com/PrincipiaMathOrg/math-solutions/blob/c18609e47b635722206b9a2e9dcd402d0edcfb0a/mathdb/368345/solution.tex).

The file's introducing commit in this repository is

`c18609e47b635722206b9a2e9dcd402d0edcfb0a`,

dated **26 October 2026, 14:00:38 UTC**. The commit message records import from an earlier upstream branch; the root/algebra audit investigates that earlier provenance separately. The dated public copy already predates this campaign.

The title, abstract, theorem scope, exact parameter polynomial, and two remaining parameter checks match the entire Conjecture 4.3 disproof. It is not merely a bounded numerical screen. The root and algebra lanes' separate reports carry the mathematical comparison; this content audit independently finds the exact source and full-scope claim.

## Classification of all sixteen targets

| Campaign target | Full-text archive finding | Disposition for this archive gate |
|---|---|---|
| Fang–Zhang–Zhao, Conjecture 4.3 | Exact full disproof, MathDB 368345 | Prior-resolved; exclude |
| McCrea, single-crossover Conjecture 9.2 | No author, source identifier, fixed-perimeter, or Franklin-statistic match. Two incidental crossover hits concern a discrete maximal-function comparison and a Goldbach bound | No matching resolution found |
| López Pouso–Segura, Bessel-weight Conjectures 2, 5, and 8 | No exact source, Pouso, Nicholson, or inverse-phase match. The Segura result concerns parabolic-cylinder ratios; Bessel hits concern distinct kernels, integrals, zero gaps, Turán minima, and medians. Gauss–Legendre occurs only in an unrelated numerical-quadrature check | No matching resolution found |
| Vishnyakova, root-radius conjecture | Broad interpolation/falling-factorial hits concern unrelated derivative-root means, interpolation problems, lattice partitions, and a row-sum formula; no source identifier, author, or matching disk theorem | No matching resolution found |
| Gröchenig, upper zero-density comparison | Zero-density hit concerns frequency symmetries of continued fractions, MathDB 371294; Beurling hit is a reference in an unrelated weighted Hardy-space audit | No matching resolution found |
| Han–Sabag–Kostina–Hassibi, matrix conjecture | Lyapunov hits concern exponents of a different discrete dynamical system, MathDB 331783; no encoder, Kalman, author, or source-identifier match | No matching resolution found |
| Sun–Zhao, Conjecture 5.2 | Exact ratio counterexample, MathDB 332483 | Prior-resolved; exclude |
| Lyon, transformed gamma median | MathDB 345410 and 345411 establish Gaunt–Merkle variance-gamma and McKay median statements; their displayed bounds do not assert monotonicity of Lyon's shape transform | No matching resolution found |
| Ferreira–Simon, beta-prime Conjecture 1 | MathDB 351688 refutes the same paper's Conjecture 3 about a Mills-ratio derivative quotient; exact target is different | No matching resolution found |
| Chen–Khare–Sahi, Macdonald semiring Conjecture 5 | Macdonald hit is Ehrhart–Macdonald reciprocity, MathDB 374965; Khare substring hit is Wakhare's entropy polynomial, MathDB 357503 | No matching resolution found |
| Dospolova–Germanskov–Zaporozhets, Conjecture 3.6 | No source, author, intrinsic-volume, Gaussian-bounded, Vitale, or Steiner-entire-function match | No matching resolution found |
| Roos–Seiringer, radial Dirichlet kernel | Dirichlet-kernel hits are Fourier kernels in Goldbach estimates; no BCS, author, or exact-source match | No matching resolution found |
| Kovalev, Hardy-norm Conjecture 6.1 | MathDB 369171 and 369172 prove the different bounded-power-series/cosine-sum Conjectures 1.2 and 1.3 from arXiv:2507.04544; no Hardy-norm comparison | No matching resolution found |
| Brown–Mol, translated annulus | The only subtree-root phrase describes descendant blocks in an arbor polytope, MathDB 373577; no subtree polynomial, source identifier, or annulus claim | No matching resolution found |
| Chen–Kitaev–Zhang, record Conjectures 1 and 3 (additional scope) | Hits concern Cheon–Jung–Kitaev–Mojallal Riordan-graph nullity and Gil–Lopez–Weiner 1324-avoidance expansion; neither contains the separable-record assertion | No matching resolution found |
| Zhu, unweighted Jacobi–Stirling Hankel positivity (additional scope) | Production-matrix hit is Barry's almost-Riordan row-sum formula, MathDB 351775; numeric DOI fragment also occurs in an unrelated integer table | No matching resolution found |

Candidate ordinary manuscripts were opened at their statement and relevant surrounding argument. Broad incidental text matches in unrelated Goldbach files and arithmetic tables were not treated as substantive mathematical leads.

## Added McCrea and López Pouso–Segura checks

The exact McCrea target is Conjecture 9.2 in [arXiv:2609.12005v2](https://arxiv.org/abs/2609.12005v2): the unique density crossover between the two fixed-perimeter Franklin partition statistics, for every modulus at least three. It is not the earlier fixed-marked-count inequality. Added searches included the arXiv identifier, author, Franklin, fixed perimeter, crossover, transition density, and multiplicity/divisibility language. Only the word crossover matched: MathDB 348574 concerns the discrete maximal-variation conjecture, and the other occurrence is in Goldbach analytic estimates. The relevant source header of 348574 was read; it has no partition-count assertion.

The exact López Pouso–Segura target is the joint Bessel-weight package in [DOI 10.1186/s13660-025-03283-w](https://doi.org/10.1186/s13660-025-03283-w), [arXiv:2305.19128](https://arxiv.org/abs/2305.19128). For squared order-zero Bessel zeros and reciprocal squared derivative weights, the three statements give the signs, strict monotonicity, and exact limits of the source's sequences `C_i`, `E_i`, and `K_i`. They do not assert the separate finite-degree uniform Gauss–Legendre circle conjecture. The full campaign statement and its source audit were read before comparison.

The broad Bessel and Segura search produced 470 matching lines across 62 text units, including duplicate PDF/source representations. The distinct ordinary manuscripts' titles and displayed target theorems were examined. MathDB 364320 proves a Segura parabolic-cylinder ratio statement; 326635 proves log-concavity of gaps between squared zeros of `J_1`; 321003 concerns minima of a normalized Bessel Turánian; 339406 bounds an integral of a modified Bessel function; 365454 refutes a truncated Bessel-kernel inequality; and 365832 gives a high-dimensional Bessel-integral asymptotic. The remaining hits concern variance-gamma/McKay medians (345410/345411), hypergeometric denominator formulas (346880/350746), a generalized Eulerian identity (355408), Gabor-system norms (375037), and a normalized-Bessel ratio bound (335189). None states the reciprocal-derivative-weight sums or their monotonicity and exact limits. Source identifiers, Pouso, Nicholson, and Bessel-phase terms did not match anywhere in the complete searched text collection. The lone Gauss–Legendre occurrence records a numerical quadrature cross-check in a Goldbach source comment; it does not state a theorem on nodes or weights.

## Coverage limits

This audit covers the complete GitHub snapshot at the pinned commit, not every object ever served by the Principia website. Its `site-backup/README.md` expressly says that three named-author projects were omitted from that backup: MathDB 328424, 369283, and 380445. The first two are identified by the repository's own source headers as Goldberg's graph-energy conjecture and Johnston–Plosker–Torrance–Varona's generalized Cauchy–Schwarz inequality. The third is identified by the author's public [Polyhex-Hull repository](https://github.com/pragyaangaur/Polyhex-Hull) as Kurz's polyhex convex-hull problem. None is one of the sixteen audited targets; their omitted full ordinary papers were not treated as searched.

Keyword search can miss an equivalent theorem expressed without recognizable terminology. That limitation remains, even with complete file acquisition. The present audit materially corrects the earlier path-only process by examining every archived text and every PDF extraction and then reading plausible matching claims. The two exact prior-resolution corrections are decisive and do not depend on this residual limitation.
