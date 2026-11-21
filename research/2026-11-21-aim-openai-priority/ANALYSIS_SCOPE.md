# OpenAI archive: analysis scope comparisons

Audit date: 21 November 2026. Reviewer: analysis agent.

## Status and corpus

No prior resolution of the four assigned targets was found in the completed native-text and PDF passes. All target-tagged PDF matches were classified, including the three public reasoning-trace documents not represented by the corresponding native-paper matches. The three additional Ising papers inspected for Johnson also have different hypotheses and conclusions. This is a source-scope finding, not a claim that all the unrelated manuscripts have valid proofs.

The coordinator completed the additional NFKC-then-casefold pass over all 173,622 native OpenAI files. It found zero additional target/file matches. The native and PDF semantic comparisons and the normalized residual gate for this report are complete.

The archive is [OpenAI/math at `4eaee87548250b2682affda7d05d947c05554bae`](https://github.com/openai/math/tree/4eaee87548250b2682affda7d05d947c05554bae). Its downloaded size is 896,084,751 bytes and its SHA-256 is `4fee0780fe7cfa1bf7bdd9043e947b70e91ed9727bbecf08adc664d868d22f55`. The native scanner read all 173,622 regular UTF-8 files and retained the complete 1,349 matching files. It searched full bodies and paths with case folding; it did not apply Unicode NFKC normalization. The separate checks of the PDF texts described here did apply NFKC before case-insensitive matching.

The native pass uses `targets.json`, `openai-text-manifest.json`, and `openai-text-matches.json`. The supplemental semantic search added word-bounded names and phrases such as `arccoth`, `beta ... second ... kind`, `Berg ... Pedersen`, `Chen ... Rubin`, `Vitale`, and `Wills ... functional` to the already retained full files. That supplemental search is not represented as a second search of every archive member. Search hits in formal source files were read only to identify their mathematical subject; no Lean verification was performed.

| Assigned target | Native matching files | PDF matching files | Scope finding |
| --- | ---: | ---: | --- |
| Roos–Seiringer | 47: 42 preprint files, 5 formal source files | 20 | Robert Seiringer citations in other quantum models; Joris Roos in harmonic analysis; a derived-limit Roos complex; the identifier `roost`. No BCS half-space radial-kernel assertion found. |
| Dospolova–Germanskov–Zaporozhets | 72: 5 preprint files, 67 formal source files | 3 | Finite-dimensional volume usages; a Gaussian decay condition on Fourier pairs; numerical certificate substrings. No Hilbert-space intrinsic-volume realization theorem or equivalent strict obstruction found. |
| Ferreira–Simon | 2 preprint files | 1 | David Dos Santos Ferreira's inverse-boundary results. No beta-prime convolution identity found. |
| Lyon | 842: 52 preprint files, 788 formal source files, 2 index files | 23 | Lyons, Delyon, Lyonell, the city of Lyon, identifiers containing `lyOn`, and embedded digit strings. No gamma-median monotonicity assertion found. |

The raw counts are deliberately not counts of relevant papers. The extra semantic search also found two self-convolution usages among files retained for other targets. Their scopes are recorded below.

The supplemental manifest records successful text conversion of all 789 PDFs, with no empty converted text; 120 PDF records match at least one campaign target. The remaining 113 non-UTF-8 files are 110 mutually-unbiased-basis numerical `.bin` files and three PNG diagrams. They were not decoded as mathematical prose. The PNG paths are a Lieb–Thirring half-line gluing diagram and two randomized k-server diagrams. No PDF conversion, size, or recursion-depth limit was hit. The declared scanner limits are 256 MiB per expanded entry and depth eight. These facts are recorded in `openai-supplement-manifest.json`, rather than inferred from a directory count.

## Roos–Seiringer

The target is the complete scalar assertion following Lemma 5.1 of *BCS Critical Temperature on Half-Spaces*, [arXiv:2306.05824](https://arxiv.org/abs/2306.05824), [published DOI 10.1007/s00205-025-02088-x](https://doi.org/10.1007/s00205-025-02088-x): nonnegativity of the radially averaged three-dimensional Dirichlet kernel for every radius. The statement is about the specific sine-integral/arccoth expression in that lemma, with the chemical-potential scaling (5.2). It is not generic positivity of a Dirichlet resolvent or a statement about Bose condensation.

The potentially relevant physics matches were checked against their actual introductory statements and, where available during the pass, their complete converted PDFs:

| Archive paper or group | Actual claimed scope | Comparison with the target |
| --- | --- | --- |
| *A density-uniform condensate bound for dilute Bose gases*; *Ground-state condensation in the dilute hard-sphere gas*; *Bose–Einstein condensation at positive temperature in the dilute hard-sphere gas* | A positive constant-orbital occupation fraction for repulsive Bose Hamiltonians, in specified thermodynamic and dilute regimes | The cited Seiringer results concern Gross–Pitaevskii or Bose-gas limits. These statements do not concern the BCS half-space radial kernel. |
| The two *Quantum Depletion* papers | Bogoliubov depletion or momentum-distribution asymptotics for repulsive Bose gases at zero temperature | Their `BCS` occurrences are bibliographic keys for Basti–Cenatiempo–Schlein, not the Bardeen–Cooper–Schrieffer half-space model. |
| *Bloch's Law for Finite-Range Heisenberg Ferromagnets*; *Spontaneous magnetization*; *The first lattice correction to Bloch's law*; *The spherical magnetization law* | Quantum-spin magnetization or its low-temperature asymptotics | The kernels belong to lattice spin and path representations. No statement identifies or proves the radial function in Roos–Seiringer Lemma 5.1. |
| *A Coulomb ground-state density without Kohn–Sham ensemble representation* | Failure of noninteracting ensemble representation for a three-electron Coulomb density | Its half-space positivity is for Schrödinger ground states and resolvents in an auxiliary symmetry argument, not the target scalar kernel. |
| BFSS threshold states, spherical Laughlin gaps, Coulomb excess charge, and triangular-lattice universal optimality | Their respective spectral, electrostatic, or packing statements | The matches cite Frank–Seiringer, Seiringer–Yngvason, Bellazzini–Frank–Lieb–Seiringer, or Lewin–Lieb–Seiringer results of different scope. |

Representative primary-source checks at the pinned commit:

- [Bloch main theorem](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/preprints/Blochs-Law-for-Finite-Range-Heisenberg-Ferromagnets-in-Three-Dimensions-October-5-2026/build/sections/01-introduction.tex): its coefficient is the determinant of the quadratic one-magnon dispersion, for a finite-range lattice interaction.
- [Dilute-gas historical comparison](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/preprints/A-density-uniform-condensate-bound-for-dilute-Bose-gases-September-27-2026/build/sections/history.tex): the referenced Seiringer work concerns macroscopic eigenvalues of a one-particle density matrix, with the interaction/volume limits stated explicitly.
- [Quantum-depletion introduction](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/preprints/Quantum-Depletion-for-Fixed-Bounded-Repulsive-Potentials-October-5-2026/build/source/sections/introduction.tex): the model is a repulsive periodic Bose gas and the limit is the depletion fraction.

The other preprint-name matches are Joris Roos's harmonic-analysis papers, not Barbara Roos; and the algebraic-topology Roos complex, which computes a derived inverse limit. All five matching formal source files are in a logspace construction and use the identifier `roost`. Exact source ID, DOI suffix, radial-Dirichlet phrase, and arccoth checks did not find the target in the inspected matched texts.

The additional [public Heisenberg reasoning trace](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/reasoning_traces/spontaneous-magnetization-quantum-heisenberg-ferromagnet.pdf) was read around all Seiringer matches and its problem statement. It concerns spontaneous magnetization for a nearest-neighbor quantum-spin Hamiltonian, and cites the spin-wave free-energy theorem and Seiringer's 2025 account. It does not introduce the BCS half-space kernel.

## Dospolova–Germanskov–Zaporozhets

The target is Conjecture 3.6 of [arXiv:2507.11626](https://arxiv.org/abs/2507.11626): whether every positive sequence with $`a_0=1`$ and log-concave $`k!a_k`$ is the intrinsic-volume sequence of a Gaussian-bounded convex compact subset of a separable Hilbert space. The campaign disproof excludes the complete family $`a_k=c^k/k!`$, $`c>0`$. An earlier strict necessary condition for all nontrivial Hilbert-space GB compacta would therefore be material prior art even without the authors' names.

The nonnumeric native matches have the following scopes:

1. [Petty consequences, lower-degree projection bodies](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/preprints/Pettys-projection-volume-conjecture-in-dimensions-at-least-four-September-24-2026/build/latex/sections/07_consequences.tex). The stated corollary assumes a convex body with nonempty interior in $`\mathbb R^n`$ and compares $`V_{i+1}(\Pi_iK)/V_{i+1}(K)^i`$ with the Euclidean-ball value. The relevant introduction and the full lower-degree corollary/proof were read. They give neither Hilbert-space sequence realizability nor a strict $`V_1^2>2V_2`$ obstruction for all GB compacta. The paper explicitly makes no equality classification for this lower-degree corollary.
2. [Finite-entropy linear estimates](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/preprints/A-finite-entropy-system-without-a-smooth-positive-volume-model-September-25-2026/build/sections/03-linear.tex). The words “intrinsic volume expansion” refer to the exterior Jacobian of a finite-dimensional triangular linear cocycle: a determinant exponential multiplied by a ratio of endpoint Gram determinants. They do not mean the Steiner intrinsic-volume sequence of a convex body. The corresponding PDF is titled *A zero-entropy system without a smooth positive-volume model*; this title/source-directory difference is retained in the reading record.
3. [Triangular energy density source header](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/lean/OAI/Analysis/Triangular/Energy/Density.lean). “Gaussian-bounded Fourier pairs” is a decay/regularity description for functions on the plane in an energy linear-programming bound. The definition lists continuity, integrability, Fourier integrability, a first moment, and a bounded norm. It is not the Gaussian-bounded compact-set notion in the conjecture.

The remaining 66 formal-source files and two matrix-multiplication certificate files match the digits `369313` inside numerical data. No author name, exact arXiv ID, Steiner-entire-function assertion, or relevant Vitale/Hilbert realization statement was found in these matches.

The third matching PDF, [the public Mahler reasoning trace](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/reasoning_traces/symmetric-and-general-mahler-conjectures.pdf), was checked separately. Its §13 uses normalized intrinsic volumes of a finite-dimensional convex body and its polar, in a transport/curvature-moment attempt to estimate a volume product. The inspected passage records a weaker-constant obstruction. It contains no Hilbert-space GB realizability assertion or strict intrinsic-volume inequality applicable to all GB compacta.

## Ferreira–Simon

The target is the complete distributional identity in Conjecture 1 of [arXiv:2108.09244](https://arxiv.org/abs/2108.09244), for every $`a>0`$ and $`0<b<1/2`$:

```math
B'_{a,b}+\widetilde B'_{a,b}
\overset{d}{=}
B'_{2a,b}\left(1+\sqrt{B_{a,1/2}/B_{b,1/2-b}}\right),
```

with independence on each side.

Both native target-tagged files belong to [*Smooth anisotropic uniqueness in the Calderón problem from one boundary patch*](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/preprints/Smooth-Anisotropic-Uniqueness-in-the-Calderon-Problem-from-One-Boundary-Patch-September-24-2026/build/sections/01-introduction.tex). The main theorem identifies smooth Riemannian metrics up to a boundary-fixing diffeomorphism from a local energy Dirichlet-to-Neumann map. Its bibliography and historical discussion cite **David Dos Santos Ferreira**, Kenig, Salo, Sjöstrand, and Uhlmann. These are not Rui A. C. Ferreira's beta-prime distribution results.

The expanded self-convolution search found two other usages among files retained for different targets:

- [Honeycomb-walk boundary calculation](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/preprints/Radial-transfer-estimates-and-polygon-length-laws-for-honeycomb-walks-September-26-2026/build/sections/boundary.tex), in the subsection on the homogeneous correction: the self-convolution of a hyperbolic-secant density is proportional to $`z/\sinh(\pi z)`$. It is used for the orthogonality and norms of two Meixner–Pollaczek weights. It does not concern sums of beta-prime variables or the conjectured factorization.
- A prime-number-theorem patch describes obtaining a nonnegative Fourier transform by convolving a smooth compactly supported function with itself. This is also unrelated.

No native beta-prime phrase or exact source identifier was found. The full Calderón PDF's matching passages agree with its native source.

## Lyon

The target is strict decrease on all $`a>0`$ of

```math
A(a)=2^{1/a}m(a)-a,
```

where $`m(a)`$ is the median of the unit-scale gamma distribution. The original PLOS paper has DOI suffix `0288601`; the current source [arXiv:2611.14429](https://arxiv.org/abs/2611.14429) explicitly discusses the unresolved monotonicity.

All 52 matching preprint files were classified by their actual matching references or passages. The names are Russell, Terry/Terence, or Richard **Lyons**; Bernard or François **Delyon**; or **Lyonell** Boulton. The exact word “Lyon” occurs in three author-hosted URL/address contexts and the publisher address of a 1901 source. These are not Richard F. Lyon or the gamma-median problem. The two index matches describe Russell Lyons's factor-of-IID question for free Ising spins.

The broad substring `lyon` also matches formal identifiers such as `LocallyOn` and `StronglyOn`. Word-bounded name and gamma/median checks remove these matches. Twelve numerical formal-source files and the `qP780_gmp` matrix-multiplication input contain one of the PLOS numeric suffixes inside longer integers; they are not article citations. No gamma-median, Chen–Rubin, or Berg–Pedersen monotonicity statement was found in the inspected matched files.

All 23 matching PDFs have the same unrelated-name or city interpretation. The additional [Kaplansky reasoning trace](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/reasoning_traces/kaplansky-direct-finiteness-characteristic-two.pdf) invokes Russell Lyons and Fedor Nazarov's invariant-matching result for nonamenable Cayley graphs, not a distributional median theorem.

## Johnson: three additional Ising papers

The Johnson target is Conjecture 7.1 of [arXiv:2610.24371](https://arxiv.org/abs/2610.24371): for every positive nonincreasing log-convex distance kernel, every even matrix size, and every perfect matching, its positive-upper-triangle Pfaffian dominates that matching's edge product. Physical boundary-spin Pfaffian identities have to be compared with these exact quantifiers.

| Pinned OpenAI source | Inspected Pfaffian statement | Scope comparison |
| --- | --- | --- |
| [Bulk Ising universality introduction](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/preprints/Conformal-universality-of-bulk-Ising-correlations-under-weak-interactions-September-23-2026/build/sections/introduction.tex) | Its sole full-PDF Pfaffian occurrence cites Cava–Giuliani–Greenblatt's boundary-spin scaling limit in the free half-plane. The paper's own theorem concerns mixed bulk spin/energy limits under small square-symmetric finite-range even perturbations. | No all-kernel or all-matching inequality is asserted. |
| [SLE3 universality introduction](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/preprints/SLE3-universality-for-weak-finite-range-Ising-interactions-September-23-2026/build/sections/01-introduction.tex) | The three full-PDF occurrences cite that renormalized boundary-spin limit and Aizenman–Duminil-Copin–Tassion–Warzel's asymptotic Pfaffian relation under ferromagnetic, translation-invariant, square-symmetric finite-range pair interactions with connected interaction graph. | These hypotheses describe actual Ising laws and their critical limits. They do not assert that every log-convex distance matrix has such a realization. |
| [Quenched FK–Ising boundary section](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/preprints/Quenched-SLE-Universality-for-Weakly-Disordered-FK-Ising-Interfaces-October-5-2026/build/sections/boundary.tex) | It uses the physical free-dual boundary-spin Pfaffian identity, then the specific continuum kernel $`(x_j-x_i)^{-1}`$. Its four-switch ratio is $`1-\ell+\ell/(1-\ell)=1+\ell^2/(1-\ell)`$. | This is a four-point cancellation for boundary correlations of the specified model. It is not arbitrary-order domination for an arbitrary log-convex function. |

The complete converted PDFs were searched and all of their Pfaffian occurrences were inspected. None of these papers supplies a realization theorem for Johnson's whole matrix class. Applying a physical Pfaffian identity and Griffiths inequalities to an arbitrary matrix would require that additional theorem; it cannot be omitted merely because the matrices have positive entries. This comparison is consistent with the separate planar-Ising discussion in the Johnson priority audit.

## Limits and completion

This report makes a bounded negative finding about the specified snapshot. It does not prove absence of prior art everywhere. Matching digits, names, and titles were not treated as mathematical resolutions. Conversely, a theorem with different names would count as prior art if its actual statement implied the target; the intrinsic-volume and physical-Pfaffian comparisons above were made for that reason.

Completion state: complete for the specified snapshot and declared limits. The coordinator's NFKC-then-casefold residual pass over all 173,622 OpenAI native files found zero additional target/file matches. Its separate AIM pass over 4,624 native files also found zero additional matches; AIM's semantic comparisons are in the coordinator's audit, not asserted to have been independently repeated here. No new priority collision was found for the four assigned analysis targets or the three additional Johnson/Ising sources.
