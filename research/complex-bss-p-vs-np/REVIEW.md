# Review and verification scope

Status: research. The full statement `P_C != NP_C` has not been proved here.

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

## Remaining obligations

No permanent-graph formula with a fixed or sufficiently small growing number of quantifier blocks has been constructed. No general method recovers the hard interior coefficient from a small arbitrary nonzero multiple of the resultant. The later geometric arguments exclude the positive existential six-resultant incidence and the stated initial graph-factor degeneration under the imported lower bound. They do not provide a replacement bridge.

The distinction between Bürgisser's proved Theorem 1.1 and his Conjecture 1.1 is unchanged. The conclusion remains research status: HN_C outside P_C has not been proved here.

No Lean file was changed. No local Lean build or kernel replay of these deductions was performed. Upstream statement inspection and source CI are distinct from a local rebuild. The solved-results table and its verification classifications are unchanged.
