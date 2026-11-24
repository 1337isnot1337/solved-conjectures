# History

## 2026-11-23 — Three-evaluation Fourier filter for quadratic resultants

A [cube-root-of-unity character filter](research/complex-bss-p-vs-np/FOURIER_RESULTANT_FILTER.md) extracts the VNP-hard BCJS grid coefficient from three tensor-resultant evaluations as the first nonzero homogeneous part. It transfers the imported 2^{Omega((log N)^{4/3})} border lower bound to generic quadratic resultants. Even the cofactor 1+a* causes the filter to expose a degree-one term, so the exclusion-complexity target and P_C versus NP_C remain open. [Finite checker](research/complex-bss-p-vs-np/verify_fourier_filter.py).

## 2026-11-23 — Smooth algebraic certificates imply small circuits

The [smooth-certificate note](research/complex-bss-p-vs-np/SMOOTH_CERTIFICATE_BARRIER.md) proves a regular implicit-circuit lemma and its extension to positive-dimensional regular witness fibers. A polynomial graph with such a certificate has polynomial arithmetic-circuit complexity. Using the standing permanent lower bound, this excludes generically regular polynomial-size existential encodings of the permanent graph, but **does not** exclude general NP_C witnesses. [Finite Newton check](research/complex-bss-p-vs-np/verify_smooth_implicit.py).

## 2026-11-23 — Valiant’s extended hypothesis, two-branch research

