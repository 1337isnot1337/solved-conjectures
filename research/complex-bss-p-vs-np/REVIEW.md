# Review and verification scope

Status: research. The full statement `P_C != NP_C` has not been proved here.

## Continued research checkpoint

The next continuous-fiber checkpoint was reviewed separately. [SKEW_PRODUCT_REVIEW.md](SKEW_PRODUCT_REVIEW.md) checks the actual three-block verifier, finite-set translation soundness, exponential interpolation completeness, and the finite identity tests for restricted multiplicities. The integrator also checked the complete [polynomial-support proof](SKEW_POLYNOMIAL_SUPPORT_EXCLUSION.md), including its local witness count, common hitting-family parameter dimension, padding semantics, and charged exponentiation circuits. These are restrictions on the candidate; the candidate's polynomial certificate-size assertion is not proved.

The [moving-challenge review](MOVING_CHALLENGES_REVIEW.md) checks complete enumeration on the stated finite etale open and the failure at collisions or root escape. [GEOMETRIC_STRESS_TESTS.md](GEOMETRIC_STRESS_TESTS.md) records a second adversarial audit of the earlier analytic/component steps. The integrator read both arguments. The admissibility hypothesis is retained, and no arbitrary continuous universal block is discretized.

For [relative-invariant cancellation](RELATIVE_INVARIANT_CANCELLATION.md), the integrator checked Domokos--Feher--Rimanyi's published Remark 5.3(i), formula (6), and Theorem 5.4, including the identification of the two degree-six invariant formulas. An independent exact SymPy computation of all three-column minors, the quotient multiplication determinant, the canceled first coefficient, and the derivative `-64` passed. The arbitrary-jet extension is proved by the displayed local inverse and homogenized Taylor polynomial; those finite checks do not prove its general statement.

The [pole-cluster review](RECIPROCAL_POLE_CLUSTER_REVIEW.md) independently checks the short digit observable, irreducibility, finite-root derivatives, degree bounds, and escape bookkeeping. The integrator checked the complete written proof as well. The hard trace is attached to a selected analytic cluster; the full denominator is already short. This cannot be cited as a counterexample to full reduced-denominator extraction.

All these reviews are internal written reviews. No Lean proof, human refereeing, or novelty determination is claimed. Documentation and site checks are recorded at the publication milestone.

The following additions have complete written arguments, independent worker reviews, and integrator review. The reviews are internal mathematical reviews, not formal verification, human refereeing, or novelty assessments.

- [Directional cofactor roots](DIRECTIONAL_COFACTOR_LOG_JETS.md): the finite-branch jet dependency, logarithmic derivative identity, moving-center border limit, and tagged-triangle logarithm filter were checked. The full coefficient-space jet is taken before the grid specialization. The explicit short cofactor with many directional roots limits the conclusion. [Review](DIRECTIONAL_COFACTOR_REVIEW.md).
- [Squarefree extraneous cofactors](RADICAL_COFACTOR_JETS.md): approximate factor bounds apply only to the extraneous factors, finite logarithms remove their unrestricted multiplicities, and coefficientwise closure handles both limits. The cited Dutta--Saxena--Sinhababu Theorem 1 was checked against the author-hosted 2022 manuscript; its whole-radical bound does not solve the resultant case. [Review](RADICAL_COFACTOR_REVIEW.md).
- [Universal certificates](UNIVERSAL_CERTIFICATES.md): shared divided differences, exact gate counts, parameter-only denominator clearing, and projective-chart density were checked. Review prompted explicit division-free notation and the qualification that a generic certificate need not remain defined on a proposed specialization. The finite-part obstruction uses a short exact syzygy and the recorded base-expansion permanent coefficient. [Review](UNIVERSAL_CERTIFICATES_REVIEW.md).
- [Recursive finite prefixes](TREE_KKT_FINITE_PREFIX_EXTENSION.md): the tree induction preserves full ancestral covectors, not just the current node's coordinates. Explicit pruning gives the extra count R<=KA needed for the sparse derivative bound. [Review](RECURSIVE_AND_SAMPLING_REVIEW.md).
- [Restricted continuous sampling](CONTINUOUS_NONDENSE_FIBER_SAMPLING.md): all preceding parameters are included in the bad-sample dimension count; the projective encoding and fixed-depth scope were checked. The dense moving-hole graph and homogenization counterexample were checked exactly in the proof. [Review](RECURSIVE_AND_SAMPLING_REVIEW.md).

