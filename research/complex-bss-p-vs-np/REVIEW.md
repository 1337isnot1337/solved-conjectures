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
| Six-resultant additive incidence criterion | Incidence worker and integrator checked factorization and generic-branch extraction | Conditional criterion; the witness equations are missing |
| Regular implicit witnesses and convergent regular perturbations | Integrator checked Newton truncation and coefficient convergence | Exactly the hypotheses in Propositions 1 and 2; no general singular theorem used |

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

## Remaining obligations

No permanent-graph formula with a fixed or sub-log-log number of quantifier blocks has been constructed. No additive resultant-value incidence or multiplier-preserving permanent-graph degeneration has been constructed. No general method recovers the hard interior coefficient from a small arbitrary multiple. The singular implicit-witness extension is being investigated separately and is not an input to this checkpoint.

No Lean file was changed. No local Lean build or kernel replay of these deductions was performed. Upstream statement inspection and source CI are distinct from a local rebuild. The solved-results table and its verification classifications are unchanged.
