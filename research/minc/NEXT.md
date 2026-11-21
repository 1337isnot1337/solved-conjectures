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

The [fourth-order near-scalar theorem](combinatorial/unitary_orbit_quartic_germ.md) is an exact all-order expansion for spectra $`1+\varepsilon x`$, $`\sum x_i=0`$:

```math
M_n(1+\varepsilon x)=1+\tfrac12s_2\varepsilon^2+\tfrac13s_3\varepsilon^3+\Gamma_n(x)\varepsilon^4+o(\varepsilon^4).
```

The coefficient simplifies to the zero-diagonal Hermitian orbit optimization

```math
\Gamma_n(x)=\tfrac14s_4+(\tfrac18-\tfrac1n)s_2^2+\max_{H\sim\mathrm{diag}(x),\,\mathrm{diag}H=0}\sum_{i\lt j}|h_{ij}|^4.
```

Equivalently, it is $`3s_4/4+(1/8-1/n)s_2^2`$ minus a nonnegative deficit consisting of adjacent-edge products and half of the squared off-diagonal entries of $`H^2`$. The upper envelope is attained **if and only if** the multiset $`x`$ is sign-symmetric; otherwise the deficit is positive. When $`s_2>0`$, the gap is at least $`s_3^2/(2s_2)`$. Every maximizing matrix has diagonal $`1+O(\varepsilon^2)`$; the orbit maximum is also multiplicatively Schur-monotone for strictly positive spectra. Exact coefficient, quartic, deficit, and equality checks pass. The [asymptotic review](combinatorial/unitary_orbit_quartic_asymptotic_review.md) and [algebra review](combinatorial/unitary_orbit_quartic_review.md) now check the theorem independently. The example value `98/3` has been corrected to a path coefficient; it is not the optimized coefficient for that spectrum, which is at least `128/3`. The [targeted priority audit](combinatorial/unitary_orbit_quartic_priority_addendum.md) credits the classical principal coefficients, cycle bookkeeping and elementary deficit inequality. No earlier full optimized quartic statement was found, but original-paper access limits remain; priority is provisional. None of this evaluates the maximum for an arbitrary spectrum; **P1 remains unsolved**. The next mathematical target is the constrained nonnegative deficit minimum or equivalent off-diagonal fourth-power maximum, including the connected-support stationarity condition (21), not more low-order checks or generic elimination.

The [quantitative spectral-defect continuation](combinatorial/unitary_orbit_spectral_deficit.md) now proves two all-order lower bounds on the quartic deficit: one from every odd spectral moment, and one from the fourth power of the Euclidean distance to sign-symmetric spectra via greedy matching and Hoffman--Wielandt. This supplies a positive explicit certificate even when the prior cubic moment vanishes (exact example: spectrum \((-10,-4,-2,7,9)\)). An [exact checker](combinatorial/verify_unitary_orbit_spectral_deficit.py) passes 125 rational symmetric-matrix probes, with no independent review yet. Neither bound evaluates the minimum nor the nonlocal P1 maximum; it is uncounted. The next step remains solving the exact constrained deficit minimization and the unrestricted spectrum problem.

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

The [complement-average checkpoint](combinatorial/c6_complement_average_checkpoint.md), with [independent review](combinatorial/c6_complement_average_review.md), proves that the normalized uniform complement-matching average has positive initial derivative on arbitrarily large connected binary `k`-regular matrices for every fixed `k>=3`. It uses Jerrum's published chains and an explicit three-switch lower bound on dense-complement edge marginals. This blocks a universal continuous-monotonicity proof, not the endpoint inequality and not a comparison restricted to global minimizers. The exact endpoint average remains the required statement; a single large cofactor does not establish its failure. Wanless's pointwise counterexample is prior work.

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


## Further continuation, 20 November 2026

The [continuation index](continuation-2026-11-20/README.md) records the next
four-worker investigation. It has **zero new complete resolutions**; no
restricted-rank theorem, construction obstruction, or finite probe is
counted toward the requested ten.

