# Review of recursive finite prefixes and restricted continuous sampling

Internal written review by the alternate-PH agent, 23 November 2026. Both full notes were read. No mathematical gap was found. This is not formal verification or external peer review.

## Recursive critical incidences

In TREE_KKT_FINITE_PREFIX_EXTENSION.md, the target covector at a node includes every ancestor coordinate. Its own and descendant witness coefficients vanish, but its strict-ancestor coefficients need not vanish. The induction preserves that whole target covector. Rescaling an entire retained child subtree preserves every internal zero stationarity equation. Subsequent compression inside that child preserves its already scaled ancestor contribution, so it cannot undo the parent's normalization. At a leaf, all active gradients have support on one ancestral path and can be selected directly to span its target covector.

The full accepting-path expansion preserves tree support: a leaf reads precisely its earlier existential witnesses and challenge prefix. Inequations can be maintained in an isolating neighborhood of an actual irreducible component. Separate node balls preserve the same support. No global arithmetic representation of the witness strategy is assumed.

I checked the bounds K<=product_j A_j<=A^(k+1) and R<=A^k sum_j 2p_j<=A^(k+1). I requested the explicit pruning now added: remove any node with no selected constraint at or below it. Each retained coordinate then lies on the path of a selected constraint, also giving R<=KA. This justifies the shared gate bound O(KA(L+A+1)) without an extra unabsorbed R term.

The component differential relation, finite-product central-factor selection, generic specialization, and analytic transfer are the previously reviewed arguments with the displayed retained-system sizes. A fixed polynomial analytic overhead gives the asserted basic-resource bound raised to C(k+2), with an absolute C. Hence polynomial-resource finite-universal permanent protocols with k=o((log m)^(1/3)) are excluded under the imported lower bound. This excludes that format; it does not construct a protocol or separate P_C and NP_C.

## Continuous nondense-fiber sampling

In CONTINUOUS_NONDENSE_FIBER_SAMPLING.md, the set of nonfull parameters is constructible by projection of the complement. For ell=P+1, the bad-sample incidence has fiber dimension at most ell(r-1), hence total dimension at most ell*r-1. Its projected closure is proper, giving one generic sample tuple valid simultaneously for every preceding parameter. The proof correctly includes all input and earlier witness coordinates in P and makes no effective construction claim.

The projective existential case has closed fibers because the equations are homogeneous and define a closed projective incidence. The affine encoding with one normalization dot product per projective witness has exactly the stated witness, equation, and gate counts. Open-chart conditions must remain excluded.

The fixed-depth iteration is sound under its stated hypothesis. The whole inner truth relation must have nondense nonfull fibers at each eliminated block. Positive polynomial equalities, finite positive combinations, projective existential projection, and universal intersections provide the stated sufficient closedness syntax. General affine existential witnesses do not.

The graph example y=0 iff for every z there exists u with y((z-y)u-1)=0 is exact. Its false fibers omit the moving point z=y, so any fixed finite tuple misses some false parameter. Its projective homogenization admits [u_0:u_1]=[z-y:1] for every y,z, including the point at infinity at z=y, and therefore changes the truth set to all y. The note correctly limits this counterexample to fixed samples independent of the preceding parameters; adaptive parameter-dependent sampling is not refuted.

Both notes preserve the distinction between finite universals, restricted continuous universals, and arbitrary complex universal quantifiers.
