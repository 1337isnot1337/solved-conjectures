# Minc's list

Research session dated 20 November 2026 (America/Chicago). Coordination: [issue 139](https://github.com/1337isnot1337/solved-conjectures/issues/139#issuecomment-7056710026).

## Status

No new complete numbered-list resolution has been established in this session. The target remains ten full resolutions. An auxiliary lemma, prior-art correction, finite-order case, or special-family result does not count.

The live [Minc index](https://yair-lavi.com/mincs-list/), retrieved directly on this date, lists 24 open entries. Search-engine snapshots sometimes still show 25 because they predate the Németh–Seberry–Shu update. The directly retrieved index is used for the status inventory.

The repository's [current state](../NEXT.md), existing proofs, issue comments, and failed-route notes were read before selecting continuations. The previous proposed FPRAS for P18 and the Pula–Song–Wanless and Malek subsidiary conjectures are existing work and will not be recounted.

## Allocation

| Worker | Primary targets |
| --- | --- |
| inequalities | C9 Marcus; C20 Gyires; C34 Lih–Wang; C44 zero-diagonal minimum |
| sign_and_regular | C36 Kräuter; P3 cubic value sets; P4 regular maxima; P5 Hadamard nonvanishing; P7 equal permanent and determinant |
| compound_and_faces | P14 cohesive matrices; P15 barycentric matrices; P17 characteristic polynomial; P18 Perron root |
| root | C5 Ryser; C6 normalized minima; C24 integer minima; P11/P12 circulant comparisons; P13 real radius; cross-review |

C30, C42, P1, P2 and P8 remain eligible secondary targets, subject to the existing workers' current reservations. These assignments are nonexclusive; new files stay inside this directory to preserve concurrent work.

## Discovery requirements

For any proposed solution, record the exact quantifiers and original source, search both web indexes and the relevant primary papers for earlier resolutions, write a full proof or an exact counterexample, and obtain independent review. Computational experiments can reject an approach or check algebra; they cannot establish a general quantified claim by themselves.

The current user instruction excludes Lean. Results will be published on main with atomic updates that retain other workers' commits. Substantive checkpoints will be linked in issue 139.

## Initial decisions

- C24: four-switch collision descent and uniform complement-matching averaging already have exact obstructions in the repository. The remaining useful target is a transformation or inequality valid at a global minimum, or an exact multigraph below a known binary minimum. Re-deriving the failed averages is excluded.
- C20: the strong Gram/Fischer-norm route and the substochastic Poisson limit are already developed. The unresolved norm inequality must be proved or refuted, rather than restated.
- P14/P15: the existing Pula–Song–Wanless threshold does not characterize all faces. A generic optimization or quantifier-elimination restatement will not count as a characterization.
- P17: the earlier symmetric-power complementary-minor identity has already been reviewed and is not a uniform speed improvement.
- C36/P7: fixed-width paired cores, finitely many P-recursive families, and fixed one-vertex stretching are already excluded as all-order constructions. Any new construction needs genuinely growing structure.

Primary statement links and detailed source audits will accompany each substantive checkpoint. No priority claim is made for this planning document.

## Reviewed checkpoints

All entries below remain partial. The full-resolution count is zero.

| Listed target | Result and exact remaining gap |
| --- | --- |
| C24, Integrality of the minimum permanent | [Every integer minimizer has an explicit collision bound](root/integer_minimizer_collision_bound.md), uniformly $`O(k^2\log n)`$. A nearby binary feasible matrix exists in the stated sparse range, but the repair has no permanent comparison. [Independent review](compound/c24_defect_review.md). A further [dense-line theorem](root/dense_integer_minimum.md) proves that exactly the binary matrices minimize when $`k=n-1`$ and $`n\ge500\,000\,000\,000\,000`$, permitting defects that grow with order. [Dense-line review](compound/dense_integer_review.md). The remaining degrees and orders prevent a full resolution. |
| P5, Vanishing Hadamard permanents | [The first three partition sectors are universal](sign/hadamard_partition_sectors.md), and the fourth is determined by four-column correlations with two fixed moments. Aggregate cancellation over all sectors remains unproved. [Integration review](root/compound_and_sector_review.md). |
| P17, Characteristic polynomial of permanental compounds | [A deterministic collision-Krylov algorithm](root/collision_krylov_charpoly.md) computes the characteristic polynomial in $`\widetilde O(n^{(k-1)\omega+2})`$ arithmetic operations for every fixed $`k\ge2`$, including singular matrices and repeated eigenvalues. [Independent review](compound/collision_krylov_review.md). A [Monte Carlo black-box corollary](compound/blackbox_compound_bound.md) improves the available dense bound in a wider stated parameter range. The [one-pivot action](compound/one_pivot_storage.md) gives input/output-scale polynomial storage for $`k\le n/2`$. [Review of both refinements](root/dense_and_algorithm_review.md). The central growing-degree time gap remains. |
| C34 and the Hwang route | [A conditional susceptibility bound implies convexity of every padding limit](inequalities/susceptibility_bridge.md). An infinite weighted Jerrum family disproves extension of that auxiliary bound to all activities. [Review](sign/susceptibility_review.md). A further [positive alternating-path expansion](inequalities/matching_path_susceptibility.md) isolates the exact occupancy interval where longer paths must contribute; an abstract root law disproves a scalar-moment shortcut without being a matrix counterexample. [Path review](compound/matching_path_review.md). The required bounded-activity inequality and the full finite-matrix problem remain open. |
| C30, Chollet's conjecture | The [averaged-cofactor reduction](sign/chollet_cofactor_bridge.md) isolates an unproved lower bound; its upper bound is a deduction from Pate's published theorem. A [Fischer Gram order](inequalities/chollet_gram_order.md) gives a conditional reduction of a least-order counterexample to a singular correlation matrix. The [cofactor kernel calculation](compound/cofactor_scope_and_kernel.md) proves that the two relevant Gram matrices have the same kernel and exhibits an exact obstruction to a broader arbitrary-compound comparison. [Combined independent review](root/cofactor_structural_review.md). The required cofactor norm bound remains unproved; no full Chollet claim is made. |
| P13, Real van der Waerden radius | [A uniform local Hessian bound](inequalities/uniform_radial_permanent.md) proves $`b(n)\ge1/1000`$ for every order. It uses an [all-degree centered coefficient bound](sign/centered_permanental_coefficients.md). [Independent review](compound/uniform_radial_review.md) and [priority-search record](sign/centered_coefficients_priority.md). The exact radius remains undetermined. |
| C44, Zero-diagonal doubly stochastic minimum | [An explicit eventual theorem](inequalities/explicit_eventual_zero_diagonal.md) proves the conjectured minimum and uniqueness for every $`n\ge20\,000\,000\,000\,000`$. [Independent review](compound/eventual_zero_diagonal_review.md). A further [uniform Frobenius stability bound](inequalities/uniform_frobenius_stability.md) proves $`\log(\operatorname{per}A/d_n)\ge\|A-J_n\|_F^2/32\,000\,000`$ for every doubly stochastic matrix and gives explicit $`O(1/n)`$ squared-distance confinement. [Stability review](compound/uniform_frobenius_review.md). No unpublished confinement estimate is assumed. The remaining smaller orders prevent a full resolution. |
| C6, Monotonicity of normalized minimum permanents | [Strict descent in a fixed dense band](sign/c6_dense_barycentric_comparison.md) holds for every order with $`(n-k)/k\le1/4000000`$, with an explicit gap for the average over any complementary matching decomposition. [Independent review](root/dense_and_algorithm_review.md). The remaining degrees are untreated. |
| P18, Perron root of permanental compounds; P17 | [Explicit zero-one companion inputs have exponentially large Perron-root algebraic degree](compound/perron_algebraic_degree.md). The same note proves generic irreducibility of the compound characteristic polynomial in every nontrivial degree. [Independent review](root/perron_degree_review.md). The output-size obstruction applies to expanded minimal-polynomial coefficient lists; compact exact descriptions and approximation are not excluded. Neither listed algorithm problem is resolved. |

Each checkpoint has a companion exact-arithmetic checker in its directory.
These checks validate displayed algebra and implementations. They do not
replace the general proofs or count as additional conjecture resolutions.
The notes credit their classical inputs and leave priority unverified.

Two further [cofactor induction](sign/cofactor_derivative_obstruction.md)
and [signed-curvature](inequalities/chollet_signed_curvature.md) notes
close proposed shortcuts without resolving C30. The former gives an
arbitrarily negative genuine derivative remainder with explicit positive
compensation in the full matrix. The latter proves that the central
transposition energy is negative at every hypothetical negative averaged
gap, so that term has the wrong sign to exclude a negative minimum.
The [combined review](root/cofactor_structural_review.md#6-further-exact-boundaries)
checks both calculations and the exact projection-angle reformulation.