- [Chollet rank-square theorem](continuation-2026-11-20/inequalities/chollet_projection_checkpoint.md):
  an independently reviewed sphere-tilt proof covers rank r at least five
  and n at least r squared. A [later priority audit](continuation-2026-11-20/reviews/chollet_rank_priority_audit.md)
  attributes the entire range r at least 18, and all sufficiently large n
  at smaller ranks, to prior Yuan--Parrilo and sphere bounds. Only a finite
  rank/order region remains outside its conservative criteria, with no
  priority certified. The unrestricted rank-reduction bridge is missing.
  [Variational identities](continuation-2026-11-20/inequalities/chollet_laplacian_checkpoint.md)
  do not establish that bridge.
- [Brualdi support theorem](continuation-2026-11-20/sign/brualdi_symmetric_support.md):
  every minimizing row and column has strict-majority support, and the
  mutual-positive support is fully indecomposable. This enables symmetric
  scaling but does not bound its permanent. An
  [exact low-permanent example](continuation-2026-11-20/sign/brualdi_low_permanent_scaling_obstruction.md)
  shows why the derangement threshold alone cannot supply that bound.
- [C24 averaging obstruction](continuation-2026-11-20/regular/integer_complement_average_obstruction.md):
  uniform complement replacement fails on an infinite integer-regular
  family. A useful individual replacement or a minimizer-specific theorem
  is still possible.
- [Lih--Wang coefficient obstruction](continuation-2026-11-20/regular/lihw_coefficient_obstruction.md)
  rejects a pointwise proxy using published Jerrum graphs. The
  [full rook transfer](continuation-2026-11-20/regular/jerrum_lihw_transfer.md)
  evaluates the actual aggregate gap, including weighted flat completions;
  no uniformly positive gap or full-family sign theorem was found.
- [Wang sign-skeleton identities](continuation-2026-11-20/sign/p7_skeleton_lifts.md)
  give exact determinant and permanent formulas and prove that fixed
  one-vertex stretching produces only finitely many equality solutions.
  Simultaneous growth and changing skeletons remain outside this obstruction.
- The [P17 review](continuation-2026-11-20/reviews/permanental_compound_jacobi_review.md)
  supplies an all-spectrum complementary-minor identity but rejects its
  generic cost as a uniform speed improvement.

Proofs, primary-source links, independent reviews, and exact checkers are
linked from the continuation index. Issue 139 records assignments and
commit checkpoints. The separate C6, C20, C44, and P1 workers' files were
preserved.

## 20 November 2026: subgroup and triangular checkpoint

The continuation's [reviewed subgroup/triangular bundle](continuation-2026-11-20/reviews/subgroup_triangular_root_review.md)
is complete. It proves a Segre-coordinate and moment bound excluding the
exceptional-subgroup sign route for order-six rank-two matrices. A classical
Gaussian content-product identity lifts the single-block comparison to all
ranks, but not the comparison with the permanent. A separate positive-definite
function argument excludes counterexample creation by POT-valid orthogonal
ancillary blocks. These are auxiliary statements, not full C42/P2 resolutions.

The triangular P7 recurrence now has an exact unextendable order-nine seed
at the admissible transition to order ten, a general two-step formula, and
the complete replacement hierarchy for a restricted two-step reset. The
required preserved class of coefficient polynomials is still absent. All
recorded symbolic and independent exact checks passed. The explicit scope
exclusions and the Chollet priority correction remain in force. The
continuation has zero completed eligible conjectures; the requested ten
have not been obtained.

## 20 November 2026: precise limits of the two extension methods

The [projection-factor audit](continuation-2026-11-20/inequalities/mixed_block_projection_obstruction.md)
applies Sra's prior normalized Schur-function theorem to prove that Haar
rank projections are optimal among invariant positive metric averages with
a fixed rank cap. The [correction review](continuation-2026-11-20/reviews/mixed_block_correction_obstruction.md)
checks the diagonal-product term and gives a formal Fourier-data separator.
It is not a Gram counterexample. Configuration-dependent maps and further
Gram relations remain outside the obstruction.

