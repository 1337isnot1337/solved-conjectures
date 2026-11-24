# Independent review of the block critical-point extension

Review by the alternate-PH agent, 23 November 2026. I derived the block selection argument independently, then read BLOCK_KKT_FINITE_EXISTENTIAL_EXTENSION.md in full. No mathematical gap was found. This is internal written review, not formal verification or external peer review.

## Hypothesis and exact scope

The reviewed statement concerns a finite challenge set, a polynomial number p of shared complex witnesses, at most q complex witnesses local to each challenge, and residual equations whose circuits depend only on the shared coordinates and their own local block. It also covers the displayed deterministic BSS verifier with an existential complex block after the finite Boolean universal block. It does not cover an arbitrary complex universal quantifier.

## Compactness and local component selection

Expanding all local witnesses is legitimate for existence because the challenge set is finite. It is not used as the final small incidence. In the global version, the nested-ball/Baire argument provides a real open input region with bounded full witness arrays. In the component version, a generic smooth point of an actual irreducible component, away from all other components and all inequation zeros, provides a local holomorphic witness section.

A product of one shared witness-output ball and separate local witness balls can be placed wholly inside that isolating neighborhood. Its finite product is compact, and all true sections remain strictly inside on a smaller input box. Small positive perturbations preserve the neighborhood. Thus limits of approximate maximizers satisfy every original residual on the intended component and have output f. Separate balls preserve the block support needed later.

## Generic regularity and block count

The generic-offset proof applies in the full finite-dimensional witness space, regardless of its large dimension. For each constraint subset, the bad critical-value set has proper algebraic closure by the characteristic-zero differential-rank argument. Generic positive offsets and radii in the permitted open intervals make each specialization nonzero. The leading-coefficient argument supplies one real input box and one punctured parameter interval on which all active gradients are independent.

Within a single block, all active gradients lie in a coordinate subspace of dimension N+Q, where N=2p+1 and Q=2q. Independence in the full space implies independence in that support. Hence a block has at most N+Q active constraints, even if it initially had arbitrarily many residuals.

## Whole-block compression

At a maximizer, stationarity in each local witness tuple gives a zero local covector. Each block's remaining shared contribution is a vector g_beta in R^N. Their sum, including the shared-ball vector when active, equals e_y. Linear algebra selects at most N whole block vectors spanning e_y.

Rescaling all multipliers in a selected block by one scalar preserves its local zero covector. The selected shared contributions retain exactly e_y. No positivity of the rescaled multipliers is required in the resulting complex algebraic incidence. This rescaling, rather than selecting arbitrary individual constraints across blocks, is the necessary step.

The retained system has polynomially many local witness coordinates, active equalities, and multipliers. All derivatives can be computed within their own shared-plus-local coordinate support. The discarded blocks occur in neither the equations nor their differential identities.

## Proper projected components and transfer

On every reduced irreducible component of every retained incidence, the weighted sum of active-equation differentials cancels all retained witness differentials and leaves dy plus terms in dx and dt. The coefficient of dy is one. Therefore every projected component has dimension at most n+1, including components unrelated to the original real maximizers.

This all-component property is enough for the finite-product hypersurface argument. Nondominant base images can be excluded on a smaller real box and punctured parameter interval. The maxima converge uniformly to f; consequently one projected hypersurface has a nonzero central equation divisible by y-f. Generic specialization preserves actual source components and dense domination of the hypersurface fibers. The previously reviewed degeneration and finite-branch Taylor-jet lemmas then apply.

## BSS path conversion

For each finite Boolean challenge, an accepting path has polynomial-sized numerator-denominator equations and inequations involving only the shared input and that challenge's local witness. Full assignments of these finitely many paths give basic constructible sets in the expanded witness space. A dense graph image selects an actual component of the corresponding equation variety. The inequations are all nonzero in a sufficiently small neighborhood of a generic point; exponentially many inverse witness variables are not introduced.

The proof therefore excludes polynomial-size verifiers of the displayed form for the permanent, conditional on the pinned border lower bound and the reviewed analytic lemmas. It does not prove the full complex BSS separation or any general all-multiple resultant lower bound.

I reread the final expanded Section 5. Its explicit active equations, shared stationarity, and separate local stationarity match the proof. With N=2p+1 and Q=2q, it retains at most K=N(N+Q)+1 multipliers, at most (N-1)+NQ+K witness coordinates, and at most K+N+NQ equations. The stated gate bound O(K(N+Q+1)(L+N+Q+1)) includes all active equations, derivatives, and multiplier sums. The final version also explicitly requires an actual irreducible component in Section 7 and includes the Boolean challenge length m in the verifier bound. These presentation clarifications are implemented; no mathematical correction was required.