No numerical test or Lean build is offered as proof of these general statements. Documentation rendering, links, fences, whitespace, and site checks are recorded at publication. Arbitrary resultant cofactors and unrestricted continuous universal quantifiers remain unresolved.

## Written statements checked

The graph decision lower bound is the existing-theorem consequence coordinated in [issue #247](https://github.com/1337isnot1337/solved-conjectures/issues/247) and merged through [PR #249](https://github.com/1337isnot1337/solved-conjectures/pull/249). Its [canonical review](../bss-permanent-graph/REVIEW.md) records three internal adversarial reviews. This campaign gives a separate audit and uses that deduction, with credit to the imported Anthropic lower bound and Bürgisser's graph/factor transfer.

The present campaign used four workers: a model/source integrator, a graph/boundary reviewer, a weighted-protocol investigator, and an incidence/resultant investigator. These are internal model reviews, not independent human refereeing.

| Statement | Review performed | Scope |
| --- | --- | --- |
| Uniform model, quadratic encoding, theorem/conjecture direction | Integrator inspected the pinned primary sources and the encoding | Exact model and imported statements; no full separation |
| Ryser sum-check, soundness, two failed quantifier reorderings | Graph worker independently checked the weighted worker's proof; integrator checked formulas | All complex inputs, `2m` alternating blocks |
| Generic boundary extraction and growing-hierarchy cost | Integrator checked graph worker's proofs | Conditional use of a hypothetical HN decider |
| Generic transverse perturbation preserving a factor of every multiple | Graph worker and integrator checked incidence worker's proof | Requires an actual substitution with the stated initial factor |
| Matching incidence, multiplier masking, cylinder lemma | Graph worker and integrator checked incidence worker's arguments | Exact restrictions on the stated constructions |
| Single-triangle resultant and Newton-face obstruction | Weighted worker gave an independent quotient-norm derivation | Direct coordinate weighting before further affine cancellations |
| Six-resultant additive incidence criterion | Incidence worker and integrator checked factorization and generic-branch extraction | Historical conditional criterion; the later singular-witness theorem excludes the hypothesis under the imported lower bound |
| Regular implicit witnesses and convergent regular perturbations | Integrator checked Newton truncation and coefficient convergence | Restricted exact-circuit theorem; singular extension reviewed separately below |

The source audit distinguishes Bürgisser's June 2026 v1 from the October 2026 v2. The paper's proved implication goes from BSS separation to constant-free Valiant separation. The reverse implication using border hardness is Conjecture 1.1. The all-fields lower bound does not supply the contracting hypothesis needed for a particular protocol construction; the source's flat case must also be covered.

## Exact executable checks

Run:

```sh
python3 research/complex-bss-p-vs-np/verify_obstructions.py
```

The script requires SymPy. The checked environment used SymPy 1.14.0. It verifies:

- The polynomial Ryser identity for symbolic matrices of sizes 1, 2, and 3 by comparing the Boolean sum with an independent permutation expansion.
- Both cases of the interpolation identity that makes the challenges-first protocol unsound, and the two incompatible terminal values for the messages-first protocol at `X=I_2`.
- The single-triangle resultant norm by deriving the multiplication matrix in the quotient ring, then taking its determinant.
- Exact jet masking for selected degrees, the two-by-two term-norm coefficient, and cancellation/all-ones counterexamples.
- The hard residual in a true zero-sum strategy example for a symbolic two-by-two matrix.

These are exact symbolic identities, not floating-point experiments. The arbitrary-size conclusions are proved in the notes. The script does not prove those general conclusions, the imported lower bound, a hierarchy collapse, or any `P_C` versus `NP_C` separation.

## Repository checks for the integrated checkpoint

The exact integrated README passed `scripts/check_readme_verification.py` for all 68 existing result rows. The symbolic checker passed all five check groups, and `git diff --check` passed after removing two extra blank lines at EOF. Hosted README and Lean-source-selection checks passed; the Lean build was skipped because this checkpoint changes no Lean source.

The site build initially failed on base and PR heads because an unrelated existing proof had two reversed inline-math closing delimiters. The integration corrects only those delimiters in `results/steinke-zakynthinou-agnostic-vc/PROOF.md`. With that formatting correction, the local complete site build and its nine existing renderer tests passed. The complete site-content checker also passed, including internal links, anchors, source scopes, metadata, and MathML checks. No mathematical statement in that proof is changed.

## Geometric extension: review scope

The singular-witness proof was independently checked by the weighted-protocol and incidence-route workers and by the integrator. Reviews covered component selection after generic witness slicing, prime avoidance for square combinations, the finite holomorphic map, a fixed input polydisc avoiding the perturbed discriminant, locally uniform convergence, truncated Newton costs, inverse witnesses for divisions, and moving Taylor centers. The finite-branch variant was checked separately because the later arguments use algebraic rather than rational output branches.

The dense-boundary proof was independently checked by the graph-hardness and incidence-route workers and by the integrator. The review required simultaneous generic cuts of the full-base and omitted-boundary fibers. It also required a separate proof that a generic affine specialization remains an irreducible component of the original small equation system. Equations for a saturated projective closure are never charged as if they were available. The omitted-algebraic-branch and missing-side degeneration extensions passed the same reviews.

The hypersurface-degeneration argument was checked by the graph-hardness worker and the integrator. Its squarefree-part discriminant permits repeated original factors; a fixed Rouché root cluster supplies holomorphic sheets converging to the desired polynomial. The Taylor order is bounded by the output polynomial degree, not by the degree of the hypersurface. The explicit infinity examples were checked algebraically and are used only to disprove the stated homogenization and dense jet-length shortcuts.

These are internal model reviews of written mathematics, not independent human refereeing. No Lean formalization is claimed. The supporting analytic theorem is Riemenschneider's Chapter 6, Theorem 6.22 and Corollary 6.29; the exact source file and digest are recorded in SOURCES.json. Bürgisser arXiv:1812.06828v1, Theorem 2.4 supplies the equivalence between coefficientwise closure and border circuits over C.

## Boolean-potential checkpoint

The full [critical-incidence argument](CRITICAL_INCIDENCE_BARRIER.md) received independent written-file reviews from the graph-hardness and incidence-route workers and a line-by-line integrator review. [CRITICAL_REVIEW.md](CRITICAL_REVIEW.md) records the two worker reports. All reviewed the universal template, ambient derivative identity, selection over the component function field, rational multiplier lift, small derivative circuits, and dimension bound for every projected component. The argument uses the proved singular-witness lemma. It does not use a small Boolean hitting set, a small defining subsystem of the full Boolean equations, an efficient constructor of certificate constants, or a bounded parameter degree. No gap was found in that reviewed proof; no formal verification or human refereeing is claimed.

The bounded-rank construction, one-variable quotient recurrence, and false-input delta paths passed both sibling reviews. The canonical Cauchy-recovery argument, general constructor obstruction, linear and bounded-parameter template arguments, and trace representation lemmas were separately checked. The nonlinear root-line example is retained because it invalidates selecting a few original equations; the critical construction adds derivative equations and therefore avoids that invalid step. The first-derivative flow counterexample was independently recomputed by another worker and the integrator.

Additional executable checks, run from the repository root:

```sh
python3 research/complex-bss-p-vs-np/verify_boolean_potentials.py
python3 research/complex-bss-p-vs-np/verify_canonical_potentials.py
python3 research/complex-bss-p-vs-np/verify_gradient_flow.py
```

The Boolean script uses SymPy and passed eight exact complex rank-one/rank-two cases up to matrix size five, every Boolean evaluation for those cases, full flip averages at non-Boolean rational tuples, all delta-path tests through dimension six, and two quotient-product identities. The canonical script uses the standard library and passed all four gadget inputs and the Cauchy recovery formula on every formal basis vector through dimension eight. The gradient script uses the standard library, checks primality of 1000003, recomputes det(X)=-9352 and per(X)=53592404 by permutation sums, and obtains the nonzero augmented determinant 64147 modulo that prime. This certifies inconsistency over C of the stated 105-unknown ansatz.

Those finite computations verify the displayed identities and counterexample. They do not verify the general critical-incidence theorem, the analytic jet theorem, the imported border lower bound, or the desired complexity-class separation. The written proofs carry the general arguments. The sound batching lemma is proved for the ordinary sum-check protocol; a short-alternation protocol to which it could usefully be applied is still missing.

## Remaining obligations

No permanent-graph formula with a fixed or sufficiently small growing number of quantifier blocks has been constructed. The unconditional polynomial-size Boolean-potential hypothesis is now excluded by the critical-incidence argument. No implication from P_C=NP_C to such a size bound has been obtained either. No general method recovers the hard interior coefficient from a small arbitrary nonzero multiple of the resultant. The later geometric arguments exclude the positive existential six-resultant incidence and the stated initial graph-factor degeneration under the imported lower bound. They do not provide a replacement bridge.

The distinction between Bürgisser's proved Theorem 1.1 and his Conjecture 1.1 is unchanged. The conclusion remains research status: HN_C outside P_C has not been proved here.

No Lean file was changed. No local Lean build or kernel replay of these deductions was performed. Upstream statement inspection and source CI are distinct from a local rebuild. The solved-results table and its verification classifications are unchanged.


## Finite-residual critical points and restricted cofactor recovery

The full real critical-point argument, including its local-component and finite-Boolean-verifier extensions, was read by the integrator and independently audited by the weighted-protocol reviewer. The [detailed review](REAL_KKT_REVIEW.md) checks generic regular values for all finite active subsets, a fixed real input box, compactness of maximizing witnesses, the product of projected hypersurfaces, generic preservation of actual source components, and the existing complex root-cluster and Taylor-jet transfer. The real-coefficient target assumption is explicit. The proof does not add real-order operations to the complex verifier and does not replace a complex universal quantifier or a further complex existential block by a Boolean block.

The composition and few-parameter cofactor lemmas were read by the integrator and independently reviewed by the alternate-PH worker. Their [review](RESTRICTED_COFACTOR_REVIEW.md) records an actual failed step and its repair: a nonzero multiple can vanish on the chosen grid, so the general cofactor argument extracts its resultant jet in full coefficient space before affine specialization. The generic-center inverse proof, binomial Taylor coefficient count, polynomial-versus-rational cofactor distinction, and BCJS parameter relation were checked. These give restricted multiple lower bounds; they do not constrain the arbitrary cofactor exposed by a BSS branch.

No new numerical test is offered as verification of these analytic and algebraic arguments. The existing finite checkers retain their stated scope. No Lean source changed and no formal verification of these new deductions is claimed.

The [block proof](BLOCK_KKT_FINITE_EXISTENTIAL_EXTENSION.md) subsequently handles a local complex existential block after each finite Boolean challenge. The alternate-PH worker and integrator read the full argument; its [review](BLOCK_KKT_REVIEW.md) checks the product of separate balls, global independence of active gradients, the support bound within each block, rescaling all multipliers in a selected block together, and every-component projected dimension. The final incidence has polynomially many witnesses and equations even though the expanded existence argument has a potentially exponential witness array. The separate [all-multiple reviewer](REAL_KKT_INDEPENDENT_REVIEW.md) also audited the base real critical-point proof. The continuous-quantifier cutoff counterexample was checked directly by its two Boolean cases; it disproves only that cutoff-and-limit shortcut.

The [tagged-trace note](TAGGED_TRACE_OBSTRUCTION.md) was reviewed by the integrator and the alternate-PH worker; [review](TAGGED_TRACE_REVIEW.md). The proof checks generic-line irreducibility, the CRT idempotent selecting the resultant factor, the binary-digit recurrence on roots of unity, the O(m^2) observable circuit, and specialization of multiplication trace in a fixed free basis. The generic witnesses are taken over the algebraic closure of the coefficient field and residues only over roots of the squarefree multiple. It does not rule out a resultant-specific trace method.