The [fixed-reset obstruction](continuation-2026-11-20/sign/triangular_fixed_reset_obstruction.md)
has an [independent analytic review](continuation-2026-11-20/reviews/triangular_fixed_reset_review.md).
For each fixed seed and initial direction, the specified two-row reset can
satisfy nonzero permanent-determinant equality only finitely often. Its
cutoff need not be uniform in the seed. Root checked the exact operator,
nearest-pole asymptotic, and determinant normalization and ran the symbolic
checker. Adaptive constructions remain unexcluded. These deductions add
zero full eligible Minc resolutions.

## 20 November 2026: legal wreath transfer and its remaining obstruction

The [wreath-transfer note](continuation-2026-11-20/inequalities/wreath_power_trace_obstruction.md)
now realizes Fourier-block power traces using an actual subgroup and retains
the character-degree factor. The self-contained classical apolar-norm
argument proves the factorial denominator bound, excluding every
identical-copy wreath transfer of a base normalized character already
bounded by the permanent. For a general PSD block metric, the ratio is
bounded by kappa_A^m times that metric's self-Chollet ratio. All four exact
core factors satisfy kappa_A<1. Thus a counterexample by this route would
already require a self-Chollet counterexample in the metric. This is a
conditional reduction, not a proof of Chollet or unrestricted dominance.

The [independent review](continuation-2026-11-20/reviews/wreath_power_trace_review.md)
checks the group convention, character degree, Fock normalization, both
Fischer bounds, zero cases, and exact factors. Root checked the same proof,
read the primary norm source, and reran the rational checker. An
[additional source audit](continuation-2026-11-20/reviews/schubr_rank_four_source_audit.md)
records a prior rank-four claim whose continuation was checked but whose
singular-five certificate remains uninspected. No novelty or full-conjecture
credit is assigned to that claim. Full eligible resolutions from this
continuation remain zero; the requested ten are not achieved.


## Uniform bounds and current cofactor gap, 20 November 2026

The [independent-session index](nov20-independent/README.md) records the
next reviewed checkpoints. They add **zero complete numbered-list
resolutions**. The count above is unchanged. The following updates
supersede the earlier missing-lemma descriptions where indicated.

- **C44 and P13:** the [uniform local Hessian theorem](nov20-independent/inequalities/uniform_radial_permanent.md)
  is now proved, using an [all-degree centered coefficient bound](nov20-independent/sign/centered_permanental_coefficients.md).
  It gives a real van der Waerden radius at least 1/1000 uniformly in
  order. A maximum-matching capacity bound then proves the zero-diagonal
  minimum and uniqueness for every n at least 20,000,000,000,000;
  [full eventual proof](nov20-independent/inequalities/explicit_eventual_zero_diagonal.md).
  No unpublished confinement estimate is assumed. The smaller orders
  remain unresolved, and the largest real radius is not determined.
- **Uniform stability:** for every doubly stochastic A, with d_n=n!/n^n,
  [the proved bound](nov20-independent/inequalities/uniform_frobenius_stability.md)
  is log(per A/d_n) at least ||A-J_n||_F squared divided by 32,000,000.
  For possible zero-diagonal minimizers it gives an explicit squared
  distance bound of order 1/n. The missing uniform local estimate in the
  earlier C44 paragraph is therefore supplied for this restricted ball;
  no all-order zero-diagonal theorem is claimed.
- **C24 and C6:** [integer minimizers have a collision bound](nov20-independent/root/integer_minimizer_collision_bound.md)
  of order k squared log n. The [dense-line proof](nov20-independent/root/dense_integer_minimum.md)
  proves that exactly binary matrices minimize on k=n-1 for every n at
  least 500,000,000,000,000, allowing defects that grow with n. Separately,
  [normalized complement averaging decreases strictly](nov20-independent/sign/c6_dense_barycentric_comparison.md)
  when (n-k)/k is at most 1/4,000,000. Neither statement covers the
  remaining degrees and orders, so neither counts as a full entry.
