# Standard Simplex: archive statement comparisons

Research audit dated 21 November 2026. The comparison target is the all-cell, all-ambient-dimension, low-positive-correlation theorem in [SMALL_CORRELATION.md](SMALL_CORRELATION.md). This note records the mathematical scope of potentially relevant archive claims. It does not verify every unrelated manuscript, establish global priority, or resolve the full Standard Simplex conjecture.

The pinned repositories, exact scan patterns, paths, and decoding limits are recorded in [LOW_CORRELATION_SCAN.json](LOW_CORRELATION_SCAN.json) and [LOW_CORRELATION_PRIOR_AUDIT.md](LOW_CORRELATION_PRIOR_AUDIT.md). Matching contexts were used to locate statements; the close statements below were read in their source bodies. Full copyrighted source bodies remain outside the repository deliverable.

## `mxym/math`

The 493 main-pass matches include repeated Markdown, TeX, PDF, release, audit, and source copies. The following are the relevant mathematical families at commit `4a51ff772a566451627b9ff41f6248518561d9d4`.

| Source path | Scope actually read | Comparison |
|---|---|---|
| `research/gaussian-balanced-simplex-all-k/paper.md`, with final copies under `preprints/gaussian-equal-cells-2026-10/` | Complete first-moment proof, covariance identities, equality statement, and literature-status note | Explicit credited input. It proves the balanced first-moment extremum and expressly stops before finite-correlation optimality |
| `research/gaussian-centroid-mass-envelope/paper.md`, Sections 6–7, especially Theorem 11 | The finite-noise envelope and its approximation error | Gives two-sided additive bounds using the mass profile and a first-moment envelope. It does not identify an exact optimizer at a fixed nonzero correlation |
| `research/gaussian-propeller-balanced-fans/paper.md`, Sections 12–13, Theorems 16–17 | The full small-correlation fan comparison and later four-cell threshold discussion | For arbitrary cell count, compares the regular simplex only against an explicit equiangular planar fan; it does not compare every measurable balanced partition |
| `research/gaussian-prescribed-mass-centroid-ellipsoid/paper.md`, Section 5, with article-revision copies | The prescribed-mass anisotropic first-moment theorem and stated non-implications | A first-moment metric inequality; explicitly does not prove full simplex-valued Bobkov or positive finite-correlation optimality |
| `research/gaussian-balanced-four-global/` and `research/gaussian-balanced-four-rigidity/` | Main statements and the previously inspected covariance/rank-local arguments | Four-cell first-moment results, superseded in the current proof's input by the all-cell first-moment source; no finite-correlation theorem |
| `research/gaussian-centroid-symmetry-rigidity/`, `gaussian-spherical-cap-converse/`, `gaussian-quadratic-dimension-all-k/`, and `gaussian-sharp-dimension-rate/` | Main theorem statements and matched first-moment discussions | Dimension and asymptotic first-moment bounds as the number of cells varies; they do not give fixed-cell exact noise optimality |
| `manuscripts/sharp-simplex-stability/truncation.tex` and related projection-simplex notes | The stated stability object, distance, and hypotheses | Convex-body projection/Banach–Mazur simplex stability, not Gaussian partition stability |

The finite-noise envelope deserves an explicit distinction. With its notation for the squared mass sum and first-moment envelope, it bounds the optimum by expressions differing by a positive error of order correlation times the squared mass sum plus correlation squared. Such an error estimate does not imply equality with the regular-simplex value on an interval. The planar-fan theorem also explicitly limits its competitor to that fan family. Neither theorem is upgraded by its title or by an archive status label.

Other matches concern APPT and entropy inequalities, Cayley independent sets, ordinary convex or simplicial simplexes, and the substring “linear independence.” Their matched statements or surrounding contexts do not concern the target Gaussian optimizer. Formalization source was text-screened only; no Lean code was run or verified.

### Scope of the three size-limited simplex proof graphs

The following compressed bodies exceeded the main scan's 16 MiB gzip bound:

- `verification/finalization/results/simplex-lower/ReplayAllSafeOwned.graph.json.gz`;
- `verification/finalization/results/simplex-upper/ReplayAllSafeOwned.graph.json.gz`;
- `verification/finalization/results/simplex-upper/ReplayLiteralMain.graph.json.gz`.

