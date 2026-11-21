# Five-target source-body comparison

Reviewer: combinatorics lane. Date: 21 November 2026.

**Completed:** the five assigned targets were compared with all their native-text matches in the pinned OpenAI/math and MColbrook/AIM snapshots, and with every assigned-target match in both PDF/compressed supplements. No additional exact-target prior resolution was found in this completed scope. Sun–Zhao remains withdrawn because of the independently established Principia collision; this audit does not restore it.

**Final residual check:** the coordinator completed a Unicode-NFKC residual search over all 173,622 OpenAI native files and all 4,624 AIM native files and found zero additional matches. No new source-body comparison was required by that pass.

## 1. Acquired snapshots and method

The coordinator downloaded and scanned the archives; this reviewer inspected the resulting full matching files and matching contexts. The scanner reads every regular UTF-8 member without a size cutoff and preserves complete files that match the recorded source identifiers, author names, or structural phrases. The acquisition manifests and the scan scripts are retained alongside this report.

| Archive | Pinned commit | Completed acquired-text scope |
|---|---|---|
| [OpenAI/math](https://github.com/openai/math/tree/4eaee87548250b2682affda7d05d947c05554bae) | `4eaee87548250b2682affda7d05d947c05554bae` | 173,622 UTF-8 files; 1,349 files matched at least one campaign target. The 896,084,751-byte archive has SHA-256 `4fee0780fe7cfa1bf7bdd9043e947b70e91ed9727bbecf08adc664d868d22f55`. The native manifest lists 902 non-UTF-8 objects separately; the completed supplement converted all 789 PDFs to text and records the remaining 113 objects as limitations. |
| [MColbrook/AIM](https://github.com/MColbrook/AIM/tree/b2ec0fac559f532fc0ed04fce81deea0ce07c68b) | `b2ec0fac559f532fc0ed04fce81deea0ce07c68b` | 4,624 native UTF-8 files, plus 2,029 embedded text entries and 144 PDF text conversions in the completed supplement. Archive SHA-256 `ce1e24640f6996977e868b03c865c565a077d919406a2b5561d2f3febb643f4d`. |

The per-file assigned-target inventory, matched phrases, and SHA-256 values are saved in `COMBINATORICS_MATCH_CLASSIFICATION.json`. The inventory was computed from the complete preserved files, not only the scanner's truncated line excerpts. Source-body reading focused on the matching statement, definition, lemma, bibliography entry, or its surrounding argument. Where a match was merely a numerical substring, the complete file was searched for a bounded identifier and meaningful target terms before classification.

This is a theorem-scope comparison, not verification of the many unrelated claims in either archive. Reading plain declarations and comments in source files for prior-status purposes involved no Lean execution, proof checking, or formalization work.

## 2. Exact statements being compared

| Target | Exact campaign scope |
|---|---|
| McCrea | Conjecture 9.2 of arXiv:2609.12005v2: for every allowed modulus `k>=3`, exactly one density transition in the specified interval between the fixed-perimeter partition statistics defined by multiplicity and divisibility. The older fixed-number theorem is distinct. |
| López Pouso–Segura | Conjectures 2, 5, and 8 in *Uniform relations between the Gauss–Legendre nodes and weights*, DOI `10.1186/s13660-025-03283-w`, treated together as one result: the stated signs, strict monotonicities, and limits of the three sequences made from positive zeros `j_k` of `J_0`, reciprocal derivative weights `J_1(j_k)^{-2}`, and their partial sums. This scope does not include the separate finite-degree quadrature conjectures. |
| Han–Sabag–Kostina–Hassibi | Conjecture 1 of arXiv:2406.17196v2: the universal sparse-optimality assertion in the stated Lyapunov-positive encoder matrix optimization. The campaign counterexample compares a feasible unrestricted encoder against every one-nonzero-entry-per-column assignment. It does not claim to resolve general feedback-channel capacity or the whole code-stabilization problem. |
| Gröchenig | Problem 4.12 of DOI `10.1007/s44146-026-00264-3`: the universal upper/lower Beurling-density comparison for zeros of bounded-coefficient Pólya-frequency translate sums versus coefficient sign changes. The campaign disproof concerns the upper-density assertion through one entire Gaussian translate sum; the separate lower-density inequality is not settled there. |
| Sun–Zhao | Conjecture 5.2 of arXiv:1602.04359, the iterated-ratio assertion for the Catalan–Larcombe–French sequence. This campaign entry is already withdrawn because Principia contains an earlier exact resolution of the same claim. |

The corresponding current campaign proof statements and landing pages were read before this comparison. In particular, the López Pouso–Segura sequence definitions were checked explicitly rather than treating every occurrence of “Bessel weight” as relevant.

## 3. OpenAI/math native results

| Target | Raw matching files | Source-body outcome |
|---|---:|---|
| McCrea | 5 | Three bibliography entries refer to Franklin P. Peterson; two passages concern the perimeter of a random planar map. None concerns integer-partition Franklin statistics or a density crossover. |
| López Pouso–Segura | 15 | All hits arise from “Bessel weight” or “reciprocal derivative.” The definitions concern modified-Bessel XY-model weights, Sobolev multipliers, a cubic-moment integral, or ordinary inverse/phase derivatives. None defines the target `J_0`-zero weight sequences. |
| Han–Sabag–Kostina–Hassibi | 0 | No source-ID, author, coded-Kalman, Lyapunov-positivity, or sparse-optimality hit in the completed native scan. |
| Gröchenig | 41 | Thirty-nine files match generic “zero-density” language. Two concern Michael Groechenig's arithmetic local-system work. The closest Gaussian-zero passage is a finite-dimensional random homogeneous polynomial grid, not a Pólya-frequency translate sum or sign-change density comparison. |
| Sun–Zhao | 69 | Every hit is the digits `332483` embedded inside a longer integer certificate. Full-file searches find no bounded occurrence of that problem number and no source ID, author-pair name, Larcombe name, or iterated-ratio phrase. |

### McCrea: the five passages

The three bibliography entries are in the Smith–Toda and stable-Hurewicz packages. Their actual titles are *A spectrum whose Z_p cohomology is the algebra of reduced pth powers* and *Spherical classes and the Dickson algebra*. “Franklin” is the given name of Peterson. These are not combinatorial partition-statistic theorems.

The other two hits are in `preprints/The-critical-Liouville-quantum-sphere-and-geometric-limits-of-FK-maps-at-q-equals-4-September-24-2026/build/sections/02-discrete.tex` and `06-kernels.tex`. The first passage defines disk generating functions `F_p(x)` for a triangulation model with loop fugacity two and uses a fixed boundary perimeter to control a marked-vertex generating function. The second compares perimeter units in local conditional geometric kernels. The definitions and nearby lemmas were read. Neither passage compares the two partition statistics in McCrea's conjecture.

### López Pouso–Segura: definitions settle the apparent overlaps

Five XY-model packages account for the closest terminology. Their weight is explicitly

```math
p_b(j)=e^{-b}I_j(b),
```

where `I_j` is the modified Bessel function and the weights form the distribution of a difference of Poisson variables. The passages prove finite-height-law comparison inequalities, height limits, or spin-height duality. The definitions and relevant statements were read in the finite-height, height-representation, and critical-input sections. They do not involve positive zeros of `J_0`, the reciprocal values of `J_1` at those zeros, or the three source partial-sum sequences.

The Fourier/NLS occurrences define a Bessel/Sobolev weight of the form `(1+norm(x)^2)^(s/2)` or a power comparison used in interpolation. The cubic-moment file defines the positive integrand `exp(-u/3) exp(-2a cosh(u))` and asserts integrability. These are different objects.

The four reciprocal-derivative matches concern a local conformal inverse, nonstationary integration by parts, Egyptian-fraction exponential-sum estimates, and a reciprocal-cosine argument for the standard map. Their displayed statements were inspected. None states monotonicity or limits of the López Pouso–Segura sequences. There is no author or exact-source-ID hit in these 15 complete matching files.

### Gröchenig: the closest analytic claim was read directly

The main potentially confusing hit is the homogeneous-polynomial-grid lemma in `preprints/One-sided-negative-sectional-curvature-and-the-holomorphic-Liouville-property-September-25-2026/build/03-analytic.tex`. I read the lemma and its Gaussian-ensemble argument. It constructs systems of homogeneous polynomials of degree `N` whose transverse projective zeros have equidistribution and derivative/separation properties. Its displayed one- and two-point densities are conditional Jacobian expectations for random polynomial zeros. The surrounding introduction explains their use in a holomorphic-Liouville construction. This is not a density inequality for real Gaussian translates with fixed coefficients, and it does not compare zeros with coefficient sign changes.

The two `Groechenig` hits cite Esnault and Michael Groechenig on integrality of cohomologically rigid local systems. The relevant introduction and bibliography entry were inspected; they concern arithmetic monodromy rather than Karlheinz Gröchenig's total-positivity problem.

All remaining zero-density contexts were checked in place. They concern one of: zero measure-density pieces or an entropy convention; exceptional arithmetic families; zeros of zeta/Hecke/Dirichlet functions; quantum-ergodic subsequences; geometric current decompositions; or probability densities in regression, quantum matter, and geometric inequalities. None states the target Beurling-density comparison or an equivalent counterexample.

### Sun–Zhao: numerical substring rejection

The scanner deliberately included the MathDB number as a broad recall aid. Each of the 69 files contains that digit string in a larger integer. A second pass searched the full files, including their paths, using bounded numeric matching for `332483` and independent patterns for `1602.04359`, Sun–Zhao, iterated ratios, and Larcombe. It found no meaningful match. These files therefore supply no additional Sun–Zhao prior citation. The established Principia prior remains controlling.

## 4. OpenAI/math PDF supplement

The supplement converted all 789 PDF objects. Its campaign-wide scan records 120 matching PDFs. The five assigned targets have the following matching-object counts; one PDF is counted once per target, irrespective of the number of matched passages.

| Target | PDF matches | Completed comparison |
|---|---:|---|
| McCrea | 4 | Three Peterson bibliography entries and the Liouville/FK-map perimeter paper. The same unrelated definitions as the native matches. |
| López Pouso–Segura | 5 | Four XY-model papers using the modified-Bessel distribution and one standard-map reciprocal-derivative argument. No target Bessel-zero sequence. |
| Han–Sabag–Kostina–Hassibi | 0 | No assigned-target match in the complete converted-PDF scan. |
| Gröchenig | 24 | Local-system integrality, finite-dimensional random polynomial zeros, or unrelated measure/arithmetic density arguments. |
| Sun–Zhao | 0 | No assigned-target match in the complete converted-PDF scan. |

Every matching passage in these 33 assigned PDFs was inspected in the converted full text. The actual relevant definitions and nearby statements were read, rather than relying on the filenames. The closest Gaussian-polynomial lemma was re-read in the PDF conversion as well as in its native source.

The four McCrea-tagged PDFs repeat the three Franklin P. Peterson bibliography entries and the Liouville/FK-map uses of a triangulated disk's boundary perimeter. The latter paper's marked partition function is a sum over maps with fixed boundary length, not over integer partitions with McCrea's multiplicity/divisibility statistics.

For López Pouso–Segura, the PDFs of *Critical Center Magnetization*, *The Critical Spin Field*, *The critical correlation exponent*, and *The critical logarithmic correction* explicitly use `p_b(j)=exp(-b) I_j(b)`. Their statements concern finite height laws, Gaussian comparisons, and spin correlation coefficients. The fifth PDF, *Positive Metric Entropy for the Standard Map at Large Parameters*, differentiates a reciprocal function `1/S` in a local cosine/Taylor argument. Neither the modified-Bessel distribution nor that reciprocal derivative is a sequence of the source's `J_0` zeros and `J_1` weights.

For Gröchenig, Lemma 3.1 of *One-sided Negative Sectional Curvature and the Holomorphic Liouville Property* constructs homogeneous polynomial systems `Q_N=(H_N,p_N)` on complex `n`-space. It requires `N^(n-1)` transverse projective zeros and an equidistributed large subset with quantitative derivative and separation bounds. Equation (3.4) gives a conditional-Jacobian one-point density of that finite-dimensional Gaussian polynomial ensemble. These are different hypotheses and conclusions from the real-line Gaussian-translate/sign-change comparison. The local-system paper again cites **Michael** Groechenig. The remaining 22 PDFs use zero-density language for exceptional arithmetic families, zeta/Hecke/Dirichlet zeros, geometric currents, matter/energy or probability densities, or zero-density subsets in dynamical sampling. Their matching arguments contain no Pólya-frequency translate assertion.

The per-PDF inventory added to `COMBINATORICS_MATCH_CLASSIFICATION.json` records the original path, PDF SHA-256, converted-text SHA-256, matching lines, and the comparison category. No PDF conversion failed in the acquisition manifest, and all 789 conversions are nonempty. The coordinator separately inspected the three short nonfigure PDFs as withdrawal notices; the other 27 short PDFs are figures. The supplement does not claim to interpret the remaining 110 binary objects in the mutually-unbiased-bases dimension-six package or three PNG figures.

## 5. AIM native and supplement comparison

The assigned native counts are McCrea 19, López Pouso–Segura 0, Han–Sabag–Kostina–Hassibi 1, Gröchenig 10, and Sun–Zhao 0. The completed supplement adds one McCrea-tagged PDF and two Gröchenig-tagged embedded problem-page copies, with no assigned-target match for the other three.

The McCrea matches concern fixed-perimeter Robin/Steklov eigenvalue optimization and duplicate status records, or Franklin T. Rea's work on attenuated ray transforms. I read the actual problem statements of AIM 020 and 022 and the relevant result scope. The square/parallelogram and equilateral-triangle assertions optimize a boundary eigenvalue under a geometric perimeter constraint. The supplemental PDF is the same parallelogram theorem. These claims are unrelated to fixed-perimeter integer-partition statistics.

The sole Han-tagged native item is a cached web-search response, not an AIM proof package. The “Sabag” match occurs in the URL of a feedback-capacity coding repository. Other items in the same response concern noisy Gaussian broadcast feedback and capacity regions. I additionally opened the primary abstract of [Pillai and Prabhakaran, arXiv:1502.04806](https://arxiv.org/abs/1502.04806): its assertion says sufficiently noisy passive feedback does not enlarge capacity for a class of two-user broadcast channels. It does not assert sparse optimality of the coded-Kalman Lyapunov matrix program.

The closest Gröchenig-tagged AIM claim is [problem 1026](https://github.com/MColbrook/AIM/blob/b2ec0fac559f532fc0ed04fce81deea0ce07c68b/problems/1026-steklov-zeros-in-a-fixed-boundary-collar.md). Its full problem statement and resolution comparison were read. It concerns zeros of Steklov eigenfunctions near the boundary of one fixed planar domain, with an eigenvalue-dependent wavelength. The two embedded supplement pages repeat the same target. That has neither the translate-sum hypothesis nor the coefficient-sign-change conclusion of Gröchenig's problem. The other matches are zeta zero-density estimates, a zero-density PDE solution convention, cell-density subsolutions, or cached search text; none is an exact-target theorem.

## 6. Limits and disposition

- This is a bounded archive-content audit at the two recorded commits. It does not prove that no earlier resolution exists elsewhere or under phrasing missed by the search terms.
- The body reading covered the matching contexts and the full statement or definition of plausible hits. It did not verify every unrelated theorem in either archive. An archive's claim that a famous conjecture is solved is not treated here as a verified mathematical fact.
- No mathematical correctness claim about the five campaign packages follows from this audit. Their independent mathematical reviews remain separate.
- The AIM supplement records 124 unconverted nontext entries, principally numeric arrays and images. No content claim is made for those entries. PDF extraction is text-based; an image-only statement could evade it.
- The OpenAI/math supplement is complete in the recorded acquired-text scope: 789 converted PDFs, with 110 binary objects and three PNG figures left uninterpreted. PDF extraction is text-based, so this does not certify the content of rasterized equations or image-only statements. The coordinator completed the native Unicode-NFKC residual search for both archives with zero additional matches.

Within the completed scope, there is no additional exact-target collision. The existing Sun–Zhao withdrawal is unchanged.