- **P17 and P18:** the [collision-Krylov algorithm](nov20-independent/root/collision_krylov_charpoly.md)
  is deterministic, handles singular matrices and repeated eigenvalues,
  and costs soft-O(n^((k-1)omega+2)) for every fixed k at least two.
  [Mixed actions and a black-box corollary](nov20-independent/compound/blackbox_compound_bound.md)
  treat wider ranges but leave the central growing-degree time gap.
  [Generic irreducibility and explicit Perron degree](nov20-independent/compound/perron_algebraic_degree.md)
  exclude polynomial-time expanded minimal-polynomial output on one
  all-order companion family. They exclude neither compact exact output
  nor approximation and resolve neither list entry.
- **C34/Hwang:** the [susceptibility bridge](nov20-independent/inequalities/susceptibility_bridge.md)
  retains the bounded-activity obligation. Its unrestricted-activity
  extension is false. The [alternating-path note](nov20-independent/inequalities/matching_path_susceptibility.md)
  gives V at least mu squared divided by zm and identifies the remaining
  occupancy interval t(z)<q<q_*(z). A rational abstract root law satisfies
  the recorded scalar constraints but violates the proposed variance
  inequality. It is not a matching-root realization or a conjecture
  counterexample. A full proof still needs more matching structure.
- **C30:** the [averaged cofactor lower bound](nov20-independent/sign/chollet_cofactor_bridge.md)
  ||Gamma(A)||_F squared at least n per(|A| squared) remains unproved.
  Pate's published theorem gives the required upper bound n(per A) squared.
  The [Fischer Gram-order argument](nov20-independent/inequalities/chollet_gram_order.md)
  proves conditional diagonal monotonicity and reduces a least-order
  counterexample to singular correlation matrices; it does not bound
  their rank. The [two cofactor Gram matrices have the same kernel](nov20-independent/compound/cofactor_scope_and_kernel.md),
  but the linear map between their omitted-product spans is not known
  to be a contraction. The analogous arbitrary-compound inequality is
  false by an exact four-vector Gram example. Do not generalize from it
  to the cofactor case, or treat the singular reduction as an induction
  base. The recent Schubr cofactor paper expressly leaves the cofactor
  matrix comparison undecided.

The index links the independent reviews, exact diagnostics, and bounded
source audits. Classical input theorems are credited. No claim of
historical priority, external peer review, or ten completed results is
made. The hourly Minc research task is already enabled; future workers
should fetch current main and the latest issue comments before assigning
files or continuing one of these gaps.

Two subsequent C30 calculations prevent repeating invalid shortcuts.
The [exact derivative family](nov20-independent/sign/cofactor_derivative_obstruction.md)
has residual T entrywise-squared minus U equal to diag(4(3-t^4),0,0),
although its full cofactor difference has an explicit positive
semidefinite decomposition. Separate positivity of derivative Grams
does not control that residual. The [signed-curvature identity](nov20-independent/inequalities/chollet_signed_curvature.md)
proves E_K<0 whenever the hypothetical averaged gap G<0, so its central
term contributes positive curvature at a negative minimum. The remaining
gradient comparison is signed and unproved; the diagonal-preserving
tangent contraction is not the full central transposition operator.
The cofactor kernel note now gives the exact angle inequality needed on
the omitted-index projected span. None of these computations establishes
that angle bound, excludes every negative minimum, or changes the full
resolution count.

The [Marcus route review](nov20-independent/root/marcus_route_review.md)
checks two further obstructions. Fixed orthogonal auxiliary padding
that preserves every coarse permanent forces a rank-one auxiliary
coarse Gram and loses at least a factor of the factorial of the block
count. Even the corresponding universal domination step is impossible.
The normalized binary-quadratic central-limit construction has a
nonnegative leading correction on every product test; its negative
cumulant direction is detectable by a nonproduct test and cannot by
itself supply a conjecture counterexample. The finite-copy expression
is not controlled. Tubbenhauer's November preprint and its remaining
small-block gap were already in the earlier source audit, not first
found at this checkpoint. These deductions do not resolve C9.