Their associated mathematical statement was checked directly. The pinned [finalization README](https://github.com/mxym/math/blob/4a51ff772a566451627b9ff41f6248518561d9d4/verification/finalization/README.md) links the [sharp-simplex manuscript guide](https://github.com/mxym/math/blob/4a51ff772a566451627b9ff41f6248518561d9d4/manuscripts/sharp-simplex-stability/README.md). The [upper statement](https://github.com/mxym/math/blob/4a51ff772a566451627b9ff41f6248518561d9d4/formalizations/sharp-simplex-upper-bound/THEOREM.md) concerns a compact convex body and every maximum-volume inscribed simplex, with excess under a dilation about that simplex's centroid controlled by a Euclidean projection-body/pyramid volume defect. The [lower statement](https://github.com/mxym/math/blob/4a51ff772a566451627b9ff41f6248518561d9d4/formalizations/simplex-truncation-sharpness/THEOREM.md) is the sharpness obstruction obtained by truncating a coordinate simplex. These are convex-body stability statements, not Gaussian partition or noise-stability theorems.

The upper statement file has SHA-256 `e48bb14ec46df4b68c4a5c6d813fd774094c62fb9fb02b8e5c61e91573d29889`; the lower statement file has SHA-256 `b1708e7ca49705663ef9d91cd1be9904b227434828732e1f3b0e1767ceed60b0`. The compressed proof-graph payloads remain unsearched, rather than being counted as text coverage. The source mapping settles their declared mathematical scope; it is not a verification of their formal proofs.

## AIM

The native problem records at the pinned commit include AIM294, the balanced positive-correlation problem, and AIM637, the negative-correlation problem with unrestricted masses. Their statements were read. Their archived status reviews and search logs compare the three-cell theorem, conditional hyperstability, and the unrestricted propeller problem. These are source leads and scope records, not proofs that all later work is absent.

The new native matches additionally include catalog renumbering/history, queue records, unique-games application descriptions, and the source's symmetric Gaussian perimeter question. The latter concerns cylinders and complements, not a balanced multi-cell finite-noise optimizer. The independent [supplemental comparison](low-correlation-supplement/SUPPLEMENTAL_SCOPE.md) reads the PDF/embedded matches, including propagation of chaos, scalar Gaussian variance mixtures, and random-tensor singular values. Every supplemental match has a separate classification and reading scope.

## OpenAI/math

The native and PDF copies of *The Gaussian Propeller Bound in Every Dimension* concern the unrestricted first-moment maximum. Empty cells are permitted, and equality uses three nonempty sectors. Its introduction, Theorem 1.1, Section 1.2, application, and remaining relevant occurrences were read. The independent reviewer records the exact comparison in [SUPPLEMENTAL_SCOPE.md](low-correlation-supplement/SUPPLEMENTAL_SCOPE.md).

The matched *Unique Games* source uses Isaksson–Mossel's invariance principle to transfer between discrete and Gaussian ensembles. This does not itself identify the maximizing Gaussian partition. The Min-UnCut and Max-Cut papers have binary outputs. The Hellinger and binary-information contraction papers have discrete-cube information objectives. Their actual stated objectives and relevant Gaussian/noise passages were checked, rather than treating their use of the word “noise” as the target theorem.

Other native matches use the standard simplex in topology, algebraic geometry, convex-body projection, or integration. The main-pass PDF *The Euclidean plane is not five-colorable* is one extra match outside the independent reviewer's literal-term list: the match is “linear-independence” in a measurable-section argument, and its abstract concerns monochromatic unit-distance pairs. Its statement and matched passage were read. It does not concern Gaussian simplex noise stability.

The independent review classifies all 55 of its broader PDF matches, including summary copies, Boolean information, hard-sphere fluctuations, Ising correlation decay, and false-positive linear-independence passages. It does not claim to have verified the full proofs of those unrelated results.

## Trure

The main pass has 83 matches, with no exact Standard Simplex identifier or word-bounded author-name hit in its saved bodies. Three matched records concern Faifman–Polterovich's Gaussian dilation question: `Problems/faifman-polterovich-2026-centred-gaussian-dilation.md` and the corresponding Blueprint and scribe records. The source's statement, counterexample mechanism, and barycenter distinction were read. It concerns a Gaussian B-type dilation inequality for convex bodies with zero Lebesgue barycenter, not a partition noise objective.

The other matches use standard simplexes in topology, linear independence, the distinct Heilmann–Lieb name, or unrelated probability. The coupon-collector strong-dominance statement was read and is unrelated. No formalization was executed.

## Principia

The two main-pass matches are the PDF and TeX copies of `site-backup/mathdb-376979/mathdb-376979-solution`, a Stolarsky-monotonicity/logarithmic-mean-smoothing result. Its abstract, target statement, and matched passage were read. It uses a uniform distribution on an ordinary simplex and a linear-independence argument; it does not state a Gaussian partition comparison.

## ArtificialZeng

The 23 main-pass records belong to two nearby lexical groups and their indexes/copies: BW2-B06-P13 concerns Atiyah–Sutcliffe linear independence for centered pyramids; BW2-B85-P10 concerns domination-polynomial log-concavity and cites a different paper coauthored by Heilman. The actual PDF abstracts/statements and source match contexts were inspected. Neither is a Gaussian partition result. The Brown–Mol registry merely lists one of those earlier sources. The size-limited compressed certificates and binary figures remain explicit scan limits.

## Reading boundary

This is semantic triage of retrieved matches, with full statement and relevant-section reading for plausible mathematical overlaps. It is not a claim to have read every line of every catalog, every unrelated proof, or unconverted binary bodies. The main and supplemental patterns differ; their recorded unions, rather than a bare count of PDF conversions, describe the actual evidence. No earlier exact all-cell low-positive-correlation theorem was found within that bounded evidence.
