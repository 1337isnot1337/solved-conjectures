# Minc’s list

Research started 20 November 2026. Coordination: [issue #139](https://github.com/1337isnot1337/solved-conjectures/issues/139).

## Scope

Only full open entries on [Yair Lavi’s Minc list](https://yair-lavi.com/mincs-list/) are eligible. The source marks 24 entries open at the start of this investigation. A finite-order extension, a conditional implication, a bound, an algorithm that merely enumerates the definition, or a renamed subproblem is not a completed entry. No Lean verification is in scope.

**Completed unqualified entries: 0.** One complete candidate theorem now gives a general FPRAS for the approximation formulation of Problem 18. Its exact scope, proof and priority audit are recorded below. A separate complete proposed proof now resolves the named Pula–Song–Wanless subsidiary conjecture, with a repaired reduction and independent uniqueness proof; it does not count as a full solution of Problems 14 or 15. A further complete proposed proof now resolves Malek's named subpermanent endpoint conjecture in the site's linked survey; its stricter source-chain eligibility limit is stated below. No exact polynomial-time Perron computation is claimed.

[Current proof gaps and continuation state](NEXT.md) give a compact reading order for the latest work.

## Assignments

| Entry | Name | Worker |
| --- | --- | --- |
| C5 | Ryser’s design conjecture | combinatorial |
| C6 | Monotonicity of normalized minimum permanents | combinatorial |
| C9 | Marcus’s block-permanent inequality | inequalities |
| C20 | Gyires’s ratio inequality | inequalities |
| C24 | Integrality of the minimum permanent | combinatorial |
| C30 | Chollet’s conjecture | sign_matrices |
| C34 | Lih–Wang convexity inequality | inequalities |
| C36 | Kräuter’s minimum sign-matrix permanent | sign_matrices |
| C42 | Lieb’s permanental dominance conjecture | root |
| C44 | Zero-diagonal doubly stochastic minimum | inequalities |
| P1 | Maximum permanent on a unitary orbit | root |
| P2 | Permanent dominance for degree-one characters | root |
| P3 | Permanent values of 3-regular matrices | combinatorial |
| P4 | Maximum permanent when k does not divide n | combinatorial |
| P5 | Vanishing Hadamard permanents | sign_matrices |
| P7 | Sign matrices with equal absolute permanent and determinant | sign_matrices |
| P8 | Monotonicity toward the boundary | root |
| P11 | Matrices below every circulant | combinatorial |
| P12 | Circulant maxima when k does not divide n | combinatorial |
| P13 | Real van der Waerden radius | root |
| P14 | Characterizing cohesive matrices | root |
| P15 | Characterizing barycentric matrices | root |
| P17 | Characteristic polynomial of permanental compounds | root |
| P18 | Perron root of permanental compounds | root |

## Evidence standard

For each proposed result record the original quantified statement, primary sources, recent status searches, a complete argument, and an independent attempt to find a gap. Computation can find a counterexample, but the final witness and inequality must be exact. New-result priority remains provisional even after literature searches. Research files will distinguish known statements, proved lemmas, conjectures, failed approaches and unresolved gaps.

## Initial exclusions

The ten entries already marked resolved by the source are excluded: conjectures 3, 4, 15, 17, 18, 27, 28, 35, 41, and problem 10. Existing results in this repository and prior results in other repositories also do not count as new.

## Sources

- H. Minc, *Theory of permanents 1982–1985*, Linear and Multilinear Algebra 21 (1987), 109–148, https://doi.org/10.1080/03081088708817786.
- G.-S. Cheon and I. M. Wanless, *An update on Minc’s survey of open problems involving permanents*, Linear Algebra and its Applications 403 (2005), 314–342, https://doi.org/10.1016/j.laa.2005.02.030.
- Yair Lavi, [Minc’s list](https://yair-lavi.com/mincs-list/), accessed 20 November 2026. The source’s individual pages supply exact statements and partial results; fresh literature checks are still required.

## Checked research checkpoints

- [Real van der Waerden radius](sinkhorn_frobenius_radius.md): new all-order certified lower radius `b(n)>=R_n` for `n>=3`, where `R_n` is the unique positive root of `T_n(R)=1+nR^2`, and `sqrt(n) R_n -> 1.5852...`; explicit corollaries are `b(n)>=1/(2sqrt(n))` for `n>=4` and `b(n)>=1/sqrt(n)` for `n>=64`. Uses Lavi's zero-margin subpermanent lemma. Sharp radius **still open**; the root reviewer checked the cited zero-margin lemma and deduction, while priority remains unverified. No completed entry is claimed.
- [Perron root of permanental compounds](../../results/perron-root-permanental-compounds/): complete candidate proof of an FPRAS for every nonnegative rational input and every compound degree, with deterministic zero detection. Independent reviews are in [sign-matrices/p18_independent_review.md](sign-matrices/p18_independent_review.md) and [inequalities/perron_review.md](inequalities/perron_review.md); the [prior-art audit](../../results/perron-root-permanental-compounds/source-audit.md) found no full-domain result. This settles the approximation formulation if the proof and novelty assessment withstand external review; it is not an exact computation theorem.
- [Gyires's ratio inequality](inequalities/gyires_spectral.md): a proved sufficient condition on a spectral-norm neighborhood, using cited prior results. The unrestricted conjecture remains open here.
- [Integrality of the minimum permanent](combinatorial/switch_descent_obstruction.md): an exact infinite-family obstruction to a proposed four-cycle descent strategy, with a six-cycle improvement. This disproves the proposed strategy lemma, not Conjecture 24.
- [Earlier open-path reduction](perron-compound.md): historical derivation and the convergence obstacle bypassed by the trace argument.


- [Permanent dominance for degree-one characters](abelian-dominance.md): proves the semiregular-action case for every character and the abelian-subgroup case in every order as consequences of Grone–Pierce and Lieb–Fischer. This is a structural subcase, not a full solution of Problem 2 or Conjecture 42; priority is unasserted.


- [Pula–Song–Wanless conjecture](../../results/pula-song-wanless/proof.md): complete proposed proof of the inclusive threshold `n>=m+sqrt(m)`, with a real-rooted-minor repair of the published equalization argument and an independent van der Waerden uniqueness proof. The known cohesive and non-barycentric directions are independently checked and credited. [Two written reviews](../../results/pula-song-wanless/review-inequalities.md) and [exact identity checks](../../results/pula-song-wanless/verify.py) accompany it. The [source audit](../../results/pula-song-wanless/source-audit.md) found no earlier full threshold proof; its limits are explicit. This is a subsidiary conjecture, not either unrestricted characterization problem.

## Gyires PSD-orbit publication and prior-art corrections

- [Gyires on PSD permutation orbits](gyires_psd_permutation_orbits.md): an all-order proper-class theorem for A=PSQ, where S is symmetric positive-semidefinite doubly stochastic and P,Q are independent permutations. The full Gyires ratio is at least per(A)>=n!/n^n, with equality only at J. The proof uses Loewner monotonicity and permanent tensor Cauchy--Schwarz; the [exact rational checker](verify_gyires_psd_permutation_orbits.py) passes 175 examples. **The unrestricted C20 conjecture remains open.** Prior priority not established.
- [Lih--Wang PSD-orbit quantitative bound](lihw_psd_orbit_convexity.md): the same class satisfies per(J+t(A-J))<=beta_n+t²(per(A)-beta_n) for the entire segment t in [0,1], with explicit positive second-derivative lower bound; the [exact rational checker](verify_lihw_psd_orbit_convexity.py) passes 60 examples. **Qualitative convexity for this class follows already from Kopotun (1996)**, and the strengthened quantitative estimate's novelty is unverified. **The unrestricted C34 conjecture remains open.**

## Further checked routes and remaining gaps

- [Integer regular-matrix minima](combinatorial/descent_research.md): a decomposable support cannot minimize for any `k>=2`; longer alternating-cycle changes have exact minor expansions. Their signs do not yield a universal descent theorem. Continuous minimizer cofactor identities cannot be assumed on the integer grid.
- [Brualdi's cohesive family](combinatorial/brualdi_boundary_notes.md): the symmetric-family reduction is unjustified without a full-face argument. A proposed principal-cofactor inequality has an exact counterexample.
- [Characteristic polynomial of permanental compounds](inequalities/compound_charpoly_obstruction.md): symmetric powers, Ryser transforms and trace encodings are exact, but do not currently improve the unrestricted algorithm. The needed multilinear evaluation step is unresolved.
- [Lih–Wang convexity](inequalities/lihw_stability_obstruction.md): the relevant interpolation need not be real rooted, and a coefficientwise chord bound is false. No full inequality is established.
- [Zero-diagonal minimum](sign-matrices/c44_research.md): exact obstructions rule out unconditional transpose averaging, principal-cofactor summation, and entropy conjugation averaging. [Exact certificate](sign-matrices/c44_obstructions.py). [Entropy nonconcavity](inequalities/entropy_nonconcavity.md) has a separate [rational certificate](inequalities/entropy_nonconcavity.py). These are counterexamples to auxiliary claims, not to Conjecture 44.
- [Sign-matrix constructions](sign-matrices/research.md): a fixed-determinant family has an exact path-partition recurrence, but its simplest closed subfamily misses admissible orders. The Hadamard signed-automorphism argument cannot force permanent vanishing. No all-order attainment or nonvanishing result is claimed.
- [Regular orbit images and abelian dominance](sign-matrices/abelian_review.md): a stronger absolute-sum inequality follows from Grone–Pierce and Lieb–Fischer. The proof is checked, but the original Grone–Pierce corollaries remain inaccessible and priority is unverified. The unrestricted dominance conjectures remain open.

All three parallel workers have recorded their checked results and are pursuing further routes. No extra full conjecture solution was obtained from the routes above, and none of these partial results or obstructions increases the full-entry count. The ten-resolution target is unmet.

- [Zero-diagonal Hessian](zero_diagonal_second_variation.md): exact all-order tangent-space second variation at `U_n=(J-I)/(n-1)` with explicit symmetric and skew curvature eigenvalues. [Exact checker](verify_zero_diagonal_second_variation.py). Burghduff's local-minimum theorem is prior art; the global C44 conjecture remains open.
- [Weak Gyires block closure](gyires_weak_block_closure.md): the original four-term inequality propagates strictly to `A⊕B` under a binomial ratio threshold (automatically for block orders `r,s>=5`), without stronger Gram hypotheses on either input. A complementary size-free hybrid theorem needs stronger Gram estimates for only one block; [exact checks](verify_gyires_weak_block_closure.py). This is decomposable-class progress, not full C20.

## Partial diagonal family theorem

The [partial-diagonal proof](combinatorial/partial_diagonal_nonbarycentric.md) shows that for every `n >= 3` and `2 <= k < n`, the barycenter of the doubly stochastic face with zeros in the first `k` diagonal positions is not even stationary. It completes the all-parameter assertion suggested by the earlier partial results on this family. The proof uses the stationary-barycenter matching law and a strict log-convexity determinant for derangement counts. Root and inequalities reviews found no gap; the written argument covers all parameters.

The [source review](combinatorial/partial_diagonal_root_review.md) states the limits: Minc's 1994 full text was not obtained, no separate named conjecture was verified, and priority remains unconfirmed. This is kept as research, not added to the solved-conjecture count. It does not settle the unrestricted Problem 15 or the zero-diagonal Conjecture 44.

## Brualdi structural reduction and further obstructions

The [Brualdi structural theorem](combinatorial/brualdi_structure.md), with a [root review](combinatorial/brualdi_root_review.md) and [source audit](sign-matrices/brualdi_source_audit.md), restricts every minimizer on the face of `C_n=J-I+E_nn`, for all `n>=4`. It excludes large zero rectangles, proves positivity of the entire free row and column, proves strict cofactor deficits at the prescribed diagonal zeros, and shows that any extra zeros form a directed acyclic graph. **The graph has not been proved empty. Brualdi's cohesiveness conjecture remains unresolved.** Classical strictness is credited to Bapat and Panov. Historical priority for the combined restrictions is unverified.

Two additional checked route audits are recorded without adding any completed entry:

- [Marcus's block-permanent inequality](inequalities/marcus_gaussian_routes.md): exact counterexamples rule out a universal holomorphic-test comparison, block-commutator positivity, and higher-cumulant positivity. The simplest lift of Tran's permanent-on-top example has a strictly positive full Marcus gap. [Exact certificate script](inequalities/marcus_gaussian_certificates.py).
- [Sign-matrix constructions](sign-matrices/sign_lift_audit.md): projective row and column multiplicity restrictions, a rank lower bound for nonzero pure-power permanents, and exact obstructions to Ferrers and double-pairing construction families. [Exact certificate script](sign-matrices/sign_lift_audit.py). These exclude methods, not the original conjectures.

## Gyires interior reduction and further route checks

The [Gyires interior reduction](inequalities/gyires_interior_reduction.md) proves that at any local minimum of `per(A)^2/per(AA^T)` on the doubly stochastic polytope, rows with identical supports are equal. The uniform matrix is therefore the only interior local minimum. A possible lower global minimum on a boundary face with distinct row supports remains uncontrolled. This is a partial theorem, not a solution of Conjecture 20. A separate [product-polynomial audit](inequalities/gyires_product_stability_obstruction.md), with [exact certificates](inequalities/gyires_product_certificates.py), disproves both automatic real stability and automatic equality of capacity with the value at one for that proposed proof route.

The [Brualdi strict-AF review](inequalities/brualdi_af_review.md) independently checks the structural reduction and gives an [inverse-sign obstruction](inequalities/brualdi_af_certificates.py). The [DAG continuation audit](combinatorial/brualdi_dag_attempts.md) supplies stronger exact counterexamples to two auxiliary shortcuts, with a [separate certificate script](combinatorial/brualdi_dag_certificates.py). Constant maximal minors and strict AF alone do not eliminate the remaining zero DAG; the complete minimizer conditions are still needed.

The [Chollet Gaussian replacement audit](sign-matrices/chollet_gaussian_replacement.md) disproves a stronger moment-matrix domination in every order `n>=4` using the regular-simplex correlation matrix. Its negative test does not factor into the Gaussian forms required by the conjecture. The [exact base certificate](sign-matrices/chollet_gaussian_replacement.py) checks the displayed moments. The replicate interpolation and its unproved coefficient bound are recorded explicitly. No Chollet or Marcus counterexample is claimed.

The [supplemental public-repository source audit](repository_prior_art_audit.md) records additional searches for earlier PSW threshold proofs and general compound Perron approximation results. It describes the bodies actually inspected and the limits of capped and incomplete search indexes. It does not turn internal review into external confirmation.


## Quadratic dominance, boundary minima, and source exclusions

The [quadratic permanental-dominance checkpoint](combinatorial/quadratic_permanental_dominance.md) records the named subsidiary conjecture linked from C30 and C42. It proves direct-sum closure and shows that a first counterexample, if one exists, can be chosen singular with positive diagonal and connected support. It also gives exact subset-module and standard-block deficit formulas. The [independent review](inequalities/quadratic_dominance_review.md) checks the reductions. The final all-order bound remains unproved; generic positivity, row sums and diagonal bounds do not imply it. Reproducible finite diagnostics are retained as diagnostics only.

The [Gyires boundary-minimum theorem](inequalities/gyires_boundary_minimum.md) proves that the order-three zero-diagonal uniform matrix is a strict local minimum of the stronger Gram ratio on the full doubly stochastic polytope. Its ratio is above the conjectured lower bound. Thus a full proof must control boundary minimum values, rather than exclude boundary minima. An [exact certificate](inequalities/gyires_boundary_certificates.py) checks the identities. The [polarization note](inequalities/gyires_polarization.md) isolates a sufficient balanced stable-polynomial norm inequality and explains why negative association and the capacity theorem do not supply it.

The [Chollet border-operator note](sign-matrices/chollet_border_operator.md), with [exact complex checks](sign-matrices/chollet_border_operator.py), identifies the required product-vector positivity and disproves a uniform positive-averaging extension of the existing scalar induction. It does not prove full operator positivity or Chollet's conjecture.

The [updated Lih–Wang source audit](sign-matrices/lihw_source_audit.md) gives the exact binomial-average formulation. A proposed coefficientwise shortcut is withdrawn because its next-to-top case is the false Holens inequality. Wanless's superpolynomial near-perfect/perfect matching ratio obstruction rules out polynomially weakened versions too. The currently published Kopotun estimates do not reach the required half-segment. The complete C34 inequality remains open here.

No item in this checkpoint increases the full-resolution count.

## Malek's conjecture

The [complete proposed proof](../../results/malek-subpermanent/proof.md) covers every order and every subpermanent degree in Malek's negative-transform comparison. Its new capacity estimate controls optimized slices by the product of the arithmetic mean of the variables and that of their reciprocals. The resulting lower coefficient exceeds the centered upper coefficient in all proper degrees; exact initial constants and a uniform polynomial comparison cover all orders. All equality cases are stated, with the full-permanent case credited to prior work.

The [source audit](../../results/malek-subpermanent/source-audit.md) found no earlier complete endpoint proof in the inspected primary texts, recent followups and public repositories. It records the source-access limit and a stricter eligibility limit: the current C3 page cites Malek, but the all-degree conjecture is explicitly stated in the Minc index's linked 2005 survey, not on that live page. Thus this is a named subsidiary through the source chain, not a new numbered C3 resolution. [Two internal reviews](../../results/malek-subpermanent/review-inequalities.md) and the [exact scalar checker](../../results/malek-subpermanent/verify.py) accompany it. [Issue #145](https://github.com/1337isnot1337/solved-conjectures/issues/145) tracks the result.

The unqualified numbered-entry count remains zero. The ten-resolution target remains unmet.


## Convexity priority exclusion and exact route obstructions

The [Kopotun quantitative theorem](kopotun/) proves global strict convexity of the degree-`k` subpermanent sum for every `n>=16k^2`. Two independent reviews and exact tensor/coefficient checks support its proof. However, a prior August 2026 centered coefficient bound already implies eventual global convexity by [ordinary polarization](kopotun/prior-bound-implication.md). Its mathematical proof is available in the earlier repository's exposition even though one referenced note is absent. The [complete audit](kopotun/source-audit.md) records this overlap. The result is retained as a quantitative refinement and is not registered or counted as a newly resolved conjecture.

The [zero-diagonal Hessian obstruction](inequalities/c44_hessian_obstruction.md), with an [exact rational checker](inequalities/c44_hessian_certificate.py), disproves convexity and even local quasiconvexity throughout the published candidate ball for Conjecture 44. The witness still has permanent above the proposed minimum. It rules out those proof methods, not C44.

The [boundary-endpoint obstruction](combinatorial/boundary_endpoint_obstruction.md) proves that a strictly positive endpoint radial derivative does not characterize monotone boundary directions. It combines the published Jerrum–Wanless ratio family with an exact direct-sum identity, and produces at least two interior stationary points. It is not a full solution of Problem 8. The [unitary-orbit source audit](combinatorial/unitary_orbit_source_audit.md) records earlier general algebraic prescriptions, complete exceptional-spectrum formulas and classical equality results; none is counted as new work here.

This checkpoint adds no full resolution. The ten-resolution target remains unmet.


## Radial convexity and further priority checks

The [Hwang radial-convexity checkpoint](inequalities/hwang_radial_convexity.md) gives an exact Bernstein moment criterion and a uniform-block padding limit. For a fixed doubly stochastic core `A` of order `m`, the normalized radial permanent converges with two derivatives to `exp(mt)(1-t)^(2m) R_A(t/(1-t)^2)`. Negative curvature of this limit on the half interval would give a full counterexample family, but no such core is known here. The same function is a balanced Poisson occupancy correlation. An exact negative Taylor coefficient rules out a coefficientwise positivity proof. The [symbolic checker](inequalities/hwang_radial_certificates.py) passed; Hwang and C34 remain open.

The [two-sparse Gyires review](sign-matrices/gyires_sparse_review.md) checks the other worker's full proof and its 288 exact diagnostics. It also shows that the entire non-strict class follows from Lavi's prior two-permutation theorem by reflecting each cycle and multiplying the block inequalities. Different component weights do not establish a new class. The [self-Gram polynomial obstruction](sign-matrices/gyires_self_gram_obstruction.md), with an [exact checker](sign-matrices/gyires_self_gram_obstruction.py), shows that even using the same matrix on both sides does not make the relevant occupation polynomial stable or Lorentzian. The scalar Gyires inequality still holds at that witness.

The [barycenter-stationarity audit](combinatorial/barycentric_stationarity_audit.md) reconstructs the Fischer–Hwang 1996 cyclic-block obstruction and records the exact covariance Hessian formula. Stationarity is insufficient; adding local minimality still includes the unresolved C44 global problem. This is a prior-art exclusion, not a new P15 resolution.

No new full conjecture resolution is claimed in this checkpoint.


## Whole-matching replacement and occupation-law residuals

The [whole-matching replacement note](combinatorial/matching_replacement_research.md) records a different C24 strategy from local switches: remove one supported permutation and add another. It proves the exact collision change, the uniform-permutation average and the weighted triple-minor formula. The required simultaneous control of permanent and collisions is unproved; a weaker lexicographic theorem would also suffice. Bounded diagnostics are documented as diagnostics and do not establish any order case.

The [multinomial reformulation](sign-matrices/gyires_multinomial_reduction.md) identifies strong Gyires with an exact density inequality: the L2 norm of the occupation law relative to the uniform multinomial law must not exceed its density at the all-ones occupation. The central-density maximum and ordinary relative log-concavity shortcuts are false. No density inequality is proved.

For the original weak Gyires inequality, the [symmetrized-row-polynomial note](inequalities/gyires_symmetrized_polynomial.md) gives an exact central-coefficient/Fischer-norm equivalence. It then supplies an explicit doubly stochastic witness showing that the row polynomial plus the column polynomial is neither stable nor Lorentzian; the obstruction persists under a sufficiently small positive uniform perturbation. The witness satisfies Gyires strictly. The [exact checker](inequalities/gyires_symmetrized_polynomial.py) passed, and the inequalities worker independently checked the obstruction.

These files preserve the remaining proof obligations and excluded methods. They add no full conjecture resolution.


## Border similarity and recurrence obstruction

The [Brualdi border and similarity reduction](sign-matrices/brualdi_similarity_reduction.md) retains the full free-row and free-column stationarity equations. It derives a necessary positive semidefinite matrix inequality from feasible diagonal similarity and proves `0<a_nn<1/2` at every global minimizer. The extra-zero DAG has not been eliminated; this is not a cohesiveness proof.

The [constant-recurrence obstruction for Wang's problem](sign-matrices/cfinite_obstruction.md) proves that finitely many all-order sign-matrix families with C-finite permanent and determinant sequences cannot cover all sufficiently large non-Mersenne orders. The proof uses the classical Mersenne valuation and a long-zero-run argument. It neither establishes the expected classification nor rules out binary-dependent constructions.

Both notes have been checked as partial results. No completed entry is added. A compact [current research state](NEXT.md) records the exact outstanding proof obligations and the scope of the three complete proposed results.


## Pate source correction

The [Pate indicator-theorem correction](inequalities/pate_packet_correction.md) establishes the Marcus replacement endpoint derivative, every two-part Chollet occupation bound, the standard-representation case of quadratic permanental dominance in every order, and a cofactor-product permanent bound as consequences of the 2008 theorem. [Exact checks](inequalities/pate_packet_certificates.py) verify the subset indexing and polynomial identities. The Gaussian replacement and quadratic-dominance notes, including the review's source-status paragraph, have been corrected: the total standard-block Fischer-deficit compensation is established, rather than an unresolved target.

The result does not extend by subtracting cumulative two-row upper bounds, by applying the PSD theorem to cross-minors, or by silently iterating two-copy mixing. Full quadratic dominance, Chollet and Marcus remain open here. This source correction adds no newly resolved conjecture.


## Polynomial-recurrence obstruction

The [uniform-recurrence theorem](sign-matrices/p_recursive_obstruction.md) extends the Wang construction obstruction to P-recursive permanent and determinant sequences. It also proves that finitely many all-order families with P-recursive permanent sequences cannot, between them, attain Kräuter's proposed minimum in every sufficiently large order. The key uniform recurrence is independent of a scalar parameter; long order intervals force too many distinct eventual exponential values for a finite set of families.

This excludes a class of construction methods. It does not disprove attainment in any order, establish the expected Wang classification, or settle either original conjecture. Binary-dependent constructions and genuinely unbounded families remain available. No full resolution is added.


## Matching-limit monotonicity and checked lift restrictions

The [matching-limit theorem](inequalities/hwang_matching_monotonicity.md) proves `F_A'(t)>0` for every finite doubly stochastic core and every `0<t<=1/2`. It combines the weighted alternating-path identity with an exact scalar averaging certificate. The [independent review](inequalities/hwang_matching_monotonicity_review.md) found no gap, and the [exact checker](inequalities/hwang_matching_monotonicity.py) passed. Uniform convergence with two derivatives also proves half-interval monotonicity of the actual permanent path for `A direct_sum J_M` for every sufficiently large `M`, with a threshold depending on the core. Neither convexity nor monotonicity on the full unit interval follows. A vertexwise strengthening is false, with an exact hub-family obstruction recorded in the note. Historical priority of this partial theorem is unasserted.

The [paired-row sign-matrix formulas](sign-matrices/paired_row_lift.md) give exact even/odd determinant and coefficient identities for a possible binary construction. The canonical transitive choice always has zero permanent in even order, so it cannot propagate the needed equality. The required coefficient invariant is still missing.

The [Pate partition-lift obstruction](inequalities/pate_partition_lift_obstruction.md) retains the complementary factors in a many-copy indicator lift. Exact rank-one examples disprove a direct averaged lower bound and a nonlinear repair; an all-singleton version of the latter would already imply full Chollet through identity padding. These are excluded proof methods, not conjecture counterexamples.

This checkpoint adds no full named conjecture resolution. The ten-resolution target remains unmet.

## Substochastic padding checkpoint

The [substochastic-core construction](inequalities/hwang_substochastic_padding.md) extends uniform padding to every doubly substochastic core. Its exact finite permanent formula converges with two derivatives to a matching sum with nonuniform monomer factors. A negative second derivative of that sum would transfer to finite counterexamples to Hwang's conjecture. The [exact checker](inequalities/hwang_substochastic_padding.py) passes twelve comparisons against full permanent enumeration. No negative-curvature core, general curvature theorem, or new conjecture resolution is claimed.
