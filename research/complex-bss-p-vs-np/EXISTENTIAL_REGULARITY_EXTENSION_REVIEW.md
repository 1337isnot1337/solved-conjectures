# Independent review of the existential regularity extension

Reviewed file: [EXISTENTIAL_REGULARITY_SAMPLING_EXTENSION.md](EXISTENTIAL_REGULARITY_SAMPLING_EXTENSION.md), Sections 1–8, 23 November 2026 (America/Chicago).

Result: no gap found in the written argument under the project's separately reviewed KKT, local-branch jet, and graph-degeneration lemmas. This is an internal mathematical review, not formal verification or a novelty claim. The result is an obstruction to a proposed certificate class, not the HN_C separation.

## 1. Projective sampling

The parameter dimension is correct. The family of coefficient vectors of B(a,epsilon*u) is parametrized by P complex coordinates a and one coordinate epsilon. Its projective image closure therefore has dimension at most P+1. The degree D may be enormous but does not enter this dimension bound.

For a nonzero projective polynomial, the set of simultaneous scalar evaluation roots is finite or empty. The root-incidence dimension argument therefore supplies P+2 common evaluation points avoiding every projective limit polynomial in that closure. A finite union of such closures for the finitely many query families causes no change in the count.

Using the projective closure, rather than only the raw circuit image, is necessary for the uniform estimate. Its affine cone intersected with the unit coefficient sphere is compact. The evaluation maximum has no zero there, so it has a positive lower bound. The resulting constant can be arbitrarily large; the proof needs only that it is finite for each fixed input size. No effective conditioning or uniform construction is claimed.

The coefficient estimate is valid for moving parameters. If each sampled value is O(epsilon^k), the coefficient of u^j in B(a_epsilon,epsilon*u) is O(epsilon^k). That coefficient is epsilon^j b_j(a_epsilon). Thus b_j(a_epsilon) tends to zero for every j<k. This remains true when the input coordinates move together with the witness coordinates. For k=D+1 every coefficient vanishes in the limit.

## 2. Path and order selection

For a fixed resource bound, each query's possible orders form a finite set, with infinity represented by the cutoff degree+1. These finitely many order strata are constructible even though no efficient expansion of their coefficient equations is available. Selecting one dense accepting path and one dense exact-order stratum is therefore valid.

After all lower-coefficient equations are imposed, the exact-order stratum is an open subset of their common zero set. Its closure is a union of actual irreducible components. Soundness places the projected image in the graph, and density selects an actual component dominating that graph. This step does not mistake a proper subvariety of a component for a component.

Input denominator guards and the nonzero leading coefficients are retained. Ambient zero polynomial families may be omitted; a specialized zero polynomial is instead enforced by the cutoff degree+1. The order bounds have logarithmic size O(S), including that last case.

## 3. Local compact witnesses and varying inputs

At a generic smooth point of the selected component, the projection to x is smooth and supplies a local holomorphic witness section. The permissible x-image contains a complex open set and therefore meets real x-space. Since f has real coefficients, y=f(x) is a real optimization coordinate on that real box.

The nonzero coefficients used as guards need not have small circuits. Their continuity at the selected point is enough to choose a product neighborhood consisting of a real input box and a closed ball in the real coordinates of (y,c). All guards remain nonzero throughout that whole product. Shrinking the box keeps the true section strictly within an inner ball; the final radius may vary in a nonempty interval without losing these properties.

This is the correct way to prevent denominator-zero limits. A scaled lower bound alone would fail: Q_c(u)=c with c_epsilon=epsilon^a has nonzero normalized values while its limiting polynomial is zero. The fixed local neighborhood in the reviewed proof excludes that phenomenon by keeping the actual selected leading coefficient nonzero.

For any feasible sequence with epsilon tending to zero, input coordinates tending inside the box, and witnesses converging in the ball, projective sampling forces all required lower coefficients to vanish. The nonzero guards survive. Hence the limit follows the accepting path and has y=f(x). No globally bounded choice of witnesses is assumed.

