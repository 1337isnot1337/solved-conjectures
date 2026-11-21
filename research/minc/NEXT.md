# Current research state

Research checkpoint, 20 November 2026 (America/Chicago). Coordination: [issue #139](https://github.com/1337isnot1337/solved-conjectures/issues/139).

## Counting and evidence

The requested ten new full named resolutions have not been obtained. The campaign has **zero unqualified full numbered Minc-list resolutions**. The three complete proposed results below have different scopes and must retain those qualifications. Internal proof review and exact identity checks are not external confirmation of correctness or priority.

| Proposed result | Scope | Main file |
| --- | --- | --- |
| Perron root of permanental compounds | General FPRAS for the approximation formulation of P18, including exact zero detection; not exact polynomial-time computation | [Proof](../../results/perron-root-permanental-compounds/proof.md) |
| Pula–Song–Wanless conjecture | Full named subsidiary threshold; not the unrestricted P14/P15 characterizations | [Proof](../../results/pula-song-wanless/proof.md) |
| Malek's conjecture | Full all-degree negative-transform comparison, stated in the site's linked survey; the live C3 entry is already resolved and does not itself state the full all-degree target | [Proof](../../results/malek-subpermanent/proof.md) |

Each result directory contains its source audit, reviews and reproducible checks. The [Malek follow-up](../../results/malek-subpermanent/priority-audit-addendum.md) now includes the full 1996 Kopotun paper and two citation-index checks; it finds no prior full negative endpoint but does not remove the inaccessible 1989 original-source qualification. Any newly found prior resolution or proof gap must be recorded before treating the proposed result as established.

The [P18 follow-up](../../results/perron-root-permanental-compounds/priority-audit-addendum.md) credits earlier semigroup spectral-concavity methods and records the restricted scope of quantum trace algorithms. The [PSW follow-up](../../results/pula-song-wanless/priority-audit-addendum.md) checks alternate boundary-face notation and later citations. Neither changes the qualified count or removes the stated access limits.

## Current full targets and exact gaps

### Maximum permanent on a unitary orbit

The [fourth-order near-scalar note](combinatorial/unitary_orbit_quartic_germ.md) proves an exact all-order local expansion for spectra \(1+\varepsilon x\), \(\sum_i x_i=0\): the second and third coefficients are \(\sum x_i^2/2\) and \(\sum x_i^3/3\), while the fourth coefficient is a maximum over zero-diagonal conjugates \(H\) of \(\sum_{|S|=4}\mathrm{per}H[S,S]+\sum_i((H^2)_{ii}-\sum x_j^2/n)^2\). It proves that every maximizing matrix has diagonal \(1+O(\varepsilon^2)\), even though the global constant-diagonal conjecture is false. The orbit maximum is also logarithmically Schur-convex in the positive spectrum. A complete proof and exact rational coefficient checks are saved; no independent review or novelty certificate exists. **P1 is not resolved.** The exact next step is to evaluate the zero-diagonal quartic functional structurally and extend beyond near-scalar spectra, not to repackage existing Gröbner elimination or the earlier exceptional-spectrum solution.

### Ryser's design conjecture

The [source audit](combinatorial/ryser_source_audit.md) confirms the existential statement: some symmetric design must minimize the permanent when such a design exists; it does not require every design to minimize. The [codegree and loop note](combinatorial/ryser_cycle_reduction.md) proves the exact four-cycle excess and the compensating six-cycle identity. Generalized loops can have negative weight. No comparison of the full signed expansion is proved, and no switch sweep or added order is being counted.


### Brualdi's cohesive family

For every global minimizer on the face of `C_n=J-I+E_nn`, the [structural reduction](combinatorial/brualdi_structure.md) proves that the free row and column are positive, the prescribed diagonal zeros have strict cofactor deficits, and any additional zeros form a directed acyclic graph. The [border and similarity reduction](sign-matrices/brualdi_similarity_reduction.md) adds the full border stationarity equations, a necessary matrix inequality from diagonal similarity, and `0<a_nn<1/2`.

The missing step is to prove that the extra-zero graph is empty. Equal maximal minors, strict Alexandrov–Fenchel, and the recorded scalar bound have not proved this. The inverse-sign and transpose-averaging shortcuts have explicit obstructions. A further restricted-order verification would not settle the target.

The [face entropy reformulation](combinatorial/face_entropy_reformulation.md) supplies an exact alternative objective with the same minimizers on every Birkhoff face. Its natural tangent direction vanishes at a hypothetical boundary minimizer, so it does not remove the extra-zero graph. The independent review checks boundary supports and coincident optimizer sets. No concavity or global-convergence theorem is asserted.

### Zero-diagonal minimum

The [radial asymptotic note](inequalities/c44_radial_asymptotic_gap.md) proves `Psi(X_0+D)-Psi(X_0)>=||D||_F^2/2` for the determinant model, within its finite domain. The [independent review](inequalities/c44_radial_gap_review.md) checks the stronger singular-value Jensen bound. This is not a permanent inequality. Two exact feasible families inside the reported Frobenius confinement scale violate, respectively, McCullagh's bounded-moment assumption and Li's small absolute line-norm assumption. A uniform lower bound on the remainder difference proportional to `-||D||_F^2`, with sufficient constants and all required orders covered, remains missing. Separate asymptotic value errors do not give that estimate. Full permanent Hessian positivity and quasiconvexity remain excluded methods.

### Wang's Hadamard problem

The [characteristic-three checkpoint](sign-matrices/wang_hadamard_characteristic_three.md) and its [independent review](sign-matrices/wang_f3_review.md) verify nonvanishing for Hadamard orders congruent to one modulo three. This is treated as a deduction from classical machinery, with explicit evidence for an existing squared-permanent corollary, and is not counted. Orders congruent to two modulo three have permanent zero modulo three; orders divisible by three have singular reduction. Neither case is settled over the integers. The arbitrary-order two-adic cancellation needed for Wanless's proposed valuation remains missing. Do not restart a class-only or finite-order extension as a claimed resolution.

### Wang's sign-matrix problem

P7 asks which orders admit a sign matrix with equal absolute permanent and determinant. The full classification remains open. The [polynomial-recurrence obstruction](sign-matrices/p_recursive_obstruction.md) proves that finitely many all-order families whose permanents and determinants are P-recursive cannot cover every sufficiently large non-Mersenne order. It uses the classical Mersenne-order obstruction and arbitrarily long runs of zeros. The same note proves that finitely many families with P-recursive permanent sequences cannot attain Kräuter's proposed minimum in every sufficiently large order; its uniform recurrence is independent of the piecewise exponential scale.

This does not prove that every non-Mersenne order is admissible. A construction depending on binary digits, an unbounded state space, or infinitely many families is not excluded. Neither Wang's classification nor Kräuter's full attainment conjecture is resolved. The [paired-row formulas](sign-matrices/paired_row_lift.md) give exact binary-size determinant and coefficient reductions, but no parameter class with the required coefficient invariant. Their canonical choice has zero permanent in even order. The existing [construction audit](sign-matrices/sign_lift_audit.md) records other families that cannot supply the missing all-order theorem.

The [paired-core divisibility theorem](sign-matrices/c36_paired_row_divisibility.md), with [independent review](sign-matrices/c36_border_review.md), excludes every uniformly bounded-width border of duplicate-row cores as an all-order C36 construction. Arbitrary border signs cannot remove the inherited power-of-two divisor. An unrestricted attaining core with permanent `p` would admit an attaining next-order border outside Mersenne transitions if some sign vectors satisfy `u^T C(B)v in {−3p,−p,p,3p}`. The required discrepancy bound `min |u^T C(B)v|<=3p` is unproved. Do not infer it from the cofactor gcd or row expansions.

### Normalized minimum permanents and integrality

C6 and C24 remain open here. The [whole-matching replacement note](combinatorial/matching_replacement_research.md) gives exact uniform and weighted averages after removing one supported matching and adding another. The missing inequality must control the permanent and, for the stronger C24 strategy, repeated entries simultaneously. Binary-minimizer optimality has not supplied that inequality. Rewriting the same triple-minor average is not a new checkpoint.

The [current C24 source and transformation audit](combinatorial/minc_integrality_audit.md) proves that a minimum integer regular matrix has connected support for `k>=2`, and gives weighted four-switch necessary conditions with [independent review](combinatorial/minc_integrality_review.md). These conditions do not eliminate repeated entries. The exact binary minimum on `k=n−1` is the derangement number, so an integer family below it would refute C24, but fixed-defect asymptotics already exclude bounded perturbations and no growing-defect counterexample has been obtained.

### Marcus's block-permanent inequality

C9 remains open. The [Gaussian route audit](inequalities/marcus_gaussian_routes.md) rules out several stronger proposed comparisons. A negative test for an enlarged operator or arbitrary holomorphic function is not a counterexample unless it has the product structure required by the original conjecture. The [Pate correction](inequalities/pate_packet_correction.md) establishes the Gaussian replacement endpoint derivative, all two-part Chollet occupation bounds, and the standard-representation quadratic-dominance case from the earlier indicator theorem. It does not control the interior replacement derivative or all occupations. The [many-copy lift audit](inequalities/pate_partition_lift_obstruction.md) shows why the direct complement-factor removal and a nonlinear repair fail; an all-singleton repair would already imply Chollet. The complete block inequality is still the target.

### Hwang and Lih–Wang

The [radial convexity note](inequalities/hwang_radial_convexity.md) gives an exact moment criterion and a uniform-block padding transfer. Its limiting function is
`F_A(t)=exp(mt)(1-t)^(2m) R_A(t/(1-t)^2)`.
The [matching-limit theorem](inequalities/hwang_matching_monotonicity.md) now proves strict positivity of the first derivative for every core on `0<t<=1/2`, and half-interval monotonicity of the finite padding family for all sufficiently large tails. Curvature remains unresolved. A core with negative second derivative would disprove Hwang by an all-order family; none is known here. The exact remaining formula is `(log F)''(1/2)=36 Var(K)-4m-4(m-EK)` at matching activity `z=2`; the stronger proposed variance comparison `Var(K)>=m/6` is unproved and must not be used as an input. Global Hessian positivity, ordinary real-rootedness of the permanent pencil, and nonnegative coefficients of the entire limiting series are false shortcuts.

The [substochastic-core extension](inequalities/hwang_substochastic_padding.md) supplies a wider exact transfer: every nonnegative core with row and column sums at most one has a doubly stochastic completion whose normalized permanent path converges in `C²([0,1/2])` to the displayed weighted matching sum. Twelve exact finite counting checks pass. The all-core monotonicity theorem uses double stochasticity and does not automatically extend to this larger class. No core with negative curvature has been obtained.

The full C34 chord inequality is a separate weighted average of normalized subpermanent sums. The recent entropy averaging theorem and endpoint-permanent condition have been audited; neither supplies the missing universal chord comparison. The [source audit](sign-matrices/lihw_source_audit.md) explains why the known large cofactor-ratio examples and small-transform estimates do not settle it.

### Gyires's ratio inequality

The [occupation-law reformulation](sign-matrices/gyires_multinomial_reduction.md) is exact. The needed comparison between a central density and its norm is unproved. Boundary local minima exist and cannot simply be excluded. The [symmetrized-polynomial obstruction](inequalities/gyires_symmetrized_polynomial.md) blocks direct application of stability to the sum of row and column polynomials. It does **not** block deriving the weak inequality from a valid stronger stable-polynomial inequality applied to the two summands separately.

The [exact completion transfer](inequalities/gyires_substochastic_transfer.md) and [independent review](inequalities/gyires_transfer_review.md) give a new sufficient route to a full counterexample: find a doubly substochastic core with `4F(B)^2<F(BB^T)+F(B^TB)+2F(B²)`. The completion product is exact, with a rank-one correction tending to zero, and the normalized permanent limit is uniform at saturated margins. A failure of only one self-Gram factor does not settle the four-term conjecture. For symmetric cores the criterion is `F(B)^2<F(B²)`; the symmetric dilation yields the product criterion `F(B)^4<F(BB^T)F(B^TB)`. No negative core is known. The additive inequality `per(AA^T)<=2perA-d_n` is false and must not be used. Proving the limiting inequality for all cores would still leave the finite-order constant gap.

The [Poisson composition identity](inequalities/gyires_poisson_gram_equivalence.md) and [independent review](inequalities/gyires_poisson_review.md) prove `F(BC)=<f_B,f_(C^T)>` and `F(BB^T)=||f_B||_2^2`. Thus the all-core product inequality is equivalent to `||f_B||_2<=f_B(1)`. The latter remains unproved. The separate balanced-stable Fischer-norm route needs `c^2>=d_n||p||_F^2`, equivalently `||p-p_0||_F^2<=2 delta+delta^2/d_n` for `delta=c-d_n` and `p_0=(sum x_i/n)^n`. The [source audit in issue 139](https://github.com/1337isnot1337/solved-conjectures/issues/139#issuecomment-7056209664) records why the available capacity pairing lower bounds, pointwise productization and qualitative uniqueness do not establish this upper norm bound. No new norm inequality was proved.

## Prior-art exclusions

- The [Kopotun quantitative convexity theorem](kopotun/) is an uncounted refinement: an accessible earlier scalar bound already implies eventual global convexity by polarization.
- The entire non-strict two-sparse Gyires class follows from a prior two-permutation result. The [review](sign-matrices/gyires_sparse_review.md) records the reduction.
- The stationary but non-barycentric cyclic-block family is classical Fischer–Hwang work, reconstructed in the [stationarity audit](combinatorial/barycentric_stationarity_audit.md).

The full historical record and further unresolved routes remain in [the research index](README.md). No Lean work is part of this campaign.