A variable-scale first lift gives a written superquasipolynomial permanent lower bound under the contracting hypothesis. In the flat case a bounded-degree construction recovers the source exponent, and a cut-dependent placement handles balanced cuts covered by few Hamming balls. A tensor-train decomposition and a shared matrix-product circuit identify where independent rank multiplication fails. The unrestricted flat implication remains open. [Research proofs and finite checks](research/valiant-extended/) · [Issue #256](https://github.com/1337isnot1337/solved-conjectures/issues/256) · [PR #257](https://github.com/1337isnot1337/solved-conjectures/pull/257)

## 2026-11-23 — Complex BSS separation research and failed reductions

Added [research notes](research/complex-bss-p-vs-np/README.md) for the full uniform complex BSS separation with arbitrary machine constants. The exact model/source audit was merged through [PR #252](https://github.com/1337isnot1337/solved-conjectures/pull/252). This checkpoint adds the sound growing-alternation weighted protocol, counterexamples to its immediate compressions, a boundary extraction lemma, the sub-log-log alternation threshold, explicit resultant and matching incidences, and multiplier/coordinate-weight obstructions. Exact symbolic checks validate the listed identities. The incidence and fixed-level hierarchy bridges remain unresolved; no separation, new solved-conjecture count, or Lean verification is claimed. The canonical graph lower bound is credited to [PR #249](https://github.com/1337isnot1337/solved-conjectures/pull/249), the Anthropic lower bound, and Bürgisser's factor transfer. [Tracking issue #248](https://github.com/1337isnot1337/solved-conjectures/issues/248).

## 2026-11-23 — Newton-polytope obstruction for BCJS tensor-resultant coefficients

Proved that, after at most one extra padding coordinate, grid-assignment monomials in the BCJS tensor determinant are midpoints of supported monomial exponents 0 and 2v. This rules out isolating the hard degree-s grid coefficient by diagonal monomial rescaling at that padding dimension. [Proof](research/complex-bss-p-vs-np/GRID_NEWTON_BARRIER.md) · [Checks](research/complex-bss-p-vs-np/verify_grid_newton.py). The BSS separation remains open.

## 2026-11-23 — Put major theorem consequences immediately after solved results

Moved the imported-theorem consequences directly below the root Results section and listed the quantitative BSS permanent-graph lower bound first. The catalogue now uses the same category and order. This increases visibility while keeping these consequences separate from the solved-conjecture count and preserving the distinction between the permanent-graph obstruction and the open $`\mathsf P_{\mathbb C}`$ versus $`\mathsf{NP}_{\mathbb C}`$ separation.

## 2026-11-23 — Dimension obstruction for cofactor-robust resultant jets

Proved an orbit-dimension/vanishing-ideal lemma for the quadratic resultant: a special family of dimension $d$ and the natural two GL(n+1) symmetries cannot fill the resultant hypersurface when $d+2(n+1)^2<N_n-1$. An arbitrary nonzero cofactor can then mask all bounded-order jets on that orbit. [Research note](research/complex-bss-p-vs-np/SYMMETRY_JET_BARRIER.md). The result neither bounds the cofactor's circuit complexity nor separates complex P from NP.

## 2026-11-23 — Boolean Hamiltonicity transfer research

Recorded a self-contained investigation of the proposed arithmetic-to-Boolean P-versus-NP transfer. Proved the shared minimal component, all cycle-union coefficients, the first overlap layer, and a restriction preserving Hamiltonicity while killing the exact-cycle predicate. A stronger obstruction gives monotone logarithmic-space predicates with the same logarithmic band of higher components. Small monotone formulas refute the tested all-cut-rank bounds; the support-quotient analysis identifies the remaining efficiency gap. Internal cross-review and exact finite checks passed. No unrestricted circuit lower bound or P != NP proof is claimed, and the work remains outside the solved-results table. [Notes and checks](research/boolean-hamiltonicity/) · [Issue #251](https://github.com/1337isnot1337/solved-conjectures/issues/251) · [PR #253](https://github.com/1337isnot1337/solved-conjectures/pull/253).

## 2026-11-23 — Quadratic resultant exclusion barrier and permanent zero-testing

Added a [research note](research/complex-bss-p-vs-np/RESULTANT_EXCLUSION.md) under the open complex BSS campaign #248. It proves a precise sufficient exclusion-complexity criterion for separating nonuniform P_C from NP_C, records why the exponential degree of quadratic resultants prevents the known border-factor theorem from closing that criterion, and derives a quantitative lower bound for testing whether the permanent is zero. The complex BSS separation remains open; the decision lower bound is a deduction from imported factoring theory and the repository's standing VP != VNP assumption. No new solved-conjecture row was added.

## 2026-11-23 — Adoption of the Anthropic VP ≠ VNP standing assumption

The [agent policy](AGENTS.md#standing-research-assumption-anthropics-vp-versus-vnp-proof) now directs repository work to take Anthropic's VP ≠ VNP theorem, proof, and stated scope as true and accurate. The root index, catalogue, and weighted 3-CNF note now describe the border lower bound as a consequence of this imported theorem rather than as a speculative if-then claim. This research premise is not a statement of independent external review or a new Lean formalization; new reductions and implications still require proofs.

## 2026-11-23 — Quantitative permanent-graph decision consequence

Added a complete written deduction of the $`2^{\Omega((\log m)^{4/3})}`$ deterministic complex computation-tree lower bound for deciding the permanent graph. The proof combines the pinned Anthropic border lower bound with Bürgisser's corrected factor theorem, handles defined divisions through a single path numerator, and records an explicit $`m^2\log m`$ loss, an elementary $`m^{10}`$ alternative, arbitrary constants, and the uniform BSS simulation. Three internal adversarial reviews found no remaining gap after model clarifications. This is recorded as a consequence of imported theorems, with no additional solved-conjecture count, no new Lean-verification claim, and no $`\mathsf P_{\mathbb C}\ne\mathsf{NP}_{\mathbb C}`$ claim. [Proof and audits](research/bss-permanent-graph/) · [Issue #247](https://github.com/1337isnot1337/solved-conjectures/issues/247) · [PR #249](https://github.com/1337isnot1337/solved-conjectures/pull/249) · [Separate BSS campaign #248](https://github.com/1337isnot1337/solved-conjectures/issues/248)

## 2026-11-23 — VP versus VNP application to sparse 3-CNF

Added an explicit 3-occurrence 3-CNF encoding whose weighted satisfying-assignment polynomial projects to the Hamiltonian-cycle polynomial in every characteristic. Finite checks cover n=3,4 and structural checks n=5..8. The border-circuit lower bound is obtained from the Anthropic VP ≠ VNP theorem, now adopted as valid for repository research under `AGENTS.md`. The original source had not received independent human review when this note was first written. This is not counted as an additional solved conjecture. [Construction and checks](research/vp-vnp-bounded-occurrence-3cnf/README.md).

## 2026-11-22 — Written proofs for the iid bounty scope

The fair-label disproof now includes a direct proof of the information inequality on the actual iid experiment. A separate written theorem obtains the positive rates whenever a measurable ERM has the companion paper's global consistency property. The circle-orbit example rules out that premise even when an ordinary Borel ERM exists. [Disproof and information calculation](research/steinke-zakynthinou-agnostic-vc/completed-finite-groups.md#fair-labels-and-improper-learners) · [Positive theorem](results/steinke-zakynthinou-agnostic-vc/PROOF.md#a-measurable-globally-consistent-erm-suffices)

## 2026-11-22 — Fair-label information lower bound for the literal iid conjecture

For each positive sample size $`n`$, a VC-one benchmark with $`8n^2`$ sectors forces CMI at least $`n/32`$ for empirical tolerance at most $`1/8`$, even with improper outputs. Lean verifies the outer-measure realization of every label pattern on distinct sectors, the collision bound, the population loss, and the conclusion from the COLT paper's generalization inequality. [Lean theorem](lean/Conjectures/AgnosticVC/FairLabelObstruction.lean) · [Written proof](research/steinke-zakynthinou-agnostic-vc/completed-finite-groups.md#fair-labels-and-improper-learners)

## 2026-11-22 — The actual seeded CMI experiment

Lean verifies that a proper learner meeting the empirical rate cannot yield a measurable ambient output random variable in the original independent pool, selector and seed experiment. Restricting to the all-zero selector transfers completed measurability to the first column and seed. The proof uses ordinary seed expectations on each sample. [Lean theorem](lean/Conjectures/AgnosticVC/ConditionalJointObstruction.lean) · [Written proof](research/steinke-zakynthinou-agnostic-vc/completed-finite-groups.md)

## 2026-11-22 — Ambient standard Borel output and the agnostic VC disproof

Lean verifies the finite-support disproof when conditional information is computed on the ambient standard Borel space of classifier codes. Properness still restricts the output to the trace Borel subclass. The manuscript now contains the finite-support construction, the conditional-law reduction, and the class-by-class uniform-convergence proof. [Lean theorem](lean/Conjectures/AgnosticVC/ConditionalJointObstruction.lean) · [Manuscript](results/steinke-zakynthinou-agnostic-vc/paper.pdf)

## 2026-11-22 — Completed-iid rates for unbounded supports with bounded overlap

Lean verifies the reweighted iid experiment and its occupancy bound. Under a sharp expected outer uniform-deviation bound $`B\sqrt{d/n}`$, the integer-noise learner attains actual iid CMI at most $`20s`$ nats and expected empirical excess at most $`(16B^2+9)\sqrt{d/n}`$ for overlap $`s`$, allowing infinite supports. [Lean learner theorem](lean/Conjectures/AgnosticVC/NoisySupportSharpIid.lean) · [Lean null-support argument](lean/Conjectures/AgnosticVC/IidRectangleDensity.lean)

## 2026-11-22 — Completed-iid rates for bounded-size supports

Lean verifies a proper integer-noise learner with actual iid CMI at most $`20s`$ nats and expected empirical excess at most $`m/n+8/\sqrt n`$ for support size $`m`$ and pointwise overlap $`s`$. Almost surely the eligible names have positive marginal support mass, so they belong to a countable family for each iid law. [Combined Lean theorem](lean/Conjectures/AgnosticVC/NoisySupportIid.lean) · [Proof and scope](research/steinke-zakynthinou-agnostic-vc/completed-disjoint-support-learner.md)

## 2026-11-22 — Disproof from the actual iid selector/output law

Lean verifies the empirical-rate obstruction assuming the actual conditional selector/output law in iid CMI has a measurable version on the completed pool. The proof permits arbitrary pointwise output measures and almost-everywhere agreement. The all-zero selector gives the learner's kernel after dropping the independent ghost column. [Lean disproof](lean/Conjectures/AgnosticVC/ConditionalJointObstruction.lean) · [Proof and scope](research/steinke-zakynthinou-agnostic-vc/completed-finite-groups.md)

## 2026-11-22 — Finite score channels for agnostic VC learning

Lean verifies the fixed-pool information bound of $`20s`$ nats for integer-noise signed support counts with overlap $`s`$, together with the argmax regret and eligibility bounds. A written completed-iid learner gives 12 nats and $`2/\sqrt n+2/n`$ empirical excess for disjoint two-point supports. [Finite Lean channel](lean/Conjectures/AgnosticVC/CompactScoreNoise.lean) · [Completed-iid proof](research/steinke-zakynthinou-agnostic-vc/completed-disjoint-support-learner.md)

## 2026-11-22 — Sharp uniform convergence for the universal-measurability counterexample

Lean verifies that one VC-one class with disjoint two-point supports defeats every candidate empirical-rate constant when the scalar expected loss must be universally measurable on the sample space. The [same class has a measurable uniform-deviation envelope](lean/Conjectures/AgnosticVC/FiniteSupportUniform.lean) of expected value at most $`2/\sqrt n+2/n`$ for every iid law and sample size. The disproof uses a dependent pushforward to test universal measurability and all-sample accuracy at the resulting size. [Lean disproof](lean/Conjectures/AgnosticVC/CompletedFiniteGroups.lean) · [Proof and scope](research/steinke-zakynthinou-agnostic-vc/completed-finite-groups.md#universal-measurability-on-the-sample-space)

## 2026-11-22 — Randomized-learner formulation of the completed-iid obstruction

The [finite-support disproof](lean/Conjectures/AgnosticVC/CompletedFiniteGroups.lean) now directly quantifies over a learner with an arbitrary independent random seed. Measurability of its realized loss under the completed product experiment gives the scalar measurability used in the obstruction. All proper hypotheses have population loss one under the test law. [Proof and source scope](research/steinke-zakynthinou-agnostic-vc/completed-finite-groups.md)

## 2026-11-22 — Measurable reconstruction for the agnostic VC learner

Lean proves both agnostic rates for classes whose finite traces can be realized by countably many measurable proper reconstructions using at most $`k`$ input rows. The same learner has expected empirical excess at most $`583\sqrt{d/n}`$ on every sample and actual iid CMI at most $`197{,}120d+32k`$ nats. The [circle-orbit class](lean/Conjectures/AgnosticVC/OrbitIidRates.lean) admits one-row reconstruction and attains both rates with a Borel learner, even though the globally ordered representative rule fails there. [General Lean theorem](lean/Conjectures/AgnosticVC/LocalReconstructionMeasurable.lean) · [Argument and scope](research/steinke-zakynthinou-agnostic-vc/measurable-local-reconstruction.md)

## 2026-11-22 — Scalar expected-loss obstruction for agnostic VC learning

The [Lean disproof](lean/Conjectures/AgnosticVC/CompletedFiniteGroups.lean) for completed iid laws now needs only measurability of the real-valued expected empirical loss. For any proposed universal constant the exhibited VC-one class forces this quantity to be nonmeasurable if the empirical excess bound holds on every sample. The scalar obstruction is independent of the output sigma-algebra. [Proof and scope](research/steinke-zakynthinou-agnostic-vc/completed-finite-groups.md)

## 2026-11-22 — Distribution-free agnostic VC conjecture in the framework paper

Lean verifies [Conjecture 4.18](https://arxiv.org/pdf/2001.09122v3) with common constant $`19{,}712`$ for every positive sample size and arbitrary hypothesis classes of finite positive VC dimension. The [theorem](lean/Conjectures/AgnosticVC/FixedPairing.lean) gives both the bound on whole-output selector information for every fixed paired pool and the samplewise empirical rate. It includes $`n<d`$ by using a constant proper learner. The COLT formulation uses the iid CMI and its [measurability scope](results/steinke-zakynthinou-agnostic-vc/SCOPE.md) is recorded separately.

## 2026-11-22 — Finite-support counterexamples for completed-iid proper learners

Lean verifies the [failure of the Conjecture 6 empirical rate](lean/Conjectures/AgnosticVC/CompletedFiniteGroups.lean) for every proposed constant on a VC-one class with finite disjoint supports. The [written proof](research/steinke-zakynthinou-agnostic-vc/completed-finite-groups.md) gives distribution-uniform convergence in outer probability and quantifies why it lacks the absolute VC-one bound at the counterexample sample size. A [separate Lean counterexample](lean/Conjectures/AgnosticVC/BorelChoiceObstruction.lean) covers globally Borel kernels on standard Borel spaces with Borel trace feasibility. The scope of the original bounty awaits clarification.

## 2026-11-22 — Information bound for every fixed pairing in agnostic VC learning

The [fixed-pairing theorem](lean/Conjectures/AgnosticVC/FixedPairing.lean) bounds whole-output selector information by $`19{,}712d`$ nats on every paired pool, using the same proper learner and samplewise empirical bound. Comparing the two choices in a row to the common deleted sample removes the permutation average. The population theorem still requires the stated measurability convention. Added written scope results for [Borel trace feasibility](research/steinke-zakynthinou-agnostic-vc/borel-traces-and-randomized-selection.md) and [dominated marginals](research/steinke-zakynthinou-agnostic-vc/dominated-marginals.md).

## 2026-11-22 — Shifted lonely runner counterexamples for 18 ≤ n ≤ 54

Added [exact counterexample certificates](results/shifted-lonely-runner-counterexamples/) to the shifted Lonely Runner Conjecture for every `n` with `18 <= n <= 54`, a partial answer to Zhang's Question 8.5 (arXiv:2608.13599v3), which was open for `18 <= n <= 94` after Blanco–Criado–Santos (`5 <= n <= 17`) and Poliakova (`n >= 95`). Each certificate is checked exactly by a standard-library verifier with two independent methods. The range `55 <= n <= 94` remains open and nothing is claimed there; the heuristic searches stopped at `n = 55`, which is not evidence for the conjecture. For `41 <= n <= 54` the speeds are not `1..n`, as the conjecture allows. Not formalized. Contributed by [@aadrianvv](https://github.com/aadrianvv). [Issue #110](https://github.com/1337isnot1337/solved-conjectures/issues/110)

## 2026-11-22 — Graphs with circular chromatic index in the upper half for Δ ≡ 3 mod 4

Extended the answer to the remark in Section 8 of Mazák and Zrubák, *Circular chromatic index of small graphs* (arXiv:2603.08822), that no graph with maximum degree `Δ >= 8` and circular chromatic index in `(Δ+1/2, Δ+1)` was known, to `Δ ≡ 3 mod 4`. For every `g >= 15` an explicit simple graph on `6g+1` vertices has `Δ = 4g+3` and `χ'_c = Δ+2/3`. The construction uses a one-parameter family of base vertex sets for the perfect `(2n,3)`-colouring of a `4g`-regular circulant, in which every colour class lives on two cyclic intervals of sizes 6 and `2g-6`; besides the two blocks of length-1 edges of Family B, a third inserted block of edges of lengths 3 and 5 fits, and the base matchings, with lengths avoiding 1, 3 and 5, are given by explicit formulas. Stored SAT certificates give the same for `6 <= g <= 14`, so every `Δ ≡ 3 mod 4` with `Δ >= 27` has such a graph. With the earlier results, every `Δ >= 8` except `Δ ∈ {9, 11, 13, 15, 17, 19, 23}` now has one; for the remaining values the forward insertion framework of the note admits no example. The package contains the written proof, a standard-library verifier for `15 <= g <= 60` and the certificates, an independent standard-library re-check, and the report and scripts of one independent model referee pass, which found no mathematical errors; its minor points are applied. No Lean verification was performed.

## 2026-11-22 — Graphs with circular chromatic index in the upper half for Δ ≡ 2 mod 4

Extended the answer to the remark in Section 8 of Mazák and Zrubák, *Circular chromatic index of small graphs* (arXiv:2603.08822), that no graph with maximum degree `Δ >= 8` and circular chromatic index in `(Δ+1/2, Δ+1)` was known. For every `g >= 6` an explicit simple graph on `6g+1` vertices has `Δ = 4g+2` and `χ'_c = Δ+2/3`, and a variant with one insertion block has `Δ = 4g+1` and `χ'_c = Δ+2/3`. The proof solves the base matching problem of Family B in the circulant result by explicit formulas for every `g >= 7` (a stored base for `g = 6`), where SAT had solved it only for `6 <= g <= 13`. With the computer-checked colourings of `K_n-tK_2` for `Δ = 10, 14, 18, 22` and the circulants for `Δ ≡ 0 mod 4`, every even `Δ >= 8` has such a graph, and so does every `Δ ≡ 1 mod 4` with `Δ >= 21`. `Δ ≡ 3 mod 4` and `Δ = 9, 13, 17` remain open. The package contains the written proof, a standard-library verifier for `6 <= g <= 60` and the certificates, and the report and scripts of one independent model referee pass, which found no errors; no Lean verification was performed.

## 2026-11-21 — Circular chromatic index of complete graphs minus a few edges

Gave a second, shorter proof of Conjecture 2 of Mazák and Zrubák, *Circular chromatic index of small graphs* (arXiv:2603.08822): `χ'_c(K_n-e) = n` for every odd `n >= 7`. A smaller value would give a cyclic order of the edges in which every `m = (n-1)/2` consecutive edges are disjoint, and the residue classes of such an order force an edge to occur twice. Determined `χ'_c` for `K_n` minus two or three edges for small `n`, among them `χ'_c(K_11-2K_2) = 32/3`, which refutes the note's own earlier Conjecture H; the corrected Conjecture H′, `χ'_c(K_n-F) = n - 1/⌈m/t⌉` for `2 <= t <= m-1`, is stated without proof. Explicit colourings below `n` for `K_n-tK_2` at `n = 15, 19, 23, 27, 47` give graphs with `χ'_c` in `(Δ+1/2, Δ+1)` for `Δ = 14, 18, 22, 26, 46`. The package contains the written proof, the 32 colourings with a standard-library checker, a standard-library exhaustive search for perfect sequencings, optional SAT exclusions with a DRUP certificate generator, and the reports and scripts of two independent model referee passes. The colourings for `n = 19, 23, 27, 47` and the symmetry and structure lemmas added after the second pass are unrefereed; no Lean verification was performed.

## 2026-11-22 — Wild number of complete graphs for n ≥ 155

Added a [partial result](results/wild-number-complete-graphs/) on Conjecture 6.1 of Dawkins, Nappo, Tong and Zimbizi (arXiv:2610.22142): for every `n >= 155` and every minimum proper edge colouring of `K_n`, the wild number equals the source's lower bound. Odd `n >= 189` uses the lopsided local lemma (Theorem A), odd `155 <= n <= 187` a self-contained cluster-expansion lemma with sharper counts (Theorem B), and even `n` follows from `n-1`. Each theorem passed one independent model referee pass; the standard-library verifier rechecks every numerical condition in exact rationals. The conjecture stays open for `13 <= n <= 154`, the limit of this counting method; partial material for continuing, including a reduction of `n = 13, 14` to a finite statement and an unfinished cube-and-conquer run, is kept in the result's `continuation/` folder. Contributed by [@aadrianvv](https://github.com/aadrianvv). No Lean formalization. [Issue #155](https://github.com/1337isnot1337/solved-conjectures/issues/155)

## 2026-11-21 — Steinke–Zakynthinou’s agnostic VC learning conjecture

The [manuscript](results/steinke-zakynthinou-agnostic-vc/paper.pdf) and [combined Lean theorem](lean/Conjectures/AgnosticVC/Theorem.lean) establish a partial result on the unrestricted Conjecture 6. The multiscale entropy learner returns a member of the original hypothesis class. Its original selector-information and all-sample empirical bounds are verified under the [documented measurability conventions](results/steinke-zakynthinou-agnostic-vc/). Independent review is pending.

## 2026-11-21 — Measurable scope and source-class review

The [general VC manuscript](results/steinke-zakynthinou-agnostic-vc/paper.pdf) now includes a formal correspondence for both VC-one obstructions to Borel learning. The positive result covers countable domains and classes with a countable measurable subclass that realizes every finite trace. The [threshold review](results/steinke-zakynthinou-thresholds/LEAN_REVIEW.md) verifies the returned cutoff as a Borel Markov kernel, the source comparator at infinity, and the integrated KL relative to the actual conditional marginals. The [combined threshold theorem](lean/Conjectures/SteinkeZakynthinou.lean) uses the same learner for all iid labeled distributions and all fixed samples.

## 2026-11-21 — Proper agnostic thresholds with constant original CMI

Added a complete proposed proof of the separately rewarded threshold
case of Steinke–Zakynthinou Conjecture6. A shifted folded-rank tree,
private-tag rounding, and an adaptive rank-code conversion give a proper
finite real threshold with constant original information for every iid
distribution and the required empirical accuracy on every sample.
The complete argument passed two independent internal reviews and a fresh
primary-source audit found no exact prior resolution. The finite checker
audits indexing only; the theorem is not Lean-verified. No sponsor
acceptance, prize submission, bonus, or payment is claimed. This is one
target, with the proper and improper offers treated as alternatives.
[Proof and record](results/steinke-zakynthinou-thresholds/) ·
[Research issue](https://github.com/1337isnot1337/solved-conjectures/issues/223)


## 2026-11-21 — Gröchenig result withdrawn after checked prior resolution

The upper-density assertion in Gröchenig’s Problem 4.12 was already refuted by Alexanja Senke’s public September 2026 manuscript. The [correction record](research/bounty-continuation-2026-11-21/grochenig-prior-resolution/) contains two independent mathematical reconstructions, root’s check, the exact hypothesis comparison, signed-source chronology, and the separate direct-payment eligibility audit. The earlier proof gives coefficient sign-change densities 1/Q and infinite upper zero density for every positive integer Q; Q=2 strictly covers the repository’s upper-density counterexample. The separate lower-density and central-dominance sections of the prior manuscript were not certified by this review.

Under the collection-exclusion rule, removed the duplicate result directory and independent writeups, fourteen dedicated Lean modules, their root imports and required endpoints, replay entries, the Python verification step, catalogue and site references, and the dedicated historical verification packet. All six reused KVZ modules and their canonical verification evidence remain. The valid independent construction and completed Lean verification remain available at [commit 628270dc](https://github.com/1337isnot1337/solved-conjectures/commit/628270dc5e07d7924de265d2ac1beee4b5634b80).

The selected joint ledger changes from twelve packages and ten named families to eleven packages and nine named families. The parallel campaign’s current table changes from thirteen packages to twelve, comprising seven proofs and five disproofs. These arithmetic corrections do not constitute a fresh review or bounty-eligibility endorsement of the other packages. Earlier entries below record historical actions and are superseded wherever they count Gröchenig as a new resolution. No exact direct-payment offer was verified, and the paid-target continuation remains at zero completions.


## 2026-11-21 — Gröchenig upper-density disproof verified in Lean

Lean constructs one real coefficient sequence in ℓ¹(ℤ), with absolute mass one and support on the even integers. Its actual Gaussian shift sum is nonzero, has an entire extension and locally finite real zeros, and satisfies D⁺(c)=1/2 and D⁺(Z(f))≥1. Coefficient sign changes use the source convention that skips zero coefficients.

All 20 modules in the exact closure passed strict source checks, the complete owned-declaration axiom audit, and stock-kernel replay. The closure contains 14 Gröchenig modules and six reused KVZ kernel modules; all 20 were audited as owned modules. The audit covers 351 declarations, 310 theorem declarations, 78 private declarations, and 157 required endpoints. The [receipt](https://github.com/1337isnot1337/solved-conjectures/blob/628270dc5e07d7924de265d2ac1beee4b5634b80/docs/verification/lean-grochenig-20261121/receipt.json) retains the exact gate evidence.

The separate lower-density inequality remains unresolved here. The combined repository gate and hosted validation remain separate checks.

## 2026-11-21 — Chen–Khare–Sahi stable Hall witness checked

Added twelve Lean modules and checked their exact nineteen-module closure. At q=1/10 and t=9/10, the full eleven-partition degree-six family is identified by stable Hall orthogonality, monic dominance triangularity and literal polynomial coordinates. Its three-variable specialization has positive normalization and yields the full Muirhead-semiring counterexample. The degree-three truncated finite-Hall conflict is also proved. Strict sources, both complete owned/private audits and the exact stock replay passed. The README remains partial because the manuscript convention is unresolved and the broader families still have only the eigenfunction identification. The previous sixteen-module compatibility receipt and its pending replay are preserved separately; neither the combined repository gate nor hosted validation is claimed.


## 2026-11-21 — Gamma-quotient theorem verified in Lean

Completed the all-order Karp–Vishnyakova–Zhang gamma-quotient theorem on its
full real translated domain. Proved the exact sign, noninteger strictness,
positive-integer cutoff, and third-order signature correction. The literal
gamma convolution and all Wronskian and determinant-composition obligations
are proved internally. All 15 strict sources, the complete owned/private
audit, and exact stock-kernel replay passed. Registered 62 required endpoints
and marked the result complete. The combined repository gate and hosted
validation remain pending.


## 2026-11-21 — Chen–Khare–Sahi strict compatibility repairs

Replaced repeated monomial-product proof search with 115 proved pair identities and an indexed degree-at-most-six dispatch. Repaired strict-linter, arithmetic-normalization and deprecated-lemma failures in Translate, Boundary, Parameter and Unique. The existing public definitions and theorem statements are unchanged.

All 16 existing modules passed fresh strict Lean 4.35 compilation with warnings treated as errors. The complete owned/private audit checked 1,454 declarations, including 1,254 theorem declarations, 816 private declarations and all 49 required endpoints. Only `propext`, `Classical.choice` and `Quot.sound` are allowed. Independent stock-kernel replay of the revised closure and the combined repository gate remain pending. The README badge remains partial.

The current endpoints use the standard monic triangular Macdonald eigenfunctions. Stable Hall orthogonality followed by specialization is being formalized separately. The manuscript's literal truncated finite-variable Hall pairing conflicts with that convention; the [degree-three diagnostic](https://github.com/1337isnot1337/solved-conjectures/issues/201#issuecomment-7065320695) must be reconciled before claiming a full literal-source formalization.

## 2026-11-21 — Chow conjecture fully verified in Lean

Proved consecutive interlacing of the ordinary type-D Eulerian polynomials
for every rank at least two, with strictness from rank three. The source
bridge enumerates actual even-signed permutations and proves the refinement
recurrence and factor of two. All 11 sources, the 329-declaration audit,
and exact stock-kernel replay passed. Registered 48 required endpoints
and updated the result badge to complete. The combined gate remains pending.

## 2026-11-21 — Oravcová–Soták relative theorem formalized

Added nine modules for the actual integer distance graphs, all explicit coloring certificates and unbounded families, and the complete classification deduction relative to four stated spectrum propositions. Preserved @aadrianvv’s proof and certificate attribution. All nine new modules passed strict compilation with warnings treated as errors. The exact 28-module project closure passed an all-owned audit of 1239 declarations (1084 theorem declarations and 40 required endpoints) and independent stock-kernel replay. Only `propext`, `Classical.choice`, and `Quot.sound` are permitted. The README remains partial because `R5`–`R8` are still hypotheses. The shared-package gate remains pending.

## 2026-11-21 — Original Vishnyakova theorem verified in Lean

Completed the sampled-sequence theorem using all ordered finite Toeplitz
minors of the actual polynomial samples. Proved the centered disk and
attainment of the exact radius within that class, including initial zero
samples in the necessity argument. The full 17-module closure also contains
the weighted theorem. Strict sources, the 439-declaration audit, and stock
kernel replay passed. Registered 40 additional endpoints, bringing the
required total to 66. Updated the result badge to complete.
The combined repository gate remains pending.

## 2026-11-21 — Vishnyakova weighted theorem verified in Lean

Proved the centered-disk bound and exact attained outer radius for every
positive weight and positive degree in the source transform class.
The formalization constructs the actual transform and proves the required
polarization and tridiagonal arguments. Strict source checks, an audit of
238 owned declarations, and exact stock-kernel replay passed.
Registered seven modules and 26 required endpoints. The original sampled
class is undergoing separate checks, so the overall badge remains partial.
The combined repository gate and hosted validation remain pending.

## 2026-11-21 — Bernardi–Morales conjectures formalized

Formalized both published delta-process Conjectures 27–28 for every stated parameter, using literal subset tuples, cyclic interval events and the next-complement delta rule. The tree count allows arbitrary fixed color maps; the event identity and source probability determinant use fixed surjections. The 13-module closure passed strict compilation with warnings treated as errors, an all-owned audit of 269 declarations (205 theorem declarations and 23 required endpoints), and independent replay by the pinned stock kernel. Only `propext`, `Classical.choice`, and `Quot.sound` are permitted. Updated the complete result-level badge and all registrations. The shared-package gate remains pending.

## 2026-11-21 — Ekhad–Zeilberger’s most unfair bet conjecture

Proved the extremal asymptotic advantage for every word length from a variance lower bound for overlapping occurrences. The proof also classifies extremizers with and without a full-alphabet requirement. [Proof and checker](results/ekhad-zeilberger-unfair-bet/) · [Research issue](https://github.com/1337isnot1337/solved-conjectures/issues/219)

## 2026-11-21 — Kauers–Koutschan recurrence conjecture

Added a complete proposed proof of the two published recurrences for A189281. Inclusion–exclusion and a rank-one complex Gaussian matrix give a Schur sum in derangement numbers. Exact polynomial substitution gives zero for every coefficient in both parity classes. [Proof and checker](results/kauers-koutschan-recurrence/) · [Research issue](https://github.com/1337isnot1337/solved-conjectures/issues/218)

## 2026-11-21 — Horňák–Woźniak short arms of length at most two

Proved arbitrary vertex decomposability for tripods with positive short arm at most two under source tests 1 and 5, and established the unique-largest balancing step for general star graphs. Strict compilation, a 958-theorem full-chain axiom audit and isolated kernel replay passed. The general all-small case, four-arm reduction, existence constructions and combined gate remain.

## 2026-11-21 — Horňák–Woźniak short-arm subset and merging

Proved unconditionally that a positive partition with a sublist summing to the shortest arm is realizable, and reduced all other partitions to the case without a mergeable noncentral pair. Strict compilation, a 945-theorem full-chain axiom audit and isolated kernel replay passed. The remaining all-small case, four-arm reduction, existence constructions and combined gate remain.

## 2026-11-21 — Circular-index main theorems and regular examples formalized

Added the complete all-parameter circulant construction, the 25-vertex theorem, and both 31/33-vertex regular examples, with actual real circular chromatic indices, regular degrees, and vertex-deletion connectivity. The atom and subgroup proofs are internal to the formalization. The 19-module closure passed strict sources, an all-owned audit of 601 declarations/500 theorem declarations and 171 required endpoints, and exact pinned stock-kernel replay. Registered the checked closure and synchronized the partial overall badge; the nonregular examples, remaining Section 7 claims, combined package gate, and hosted validation remain separate.

## 2026-11-21 — Horňák–Woźniak partitions containing a large part

Proved that source tests 1 and 5 realize every positive tripod partition containing a part larger than the positive shortest arm, using greedy grouping and graph refinement. Strict compilation, a 910-theorem full-chain axiom audit and isolated kernel replay passed. All-small partitions, the four-arm reduction, existence constructions and combined gate remain.

## 2026-11-21 — Wright log-concavity conjecture disproved in Lean

Formalized the actual infinite Wright series and a continuous counterexample
family with beta zero and alpha tending to one from below. Gamma reflection,
a uniform summable coefficient bound, and dominated convergence give a strict
three-point midpoint violation. This refutes the original universal conjecture;
the written positive-beta refinements remain unformalized. Strict source
compilation, an audit of all 25 owned declarations including eight private
declarations, and independent pinned-kernel replay passed. Registered the module
and four required theorem endpoints. The combined repository gate remains
separate and pending.

## 2026-11-21 — Horňák–Woźniak large-part reduction

Proved the complete tripod reduction for partitions whose parts all exceed a positive shortest arm, by graph-level balancing and well-founded induction. Also proved refinement when discarded central pieces fit the otherwise unused shortest arm. Strict compilation, an 878-theorem full-chain axiom audit and isolated kernel replay passed; the small-part and four-arm reductions, existence constructions and combined gate remain.

## 2026-11-21 — Gilmore full matching identity rechecked

Rechecked the complete Gilmore source with strict compilation, an all-owned declaration/axiom audit and stock-kernel replay. The checks cover 449 declarations and all 20 required endpoints, including the exhaustive matching bijection and preservation of the source statistics. Corrected the stale landing page and synchronized the full result-level verification badge. The combined package gate and hosted validation remain separate.

## 2026-11-21 — Babai spectra fully formalized; Baricz–Pogány source recurrence verified

Added the complete Babai path-spectrum formalization, including both bounds and constructive realization for every allowed value, with credit to aadrianvv for the written proof. Added source-recurrence uniqueness and a direct source-recurrence inequality endpoint to Baricz–Pogány. Both passed strict source checks, all-owned axiom audits, and stock-kernel replay. Registered the Babai module and all new endpoints, corrected the stale Baricz–Pogány landing-page claims, and synchronized the full result-level badges and status pages. The combined repository gate and hosted validation remain separate.

## 2026-11-21 — Horňák–Woźniak tripod subset criterion

Proved both directions of the middle-window subset criterion when all parts exceed the shortest arm, the largest-center assignment exchange, and the coarsening step with the central part kept largest. Strict compilation, a 777-theorem full-chain axiom audit and isolated kernel replay passed. The remaining Barth reductions, existence constructions and combined gate remain.

## 2026-11-21 — Horňák–Woźniak arm assignment extraction

Proved that every connected star-graph partition assigns its noncentral classes to arms with total size at most each arm capacity. Strict compilation, a 746-theorem full-chain axiom audit and isolated kernel replay passed. The remaining Barth reduction, existence constructions and combined gate remain.

## 2026-11-21 — Horňák–Woźniak reduction foundations

Proved graph tiling for arbitrary positive lists of pieces and two subset-sum balancing steps with a termination measure. These are supporting lemmas, not the full Barth AVD reduction. Strict compilation, a 741-theorem full-chain axiom audit and isolated kernel replay passed; the remaining reduction and combined gate are pending.

## 2026-11-21 — Horňák–Woźniak source test 5

Formalized the count-based existence trigger for source test 5 and used it with tests 1 and 2 in the regular and exceptional graph partition cases. Strict compilation, a 709-theorem full-chain axiom audit and isolated kernel replay passed. Admissibility index ranges, AVD reductions, existence constructions and the combined gate remain.

## 2026-11-21 — Horňák–Woźniak source-level exceptional case

Removed the stronger pairwise restriction from the positive-slack endpoint and proved all exceptional-size graph partitions under the weaker source-derived residue bounds and a fifth-test witness. Strict compilation, a 681-theorem full-chain axiom audit and isolated kernel replay passed. Test 5 translation, general AVD reductions, existence constructions and the combined gate remain.

## 2026-11-21 — Horňák–Woźniak source-level zero slack

Derived the weaker residue consequence of original tests 1 and 2 and proved all exceptional zero-slack graph partitions under it and a fifth-test witness. Positive slack still assumes stronger pairwise bounds. Strict compilation, a 580-theorem full-chain axiom audit and isolated kernel replay passed; source translation, AVD reductions and combined gate remain.

## 2026-11-21 — Horňák–Woźniak hypothesis scope correction

The exceptional formalization assumes all pairwise residue bounds, stronger than the original admissibility tests. The repository checker accepts capacities (4, 7, 11), with residues (0, 1, 1) modulo 2, which violate the stronger bound. The formal theorem remains conditional on its explicit hypotheses; extending it to all admissible cases remains work.

## 2026-11-21 — Horňák–Woźniak exceptional graph partitions

Proved all zero-slack exceptional cases, combined them with positive slack, and constructed the exceptional-size partitions for the tripod and for a reserved short arm under explicit residue and fifth-test hypotheses. The full chain passed a 541-theorem axiom audit and isolated kernel replay. Original-test translation, general AVD reductions, existence constructions and the combined gate remain.

## 2026-11-21 — Horňák–Woźniak zero-budget criterion

Proved the exact zero-budget packing criterion and the exceptional zero-slack branch with two positive quotient gaps. The full HornakZero dependency chain passed a 492-theorem axiom audit and isolated kernel replay. Correction: the earlier 407-theorem audit imported HornakReservedArm rather than HornakLargest; the new audit includes both. Other zero-slack cases, AVD reductions and the combined gate remain.

## 2026-11-21 — Horňák–Woźniak positive-slack exceptional case

Derived the largest-count endpoint and all smaller counts with positive quotient slack under the stated residue and fifth-test hypotheses, and handled a fourth arm reserved in the center. Strict compilation, a 407-theorem axiom audit of the reserved-arm dependency and isolated kernel replay passed; zero slack, full reductions and the combined gate remain.

## 2026-11-21 — Horňák–Woźniak rho-two endpoint

Proved the three-arm rho-two endpoint construction through actual connected partitions under its explicit endpoint equations, residue conditions and fifth-test input. Strict compilation, a 396-theorem axiom audit and isolated kernel replay passed; the smallest-count endpoint, derivation of hypotheses, full AVD reductions and combined gate remain.

## 2026-11-21 — Horňák–Woźniak rho-one endpoint

Proved the three-arm choice and connected-partition endpoint for the exceptional-piece rho-one case from the stated residue conditions and fifth-test input. Strict compilation, a 333-theorem axiom audit and isolated kernel replay passed; rho-two, the smallest-count endpoint, full AVD reductions and the full gate remain.

## 2026-11-21 — Horňák–Woźniak wrapped endpoint

Proved the wrapped-residue exceptional-piece endpoint through an actual connected partition under the required chosen-arm bounds. Strict compilation, a 289-theorem axiom audit and isolated kernel replay passed; chosen-arm existence in the remaining cases, full AVD reductions and the full gate remain.

## 2026-11-21 — Horňák–Woźniak exceptional-piece foundations

Constructed actual connected graph partitions with one exceptional piece from reduced-arm allocations; proved the zero-carry and no-quotient-loss subcases and wrapped-residue identities. Strict compilation, a 280-theorem axiom audit and isolated kernel replay passed; remaining exceptional cases, AVD reductions and the full gate remain.

## 2026-11-21 — Horňák–Woźniak regular two-size case

Proved the regular two-consecutive-size connected-partition case for actual star graphs from the residue bounds and fifth-test witness, including extremal-count construction and transfer. Strict compilation, a 226-theorem axiom audit and isolated kernel replay passed; extra-piece cases, full reductions and the full gate remain.

## 2026-11-21 — Horňák–Woźniak connected partition realization

Proved that every feasible two-size arm allocation realizes an actual connected partition, including exact center and piece counts and arbitrary ordering. Strict compilation, a 205-theorem axiom audit and isolated kernel replay passed; extra-piece cases, endpoint hypotheses, AVD reductions and the full gate remain.

## 2026-11-21 — Horňák–Woźniak endpoint packing

Proved the complementary quotient and carry formulas, regular endpoint packing under its explicit carry witness, and transfer across arbitrarily many budget steps. Strict compilation, a 120-theorem axiom audit and isolated kernel replay passed; graph realization, remaining endpoint conditions, AVD reductions and the full gate remain.

## 2026-11-21 — Horňák–Woźniak packing criterion

Proved the exact per-arm ceiling-cost formula, the finite maximum for larger-piece allocations, the full two-size arm-packing criterion and the budget-transfer bound. Strict compilation, an 82-theorem axiom audit and isolated kernel replay passed; graph realization, endpoints, AVD reductions and the full gate remain.

## 2026-11-21 — Horňák–Woźniak Lean foundation

Formalized the actual star-like graph, connected partitions, center-free arm localization and fixed-large-pieces capacity criterion. Strict compilation, a 31-theorem axiom audit and isolated kernel replay passed; endpoint arguments, reduction theorems and the full combined gate remain.

## 2026-11-21 — Circulants with circular chromatic index in the upper half

Answered the remark in Section 8 of Mazák and Zrubák, *Circular chromatic index of small graphs* (arXiv:2603.08822), that no graph with maximum degree `Δ >= 8` and circular chromatic index in `(Δ+1/2, Δ+1)` was known. For every `g >= 2` the circulant `C_{6g+1}(1,...,2g-2, 2g+1, 3g)` is `4g`-regular and `4g`-connected with circular chromatic index `4g+2/3`, and `C_25(1,2,3,7,...,12)` is 18-regular and 18-connected with index `75/4`; this gives the non-trivial reading of their Problem 6 for `d ≡ 0 mod 4`, `d >= 8`, and for `d = 18`. The lower bound is `|E|/α'`, the upper bound an explicit colouring in which every window of consecutive classes is a near-perfect matching, and the connectivity follows from the classical atom lemmas, reproved in the note. Computer-certified further examples include `C_31(1,2,3,7,...,12)` with index `93/5` and non-regular graphs with index `Δ+2/3` for `Δ ≡ 1, 2 mod 4`, `25 <= Δ <= 54`, and `Δ = 21`. Problem 7 (denominators `q >= 6`), the reading `χ'_c = d+1/2` exactly of Problem 6, and `Δ ≡ 3 mod 4` remain open. The package contains the written proof, two standard-library verifiers, the certificates, the SAT search scripts and the referee's report and scripts; one independent model referee pass found no mathematical error. The note is otherwise unrefereed; no Lean verification was performed.

## 2026-11-21 — CKZ record conjectures formalized

Lean proves original Conjectures 1 and 3 for actual separable-permutation classes, all four record statistics, and all stated lengths, including the singleton. It uses the credited, Apache-licensed source-pinned trureturing Conjecture 2 tail and permutation decomposition and direct Pell certificates for the remaining comparisons. Strict compilation, a 1,132-theorem axiom audit and isolated kernel replay passed; the combined repository gate is pending.

## 2026-11-21 — CKZ low-record series inequalities

Proved the three low-record generating-function coefficient inequalities with direct Pell certificates, including the exceptional length-one term in the first comparison. Strict compilation, all-owned axiom audit and isolated kernel replay passed. The actual permutation-count bridge and all-index tail remain.

## 2026-11-21 — CKZ certificate soundness

Proved the finite certificates imply nonnegative infinite Pell series and, after Schröder substitution, nonnegative coefficients for twelve tail-polynomial cases and four recurrence seeds. Strict compilation, a 213-theorem axiom audit and isolated stock-kernel replay passed; arbitrary-index propagation, actual permutation-class connections and the combined repository gate remain.

## 2026-11-21 — CKZ Lean checkpoint

Checked the Schröder series and three low-record reductions, uniform numerator inequalities and all 16 finite integer-list certificates, together with the interpretation of list operations as the stated polynomials. The all-index coefficient argument and permutation-class bridge remain. Strict compilation, 123-theorem all-owned axiom audit and isolated stock-kernel replay passed; the combined repository gate is pending.

## 2026-11-21 — Fuss–Catalan simple roots in Lean

Verified the exact simple-negative-root count and proved that arbitrary ordinary-case root relations transfer to the Fuss case via equality of root multisets. The cited ordinary-case interlacing results themselves are not re-proved. Strict compilation, 448-theorem all-owned axiom audit and isolated stock-kernel replay passed; the combined repository gate is pending.

## 2026-11-21 — Fuss–Catalan conjecture in Lean

Proved the closed enumeration and real-rootedness for the literal Fuss–Dyck path sum for all stated parameters, including the slot/block bijection, cycle count, boundary and scalar reduction. The auxiliary simple-root count and cited interlacing transfers remain unformalized. Strict source compilation, 409-theorem all-owned axiom audit and isolated stock-kernel replay passed; the combined repository gate is pending.

## 2026-11-21 — Fuss–Catalan path bijection in Lean

Constructed the explicit equivalence between good block sequences and literal Fuss–Dyck words and verified both pattern counts. The slot-data-to-block bijection remains. Strict compilation, 236-theorem axiom audit and isolated stock-kernel replay passed; the combined repository gate is pending.

## 2026-11-21 — Fuss–Catalan slot count in Lean

Verified the exact binomial count for choosing occupied and excess-bearing slots and distributing positive excess by stars and bars. The bijections to block sequences and actual paths remain. Strict compilation, 151-theorem axiom audit and isolated stock-kernel replay passed; the combined repository gate is pending.

## 2026-11-21 — Fuss–Catalan rotation count in Lean

Proved that in every rotation-invariant finite collection of length-L integer sequences with sum -1, exactly one in L sequences is a good rotation. Instantiation and the path-counting bridge remain. Strict compilation, 137-theorem axiom audit and isolated stock-kernel replay passed; the combined repository gate is pending.

## 2026-11-21 — Fuss–Catalan cycle lemma in Lean

Proved unique good rotation and aperiodicity for integer sequences summing to -1 and verified real-rootedness of the complete closed-form polynomial including the constant boundary. The finite counting bridge to the actual path enumerator remains. Strict compilation, 123-theorem axiom audit and isolated stock-kernel replay passed; the combined repository gate is pending.

## 2026-11-21 — Fuss–Catalan real-rooted binomial sum in Lean

Proved the real-rootedness of the exact indexed binomial sum in the written coefficient formula for all parameters, including its derivative factorization and fractional-linear substitution. The path enumeration remains. Strict compilation, all-owned axiom audit and isolated stock-kernel replay passed; the combined repository gate is pending.

## 2026-11-21 — Fuss–Catalan Lean checkpoint

Formalized real-root preservation by differentiation and reversal/translation, together with exact coefficients, degree and nonnegative-axis positivity for the binomial factor. The polynomial identification and path enumeration remain; standalone compilation, axiom audit and isolated kernel replay passed.

## 2026-11-21 — Brown–Mol infinite counterfamily in Lean

Formalized the all-sufficiently-large diameter-four counterfamily, including the analytic root existence argument, the exact tree diameter and the literal subtree generating function. Strict source compilation, all-owned axiom audit and kernel replay passed; the combined repository gate is pending.

## 2026-11-21 — Brown–Mol finite tree counterexample in Lean

Formalized the literal branch graph as a tree, its all-parameter subtree generating function and the explicit 1001-vertex counterexample. Strict source compilation, all-owned axiom audit and kernel replay of the five-module closure passed. The stronger infinite-family result and combined repository gate remain pending.

## 2026-11-21 — Brown–Mol finite polynomial root in Lean

Checked the r=200 polynomial factor has a nonzero root inside the forbidden disk via an exact Gaussian-integer certificate and a general log-derivative bound. Strict standalone source compilation, all-owned axiom audit and stock-kernel replay passed. The tree/subtree-polynomial identification, infinite family and combined gate remain pending.

## 2026-11-21 — Johnson's conjecture

Added the [complete proposed proof](results/johnson-pfaffian/) of Conjecture 7.1 for all positive nonincreasing log-convex kernels, all finite even ordered real configurations, and all perfect matchings. The argument proves a stronger matrix theorem for products of circular interval factors. Replacing a wrapped interval by its complement changes only positive vertex factors, so Johnson's existing additive-interval endpoint inequality applies after any cyclic cut. Adjacent-pair deletion proves all noncrossing matching bounds, and the credited uncrossing reduction gives all matchings. The source's endpoint theorem, rainbow bound, and earlier nonvanishing resolution are not claimed as new.

Separate combinatorics, analysis, and root mathematical reviews passed. The supplementary exact checker passed its gauge, cyclic-sign, adjacent-pair, and logarithmic-reconstruction checks; no finite computation is a premise of the universal proof. The primary-source and seven-archive priority audit found no earlier exact resolution within its explicit limits. The additional [AIM/OpenAI audit](research/2026-11-21-aim-openai-priority/AUDIT.md), committed separately, covers 178,246 native UTF-8 bodies, 933 PDF extractions, and 2,029 embedded text records, including a complete normalized native residual pass. Binary exclusions and semantic-search limits remain explicit.

This subgroup's reviewed proposed-resolution tally is now thirteen: seven proofs and six disproofs. The earlier withdrawn families remain excluded. These are unrefereed claims with internal reviews. No Lean work was performed for this result.

## 2026-11-21 — Johnson–Kaya–Matzke path-spectrum conjecture

Proved Conjecture 2.1 of Johnson, Kaya and Matzke: for every `n >= 2` and `1 <= k <= n-1`, the Babai `k`-spectrum of the path `P_n` consists of the integers from `ceil(n/(n-k))` to `k+1`. The authors had proved one inclusion; the other follows from the bound `n-k` on independent sets of the distance graph. The package contains an elementary written proof and a standard-library brute-force check of all 16,369 distance sets with `n <= 14`. The note is unrefereed; no Lean verification was performed.

## 2026-11-21 — Complete Sonntag–Teichert realization in Lean

Formalized an explicit oriented graph realizing any two disjoint stars and proving all additional vertices are isolated in its domination hypergraph. Together with the tournament theorem and forward classification, this completes the result package in Lean. Strict source compilation, all-owned axiom audit and stock-kernel replay passed; the combined repository gate remains pending.

## 2026-11-21 — Sonntag–Teichert oriented-graph classification in Lean

Proved the forward two-star classification for separated domination hypergraphs of arbitrary finite oriented graphs. The proof checks the blocker product, both bicliques and singleton-part argument. Strict source compilation, all-owned axiom audit and stock-kernel replay passed. The converse realization and combined repository gate remain pending.

## 2026-11-21 — Brown–Mol's and Kovalev's conjectures

Added two complete proposed analytic disproofs after separate mathematical reviews, root reviews, primary-source comparisons, and retrospective full-content archive audits.

The [Brown–Mol package](results/brown-mol/) constructs an infinite diameter-four tree family whose subtree roots enter the conjectured forbidden disk. A self-contained local logarithm and Rouché argument proves the whole family; the established Beraha–Kahane–Weiss mechanism is credited. A separate exact certificate verifies a 1001-vertex example. The earlier ArtificialZeng theorem covers diameter at most three and explicitly leaves the general annulus open. The distinct origin-centered disk theorem and the conjecture's outer inequality are not claimed here.

The [Kovalev package](results/kovalev-hardy-duality/) constructs positive diagonal counterexamples to the lower Hardy-duality comparison in every matrix order at least 500001. The normalized supporting functional has dual norm exactly one over the full real matrix space. Conditional Jensen, a chi-square variance bound, classical Bessel integrals, and elementary rational estimates prove a uniform strict separation. No search over dimensions or numerical quadrature is required; the threshold is not optimized. The upper comparison remains unresolved by this argument.

All three supplementary standard-library checkers passed. The full-content Principia, Trure, mxym, AFTD, and ArtificialZeng audits found no earlier matching full resolution within their documented limits. The two earlier Principia collisions remain withdrawn. This subgroup's reviewed proposed-resolution tally rises from ten to twelve: six proofs and six disproofs. These are unrefereed claims with internal reviews, not independently accepted mathematical results. No Lean work was performed. The existing Sonntag–Teichert catalogue label was normalized to the supported partial-status spelling after the site gate rejected its previous wording; its checked tournament scope and pending oriented-graph classification are unchanged. A stale KVZ Bessel catalogue row reintroduced by the concurrent Baricz–Pogány update was removed again, preserving the prior-resolution withdrawal.

## 2026-11-21 — Prior-resolution correction for KVZ Bessel-ratio unimodality

Withdrew the older Karp–Vishnyakova–Zhang Bessel-ratio unimodality entry after reading [Trure issue 25199](https://github.com/the-omega-institute/trureturing/issues/25199), created and last updated on 1 November 2026. It supplies a complete correct analytic proof for every ordered real order pair above minus one and every ordered positive scale pair, including equal orders, equal scales, and negative orders. The remaining tasks named in that issue are formal translation and repository admission, not missing mathematics.

The result directory, duplicate research proof/checker, active catalogue and status entries, site alias, and verifier workflow references are removed. Historical reviews remain with prominent superseding corrections and immutable links to the earlier local proof. The [correction record](research/kvz-bessel-unimodality/PRIOR_RESOLUTION_CORRECTION.md) gives the exact statement comparison and verified Wronskian argument. Mathematical correctness of the independent reproof does not restore priority. This older entry was outside the current fourteen-target audit, so the current subgroup tally is unchanged. No Lean source or proof execution is part of this correction.

## 2026-11-21 — Sonntag–Teichert tournament theorem in Lean

Formalized the tournament domination-hypergraph theorem from finite arc and domination definitions. Strict standalone compilation, an all-owned axiom audit and stock-kernel replay passed. The additional classification and realization of oriented graphs with missing arcs, and the combined repository gate, remain pending.

## 2026-11-21 — Prior-resolution correction for Fang–Zhang–Zhao and Sun–Zhao

Withdrew two previously counted packages after a complete-text archive audit found earlier full disproofs. Principia's [26 October commit](https://github.com/PrincipiaMathOrg/math-solutions/blob/c18609e47b635722206b9a2e9dcd402d0edcfb0a/mathdb/368345/solution.tex) proves the same complete Fang–Zhang–Zhao Hoggatt failure family. Its [27 October commit](https://github.com/PrincipiaMathOrg/math-solutions/blob/34b8b155d7db464ad7306f70b16d3af9cee34501/site-backup/mathdb-332483/mathdb-332483-solution.tex) contains the same exact Sun–Zhao ratio counterexample. Both public dates precede this campaign; internal manuscript dates are unnecessary to establish that fact.

The earlier filename screens missed numeric archive paths. Root and separate reviewers read the actual proofs, checked the statement conventions and authenticated the public commit histories. The result directories, catalogue entries, duplicate computational checks and workflow references are removed. Existing unique formalizations by the separate team are preserved and explicitly attributed to previously resolved results. No Lean source or proof execution is part of this correction. The Han and Zhang catalogue statuses also regain canonical `Complete` labels so the existing site validator can read the already-recorded scopes; their pending combined gates are retained.

The [correction record](research/campaign-20261121/PRIOR_RESOLUTION_CORRECTION.md) gives the exact comparisons and counting changes. This subgroup's committed proposed-resolution tally falls from twelve to ten. The selected joint checkpoint falls from eleven to ten named families because Sun–Zhao was never admitted to that stricter subset. Earlier historical counts are superseded. Retrospective full-content archive audits continue before further promotions.

## 2026-11-21 — Baricz–Pogány coefficient theorem in Lean

Formalized the original factorial-product coefficients, formal quotient uniqueness, strict positivity in every degree, and the explicit lower bound. Strict compilation, isolated stock-kernel replay, and endpoint axiom checks passed; the combined repository gate remains pending.

## 2026-11-21 — Complete Han sparse-assignment infima in Lean

Formalized the lower bound and matching approaching feasible encoders for each of the four sparse assignments. Together with the earlier matrix witness and open-family gap, this completes the stated disproof package in Lean. Strict source compilation, all-owned axiom audit and stock-kernel replay passed; the combined repository gate remains pending.

## 2026-11-21 — Zhang deletion values in Lean

Formalized @aadrianvv’s strict inequality and the exact deletion values in both ranges, including a self-contained proof of the Liu upper bound. The seven-module closure passed local kernel replay and the endpoint axiom audit; the combined repository gate remains pending.

## 2026-11-21 — Exact sparse infimum in Lean

Proved the sparse infimum is exactly 481/441 by constructing feasible sparse encoders with power arbitrarily close to the lower bound. Strict source compilation, all-owned axiom audit and stock-kernel replay passed; the combined repository gate remains pending. The separate exact infima for the other assignments remain to be formalized.

## 2026-11-21 — Han–Sabag–Kostina–Hassibi Lean counterexample

Formalized the actual real-matrix witness, the universal sparse-encoder lower bound and a uniform gap across the stated open channel-gain interval. Standalone strict compilation, an all-owned axiom audit and stock-kernel replay passed. The individual exact assignment infima and combined repository gate remain pending.

## 2026-11-21 — Roos–Seiringer's conjecture

Added a complete proposed proof of the radial Dirichlet kernel nonnegativity assertion in §5 of *BCS Critical Temperature on Half-Spaces*. The proof gives strict positivity for every positive real argument and the continuous zero endpoint. The source scaling then covers every positive chemical potential. This is the whole scalar assertion identified by the authors, not a selected dimension of an arbitrary-dimensional conjecture; the unaveraged kernel is outside the claim.

The [package](results/roos-seiringer-kernel/) derives an exact entire series and proves both unbounded ends analytically. On the remaining interval, outward-rounded integer arithmetic and an analytic derivative bound certify 184 closed intervals covering every point. The computation is an essential part of the proof, with explicit truncation errors and coverage checks.

Two independent mathematical/code reviews and an independent source/priority audit passed. Full replays reproduce 367 evaluations and the recorded exact margin and leaf hash. The source paper, thesis, closest later papers, current author lists and public proof archives were checked; no earlier resolution was found within that documented coverage. The result remains unrefereed. No Lean work was performed. This subgroup's reviewed proposed-resolution tally is twelve.

## 2026-11-21 — Zhu Jacobi–Stirling Lean proof

Formalized the unweighted Jacobi–Stirling recurrence, the leading Hankel determinant and its coefficient −4, the negation of the full coefficientwise minor assertion, and the stated negative region. The standalone module passed strict source compilation, the all-owned axiom audit and stock-kernel replay. The combined repository gate is pending.

## 2026-11-21 — Mazák–Zrubák conjecture on complete graphs minus an edge

Proved Conjecture 2 of Mazák and Zrubák: for every even `d >= 6`, the circular chromatic index of `K_{d+1}` minus an edge is `d+1`. By Guichard's theorem a smaller value would give a proper `(d+1)`-edge-colouring whose digraph of consecutive colours is acyclic; the proof derives a contradiction from the longest-path levels of such a colouring. The package contains the written proof, a standard-library check of the lemmas for `d=4` and of the ordering obstruction for `d=6`, an optional SAT check from the definition, and the scripts of one independent model referee pass, which found no mathematical error. The scripts did not complete `d=8`. The note is otherwise unrefereed; no Lean verification was performed.

## 2026-11-21 — Dospolova–Germanskov–Zaporozhets's conjecture

Added a complete proposed analytic disproof of Conjecture 3.6 in *On Steiner entire function*. For every positive c, the sequence c^k/k! satisfies all the proposed ultra-log-concavity inequalities with equality. A nontrivial Gaussian-bounded compact has expected global Gaussian range strictly larger than twice its maximal deterministic local oscillation. Vitale's published normalized-ratio limit then excludes the entire factorial family.

The [package](results/dospolova-germanskov-zaporozhets/) credits the published Gaussian-process theorems and prominently explains the alternative short deduction from Long's earlier support-function results. The new contribution is the strictness deduction and its application to the later realizability conjecture. No earlier explicit resolution or equivalent strict obstruction was found in the documented searches, subject to the stated access limits.

Three independent mathematical reviews passed. Integration was held when OCR made Vitale's Theorem 1 appear strict; actual local rendering of printed pages 356–357 confirms the non-strict symbol and all normalization constants. The [source-symbol audit](results/dospolova-germanskov-zaporozhets/SOURCE_GLYPH_GATE.md) preserves the correction history. No computation or Lean verification is part of this proof. This subgroup's reviewed proposed-resolution tally is eleven.

## 2026-11-21 — Chen–Khare–Sahi's conjecture

Added a complete proposed disproof of Conjecture 5's Macdonald Muirhead-semiring implication. The exact rational functional separates the normalized difference for the partitions (4,2,0) and (4,1,1), at q=1/10 and t=9/10, from the entire degree-six semiring cone. A written homogeneity and dominance-cover argument proves that 38 products and seven ordinary monomials exhaust the required generators. This is a full universal-conjecture refutation. The proof also establishes an infinite rectangular-translate family; a separate Hall–Littlewood argument gives a continuous interior parameter family.

Two independent mathematical reviews passed. Three standard-library exact checkers verify the full cone table, both Macdonald eigenidentities, a separate Hall-inner-product construction, and the negative rational functional value. The [source audit](results/chen-khare-sahi-macdonald/SOURCE_AUDIT.md) distinguishes Sra's existing evaluation-positivity theorem for the very same pair from the stronger semiring assertion, and records current literature and archive searches with their limits. No prior settlement of this semiring claim was found. The subgroup's reviewed proposed-resolution tally is ten; all remain unrefereed and no Lean work was performed.

## 2026-11-21 — Ferreira–Simon's conjecture

Added a complete proposed analytic proof of Conjecture 1 in *Convolution of beta prime distribution*: the independent square-root beta mixture gives the self-convolution for the full original parameter range. The proof rederives the sum's Mellin transform, evaluates the mixing factor with a classical quadratic transformation, and proves equality in law by holomorphic continuation and characteristic-function uniqueness.

Two independent mathematical derivations passed, as did 18 supplementary exact symbolic identities. The [package](results/ferreira-simon-beta-prime/) records the current primary-source and archive search, including the distinction from the November 2026 restricted additive-decomposition result and the paper's separately refuted Conjectures 2 and 3. No earlier settlement of this identity was found within the stated access and indexing limits. This subgroup's reviewed tally is nine. No Lean work was performed.

## 2026-11-21 — Joint eleven-family checkpoint

Admitted Han–Sabag–Kostina–Hassibi's exact matrix disproof to the [joint ledger](research/2026-11-21-joint-results/) after additional independent mathematical, source, priority and provenance reviews. The selected reviewed set now contains thirteen packages: seven from the current four-worker group and six from the parallel campaign. Removing corrected-source Novelli–Thibon from the strict count and merging the two López Pouso–Segura packages gives eleven named families. Other newer parallel packages remain outside this selected review until separately admitted.

The [mathematical audit](research/2026-11-21-han-sabag-independent-review/AUDIT.md) reconstructs the exact feasible point, all sparse assignments and the open family, using a separate rational Gaussian-elimination checker. The [priority audit](research/2026-11-21-han-sabag-independent-review/PRIORITY.md) compares both source versions and records bounded search coverage and access gaps. The strict gap between infima avoids relying on optimizer nonattainment. The result remains confined to the displayed matrix conjecture, with no new general communication-code claim. Sun–Zhao's additional exact ratio counterexample passed independent mathematical review but remains outside this strict tally pending the full 2020 journal version and the author's Maple archive. No Lean work was performed.

## 2026-11-21 — Lyon's conjecture

Added a complete proposed computer-assisted proof of the strict decrease of the transformed gamma median for every positive real shape. Analytic arguments prove the ranges at most one tenth and at least seven. On the intervening compact interval, exact outward-rounded integer arithmetic certifies 4258 median brackets and 4256 covering cells. A written convexity argument extends each strict bound to every real point in its cell; this is not a sample-based monotonicity inference.

Two independent mathematical/code reviews and complete exact replays passed. The [package](results/lyon-gamma-median/) includes all enclosure formulas, untrusted bracket proposals, the verifier and a current source audit. The target remains explicitly open in the original author's 10 November 2026 manuscript; the search found no prior settlement within its recorded limits. This subgroup's reviewed tally is eight. The verification legend now describes the unformalized marker as no Lean verification, while essential computer-assisted proofs are stated explicitly in the catalogue and packages. No Lean work or partial Lean credit was added.

## 2026-11-21 — Strict joint ten-family checkpoint

Updated the [joint ledger](research/2026-11-21-joint-results/) after the complete Gröchenig mathematical and priority cross-review. This selected review contains twelve proposed result packages: seven developed by the current four-worker group and five by the parallel issue-156 group. Excluding the corrected-source Novelli–Thibon package leaves eleven direct-source packages; grouping the two López Pouso–Segura packages leaves ten named conjecture/problem families. Novelli–Thibon remains an additional documented result. Later packages in the parallel group's live checkpoint, including Han–Sabag–Kostina–Hassibi, remain outside this selected review.

The ledger now states McCrea's exact density interval, the positive-degree range of Vishnyakova's theorem, and the unresolved lower-density clause of Gröchenig's problem. It distinguishes the completed all-profile Coulter–Do–Moskovsky asymptotic theorem from the initial reversal already implicit in the authors' 2022 data; that qualified research remains uncounted. Rivero, Cavey–Lee and Simon subroof work also remain uncounted. Prior-resolution withdrawals and access limits are retained. All packages remain unrefereed; no Lean work was performed.

The full research-site build and content, link, mathematics and metadata checks passed at commit 444696374a21085f0c8193db5facab49ede6e616, run 44879720088. Earlier checkpoint entries below preserve the historical counts and are superseded by this stricter accounting.

## 2026-11-21 — Sun–Zhao's conjecture

Added a complete proposed disproof of Conjecture 5.2 in arXiv:1602.04359v4. The twelfth iterated ratio sequence fails its required log-convexity at center thirteen, using only entries retained after the specified truncation. An exact binomial-product comparison and a rational logarithm certificate give the same strict sign. The root reviewer independently regenerated the recurrence, used a different logarithm truncation and remainder, and directly iterated the ratios.

The [historical package](https://github.com/1337isnot1337/solved-conjectures/tree/fa34b035f4853c8e790bd520171739ee17923a56/results/sun-zhao-iterated-ratios/) includes both reviews and a multi-source prior-resolution audit. The full journal version and author's Maple archive were inaccessible; the resolved statement is the fully inspected latest arXiv conjecture. Neither the first-ratio theorem nor the different quadratic log-convexity transform is misidentified as the target. This subgroup's reviewed tally is seven; no Lean work was performed.

## 2026-11-21 — Han–Sabag–Kostina–Hassibi's conjecture

Added a complete proposed disproof of the explicit Lyapunov positivity conjecture in arXiv:2406.17196v2. A rational two-channel encoder has power 23825/22491, while the infimum over all encoders with one nonzero per column is 481/441. The strict gap is 706/22491. The proof classifies every sparse assignment with arbitrary nonzero coefficients and extends the example to an open interval of channel gains. It does not rely on optimizer nonattainment or claim a separate general communication-code result.

Two independent source and mathematical reviews passed, together with 16 exact rational and symbolic checks. The [package](results/han-sabag-kostina-hassibi/) records the original source, related primary papers, public issue/archive searches and access limits. This subgroup's independently reviewed campaign tally is six; the earlier joint checkpoint retains its separate attribution. No Lean work was performed.

## 2026-11-21 — Currie's conjecture on complexity 2n+1 and critical exponent

Proved Conjecture 19 of Currie's *Words with factor complexity 2n+1 and minimal critical exponent* (Electron. J. Combin. 33(3), #P3.31), which is Conjecture 1 of arXiv:2507.09387v3: each of the ten listed morphic images of the fixed point of `[01,2,02]` or of its reversal has factor complexity `2n+1` and critical exponent exactly `2+1/(λ²-1)`, where `λ` is the real root of `x³-2x²+x-1`, and the same holds for the ten arXiv morphisms. The words reduce to three languages; insertion lemmas describe all their bispecial factors, which are ordinary, and the critical-exponent inequality is proved for 72 families by exact arithmetic in `Q(λ)`. The package contains the written proof, a standard-library verifier for the computer-assisted steps with brute-force cross-checks, and the scripts of one independent model referee pass, which found no error. The note is otherwise unrefereed; no Lean verification was performed.

## 2026-11-21 — Joint ten-family research checkpoint

Recorded an [attributed joint ledger](research/2026-11-21-joint-results/) covering eleven complete proposed result packages, conservatively grouped into ten named conjecture families. Seven packages were developed by the current four-worker group and four by the parallel issue-156 group, with separate cross-reviews before inclusion. The two López Pouso–Segura packages count as one family. Full assertions, source scope, proof mechanisms, review records and priority limits are linked individually.

The [final global issue-history audit](research/2026-11-21-joint-results/PRIORITY_REFRESH.md) records the earlier Sturm proof that required withdrawal, the confirmed CKZ preregistration without a proof, and the retained targets' bounded search results. Previously resolved KVZ targets, the Boudabsa–Simon and Heim–Neuhauser reproofs, and partial or interpretation-dependent work contribute zero. All retained notes remain unrefereed. The later Gröchenig package is outside this checkpoint pending an additional cross-review. No Lean work was performed.

## 2026-11-21 — Gröchenig's problem

Added a complete proposed counterexample to the upper Beurling-density comparison in Problem 4.12. Finite Gaussian blocks with alternating coefficient signs place zeros twice as densely as their coefficient support; recursive separation and a summable tail budget combine them into one nonzero entire function with absolutely summable coefficients. The coefficient sign-change upper density is exactly one half, while the real-zero upper density is at least one. The separate lower-density assertion remains undecided here.

Two independent internal mathematical reviews and 784 exact algebra and error-budget checks passed. The prior-art audit includes the original problem, related sampling and sign-retrieval papers, recent November 2026 literature, public solution archives, and repository issues 80 and 121. No earlier resolution of the exact upper comparison was located within that documented audit. The issue-156 campaign tally is five proposed resolutions; all remain unrefereed. No Lean work was performed.



## 2026-11-21 — López Pouso–Segura's node conjecture

Added a complete proposed disproof of the published strict node and partial-moment upper inequalities, Conjectures 3 and 7. The exact two-point Gauss–Legendre rule supplies one common counterexample. A controlled expansion from the Legendre equation proves a positive fourth-order correction at the smallest positive node for every sufficiently large even degree, so an eventual interpretation of the exact node bound also fails.

The two linked assertions count together. Existing general node/weight expansions are credited; the leading asymptotic constant and the separate Bessel-limit package are not contradicted. Independent internal mathematical review and exact symbolic consistency checks passed. The source audit records both search engines, public proof archives, global issue histories and a related inaccessible full text. The work remains unrefereed, and no Lean work was performed.

## 2026-11-21 — Corrected Fang–Zhang–Zhao Sturm priority

Removed the Sturm package from the result catalogue and active status/verifier registrations after locating the full earlier proof in [TT issue 18758](https://github.com/the-omega-institute/trureturing/issues/18758), posted on 18 October 2026. Its all-real-base, all-Hoggatt-parameter theorem and six-step Jackson/Hadamard proof already settle the exact conjecture. The later incomplete Lean formalization does not affect this ordinary mathematical priority determination.

The independent reproof is retained as [credited research](research/fang-zhang-zhao-sturm/), with the [detailed prior comparison](research/2026-11-21-special-functions-fzz-priority/AUDIT.md). It counts as zero new resolutions. The separate issue-156 subgroup checkpoint is corrected from five to four; the universal infinite-log-convexity disproof is a different assertion and is audited separately. Earlier addition entries below are historical and superseded by this correction.

## 2026-11-21 — Vishnyakova's conjecture

Added a complete proposed proof of the outer-root-radius conjecture for every polynomial degree and every positive real weight. The proof gives the stronger disk centered at minus half the weight, and the all-one parameter vector attains the claimed outer radius. A complex-parameter tridiagonal argument and reciprocal-segment lemma establish half-plane zero exclusion; Grace–Walsh–Szegő and Hurwitz extend it to arbitrary independent real parameters. The equal-parameter recurrence and disk theorem from the earlier October report are credited explicitly. The original and weighted conjectures count as one family.

Two independent internal mathematical reviews and 73 exact algebraic checks passed. The source audit distinguishes prior low-degree and equal-parameter results, the neighboring already-disproved root-gap question, and later multiplication-closure theorems. No earlier full root-radius resolution was found within that documented audit; access limits and lack of external review remain explicit. The issue-156 campaign tally is five after its two priority corrections. No Lean work was performed. The Alexandersson–Leite peak-nesting conjecture was separately excluded after an earlier full informal disproof was located; its independently checked reproof is retained only as credited research.

## 2026-11-21 — Novelli–Thibon's conjecture

Added a complete proposed proof of the intended monomial-product Conjecture 5.7 for all partitions and independent parameters. A universal word-comparison identity determines every first derivative at the unit parameter point, and the Pieri rule extracts the tableau exponent. The source's printed exponent index is corrected using its own example. A separate product evaluation, derived from the credited Carlsson–Mellit theorem, also proves the adjacent hook-coefficient formula; it is part of the same named package.

Two internal mathematical reviews passed. The result includes an exact standard-library checker and a bounded source and priority audit covering both arXiv versions, published metadata, related primary literature, web searches, global GitHub proof searches and repository history. No earlier full monomial-product resolution was found in the inspected material; the access limits are recorded. The notes remain unrefereed. The separate Schur-positivity and general trace conjectures remain outside the claim, and no Lean work was performed.

## 2026-11-21 — Restored prior-resolution exclusions for two KVZ targets

Removed the reintroduced reciprocal q-gamma and Hankel-product packages and their result, status and verifier registrations. Both targets had already been excluded on November 20; today's reintroduction mistakenly reversed that established priority decision. Neither counts as a new resolution. The other Karp–Vishnyakova–Zhang targets are separate and are retained.

The reciprocal assertion was proved in [Knowledge Sense's October 13 manuscript](https://github.com/KnowledgeSense/math/blob/b95a52a54597e8b01c1a28486f2a9b29a3a54c58/preprints/Strict-Sign-Regularity-of-the-Reciprocal-Jackson-q-Gamma-Kernel-October-13-2026/build/source/strict-sign-regularity-of-the-reciprocal-jackson-q-gamma-kernel.tex), preserved at revision `b95a52a54597e8b01c1a28486f2a9b29a3a54c58`. Its full proof covers every base between zero and one, every determinant order and all increasing positive real grids. The Hankel-product negation already follows from Simon's 2012 beta–gamma kernel theorem, [arXiv:1207.6464](https://arxiv.org/pdf/1207.6464), through the logarithmic coordinate change and common translation recorded in the [November 20 correction](https://github.com/1337isnot1337/solved-conjectures/blob/a354c349b80c70bb575ffc0230d17c3ced5ec7f7/research/kvz-hankel-product/PRIOR-SIMON-CORRECTION.md). Both prior implications were reread and checked.

The campaign checkpoint was reduced by two and now links to a [priority correction](research/campaign-20261121/kvz-prior-resolution.md). The withdrawn independent proofs remain available in commit history, including the [pre-cleanup snapshot](https://github.com/1337isnot1337/solved-conjectures/tree/0e4d396261505b89eb5dddbd264be7a212d3e78c/results). Their mathematical validity does not make the targets previously open. The older November 21 addition entries below are historical records superseded by this correction.

## 2026-11-21 — Corrected Hankel-product prior-art error

Removed the reintroduced Karp–Vishnyakova–Zhang Hankel-product result directory, catalogue entries, site registration, and verifier references. Simon's *Produit Beta-Gamma et régularité du signe*, arXiv:1207.6464 (2012), printed page 4 theorem and page 16 Remark (b), already refutes the full assertion after the logarithmic change of variables. Issue 94 had documented this exclusion on 20 November; the current campaign failed to check that issue before reintroducing the claim. The new elementary examples remain mathematically valid but cannot count as a new resolution. Their previous versions remain in Git history, not in the result catalogue.

The issue-156 campaign tally is corrected from six to five. The original-source theorem and its coordinate change were reread independently. The separate reciprocal q-gamma, Hoggatt, McCrea, and Bessel-weight results are unaffected. Zhao's Motzkin-root conjecture was also excluded after a prior Chinese-language complete proof was located in xzwwwwww/math. Future candidate screening must search the repository's issue history as well as current files and external literature.

## 2026-11-21 — Simon's stable-infimum conjecture

Added a complete proposed proof of the convex-order conjecture in Remark 6 of Simon's 2014 EJP article, throughout the full parameter interval and including its Brownian endpoint. The established stable-infimum Mellin transform gives two logarithmic Lévy densities that increase with the parameter. Their difference supplies an independent mean-one multiplier, and conditional Jensen gives the claimed order. The factorization and Mellin transform are credited to prior work.

An independent internal mathematical review passed. The package records direct checks of the original and final source statements, earlier Mellin formulas, later related papers, a 2026 survey, more than forty focused searches and five public solution archives. No earlier full resolution was found within that documented search; the priority limits are explicit. The proof uses no numerical or finite-case inference, and no Lean work was performed. The notes remain unrefereed.

## 2026-11-21 — López Pouso–Segura's conjectures

Added complete proposed proofs of the three Bessel-weight sequence conjectures in the 2025 published article. A positive-measure representation proves strict convexity of the inverse squared-phase derivative; trapezoidal errors give the C and E monotonicity. A Fourier–Bessel resolvent identity fixes both limiting constants, and a weighted-average identity gives the K statement. The three linked assertions count as one named result. The finite-degree Gauss–Legendre conjectures are outside the result.

Two independent internal mathematical reviews passed. The package includes a source and prior-resolution audit with access limits, and a standard-library exact checker for the algebraic identities. It remains unrefereed; no Lean work was performed. The same checkpoint preserves unresolved symbolic parking-polytope research through dimension six and records prior resolutions that were excluded from the campaign tally.

## 2026-11-21 — Ferreira–Simon stochastic and diagonal conjectures

Added complete proposed proofs of the two distinct full-parameter conjectures in Remarks 7(b) and 5(b) of Ferreira and Simon's *Mittag-Leffler functions and convex ordering*. The first uses a common Poisson arrival series and strict sequence-norm monotonicity to establish stochastic order. The second uses the classical Lamperti sine quantile, logarithmic contraction and reciprocal pairing to establish diagonal Mittag–Leffler monotonicity.

Both arguments passed separate internal mathematical reviews. The packages contain source and prior-resolution audits covering the original statements, earlier formulations, neighboring theorems, current follow-ups and public solution archives, with access limits stated explicitly. Classical representations are credited. The stochastic assertion's 2014 and 2025 formulations count as one target; endpoint bounds and crossing-point corollaries are not additional conjectures. These are written analytic proofs and require no numerical verifier. The notes remain unrefereed. No Lean work was performed.

## 2026-11-21 — Hankel products and McCrea's conjecture

The Hankel-product novelty claim in this entry was withdrawn later on 21 November; see the correction above. McCrea's result is unchanged.

Added a complete proposed disproof of Karp–Vishnyakova–Zhang's general sign-regular Hankel-product conjecture. An elementary family has exact rational order-two minors of opposite signs; a second family has strictly sign-regular factors of every order and the same failure. Both families resolve one conjecture, with the original unrestricted-signature hypothesis checked directly. Root and combinatorics reviews passed. The published final-page access limit is recorded alongside the verified arXiv versions.

Added a complete proposed proof of McCrea's unique linear-density crossover conjecture for every modulus at least three. Positive large-power generating functions yield local coefficient asymptotics through a self-contained Fourier argument that handles the floor. Between the two means, the exponent difference is strictly decreasing with opposite endpoint signs. Independent analysis review and exact profile-word diagnostics passed. This is distinct from the previously resolved fixed-number Franklin inequality. Both packages include current priority audits, remain unrefereed, and add no Lean work.

## 2026-11-21 — Chen–Kitaev–Zhang and Zhu conjectures

Added complete proposed proofs of Chen–Kitaev–Zhang's original record Conjectures 1 and 3, and a complete disproof of Zhu's unweighted generalized Jacobi–Stirling conjecture. The record proof supplies three all-length coefficient comparisons and credits the previously public Conjecture 2 tail argument. Zhu's disproof is an exact polynomial determinant identity with a negative coefficient and an open real counterexample region.

Both packages include separate internal mathematical audits, source and priority searches with stated limits, and standard-library exact replay scripts. They remain unrefereed. The two record assertions form one named package and are not split by statistic or length. Burcroff's conjecture was excluded after a September manuscript proving the stronger unbalanced-product theorem was found and checked; the independent reproof remains in research notes. No Lean work was performed. The site's non-formalized status registrations also cover the three Hoggatt and reciprocal-q-gamma packages added earlier today.

## 2026-11-21 — Hoggatt and reciprocal q-gamma conjectures

Added three complete proposed resolutions from the named-conjecture research in [issue 156](https://github.com/1337isnot1337/solved-conjectures/issues/156). Fang–Zhang–Zhao's Sturm conjecture follows from geometric root separation, a Jackson derivative interlacing lemma, and an all-row Hadamard induction; the proof covers every real base greater than one and every integer Hoggatt parameter at least two. Their distinct universal infinite-log-convexity conjecture is false for every parameter at least four, by an exact parameter-polynomial factorization and two explicit integer calculations. Karp–Vishnyakova–Zhang's reciprocal q-gamma kernel is strictly sign regular at every order throughout the source's full base interval, by a q-binomial double series and two finite Cauchy–Binet expansions.

Each argument has a separate internal mathematical review and a documented current prior-resolution search. The Hoggatt disproof also has independent direct plane-partition enumeration. The two Hoggatt packages and reciprocal-kernel package include reproducible exact diagnostics. The proofs remain unrefereed, and inaccessible later full texts are recorded as priority limitations. Parameter subcases and the discrete reciprocal-kernel corollary are not counted separately. No Lean work was performed. Segura's modified-Bessel-product conjecture was excluded after a 2026 prior resolution was located.

## 2026-11-20 — Malek's conjecture

Added a complete proposed proof of Malek's all-degree negative-transform subpermanent inequality, including equality. The reciprocal-mean capacity cost improves the optimized-slice estimate enough to separate the lower and upper constants in every proper degree. The permanent endpoint is credited to prior work. Two independent internal reviews and a standard-library rational checker found no gap; the proof is unrefereed. A bounded audit of primary literature, recent transform followups, and public repositories found no earlier complete endpoint theorem. The original 1989 full text remained inaccessible, while Cheon–Wanless's 2005 survey states the exact conjecture. This is a named subsidiary in the Minc site's linked literature, not an additional numbered entry. No Lean work was performed.

## 2026-11-20 — Independent outside confirmation of Németh–Seberry–Shu

[Yair Lavi's Minc Conjecture 27 record](https://yair-lavi.com/mincs-list/conjecture-27/index.html) now identifies the conjecture as disproved by Cinna Davis and GPT-6.2 Astra, including the quadratic lower bound, and reports an independent audit that found no gap. The main index marks this outside confirmation with ★, separate from Lean status. This is not journal peer review.

## 2026-11-20 — Sagan–Swanson formula rendering

Replaced an unsupported fixed-width TeX spacing command by standard spacing in the two Sagan–Swanson proof copies. The displayed formula is unchanged. The unsupported command blocked the native MathML site build after catalogue registration was repaired.

## 2026-11-20 — Oravcová–Soták distance-graph conjecture

Added the classification of primitive distance sets of size five through eight with maximum chromatic number, relative to the repository's five-, six-, seven- and eight-speed spectrum classifications. The package contains a written proof, 62 periodic colourings, loop certificates for four one-parameter families, base loops for the two-parameter six-distance family, an independent standard-library verifier, and a separate SAT scan. The note is unrefereed and conditional on the spectrum classifications; no Lean verification was performed. Contributed by [@aadrianvv](https://github.com/aadrianvv) in [PR #144](https://github.com/1337isnot1337/solved-conjectures/pull/144).

## 2026-11-20 — Repaired an omitted result registration

Registered the existing `baricz-pogany-coefficients` package in the shared catalogue, root index and status map after its orphan landing page blocked the site build. The mathematical files and their stated scope were preserved. This is integration of previously published work from issue #112, not a new result of the Minc campaign.

## 2026-11-20 — Pula–Song–Wanless conjecture

Added a complete proposed proof of the named threshold conjecture for all positive block sizes with `n>1`. At `n>=m+sqrt(m)` the stated boundary matrix uniquely minimizes the permanent. The equality threshold is included. A real-rooted-minor argument replaces a gap in the available 2011 equalization proof; a separate van der Waerden completion proves uniqueness. The known cohesive and non-barycentric directions are credited and independently checked. The result includes two written independent reviews, exact identity audits and a source audit through November 2026. The notes are unrefereed and priority remains provisional. This does not resolve the unrestricted Minc Problems 14 or 15, and no Lean verification was performed.

## 2026-11-20 — Perron root of permanental compounds

Added a general FPRAS theorem for Minc Problem 18's approximation formulation. The result covers every nonnegative rational input and every compound degree, with deterministic zero detection. A stable-symbol trace bound, cyclic permanent reduction and rational grid give the algorithm without constructing the compound. The directory includes the full proof, exact finite checks, two independent reviews and a source audit. This is not an exact polynomial-time eigenvalue-computation claim, and it does not solve the characteristic-polynomial problem. No Lean verification was performed.

The Minc research record also documents partial Gyires and integrality results without counting them as full resolutions.

## 2026-11-20 — Zhang's Question 8.4

Answered Zhang's Question 8.4: the deletion values `LR([n-1] \ {r})` are `1/r` when `2r > n-1` and `2/D_r` when `2r <= n-1`, so the strict inequality holds for all `n >= 4` and `1 <= r <= n-2`. The package contains an elementary proof and an exact standard-library verifier for `n <= 40`. The note is unrefereed; no Lean verification was performed. Contributed by [@aadrianvv](https://github.com/aadrianvv) in [PR #143](https://github.com/1337isnot1337/solved-conjectures/pull/143).

## 2026-11-20 — Removed previously resolved conjectures

Removed the result entries and duplicate research writeups for Karp's
coefficient-positivity conjecture, Karp–Vishnyakova–Zhang's reciprocal
q-gamma and Hankel-product conjectures, Simon's Le Roy conjecture, and
Gatzweiler–Krattenthaler's unrestricted shifted-product Conjecture 4.
Earlier exact resolutions were established by Principia Math In Progress
(MathDB 323156 and 349140), Knowledge Sense's October 2026 preprint,
Simon's Beta–Gamma theorem, and the CoPEER archive. The
[prior audits at the pre-removal revision](https://github.com/1337isnot1337/solved-conjectures/tree/a354c349b80c70bb575ffc0230d17c3ced5ec7f7/results)
record the source and scope for each correction.

Removed standalone research writeups for the previously resolved binomial
Eulerian, intrinsic-volume sequence, and inverse-gamma Newton-series
targets. The catalogue and verification instructions now describe the
remaining collection.

## 2026-11-20 — Chow proof rendering

Replaced an obsolete bold-math command in the two Chow proof copies
with standard mathematical markup after it blocked the research-site build.
The mathematical statement is unchanged.


## 2026-11-20 — Karp–Vishnyakova–Zhang's Bessel-ratio unimodality conjecture

**Superseded on 21 November 2026:** the exact conjecture was already proved in [Trure issue 25199](https://github.com/the-omega-institute/trureturing/issues/25199) on 1 November. The following entry records the historical independent reproof, which is excluded from the original-result collection.

Added a complete proof of the full surviving unimodality assertion for all
ordered real orders greater than minus one and all ordered positive scales.
The Bessel differential equation gives a Wronskian derivative with at most
one positive-to-negative sign change. Positive series terms determine the
endpoint signs and give the complete monotonicity/unique-maximum
classification, including negative orders and every equality case.

The separate stronger log-concavity clause was already refuted and is not
claimed here. Root and analysis completed independent written audits.
Exact rational series checks passed 130 coefficient identities and ten
endpoint/positivity checks. The prior-work audit distinguishes adjacent-order,
same-argument, and Kaiser–Bessel results from this full assertion. No outside
peer review or exclusive priority is claimed.

[Historical proof, classification, exact checks, and source audit](https://github.com/1337isnot1337/solved-conjectures/tree/260d8cd070fc6642edd722b16e52370a91ab73f7/results/kvz-bessel-unimodality/).

## 2026-11-20 — Ferreira–Simon's Wright log-concavity conjecture

Added a complete disproof of the conjectured equivalence between the
gamma-defined parameter threshold and log concavity of the Wright density.
Gamma reflection and log convexity give a uniform summable coefficient
bound. The resulting differentiated-series limit has explicit curvature
of the wrong sign on entire intervals of admissible parameters, including
strictly interior positive beta.

The full written proof passed separate root and algebra reviews. Exact
rational-polynomial checks passed for the general curvature identity and
the displayed derivative values. The analytic convergence argument supplies
the counterexample intervals. The source audit records both search engines,
current author records, later primary-paper comparisons, and full-text
access limits. No outside peer review or exclusive priority is claimed.

[Proof, source audit, and exact algebra](results/ferreira-simon-wright/).

## 2026-11-20 — Karp–Vishnyakova–Zhang's gamma-quotient conjecture

Added a complete proof of all-order sign regularity for the additive gamma
quotient with every positive parameter difference. An explicit Wronskian gives
the signs for the power kernel; two gamma-density integral transforms transfer
those signs to the quotient through continuous Cauchy–Binet. The proof includes
absolute integrability, strictness, all integer rank cutoffs, and translated
domains with positive gamma arguments.

The source's proposed fixed third-order signature is corrected within the same
result. Two independent reviews of the full proof passed. A standard-library
verifier passed 115 exact rational checks of half-integer signs, integer rank,
and gamma-moment normalization. These finite diagnostics are supplementary to
the all-parameter proof. The source audit records both search engines, primary
theorem comparisons, public solution checks, and inaccessible-source limits.
No external peer review or absolute priority guarantee is claimed.

[Proof, source audit, and exact checks](results/kvz-gamma-quotient/).

## 2026-11-20 — Alexandersson's Fuss–Catalan conjecture

Recorded a short uniform deduction of the named real-rootedness conjecture.
Classical Kreweras/cycle-lemma enumeration shows that, after fixing the
number of north steps and north runs, the Fuss parameter changes only a
positive scalar. The real-zero polynomial is already known from the
ordinary-Dyck work of Bóna and coauthors and Wang–Zhang. A self-contained
Rolle argument is included for independent checking.

The complete argument passed independent review. Direct enumeration of
10,188 paths across 18 parameter pairs checked the exact source convention.
These finite comparisons are diagnostic. The attribution record expressly
credits both classical ingredients and records an inaccessible recent
paper; no unconditional novelty claim is made. This entry is distinguished
from a new enumeration or a new root-preserving theorem.
[Proof, classical attribution, and checks](results/alexandersson-fuss-catalan/).

## 2026-11-20 — Sagan–Swanson conjecture

Added a complete proof of asymptotic normality for all four q-Stirling
coefficient distributions in the proportional regime of Conjecture 7.8.
An exact conditioned probability model reduces the elementary and complete
homogeneous symmetric-function families to one theorem. A direct Fourier
bound controls the conditioning, and exponential tilting proves convergence
of the actual means and variances. The limiting variance is positive and
has order $n^3$.

Independent source/model and analytic audits passed, followed by a separate
review of the full written proof. The standard-library verifier passed 168
exact identities against the four original recurrences. These finite checks
do not replace the asymptotic proof. The literature record distinguishes
older row-distribution and fixed-parameter theorems, as well as the already
resolved bottom-heaviness conjecture, and states the access limits.
[Proof, source audit, and model checks](results/sagan-swanson-normality/).

## 2026-11-20 — Bernardi–Morales's delta-process conjecture

Added complete written proofs of the delta-process tree-probability identity
and the stronger event-determinant identity, published as Conjectures 27–28
and numbered 21–22 in the preprint. The tree count holds for each fixed
color map, and the event identity holds for each fixed surjection.

The two arguments use cycle Laplacians and cyclic adjugates, respectively.
The event proof explicitly handles full subsets, where the cycle matrix is
singular. Separate internal reviews checked the original event definitions,
the determinant identities, and membership-coefficient extraction.
The standard-library verifiers passed locally on Python 3.12.14: 71 fixed
maps and 111,721 tree-process pairs; 25 arbitrary-matrix determinant checks;
and 342 marked-surjection profiles with 438,952 literal event determinants.
The literature audit records checked sources and access limits. External
peer review and author confirmation have not been obtained.
[Result, both proofs, and checks](results/bernardi-morales-delta/).

## 2026-11-20 — Gilmore and Chow conjectures

Added an all-row proof of
Gilmore's crossing–nesting matrix identity with an alignment refinement,
and a proof of consecutive type-D Eulerian interlacing.

The weak Chow assertion is a direct consequence of Savage–Visontai's
published refinement theorem; that dependency and the separate strictness
argument are explicit. Each result includes its primary conjecture source,
a bounded literature audit, precise scope, and reproducible exact checks.
A second agent independently checked each mathematical argument. The
published verifiers passed locally on Python 3.12.14, with SymPy 1.14.0 for
Chow's checks. No Lean work was performed.
[Result entries and scope](CONTENTS.md#polynomial-identities-and-positivity).

## 2026-11-20 — Németh–Seberry–Shu conjecture

Added a written disproof of the all-row-sums conjecture for prime-order
binary circulant permanents and linked the quadratic strengthening.
[Result and scope](results/nemeth-seberry-shu/).

## 2026-11-20 — Horňák–Woźniak and Sonntag–Teichert conjectures

Added written proofs and literature checks for both connected-partition
conjectures of Horňák and Woźniak and for Sonntag and Teichert's
tournament domination hypergraph conjecture. The respective exact
cross-checks pass. The same campaign added partial results for the Erdős
essential-component, Erdős–Sauer, Bollobás–Erdős–Tuza and Erdős–Oler
conjectures. [Proofs and research notes](CONTENTS.md).

## 2026-11-19 — Four-input prime filtering

Registered 20 modules after the complete hosted source, literal-statement,
owned/raw-occurrence audit and stock-kernel gate passed. Ten canonical
finite checks now give an unconditional arithmetic filter for four inputs
nonzero modulo seven, with actual folded bounds and higher-residue
preservation relative to one of the multipliers 1 through 5.
The unrestricted six-speed runner theorem remains pending.
[Scope and original evidence](docs/verification/prime-filtering-four-exact-44601096014/README.md).

## 2026-11-19 — Prime filtering and proved runner classes

Registered twelve modules after the complete 18-module hosted gate passed
strict sources, 33 literal contracts, all 299 owned declarations, and exact
stock-kernel replay. The proofs formalize the published prime-filtering
lemma and seeded distance corollary. The `1/7` runner consequence retains
the three-distinct-speeds budget at each valuation level below the maximum.
The unrestricted six-speed bound remains pending.
[Scope and original evidence](docs/verification/prime-filtering-exact-44591941338/README.md).

## 2026-11-19 — Registered order-nine automorphism subgroup and orbit proofs

Registered the two existing modules for odd automorphism subgroups of abelian
groups of order nine. They prove subgroup order three, three fixed points,
and five orbits in the nontrivial case. The four unchanged source modules
retain their original hosted strict-source, axiom, and stock-kernel pass.
A fresh local strict-source check and complete 68-declaration audit also
passed; the separate local repeat stock replay timed out and is preserved
with its actual outcome. The length-1197 order-27 exclusion remains pending.
[Exact scope and evidence](docs/verification/hadamard-order-nine-orbits-44523474204/README.md).

## 2026-11-19 — Complete tight-five classification and independent finite lower bound

Registered the complete primitive and gcd-normalized five-speed equality
classification at `1/6`, with exactly `[1,2,3,4,5]` and `[1,3,4,5,9]` as primitive
directions. The proof also gives an independent finite derivation of the
five-speed lower bound; the earlier Renault proof remains registered.

The original run 44549751944 passed all 250 fresh strict source modules,
7,586 required theorem endpoints, 7,070 finite frames, the complete raw/private
axiom audit, and exact stock kernel replay. Every finite source was reproduced
and the original artifact authenticated. The full five-speed spectrum below
`1/5` remains incomplete.
[Exact statements and preserved evidence](docs/verification/loneliness-five-runner-exact-44549751944/README.md).

## 2026-11-19 — GitHub proof rendering and results index

- Simplified the README results table to directory links and Lean status emoji.
- Standardized Markdown math for GitHub and kept native MathML on the reading site.

## 2026-11-19 — Conditional norm reductions for nine through thirteen speeds

- Registered the actual primitive-speed norm cutoffs and prime-selection
  theorems, retaining every smaller-dimensional runner bound as an explicit
  hypothesis. The basis geometry and all 7,936 KZ subset rows are proved internally.
- Exact run 44530735399 checked 81 strict sources, 1,696 owned/raw declarations
  (1,445 theorems and 538 private declarations), 25 required theorem endpoints
  and 81 exact stock-kernel targets. Original evidence is authenticated under
  `docs/verification/loneliness-large-norm-exact-44530735399/`.
- Added 64 proof modules and 25 required endpoints. The equality classifications
  remain partial; lower-runner bounds, modular exhaustiveness and uniqueness
  are still required. The merged accepted-package gate remains separate.

## 2026-11-19 — Complete fixed-hyperplane formalization

- Registered the original fixed-hyperplane probability, counting, Haar-shift,
  endpoint and sharpness statements, preserving the ordered positive distinct
  sampling model and all original hypotheses.
- Exact run 44531509741 at `ee1f018fef258cdd54f73af31cdaf6485fd151cb` checked all 72 sources with warnings as
  errors, all 1,403 owned declarations (1,149 theorems and 44 private declarations),
  all 106 required theorem endpoints and all 72 exact stock-kernel targets.
- Preserved the unchanged raw receipt and authenticated original evidence under
  `docs/verification/hyperplane-main-exact-44531509741/`.
  Registration adds 63 proof modules and 102 previously unregistered endpoints.
  The merged accepted-package gate remains separate.


## 2026-11-19 — Both six-speed spectrum realization branches

Registered the unconditional existence theorem for every proposed six-speed
value `(P−1)/(6P)`, for `P ≥ 7` congruent to one or five modulo six.
The witnesses are positive, distinct and primitive; their exact global
values include actual attaining times. The 11-module closure passed fresh
strict sources, the audit of all 392 owned declarations including 30 private
declarations, and every exact stock-kernel target. All 15 required endpoints
are theorems. Universal classification remains incomplete.
[Scope](docs/lean-status.md#six-speed-spectrum-complete-realization) ·
[Receipt](docs/verification/six-spectrum-realization-44527134869/receipt.json).


## 2026-11-19 — Complete unrestricted two-speed insertion theorem

Registered the full two-speed insertion result, including the arbitrary
positive speeds, prescribed interval, Goddyn–Wong acceleration criterion,
common-dilation value bound, small and unbounded branches, and literal
three-insertion obstruction. The exact 27-module closure passed fresh
strict source checks, an audit of all 563 owned declarations including
11 private declarations, and exact stock-kernel replay of every module.
All 49 required endpoints are theorems. The registration adds 18 proof
modules and preserves the checked source hashes.
[Scope](docs/lean-status.md#complete-unrestricted-two-speed-insertion-theorem) ·
[Raw receipt](docs/verification/two-insertions-exact-44524198858/receipt.json).
The merged-package gate remains separate.


## 2026-11-19 — Actual Legendre-pair construction and quotient transport

Registered the matrix constructed from an actual Legendre pair, including the order-2396 specialization, and the actual invariant quotient/layer data used to exclude order 27. Their exact closures passed all three gates: construction, five modules and 87 project theorems; quotient transport, eighteen modules and 353 project theorems. Eight previously unregistered modules and thirteen named endpoints were added. The full finite no-lift certificate and final multiplier bound of nine remain pending.
[Statements and receipts](docs/lean-status.md#actual-legendre-pair-matrix-and-quotient-transport).

## 2026-11-19 — Complete Erdős 607 line-size asymptotic

Registered the sharp asymptotic for the actual real-plane record count, with
the exact leading constant. The proof discharges the characteristic-product
limit, Fourier domination, core-lattice integral, Gaussian constant, and
normalization. Its 78-module closure passed strict sources, a 1,582-theorem
standard-axiom audit, and independent pinned-kernel replay at `36b13722`.

The analytic generating function and actual Fourier coefficient identity also
passed their 39-module/867-theorem closure at `daa7d2c5`. Both exact receipts
are archived after comparison of all 93 recorded paths. The 44 new proof
modules and 20 required endpoints complete the stated note, alongside its
earlier geometry and formal-series proofs. The full merged-package gate is
separate; Li remains last.
[Exact statement and receipts](docs/lean-status.md#complete-erdős-607-line-size-asymptotic).

## 2026-11-19 — Complete Frankl high-girth frequency theorem

Registered the full all-point `518208/1000000` distinct-union bound for every
uniform generator size at least three, under three-regularity and incidence
girth at least sixteen. Actual boundary configurations, finite fiber
averaging, all twelve small-degree certificates, and the large-degree
linearity consequence discharge every proof input. Both girth formulations
and removal of the empty union are included.

The exact 64-module closure passed fresh strict sources, the all-owned
1,363-declaration axiom audit, and pinned stock-kernel replay. The 47 new
modules and 34 new required endpoints are registered; the full merged gate
remains separate. The cyclic span-four result and the overall campaign
remain incomplete. [Checked scope and receipt](docs/lean-status.md#complete-frankl-high-girth-frequency-theorem).

## 2026-11-19 — Complete conditional Hadamard border construction

Registered the full fixed-border construction from the original sign rows
and correlation equations on every finite abelian group with an index-four
subgroup. The proof derives normalization, checks the actual core and literal
border, and returns the final matrix. Its size-149 specialization has order
2396. The fourteen baseline patterns are exhaustive with actual row-operation
witnesses. Binary rows satisfying the hypotheses are still required.

The length-1197 multiplier group is also proved to have order dividing 27,
with its invariant quotient of order three constructed. The sharper bound of
nine and finite quotient/no-lift proof remain pending. Four exact passing
source/audit/kernel receipts register 31 modules and 17 required endpoints,
after comparison of all fifty recorded paths. The full merged gate remains
separate. [Scope and receipts](docs/lean-status.md#complete-conditional-fixed-border-construction-and-fourteen-patterns).

## 2026-11-19 — Complete two-difference Motzkin formalization

Registered the exhaustive integer relation-basis classification and its
compact-density trichotomy. Every pair now receives the appropriate zero-rank,
one-relation, or rank-two Hermite formula without an assumed basis. The exact
41-module closure passed strict sources, a 743-theorem standard-axiom audit,
and independent pinned-kernel replay. Two modules and seven required
endpoints join the accepted package after comparison of every recorded hash.

This closes the stated Motzkin note, including its earlier compact and cyclic
equalities, exact evaluator with complexity bounds, and explicit attaining
witnesses. The full merged-package gate remains separate. Li remains last.
[Exact scope and receipt](docs/lean-status.md#complete-two-difference-motzkin-theorem).

## 2026-11-19 — Checked sharp cover, voltage normalization, and border transport

Registered thirteen unchanged proof modules after four exact hosted closures
passed strict source checks, standard-axiom audits, and independent replay
with the unchanged pinned kernel checker. The connected 95-vertex cyclic
cover has attained least power-of-two cycle length 32; its seven-module
closure audited 288 project theorems. Arbitrary seven-voltage normalization
passed in four modules with 131 audited theorems. Finite-border transport
passed in two modules with 66 audited theorems, retaining its finite
certificate identities as inputs. Actual-row normalization passed in two
modules with 14 audited theorems, retaining its compression-shape inputs.

The universal cover theorem remains under issue 18. Deriving the compression
shapes, checking the literal finite certificate, and final Hadamard assembly
remain under issue 17. The actual row-operation scope in issue 26 is complete.
Li remains deferred. [Checked scope and receipts](docs/lean-status.md#complete-sharp-95-vertex-example-and-arbitrary-voltage-normalization).

## 2026-11-19 — Checked cyclic assembly and weight transport

Registered 32 unchanged proof modules after five hosted source, axiom and
stock-kernel gates passed. The accepted packet includes the conditional
all-period span-four assembly, its arbitrary-family transfer, the 48-case
literal weight pilot, exact overlap enumeration, and injective weight
transport with a proved cached evaluator. The concrete graph, rank and full
weight tables remain unfinished. No complete span-four theorem is claimed.
[Scope and receipts](docs/lean-status.md#frankl-cyclic-assembly-and-weight-helpers--19-november-2026).

## 2026-11-19 — Complete fixed-border multiplier and orbit bounds

Registered all 12 border-symmetry proof modules after their exact closure at
`682d0917` passed strict sources, a 216-theorem standard-axiom audit, and the
unchanged pinned kernel replay. The theorem applies to actual sign rows on
every finite abelian group with a subgroup of size 149 and index four.
The full common multiplier group is cyclic of order dividing four, and every
preserving subgroup leaves at least 151 actual sign orbits. Product coordinates
and all transports are proved; no split-domain or normalized-pattern premise
is added. The proof uses raw compressed correlations and does not require
the fourteen-pattern enumeration.
[Receipt](docs/verification/hadamard-border-transfer-682d0917.json) ·
[Checked statement](docs/lean-status.md#complete-fixed-border-multiplier-and-orbit-bounds).

Issue 22 is complete. The separate sequence restrictions and fixed-border
construction remain under issue 17. Issue 23 takes the sharp 95-vertex
Erdős–Gyárfás example in separate candidate sources. Li remains deferred.

## 2026-11-19 — Checked literal mask checker and exact domains

Registered two exact local-mask checker modules after their ten-module hosted
gate passed at `a632fc82`. The gate checked 163 project theorems, 38 required
endpoints, and every module with the stock kernel checker. The checker counts
actual compatible sets and proves its finite domains. Full window data and
the complete span-four theorem remain separate obligations.
[Receipt](docs/verification/frankl-mask-domains-a632fc82.json).

## 2026-11-19 — Checked Vaughan theorem and small cyclic components

Registered the full three-triples Vaughan theorem and every nontrivial cyclic
span-four family on at most six sites. Further period-seven-through-ten
results retain an explicit residual-graph hypothesis. The exact 53-module
closure passed strict sources, a 2,057-theorem axiom audit, checks of all 534
private certificate nodes, and stock kernel replay at `6544adcc`. Its 50 new
proof sources are unchanged. The full span-four theorem remains incomplete.
[Receipt](docs/verification/frankl-fc-packet-6544adcc.json).

## 2026-11-19 — Checked Frankl local certificate semantics

Registered the integer local checker and its equivalent maximal-cover checker.
Their exact five-module closure passed strict source checks, a 66-theorem axiom
audit, and independent kernel replay at `ad07e385`. Both checkers count actual
distinct inside patterns. No finite window weight table is asserted by this
registration. The full merged-package check remains separate.
[Receipt](docs/verification/frankl-maximal-cover-ad07e385.json).

## 2026-11-19 — Complete Hadamard automorphism obstruction

The full signed row/column automorphism theorem at order 2396 passed its
28-module strict-source, 297-theorem standard-axiom, and unchanged pinned-kernel
gate at `fb6b6e06`. The actual automorphism group and all subgroup quotients
have cardinalities not divisible by 479. The independent relative-ideal-norm
proof also passed its 15-module, 164-theorem gate. Sixteen additional proof
source files are registered, bringing this lane to 37; their closures include
the earlier 12-module, 128-theorem cyclotomic descent check at `7098a0e8`.
[Assembly receipt](docs/verification/hadamard-automorphism-assembly-fb6b6e06.json) ·
[Independent proof receipt](docs/verification/hadamard-automorphism-class-alternative-fb6b6e06.json) ·
[Descent receipt](docs/verification/hadamard-automorphism-cyclotomic-7098a0e8.json).
The expanded quadratic-model closure also passed all three gates at `0a1deef7`,
with 16 modules and 157 audited theorems, proving uniqueness of the quadratic
subfield and the exact equal-parity integer-coordinate equivalence.
[Quadratic-model receipt](docs/verification/hadamard-automorphism-quadratic-model-0a1deef7.json).

The separate sequence and border results remain pending. Issue 22 claims the
later fixed-border common multiplier and 151-orbit tail. The status inventory
now explicitly includes the two-insertion and Erdős–Gyárfás cover obligations;
Li remains deferred.

## 2026-11-19 — Checked quadratic field and ideal-class witness

Registered six Hadamard automorphism proof files that construct the actual
quadratic fixed field and a prime above 599 of norm 599 and exact ideal-class
order five. The nine-module closure passed strict sources, a 111-theorem axiom
audit, and independent pinned-kernel replay at `ae7871fc`. The universal
prime-pair alternative and full automorphism assembly remain candidates.
[Receipt](docs/verification/hadamard-automorphism-class-order-ae7871fc.json).

## 2026-11-19 — Checked Hadamard automorphism permutation component

Six proof files now cover explicit diagonal normalization, fixed-point and
cycle counts, cyclic reindexing, integer transport, and the signed automorphism
subgroup. Their seven-module closure passed strict source checks, a 100-theorem
axiom audit, and independent pinned-kernel replay at `e9a9bb45`. The full
obstruction still awaits cyclotomic descent and final assembly.
[Receipt](docs/verification/hadamard-automorphism-permutation-e9a9bb45.json).

## 2026-11-19 — Checked Hadamard automorphism Fourier component

Registered the explicit Fourier, binary overlap, indicator, and determinant
components after strict source checks, a 32-theorem transitive axiom audit,
and independent pinned-kernel replay of their six-module closure at `ee1be6e0`.
The full automorphism and ideal-class statements remain candidates.
[Receipt](docs/verification/hadamard-automorphism-fourier-ee1be6e0.json).

## 2026-11-19 — Checked Hadamard automorphism arithmetic

Registered the arithmetic and integral-basis coefficient component of the
order-479 automorphism obstruction. The five-module candidate closure passed
strict source checks, a 38-theorem transitive axiom audit, and independent
pinned-kernel replay at `56cb125e`, with unchanged sources. The full matrix
and cyclotomic assembly, and the separate ideal-class argument, remain
candidates. [Receipt](docs/verification/hadamard-automorphism-arithmetic-56cb125e.json).

## 2026-11-19 — Complete Frankl large-generator frequency bound

Registered the full all-`k ≥ 15` bound of `657/1000` for every point, with
actual distinct-union counting and the original size, regularity, and linear
intersection hypotheses. Its 16-module closure passed strict sources, a
231-theorem transitive axiom audit, and pinned-kernel replay at `663f7275`.
The high-girth cases `3 ≤ k ≤ 14` and cyclic span-four theorem remain in
progress. [Receipt](docs/frankl-large-hosted-receipt.json).

## 2026-11-19 — Checked Frankl counting foundations

Registered six proof modules after their exact hosted source, transitive axiom,
and pinned-kernel gates passed at `57d699c7`. The packet proves the general
weighted local-certificate implication, the incidence-graph bijection, finite
lopsided conditioning, and the all-parameter numerical criterion. Both full
Frankl results remain incomplete. [Receipt](docs/frankl-foundations-hosted-receipt.json).

## 2026-11-19 — Searchable collection website

Added a GitHub Pages site with search, subject filters, and individual result pages.
Updated result titles, citation metadata, and links to the maintainer's website.
The README now shows the Lean and computational verification workflows.
Reconciled five index flags with the existing partial results in the [Lean status report](docs/lean-status.md).
Mathematical claims and checked proof scopes are unchanged.

## 2026-11-19 — Partial results for three open problems

Published the two Frankl generator results, the two-speed Lonely Runner insertion theorem and a sharp bound for abelian covers in the Erdős–Gyárfás search. Each entry gives its hypotheses and reproducible checks. [Catalogue](CONTENTS.md#partial-results-on-open-problems)

## 2026-11-19 — Formal generating function and cyclic Motzkin formulas

- Registered the exact coefficientwise generating function after its
  14-module strict source check, 496-theorem axiom audit, and kernel replay.
- Registered the all-modulus cyclic formulas, gcd scaling, odd-cycle
  criterion, exact example, and abstract rational-circle attainment after
  the 48-module source check, 812-theorem audit, and kernel replay.
- Added 14 proof modules, giving 482 proof modules and two roots. The empty
  cyclic candidate wrapper is excluded. The full merged gate remains pending.
- Recorded the completed historical full check of `42fff1a2`: 397 proof
  modules, both roots, and 10,843 audited theorems.
- Added separate unregistered gates for Gaussian integration, branch
  coefficients, coefficient rescaling, the actual supported integral limit,
  exhaustive Motzkin relation bases, rational interval witnesses, the fixed
  character window, and the final sharp coefficient theorem.


## 2026-11-19 — Order-479 automorphisms excluded at Hadamard order 2396

Added a cyclotomic obstruction for every candidate matrix, with a second ideal-class proof. The index-four core search also has common multiplier group size at most four. [Scope and proofs](results/hadamard-2396/)

## 2026-11-19 — Partial results at Hadamard order 2396

Added two verified symmetry restrictions, the finite enumeration and a conditional border construction for the open order-2396 existence problem. [Scope and checks](results/hadamard-2396/)

## 2026-11-19 — Relation formulas, Euler correction, and tuple reconstruction

- Registered the Motzkin formulas for stated relation generators and
  finite-relation Borel attainment after a 39-module strict source check,
  729-theorem axiom audit, and independent kernel replay.
- Registered the uniform corrected finite Euler product after its eight-module
  closure passed strict sources, a 122-theorem audit, and independent replay.
- Registered finite tuple/core/tail reconstruction and cumulative cost counting
  from the earlier nine-module, 307-theorem hosted receipt.
- Added 13 checked proof modules, giving 468 proof modules and two roots.
  Full merged verification remains pending. Motzkin basis existence and the
  cyclic/evaluator claims, and the line-size sharp asymptotic, remain open.

## 2026-11-19 — General compact Motzkin equality

- Registered the exact density/continuous-character equality for arbitrary
  compact Hausdorff abelian groups, including zero differences.
- The exact 34-module hosted closure passed strict sources, a 664-theorem axiom
  audit, and independent kernel replay with unchanged source and gate hashes.
- Added 22 checked proof modules to the concurrent 433-module package. The
  combined 455-module hosted gate remains pending; ancillary rank, cyclic,
  evaluation, and complexity claims remain candidates.

## 2026-11-19 — Exact line-size geometry and saddle profile

- Proved the real-plane realizability criterion and exact geometric record
  count for every point count; the 20-module closure passed source, the
  342-theorem ownership audit, and independent kernel replay.
- Proved the exact saddle constant and moment identities from the literal
  integral, with a five-module, 137-theorem audit and kernel replay.
- Registered these checked components and the smooth Euler kernel. The
  exact generating function, corrected product estimate, Fourier bounds,
  and sharp asymptotic remain ongoing work.

## 2026-11-18 (America/Chicago) — Complete four-speed gap

- Proved the all-size four-speed gap and both critical directions below `2/9`,
  including their exact value `1/5` and the four-speed runner lower bound.
- Registered 36 additional modules after exact dependency coverage, an
  1,880-theorem ownership/axiom audit, and independent kernel checks.
- Supplied the previously explicit gap input to the existing five-speed
  plane and cutoff reductions. The bounded five-speed enumeration remains open.

## 2026-11-19 — Complete concrete CUT games and line-size foundations

- Identified both actual recursive CUT games with their proposed sequence at
  every natural pile size. Proved least eventual arithmetic period 12, saltus
  8, and earliest period-12 start 7. Seven compact certificate modules passed
  source checks and the 1,127-declaration ownership audit; all 23 project
  modules in their exact closure passed independent kernel replay.
- Checked seven Erdős 607 foundations, including ordinary-line existence for
  actual finite real-plane point sets, the selected-graph cost identity, and
  the core-to-gap weight equivalence. Geometric sufficiency and the asymptotic
  theorem remain in progress.
- Recorded successful hosted full source, axiom, and kernel verification of
  the 219-module Pham/finite-Motzkin checkpoint `18bf908`.

[Home](README.md) · [Catalogue](CONTENTS.md)

## 2026-11-18 (America/Chicago) — Graph theorem and runner components

- Registered the all-order Graffiti.pc318 theorem and its sharp five-vertex
  example after local and hosted source, axiom, and independent kernel checks.
  The contributed proof remains credited to @JesterInABarrel.
- Registered the consecutive runner family for counts 2 through 14, both
  exceptional eight-speed families, classification within all three stated
  eight-speed product families, and the displayed higher-speed examples.
  Exhaustive higher-speed classifications remain open.
- Registered the exact shifted hyperplane maximum, its attaining point, and
  the upper bound for every orthogonal integer velocity. The statistical and
  counting parts remain open.
- Kept the finite four-speed assembly, KZ arithmetic, reduced-basis geometry,
  Haar/Fourier, and closed-search developments under separate candidate gates.

## 2026-11-19 — Complete rectangle asymptotic and finite plane reduction

- Completed the growing-rectangle theorem for literal real-position tilings,
  uniformly over every `w ≥ h`. The 46-module proof includes the cumulative
  partition estimate and passed the 587-declaration axiom audit and kernel replay.
- Registered the unconditional four-speed cutoff 5,832 and all 64 finite plane
  certificate blocks, covering 122,880 indexed cases. Both hosted matrix runs
  passed source, axiom, and stock kernel checks.
- Registered the plane classification and five-speed cutoff 279,841 with the
  four-speed gap retained as an explicit mathematical input. The exhaustive
  five-speed classification remains in progress.
- Preserved the concurrent completed Pham proof, finite Motzkin theorem, and
  separate unregistered candidate developments.

## 2026-11-19 — Complete Pham proof and finite Motzkin theorem

- Derived both Pham limiting-series identities from actual Bulgarian-solitaire
  cycles and first-entry levels. Proved reduced denominator degrees 5 and 10
  and minimality against every nonzero alternative denominator. The complete
  36-module closure passed source checks, its 1,080-declaration axiom audit,
  and independent kernel replay.
- Completed the Motzkin equality and both attaining witnesses for every finite
  abelian group generated by the two differences. The 12-module closure passed
  independent kernel replay and the 115-declaration Motzkin audit passed.
  The arbitrary compact-group theorem and later algorithmic claims remain open.
- Added exact-closure replay for a selected candidate root. Six protocol tests
  check closure validation, object staging and checker failure propagation.

## 2026-11-19 — Additive Lean integration

- Combined 177 accepted proof modules with both project roots. The merged
  source build and compiled/direct standard-axiom audits passed; the audit
  checked 7,581 theorem declarations.
- Renamed the two independent finite rectangle inputs to `RectangleFinite`
  after detecting a collision with the concurrent shelf-packing proof. Both
  renamed modules passed fresh strict source checks and independent kernel replay.
- Preserved the separate candidate workflows and their unregistered sources.
  The component kernel receipts and the full merged hosted gate are recorded
  separately in the Lean status report.

## 2026-11-18 — Random lonely runners on a fixed hyperplane

- Added the conditional limiting law for Beck and Everett’s statistical question, the finite-subspace description of exceptional velocities, and the unshifted endpoint density for full-support normals.

## 2026-11-18 — Corrected solitaire and combined formalizations

- Completed the corrected L-solitaire theorem in Lean for arbitrary layer sets,
  actual recurrent configurations, and every diverging horizontal scale. The
  finite dynamics, stable-reference classification, analytic bound and limit
  transfer passed source, axiom and independent kernel checks.
- Merged the concurrent density and loneliness foundations, and identified the
  two real distance definitions through a checked pair-sum interface.
- Completed the all-parameter gap-five/gap-seven character formulas and the
  general odd-cycle density theorem. Added finite rectangle packing/counting
  inputs and the exact actual-pile CUT composition theorem.
- Passed the combined source build, the 6,954-theorem standard-axiom audit,
  and independent kernel replay of all 152 accepted proof modules and both
  roots. The replay list is checked against the source-import closure.

## 2026-11-18 — Graffiti.pc Conjecture 318 (credited to @JesterInABarrel)

- Added the all-order proof of Conjecture 318 **credited to [@JesterInABarrel](https://x.com/JesterInABarrel/status/2123233964827812334)**, its stronger total-dominating-pair theorem, and a sharp five-vertex counterexample to lowering the hypothesis by one.
- Checked 419,235 labeled graphs (7,337 satisfying the hypothesis); Lean formalization remains open.

## 2026-11-18 — Complete distance-graph classifications

- Proved the exact gap-five and gap-seven density tables for every positive parameter, including optimal periodic constructions.
- Proved the exact Conjecture 39 discrepancy and infinitely many strict counterexamples.
- Added checked finite rectangle-tiling and Euler-product components; the uniform rectangle asymptotic remains incomplete.
- Added the two-integer-direction plane reduction with the four-speed gap retained as an explicit hypothesis.

## 2026-11-19 — Equality for eleven through fourteen runners

- Classified the primitive equality cases using published binary sieves and an additional integer-direction calculation.

## 2026-11-18 — Complete Haralambis formalization

- Proved the three-difference density theorem and an optimal pair-sum-period construction for every positive triple.
- Proved the general greedy packing bound and the lonely-runner lower bound for at most three speeds.
- Added coordinate coalescence, integer directions, real-span dimension, and rational subspace extensions to the five-speed reduction.
- Recorded the successful hosted Lean build, axiom audit, and kernel replay for the previous density/CUT checkpoint.

## 2026-11-19 — Eight-speed loneliness spectrum

- Added the full classification below 1/8, the three families, and the table of 17 sporadic tuples.

## 2026-11-19 — Seven-speed loneliness spectrum

- Added the full classification below 1/7, the table of 27 sporadic tuples and the corollary on Zhu’s triangle conjecture for six and seven distances.

## 2026-11-18 — Checked density, CUT, and loneliness proofs

- Added complete symmetric four-point packing/covering and nonmixed-gap packing/circle proofs, including common-divisor normalization.
- Added the complete general finite CUT test and completeness of candidate enumeration.
- Added exact real-time loneliness certificates, both critical-family reductions, and the infinite five-speed family.
- Updated the formalization index to distinguish these checked components from the remaining spectrum classification.

## 2026-11-19 — Ten-runner equality classification

- Added the proof that only consecutive primitive speeds attain 1/10 and the verifier for its 28 modular certificates.

## 2026-11-19 — Collection navigation

- Split the landing page, full result catalogue, and verification instructions.
- Added landing pages for results that previously opened as file listings.
- Grouped result files under `results/` and moved the shared Lean package to `lean/`.
- Updated navigation, CI commands, and certificate-generation paths.
- Kept mathematical statements and formalization status unchanged.

## 2026-11-18 — Formalization campaign resumed

- Completed the CUT Family B theorem for the actual recursively defined games,
  including infinite cut sets and the sharp discrepancy bound.
- Added exact reverse-solitaire preimage semantics and uniform arithmetic-tail
  graph recognizers.
- Added a general loneliness maximum theorem and 31 kernel-checked exact values.
- Completed the symmetric four-point packing and covering densities, including
  attainments and sharp interval lengths.
- Continued the corrected solitaire and remaining density/automata proofs.
- Kept Li last and tracked active lanes in issue 1.

This file records collection-level changes, not a complete discovery or priority timeline. For individual additions and revisions, see [the commit history](https://github.com/1337isnot1337/solved-conjectures/commits/main/). Ongoing formalization work is recorded in [the status report](docs/lean-status.md) and [campaign notes](docs/formalization.md).


## 2026-11-19: universal abelian-cover theorem and further exact components

Registered the complete abelian voltage-cover cycle theorem and retained
the sharp 95-vertex example. Also registered the literal finite-border
certificate and the full length-598 order-eleven multiplier obstruction.
Exact source, axiom, and kernel receipts are recorded in `docs/verification`.
The Motzkin evaluator, explicit rational interval witnesses, and narrow
prime-257 minimum-pair-20 support certificate were registered separately.
The remaining collection results are still in progress; Li has not started.

## 2026-11-19: Rational-lattice and Gram components

Registered the eight rectangular/rational-lattice sources and their 50 theorem endpoints after the complete hosted source, owned/private axiom, and stock-kernel gate passed. The six-speed spectrum remains partial; the norm components retain `hfour` and `hplane`.

## 2026-11-19: Conditional two-parameter radius estimate

Registered `Conjectures.LonelinessTwoParameterRadius` and its 6 theorem endpoints after the complete 13-module hosted source, owned/private axiom, and stock-kernel gate passed. The result status remains partial; the retained hypotheses are stated in the status report.

## 2026-11-19: Six-speed norm bounds with the four-speed input discharged

Registered `Conjectures.LonelinessSixSpectrumLatticeNormFourSpeed` and its 3 theorem endpoints after the complete 113-module hosted source, owned/private axiom, and stock-kernel gate passed. The result status remains partial; the retained hypotheses are stated in the status report.

## 2026-11-19: Seven-coordinate implications with the five-speed input discharged

Registered `Conjectures.LonelinessSevenCoordinateFiveSpeed` and its 6 theorem endpoints after the complete 171-module hosted source, owned/private axiom, and stock-kernel gate passed. The result status remains partial; the retained hypotheses are stated in the status report.

## 2026-11-19: Actual rational-lattice quotient index

Registered `Conjectures.LonelinessRationalLatticeQuotient` and its 5 theorem endpoints after the complete 20-module hosted source, selected-declaration axiom audit with raw/private visibility, and stock-kernel gate passed. The result status remains partial; the retained hypotheses are stated in the status report.

## 2026-11-20 — Erdős–Granville–Pomerance–Spiro conjecture

Added a written partial result for arbitrary natural density-zero target sets.
The three input families in the [divisor-sum proof](results/erdos-granville-pomerance-spiro/)
have combined natural density about 53.46%. The computational workflow checks
finite algebra and congruence cases. The full conjecture remains open.

## 2026-11-20 — Horňák–Woźniak conjecture

Added a [proof of both vertex-decomposability conjectures](results/hornak-wozniak/) for tripods and four-arm trees with a one-edge arm. The endpoint argument removes the middle-arm bound and shows that three of the five admissibility tests suffice. The catalogue links the literature check and reproducible allocation checks.

## 2026-11-20 — Sonntag–Teichert conjecture

Added a [proof of connectivity for tournament domination hypergraphs](results/sonntag-teichert/) on their nonisolated vertices. The argument uses minimal closed in-neighbourhoods and also characterizes the disconnected cases for oriented graphs.





