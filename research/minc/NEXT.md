# Current research state

Research checkpoint, 20 November 2026 (America/Chicago). Coordination: [issue #139](https://github.com/1337isnot1337/solved-conjectures/issues/139).

## Counting and evidence

The requested ten new full named resolutions have not been obtained. The campaign has **zero unqualified full numbered Minc-list resolutions**. The three complete proposed results below have different scopes and must retain those qualifications. Internal proof review and exact identity checks are not external confirmation of correctness or priority.

| Proposed result | Scope | Main file |
| --- | --- | --- |
| Perron root of permanental compounds | General FPRAS for the approximation formulation of P18, including exact zero detection; not exact polynomial-time computation | [Proof](../../results/perron-root-permanental-compounds/proof.md) |
| Pula–Song–Wanless conjecture | Full named subsidiary threshold; not the unrestricted P14/P15 characterizations | [Proof](../../results/pula-song-wanless/proof.md) |
| Malek's conjecture | Full all-degree negative-transform comparison, stated in the site's linked survey; the live C3 entry is already resolved and does not itself state the full all-degree target | [Proof](../../results/malek-subpermanent/proof.md) |

Each result directory contains its source audit, reviews and reproducible checks. Any newly found prior resolution or proof gap must be recorded before treating the proposed result as established.

## Current full targets and exact gaps

### Brualdi's cohesive family

For every global minimizer on the face of `C_n=J-I+E_nn`, the [structural reduction](combinatorial/brualdi_structure.md) proves that the free row and column are positive, the prescribed diagonal zeros have strict cofactor deficits, and any additional zeros form a directed acyclic graph. The [border and similarity reduction](sign-matrices/brualdi_similarity_reduction.md) adds the full border stationarity equations, a necessary matrix inequality from diagonal similarity, and `0<a_nn<1/2`.

The missing step is to prove that the extra-zero graph is empty. Equal maximal minors, strict Alexandrov–Fenchel, and the recorded scalar bound have not proved this. The inverse-sign and transpose-averaging shortcuts have explicit obstructions. A further restricted-order verification would not settle the target.

### Wang's sign-matrix problem

P7 asks which orders admit a sign matrix with equal absolute permanent and determinant. The full classification remains open. The [constant-recurrence obstruction](sign-matrices/cfinite_obstruction.md) proves that finitely many all-order families whose permanents and determinants satisfy fixed constant-coefficient recurrences cannot cover every sufficiently large non-Mersenne order. It uses the classical Mersenne-order obstruction and arbitrarily long runs of zeros.

This does not prove that every non-Mersenne order is admissible. A construction depending on binary digits, an unbounded state space, or infinitely many families is not excluded. The existing [construction audit](sign-matrices/sign_lift_audit.md) records other families that cannot supply the missing all-order theorem.

### Normalized minimum permanents and integrality

C6 and C24 remain open here. The [whole-matching replacement note](combinatorial/matching_replacement_research.md) gives exact uniform and weighted averages after removing one supported matching and adding another. The missing inequality must control the permanent and, for the stronger C24 strategy, repeated entries simultaneously. Binary-minimizer optimality has not supplied that inequality. Rewriting the same triple-minor average is not a new checkpoint.

### Marcus's block-permanent inequality

C9 remains open. The [Gaussian route audit](inequalities/marcus_gaussian_routes.md) rules out several stronger proposed comparisons. A negative test for an enlarged operator or arbitrary holomorphic function is not a counterexample unless it has the product structure required by the original conjecture. The complete block inequality is still the target.

### Hwang and Lih–Wang

The [radial convexity note](inequalities/hwang_radial_convexity.md) gives an exact moment criterion and a uniform-block padding transfer. Its limiting function is
`F_A(t)=exp(mt)(1-t)^(2m) R_A(t/(1-t)^2)`.
A doubly stochastic core with negative second derivative for `0<t<=1/2` would disprove Hwang by an all-order family. No such core is known here. Global Hessian positivity, ordinary real-rootedness of the permanent pencil, and nonnegative coefficients of the entire limiting series are false shortcuts.

The full C34 chord inequality is a separate weighted average of normalized subpermanent sums. The [source audit](sign-matrices/lihw_source_audit.md) explains why the known large cofactor-ratio examples and small-transform estimates do not settle it.

### Gyires's ratio inequality

The [occupation-law reformulation](sign-matrices/gyires_multinomial_reduction.md) is exact. The needed comparison between a central density and its norm is unproved. Boundary local minima exist and cannot simply be excluded. The [symmetrized-polynomial obstruction](inequalities/gyires_symmetrized_polynomial.md) blocks direct application of stability to the sum of row and column polynomials. It does **not** block deriving the weak inequality from a valid stronger stable-polynomial inequality applied to the two summands separately.

## Prior-art exclusions

- The [Kopotun quantitative convexity theorem](kopotun/) is an uncounted refinement: an accessible earlier scalar bound already implies eventual global convexity by polarization.
- The entire non-strict two-sparse Gyires class follows from a prior two-permutation result. The [review](sign-matrices/gyires_sparse_review.md) records the reduction.
- The stationary but non-barycentric cyclic-block family is classical Fischer–Hwang work, reconstructed in the [stationarity audit](combinatorial/barycentric_stationarity_audit.md).

The full historical record and further unresolved routes remain in [the research index](README.md). No Lean work is part of this campaign.
