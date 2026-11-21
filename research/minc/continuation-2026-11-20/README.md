# Minc continuation, 20 November 2026

Coordination: [issue 139](https://github.com/1337isnot1337/solved-conjectures/issues/139#issuecomment-7056213903).

This continuation investigates full unresolved entries on [the live Minc list](https://yair-lavi.com/mincs-list/). It has obtained **zero new complete resolutions**. The requested total of ten has not been met. No Lean work is in scope.

## Work recorded here

| Target | Work | Status |
| --- | --- | --- |
| C5, Ryser's design conjecture | Exact multirow redistribution search using certified design thresholds | No counterexample; finite negative search is not a theorem |
| C9, Marcus's block-permanent inequality | Updated primary literature; two exact padding obstructions | Full inequality unresolved |
| C24, integrality of the minimum permanent | Entropy audit and an infinite-family obstruction to uniform complement averaging | Global-minimizer replacement inequality remains unproved |
| C34, Lih-Wang inequality | Pointwise coefficient proposal rejected; exact full rook transfer for Jerrum graphs and weighted extensions | Aggregate inequality unresolved |
| C30, Chollet's conjecture | Independent sphere-tilt proof; later audit attributes the entire large-rank range to prior bounds | Full conjecture unresolved; possible residual is a finite rank/order region |
| C36 and P7, sign-matrix problems | Modular obstruction, block-expansion identities, and a finiteness theorem for fixed-skeleton one-vertex stretching | Full conjectures unresolved; independently reviewed |
| P17, permanental-compound characteristic polynomial | Symmetric-power compression and collision-state resolvent route | No uniformly faster algorithm established |
| P2 and C42, permanent dominance | Exact subgroup projections, marker obstruction, and all-vector extension certificates for two known cores | No counterexample to the original conjecture |
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
analytically to all larger orders and ranks. A later
[priority audit](reviews/chollet_rank_priority_audit.md) shows that published
Yuan--Parrilo and sphere bounds already imply every case with rank at least
18 in this region, as well as all sufficiently large orders at each smaller
rank. Only finitely many rank/order pairs with ranks 5 through 17 remain
outside the conservative prior criteria; no novelty is certified for them.
The large-rank exponential estimate is weaker than the prior consequence.
This is not a full resolution and is not counted toward ten.

The [further review](reviews/continuation_obstructions_review.md) covers the
[failed Lih--Wang coefficient bound](regular/lihw_coefficient_obstruction.md),
the [integer complement-average obstruction](regular/integer_complement_average_obstruction.md),
the [exact failure of geometric descent below the derangement value](sign/brualdi_low_permanent_scaling_obstruction.md),
and the [Chollet variational identities](inequalities/chollet_laplacian_checkpoint.md).
Each note states the hypothesis it rejects or the exact unproved condition
that remains. None is a counterexample to the original named conjecture.

The [Jerrum transfer note](regular/jerrum_lihw_transfer.md) gives every rook
coefficient and the exact Lih--Wang chord gap for the full weighted family.
The [sign-skeleton note](sign/p7_skeleton_lifts.md) proves the general block
identities and shows that a fixed skeleton stretched at one vertex can
satisfy the required permanent-determinant equality in only finitely many
orders. It has an [independent review](reviews/block_skeleton_review.md).
The [root review](reviews/transfer_checkpoint_review.md) checks both sets of
deductions and records successful independent exact evaluations. Neither
route supplies a full named-conjecture resolution.

The [permanent-dominance transfer note](inequalities/permanental_dominance_transfer_checkpoint.md)
retains the subgroup dimension factors that prevent a direct use of known
permanent-on-top counterexamples. Its all-order appended-vector identity
gives twelve exact positive forms, excluding every vector extension of two
fixed cores through six exceptional subgroup characters. The
[independent review](reviews/subgroup_transfer_review.md) uses a different
group construction and direct polynomial evaluations; the
[root review](reviews/subgroup_transfer_root_review.md) checks the general
normalizations and marker argument. New Gram configurations remain to be
investigated.

The [Segre alignment note](inequalities/segre_alignment_checkpoint.md) proves
an exact trace bound for order-six matrices of rank at most two and excludes
all six exceptional-subgroup sign projections in that class. Its
[two](reviews/segre_bound_review.md)
[independent reviews](reviews/segre_cubic_global_review.md) reconstruct the
coordinates and moment inequalities separately. This rank/order restriction
is explicitly not a counted solution. The
[Gaussian rank-lifting lemma](inequalities/isotypic_rank_lifting.md) extends
the alignment comparison within one Fourier block to every rank, but does
not extend its mixed comparison with the permanent. The
[POT-valid ancillary-block lemma](inequalities/pot_valid_ancilla_obstruction.md)
proves an all-order obstruction to orthogonal padding under its stated
hypothesis. Neither lemma closes permanent dominance.

The [positive-border construction](sign/bordered_partition_lifts.md) derives
the complete triangular replacement-column recurrence. The
[induction-gap addendum](sign/triangular_recurrence_invariant_gap.md) gives
an exact failure of the specified one-step triangular append at an admissible
transition, together with the
general two-step formula. Its [independent review](reviews/triangular_recurrence_review.md)
also records the full two-step replacement hierarchy. An invariant forcing
future sign choices remains missing. The
[target audit](sign/remaining_target_audit.md) checks the remaining scopes of
Problems 8, 11, 12 and 13. The
[root review](reviews/subgroup_triangular_root_review.md) records the exact
checks, primary sources, and limits of this checkpoint. Full resolutions
from this continuation remain zero.

The [mixed-block projection audit](inequalities/mixed_block_projection_obstruction.md)
uses Sra's published normalized Schur-function theorem to determine the
optimal relative multipliers for invariant positive rank reductions. Haar
projections attain the optimum; random spectra, scales, and positive mixtures
cannot remove the loss. The [correction audit](reviews/mixed_block_correction_obstruction.md)
retains the diagonal-product term exactly and supplies formal Fourier data
satisfying every listed averaged bound while violating the desired dominance
comparison. Those data are explicitly not a Gram-matrix counterexample.
The obstruction applies to the stated inequalities and methods only.

The [fixed-reset note](sign/triangular_fixed_reset_obstruction.md) and its
[independent review](reviews/triangular_fixed_reset_review.md) prove that
every fixed seed and direction can attain Wang's equality only finitely
often under one specified repeated two-row reset. An exact differential
conjugacy gives factorial growth of the permanent against geometric growth
of the determinant. Adaptive directions and other constructions remain
outside this exclusion. These all-order method obstructions do not resolve
the original named conjectures.

The previous campaign's general P18 approximation theorem, Pula-Song-Wanless threshold, and Malek endpoint theorem retain the different scopes in [the existing continuation record](../NEXT.md). They are not new results of this continuation and are not counted here as three full numbered entries.

## Coordination boundaries

Before starting, the workers read the repository's previous reductions and fresh issue comments. Concurrent C6 coupling, C20 Poisson/stable-polynomial, C44 radial-asymptotic, and P1 spectral work is reserved elsewhere. This directory avoids overwriting those files. New claims require a complete argument, a fresh primary-source check, and an independent attempt to break the proof.

## Reproduction

The C5 code uses integer subset recurrences. Its inputs and selected logs are in `regular/`; the note specifies which row subsets were sampled. The C9/C34 code uses C++ permanent derivatives and Python optimization; compile and run commands are in the inequalities note. No negative result from a bounded search is treated as a proof of any original conjecture.
