# Review and verification record

Research checkpoint, 23 November 2026 (America/Chicago). The matrix multiplication exponent target remains unresolved. This record separates imported theorems, written proofs checked in this project, and finite executable checks.

## Review process and scope

The work was divided among three parallel research workers and a coordinating reviewer. Proofs and counterexamples were exchanged for internal adversarial review. This is internal mathematical review, not external peer review. No new theorem was formalized in Lean.

The repository instruction in `AGENTS.md` accepts the pinned Anthropic theorem and its stated lemmas. This project uses that assumption and does not re-audit the circuit lower-bound proof. [INDEPENDENT_SOURCE_AUDIT.md](INDEPENDENT_SOURCE_AUDIT.md) records the precise sources, versions, theorem numbers, and the distinction between those imports and new deductions.

The concurrent scalar construction in [PR #254](https://github.com/1337isnot1337/solved-conjectures/pull/254) is credited and its files were not overwritten. The multi-shared-party separator was independently reconstructed, then matched to Zhou's prior theorem and relabeled accordingly.

## Mathematical review

| Proof or audit | What was checked | Limit |
| --- | --- | --- |
| Normalized extension | Product pinning; the unit sandwich; binomial and multinomial type projections; compactness for one fixed retraction law. | No simultaneous choice for incompatible retraction laws is inferred. |
| Spectral formulation | Arithmetic model, recursive rank algorithm, wire power law, crossing-wire identity, tight-support labels, and the known quantum family. | Completeness of the quantum family on wires remains unproved. |
| Copied and split inputs | Matching flattening lower bounds and explicit decompositions, including arbitrary input bases. | These concern the changed tensor, not a lower bound above two for the original multiplication tensor. |
| Multi-party separator | The sum-of-squares weights, interpolation cost, and type argument. | This is a reconstruction of Zhou's published method and remains within his higher-order barrier. |
| Scalar minimum-cut tests | Gaussian/coarea graph proof; equilateral and general cap proofs; tree extension, projection, and endpoint randomization. | No arbitrary-tensor spectral point or general helper-terminal extraction theorem is inferred. |
| Tripod scalar model | Closed-form distance energy; all submodularity cases; coupling contraction of the explicit barycenter; full crossing and midpoint inequalities; inherited all-terminal hypergraph tests. | Coherence is for each fixed joint law. This is not a function on arbitrary tensors. |
| Sun scalar mask | Literal packet coefficients and the proposed common X-side scaling. | The correction is local. |
| Sun crossed maps | The unique negative-coefficient witness, all closed character triples, and the symbolic correction. | The complete corrected global map has not been verified. |
| Sun active correction cells | Five-product identity for arbitrary X-side operators; diagonal four-product refinement; full-image replacement lemma; both low-level budget comparisons. | The numerical contradiction requires the designated pair images to equal the printed family. Additional unprinted source-resolved components cannot be silently discarded. |
| Sun one-bit quotient | Fixed v1 Appendix A.6, equations (9.18)--(9.19), Section 3.2, all 64 source copies, independent Coppersmith--Winograd border-rank family, and the imported Landsberg--Michałek lower bound. | The literal $M_{64}$ quotient is contradicted; no conclusion against every possible exponent-two construction follows. |
| Sun phase and induction | Local phase obstruction; slice-commutativity argument; Walsh minors; first-jet identities; distinction from the residual-space requirement. | The actual fresh-coordinate residual and its preservation through unbounded induction remain unverified. |
| Overlapping units | Determinant-grid factorization, valuation limits, catalyst multiplicities, independent binary polynomial certificates, the sharp restricted source-overhead bound, and all three-party regroupings. | Finite and common-catalyst obstructions do not exclude unrestricted source-only subexponential overhead. |
| Full-tensor rigidity | Zero-distance teleportation, normalized quotient additivity, geodesic face normalization, edge uniqueness, and the genuine non-Hilbert quantum example. | The overlap of three rigid restrictions has not been proved to fix the full-unit charge. |
| Edge metric rigidity | Normalization of every triple through a unit wire; interval placement by CAT(0) uniqueness and an independent finite dyadic-CN proof; subset charges; threshold construction; the signed Gram formula. | The general CAT(0) counterexample is not a tensor price, and the boundary conclusion is not extended to interior wire triples. |
| Geodesic unit trade | Common-centroid kernel semicontinuity, preservation under the auxiliary map, the scalar target centroid, equal powers and common catalysts, and the conditional cancellation of neutral-wire prices. | Source-only overhead changes the square local maps to rectangular ones; no asymptotic obstruction or conversion is supplied. |
| Flattening tangents | The two explicit wire-transfer restrictions, uniform bounds for arbitrary spectral lifts, compactness on all finite tensors, additive and product identities, rank-preserving monotonicity, slice-cover bound, and exact value on matrix multiplication. | The required sign is unresolved; no differentiable lift or integration theorem is assumed. |
| Square-zero module obstruction | The complete leading-order cocycle calculation, partial-trace integrability, spectral-projector decomposition, faithful radical filtration, all-order shear induction, and normalization of the identity slice in a Laurent rank family. | The theorem requires $`n\ge2`$ and $`m\le n`$; it does not give a matrix multiplication lower bound or rule out larger or changed sources. |
| Tripod extension criterion | Necessity by arbitrary coefficient contraction at the new party; resource-cover preservation; saturation; compactness; the separate wire-only four-generator pinning argument. | The equivalent all-tensor and finite-cover conditions remain unproved for arbitrary realized wire triples. |
| Copied-factor counterexample | The normalized quantum point, invertible shear, disjoint blocks, exact original value three, and restricted value at least $`2^{5/3}`$. | It disproves the proposed copied-factor monotonicity, not every possible gluing argument. |
| Triangle subspace frame bound | The projector trace estimate, frame eigenvalue, commuting-projector specialization, and Laurent-limit estimate. | The least positive frame eigenvalue is not bounded uniformly for arbitrary maps. |
| Tetrahedral overhead | Exact overhead duality, submultiplicative limit, replacement of extra source powers by units, both bounds in terms of omega, and the finite determinant factorization. | Vanishing overhead remains exactly equivalent to the target; no conversion attaining zero is supplied. |
| Asymptotic uncrossing | The Latin block partition, all finite polynomial-map coefficients, degree bound, exact interpolation, catalyst reuse, and overhead estimate for every tensor power. | The source-only exponent is zero; the earlier one-fifth upper bound remains valid but nonsharp. Finite/common-unit impossibility is compatible with this result. |
| General free-set separation | Independent catalyst indices, the Fourier rank bound, both local sums of squares, the explicit priority constant, type superadditivity, intersecting-unit uncrossing, and full hypergraph untwisting. | All three workers and root reviewed the proof. No finite zero-overhead map, reverse weighted comparison, or exponent-two conclusion is asserted. |
| Unrestricted rank tests | All six retained-pair cases with arbitrary tensor multipliers, the Fourier specialization, exterior matching ranks, and the constant-overhead limitation. | Neither a family of rank tests nor an inequality between spectral minima classifies every spectral point. |
| Unit-star conversion | Centroid semicontinuity, the trace-form calculation for matrix multiplication, common-unit multiplicities, monomial box count, the smaller-product block construction, and the stronger retained-label lift via three face-unit distillations. | The unrestricted upper exponent one eighth does not remove the required error term from the signed inequality. |

The source-construction checkpoint adds the exact lower-ideal embedding
obstruction, the convolution cut and symmetrizer proofs, a trace-cubic
nonsmoothability certificate, a cubic smoothable enlargement, and the
Heisenberg chirp calculation. Root checked the written arguments and
both new exact scripts. The trace-cubic certificate and its Frobenius
reduction received separate mathematical and code review; the tensor-product
TNT lemma was independently derived and reviewed. The fixed-version
Jelisiejew theorem and the FJM PDF formulas were checked in primary sources.
The Sun base-map note records an unresolved composition; it does not certify
the claimed base or disprove its abstract rank bound.

The geodesic trade and its conditional cancellation criterion received
independent review from the spectral worker and root. The module obstruction
received independent file-level adversarial review from the spectral worker
and root. The first-order tangent reduction was
reviewed by the constructive worker and root. Its imported star-convexity
and asymptotic-subrank theorem numbers were checked in the cited primary
versions. These two arguments are symbolic written proofs; no additional
finite checker or Lean verification is claimed.

This checkpoint additionally reviews the weighted-support relaxation, the coefficient-independent Koszul pivot proof, the ordinary-block commutator, the weighted tetrahedral determinant, and the four-label resource certificate. The root reviewer checked the precise Landsberg--Michałek and Li statements in their primary sources. The weighted lower-bound proof was separately challenged by both other research workers. These reviews establish the stated finite obstructions and conditional criteria, not the exponent-two conclusion.

## Reproducible exact checks

Run from this directory:

```bash
python3 check_auxiliary_certificates.py
python3 check_sun_phase_and_mask.py
python3 check_sun_crossed_map.py
python3 check_sun_propagation_local.py
python3 check_unit_uncrossing.py
python3 check_tripod_countermodel.py
python3 check_sun_quotient_budget.py
python3 check_sun_dense_table.py
python3 check_sun_active_cell_compression.py
python3 check_four_party_constraints.py
python3 check_weighted_mm_koszul_pivots.py
python3 check_sun_ordinary_partial_block.py
python3 check_general_free_separator.py
python3 check_uncrossing_separator.py
python3 check_convolution_block_trade.py
python3 check_trace_cubic_nonsmoothable.py
```

The first six commands passed on the earlier assembled checkpoint. The next three passed on the source-certificate checkpoints. The four-party checker passed on the assembled full-tensor checkpoint; the earlier scripts were unchanged. The weighted-pivot and ordinary-partial-block checkers passed on the assembled files. The general-free and explicit-uncrossing checkers passed on the assembled files. The propagation-local, ordinary-partial-block, and general-free scripts use SymPy. The trace-cubic script uses NumPy integer arrays with explicit arithmetic bounds; the other scripts use Python's standard library. The computations use exact integers, rational arithmetic, and symbolic polynomials; they require no network access.

| Script | Checked content |
| --- | --- |
| `check_auxiliary_certificates.py` | Copied polynomial ranks, interpolation coefficients, sum-of-squares separator coefficients, copied matrix multiplication ranks, and a mixed-basis example. |
| `check_sun_phase_and_mask.py` | The scalar discrepancy and local correction, the one-bit phase obstruction, all one-bit Weyl products, and noncommuting normalized slices. |
| `check_sun_crossed_map.py` | Negative coefficients for the printed maps in 255 of 256 closed character triples; the corrected complete degree-zero tensor in all 256 triples. |
| `check_sun_propagation_local.py` | Walsh determinants, active addresses, local flattenings, the five-dimensional residual subspace, exact first-difference identities, the address leakage and Schur matrices, per-fresh-label ranks for an explicitly additional physical-cycle reconstruction, and the corrected source face actions. |
| `check_unit_uncrossing.py` | The binary invariant on all 65,536 support assignments per tensor, flattening ranks, all 14 nontrivial labeled flattening tests, the exact sign of the square-model deficit, and complete source-overhead restriction coefficients at $q=4,9,16$. |
| `check_tripod_countermodel.py` | All 128 subset charges of a seven-point tripod against independent exact quadratic face optimization; all 14,197 intersecting subset pairs; 1,395 subset bounds from 45 equal-weight joint laws and 2,511 from 81 unequal-weight joint laws; normalization and flattening examples. |
| `check_sun_quotient_budget.py` | Zero feature transport in all 64 outer copies and all eight allowed character triples; the exact reduced budget 8128; the detailed imported lower-bound substitution giving 8185. |
| `check_sun_active_cell_compression.py` | Exact five-product and diagonal four-product identities, both low-level source-budget comparisons, and all 216 binary two-by-two row-map triples. |
| `check_sun_dense_table.py` | All 4096 integer module/chart table entries and all 1024 normalized Walsh coefficients, reconstructed from the printed packet ledger. |
| `check_weighted_mm_koszul_pivots.py` | The bijective pivots, triangular support order, and exactly one lost pivot per block for sizes two through seven; the exact weighted lower bound 8129 at size64. No random-weight sampling is used. |
| `check_sun_ordinary_partial_block.py` | Symbolic inverses and the four nonzero commutator entries for all nonzero coefficients on the explicit 44-cycle diagnostic support. |
| `check_general_free_separator.py` | All local weight sums and surviving labels in 144 configurations with 175,974 support entries; exact Fourier identities in cyclotomic quotients for 19 moduli up to 22. |
| `check_uncrossing_separator.py` | Every coefficient of the finite polynomial map for sizes two through eight, plus exact seven-point interpolation at size two. |
| `check_convolution_block_trade.py` | All six source terms, the three target block labels, and equality of the local coordinate multisets in the balanced-trade obstruction. |
| `check_trace_cubic_nonsmoothable.py` | The rational quadratic apolar basis, all 666 pair products, rank486 modulo1009, the nine exact integral annihilators, and their independence. This is an essential computer-assisted proof certificate, not only a cross-check. |
| `check_four_party_constraints.py` | Seventeen exterior covariant ranks obtained by independent alternating projections and exact rational elimination, plus 56 ordinary cut ranks for uncrossing and tetrahedral tensors. |

The trace-cubic check supplies the finite rank certificate required by its computer-assisted nonsmoothability proof. The other checks corroborate finite statements in the written proofs. They do not execute a complete matrix multiplication algorithm, verify an unbounded induction, construct a normalized spectral point above perimeter two, or prove the desired universal perimeter upper bound.

## Repository checkpoints

Coordination and the adversarial-review request are in [issue #250](https://github.com/1337isnot1337/solved-conjectures/issues/250).

- [PR #258](https://github.com/1337isnot1337/solved-conjectures/pull/258) contains the normalized extension, spectral model, copied-input obstruction, separator, and initial scalar compatibility proofs. Its merge commit is `323c9598df45dfff1f6aa0e20f6be405bef543bf`.
- [PR #262](https://github.com/1337isnot1337/solved-conjectures/pull/262) contains the source audit, Sun checks, tree/cap results, overlapping-unit obstruction, and research-status record.
- [PR #269](https://github.com/1337isnot1337/solved-conjectures/pull/269) contains the literal quotient contradiction, exact active-cell compression, and dense scalar-table reconstruction. Its merge commit is `98cc1d899ca7cc27b3a6d6718eeffa2ba6257b56`; all nine changed files were compared with the merged Git blob hashes and match.
- [PR #271](https://github.com/1337isnot1337/solved-conjectures/pull/271) contains the full-tensor rigidity results, exact tetrahedral reformulation, constructive overhead upper bounds, and limitations of unrestricted rank tests. Its merge commit is `eb1a93cc686e855c5742dfbfa9639c5d9ec276b5`; all seven changed files match their reviewed local Git blob hashes.

- [PR #274](https://github.com/1337isnot1337/solved-conjectures/pull/274) contains the arbitrary-weight border obstruction, dense partial-support criterion, and four-party resource limitation. Its merge commit is `31aec761d16ebc0526e24bfd27431ae1c625fa68`; all eight changed files match the reviewed local Git blob hashes.

- [PR #279](https://github.com/1337isnot1337/solved-conjectures/pull/279) contains the general free-set separator and explicit zero-overhead asymptotic uncrossing. Its merge commit is `cba48e18689ba82822f34776f8c39739edad3c03`; all eleven changed files match the reviewed local Git blob hashes.

- [PR #284](https://github.com/1337isnot1337/solved-conjectures/pull/284) contains the normalized tripod criteria, interval boundary rigidity, copied-factor counterexample, frame bound, and stronger lift. Its merge commit is `54a36272109a3911c880ecb05ac7408550176bea`; all seven changed files match the reviewed artifacts.

- [PR #286](https://github.com/1337isnot1337/solved-conjectures/pull/286) contains the polynomial and convolution source obstructions, trace-cubic certificate, smoothable enlargement, Heisenberg target, and Sun base-map audit. Its merge commit is `ea3d0a535ebc4111f9a872284314a96eb9164281`; all ten changed files match the reviewed artifacts.

All files remain under `research/`. No root Results-table row, solved-conjecture directory, Lean theorem, or claimed kernel-verification status was added for this target. Repository-wide hosted checks are reported separately in the PR conversation; a successful existing Lean workflow does not formalize these new Markdown proofs.