## 4. Scaled constraints and generic LICQ

True witnesses make B_j/epsilon^(k_j) bounded at each fixed sample, uniformly over a smaller compact input box. Independent constants C_(j,i) can therefore be chosen in nonempty real open intervals above the needed bounds. The ball constant has its separate allowed radius interval.

On epsilon nonzero, the scaled map in Section 5 is algebraic and has identity differential on the base (x,epsilon). Failure of full rank is precisely dependence of its witness gradients. Characteristic-zero differential rank puts its critical values in a proper algebraic subset. This includes active sets larger than the witness dimension, whose whole image is already lower-dimensional.

There are finitely many active subsets. Generic positive choices of all level constants and the permitted radius keep each selected bad-value polynomial nonzero after specialization. Removing its lowest epsilon power leaves a nonzero coefficient polynomial in x. A smaller real box can avoid these finitely many polynomials. It is valid to choose this smaller box after fixing the constants, because the earlier witness and guard properties hold throughout the larger box.

The resulting LICQ statement is uniform over every feasible point in the smaller box for all sufficiently small positive epsilon. No infinite-constraint optimization theorem is needed: projective sampling has reduced the system to finitely many ordinary polynomial inequalities.

## 5. Critical incidence and bounds

The unscaled active equations F_i=C_i epsilon^(2k_i) and the normalized objective-gradient equations are correct. Their multipliers absorb the scaling factors. Powers of epsilon cost O(log(k_i+1)) gates, so no exponential coefficient list appears.

With N=2p+1 real witness-output coordinates and at most N active constraints, the counts are correct:

```math
r_\Gamma\le2N-1,\qquad q_\Gamma\le2N.
```

The stated C*N^2*(S+n+p+q+1) shared-circuit bound is safe for active evaluations, first derivatives, repeated powers, and all stationarity equations. The number of possible active subsets is used only in a finite existence argument; their systems are not combined into one circuit.

On every reduced complex incidence component, differentiating active equations and weighting by the multipliers yields a relation with dy coefficient one. Therefore the projected field generated by (x,epsilon,y) has transcendence degree at most n+1. This argument does not require the component to contain real feasible points.

## 6. Projected graph factor and generic fibers

The finite product over nondominant base-image equations and dominant projected hypersurface equations vanishes on every maximizing output. Every selected factor has a nonzero epsilon-zero specialization after removal of its scalar epsilon power. The limiting graph identity therefore selects a dominant projected hypersurface whose central polynomial contains y-f(x).

The actual-component specialization argument is valid. A distinct original incidence component meets the selected component in a proper closed subset. Its generic epsilon fiber has lower dimension, so it cannot swallow an irreducible component of the selected generic fiber. Components vertical over epsilon affect only finitely many values. Generic fibers of the selected component have the stated pure dimension.

The dense incidence image contains an open subset of the projected hypersurface. Its complement likewise cannot contain a full generic hypersurface fiber component. Thus generic points of the root-cluster sheets lift to actual components of the specialized small incidence. This is sufficient for the local jet argument; the proof does not assume that every boundary point of the whole hypersurface has an existential lift.

The fixed-polydisc root-cluster and moving-center jet limits then give the claimed polynomial border bound.

## 7. Scope

The argument genuinely allows independent existential circuit parameters. Its conclusion remains restricted to finite verifiers with Boolean univariate regularity/value queries and ordinary charged arithmetic; no query returns an algebraic witness or an arbitrary coefficient. The real-coefficient hypothesis on f covers the permanent.

The consequence is asymptotic: the imported permanent lower bound eventually exceeds the fixed polynomial border upper bound. The argument does not claim that regularity lies in PH_C, that HN=P supplies integral or approximate witnesses, or that arbitrary continuous universal quantifiers can be removed. Those remain separate tasks.
