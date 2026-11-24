# Review and verification scope

Research remains open. No full τ bound, BSS separation or Lean formalization is claimed.

## Mathematical review

Four parallel workers covered consecutive roots, arithmetic and prime selection, source/BSS transfer, and integration with alternative attacks. Each substantive argument was read by a worker other than its author. This is internal adversarial review, not external peer review.

The review checked the generalized Vandermonde sign argument at zero and positive evaluation points; the noncancellation in Cauchy–Binet; preservation of rank by the bitwise evaluation/coefficient basis change; denominator clearing in interpolation; first-nonzero-coefficient divisibility even when the cofactor vanishes at zero; and disjoint Hensel neighborhoods in the fixed-p-adic example.

For the classical BSS transfer, the review checked arbitrary fixed complex constants, finite algebraic extension coordinates, equality of all coordinates, nonzero generic divisors, shared numerator/denominator circuits, and integer specialization. The specialization need not be found uniformly: the lower-bound target minimizes over all circuits. After the generic vanishing polynomial has been constructed, the remaining coefficient denominators depend only on the transcendence parameters, so root identities survive specialization after clearing them.

Review corrections included the zero-root edge case in the factorial estimate, the direction of the sufficient prime-weight inequality, the restriction n >= 1 for the nested-log consecutive bound, and explicit padding for the BSS input-length convention.

The first-jet construction was separately reviewed: multiplying by an inverse of the derivative modulo the squarefree root polynomial gives identical nonzero derivatives at all prescribed roots. Neither that interpolation nor the off-root interpolation is claimed to have small circuit size.

## Exact checks

The local command `python3 research/shub-smale-tau/verify.py` passed with:

- 11,553 carry, signed digit-gate and consecutive-product checks;
- all 120 unordered nontrivial digit cuts for n = 2 through 7, plus all small minors in the stated sign check;
- off-root interpolation, common first jets and bounded-jet erasure on four distinct root sets;
- first-coefficient divisibility and prime-power collision identities on the specified empty, singleton and nontrivial root sets;
- the squarefree modular-average identity for the first one through five primes, with finite-field root counts checked independently;
- finite Hensel-lift counts and derivative valuations for the Koiran–Portier–Rojas family through n = 3 at p = 2, 3 and 5.

The unchanged root README also passed `python3 scripts/check_readme_verification.py` on the fetched snapshot: 68 result rows. No results-table entry was added. The unrelated full collection computations and Lean build were not rerun for these research notes.

The path-filtered `shub-smale-tau.yml` workflow runs the same finite verifier. Hosted status must be checked separately; a local pass is not reported as a hosted pass.

## Provenance

The BSS reduction is a reconstruction of Shub–Smale's supplied manuscript, not an original separation. The p-adic family is Example 1.16 of Koiran–Portier–Rojas, arXiv:1309.0486v1. The finite-palette combination uses that example and the elementary Chebyshev recurrence. The remaining algebraic obstructions and arithmetic estimates are presented as proved research lemmas without a novelty claim.

The pinned Anthropic statement and proof linkage were inspected. Its validity is the repository's standing premise; its Lean build was not replayed here. No missing implication has been replaced with an axiom or a computational screen.
