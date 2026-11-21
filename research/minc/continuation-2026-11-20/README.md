# Minc continuation, 20 November 2026

Coordination: [issue 139](https://github.com/1337isnot1337/solved-conjectures/issues/139#issuecomment-7056213903).

This continuation investigates full unresolved entries on [the live Minc list](https://yair-lavi.com/mincs-list/). It has obtained **zero new complete resolutions**. The requested total of ten has not been met. No Lean work is in scope.

## Work recorded here

| Target | Work | Status |
| --- | --- | --- |
| C5, Ryser's design conjecture | Exact multirow redistribution search using certified design thresholds | No counterexample; finite negative search is not a theorem |
| C9, Marcus's block-permanent inequality | Updated primary literature; two exact padding obstructions | Full inequality unresolved |
| C24, integrality of the minimum permanent | Checked the new entropy route against the integer-lattice requirement | The needed rounding inequality is unproved |
| C34, Lih-Wang inequality | Exact coefficient and curvature identities; exploratory searches | Full inequality unresolved |
| C30, Chollet's conjecture | Sphere-tilt proof for rank r and order n at least r squared; exact projection obstruction | Auxiliary theorem reviewed; reduction from arbitrary rank remains unproved |
| C36 and P7, sign-matrix problems | Classical modular rank obstruction; exact failures of one-row triangular and doubling constructions | Full conjectures unresolved; independently reviewed |
| P17, permanental-compound characteristic polynomial | Symmetric-power compression and collision-state resolvent route | No uniformly faster algorithm established |
| P2 and C42, permanent dominance | Complex affine-group counterexample diagnostics | No exact counterexample |
| P14/P15, Brualdi's prescribed-zero family | Strict-majority support at every minimizer; fully indecomposable mutual-positive support | All-order structural deduction reviewed; scaled permanent comparison remains unproved |

The [inequalities note](inequalities/c9_c34_checkpoint.md) and [regular-matrix note](regular/README.md) give exact statements, source links, calculations, and limitations. Their programs are discovery tools. Floating-point searches cannot establish the inequalities, and exact finite searches do not resolve the unrestricted conjectures.

The [sign-matrix checkpoint](sign/continuation_checkpoint.md) has an
[independent review](reviews/sign_checkpoint_review.md) and exact arithmetic
checks. The [permanental-compound review](reviews/permanental_compound_jacobi_review.md)
proves the complementary-minor identity for all spectra and explains why its
generic implementation does not meet the requested uniform speed improvement.

The [Brualdi support note](sign/brualdi_symmetric_support.md) and its
[independent review](reviews/brualdi_symmetric_support_review.md) establish a
feasibility step for geometric symmetrization, with an explicit remaining
capacity comparison. The [Chollet rank-bound note](inequalities/chollet_projection_checkpoint.md)
has a [complete argument and certificate review](reviews/chollet_rank_square_review.md).
Its exact rational intervals cover continuous spectral ranges and are extended
analytically to all larger orders and ranks. The rank restriction remains;
this is not a full resolution and is not counted toward ten.

The previous campaign's general P18 approximation theorem, Pula-Song-Wanless threshold, and Malek endpoint theorem retain the different scopes in [the existing continuation record](../NEXT.md). They are not new results of this continuation and are not counted here as three full numbered entries.

## Coordination boundaries

Before starting, the workers read the repository's previous reductions and fresh issue comments. Concurrent C6 coupling, C20 Poisson/stable-polynomial, C44 radial-asymptotic, and P1 spectral work is reserved elsewhere. This directory avoids overwriting those files. New claims require a complete argument, a fresh primary-source check, and an independent attempt to break the proof.

## Reproduction

The C5 code uses integer subset recurrences. Its inputs and selected logs are in `regular/`; the note specifies which row subsets were sampled. The C9/C34 code uses C++ permanent derivatives and Python optimization; compile and run commands are in the inequalities note. No negative result from a bounded search is treated as a proof of any original conjecture.
