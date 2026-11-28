# Erdős's triangle-free bipartization conjecture

## The degree-floor bound persists under small errors

A qualitative, uniform stability consequence for [Erdős #23](https://www.erdosproblems.com/23). No assumption on graph order is needed. The tolerance below is not explicit.

Let B(W) be the minimum unordered missed mass of a mass-one graphon W. For an actual sign cut f, let m_f(x) be its missed degree and put a_f=d_W−2m_f. For every rho>0 there is eta>0 such that the following four conditions imply mass(T)<539/1000+rho:

1. W has triangle density at most eta.
2. B(W)>=1/25−eta, and f has missed mass at most B(W)+eta.
3. The integral over the marked measurable set T of |d_W−4B(W)| is at most eta.
4. The integral over T of |a_f| is at most eta.

In particular, for every rho>0, when eta is sufficiently small, a stationary triangle-free graphon with B>=1/25 has less than 539/1000+rho of its mass within eta of degree 4B. This is not a bound on the full degree distribution away from the floor.

### What the exact argument needs

In the [exact degree-floor moment argument](DEGREE-FLOOR-SWITCHING.md#sharper-missing-pair-bound-retain-the-missing-degree-moments), the cut can be a single optimum, not drawn from a stationary law, provided a_f=0 and d_W=4B on the marked T. T can be a subset of the overall degree-floor locus. The use of the law in the exact proof is only to obtain these conditions for one cut at a globally maximizing graphon.

The argument applies to any triangle-free [0,1]-valued W. Its positive neighborhoods, meaning the sets where the kernel is positive, are independent for almost every root by the nonnegative triangle integral. A countable collection of positive neighborhoods covers the positive-degree region almost everywhere, and their successive differences give an independent partition there. Any isolated points have zero fields and no edges and can be ignored in the localization. Apply the opposite-shore independent switching inequality and the countable dense family argument in the exact note; boundedness by one suffices when approximating a neighborhood subset in L1. This shows no crossing edge lies within T and gives d_T<=d_S−2m_(S,f) pointwise, exactly as before.

For the moments, define missing mass with kernel 1−W between the two signs on S. The triangle-free property ensures that if W(y,z)>0 then their common-neighbor integrand W(x,y)W(x,z) vanishes almost everywhere in x. The weighted product count is therefore supported on pairs with W(y,z)=0, where the missing kernel is one. The count can be bounded above by integrating against 1−W over all pairs as in (8), since the degree bounds used there are nonnegative. Inside a same-shore edge the two opposite-neighborhood degrees sum to at most the opposite shore mass, because the two supports are disjoint. The rest of (8)–(9) uses only Mantel, algebra, and the identities d_W=4B and a_f=0 on T. The lower bound s>=2 sqrt(B) follows from C_S>=B without any other assumption on W. Thus the exact theorem with a marked T holds for these possibly fractional cut-distance limits too.

### Compactness with the cut and degree-floor marks intact

If the stability statement fails, take eta decreasing to zero. Retain the four measurable colour classes formed by membership in T and the sign of f. The compactness of the [finite-coloured graphon cut metric, Grebík–Pikhurko Theorem 7.1](https://pikhurko.github.io/E/GrebikPikhurko26ejp.pdf) yields a subsequence with kernels converging in cut norm after measure-preserving alignments and with the four class indicators converging in L1. Therefore T converges in measure to a marked set, and the reference signs converge in L1 to actual signs on the limiting graphon.

Triangle density and B are cut-continuous. For the latter, the missed cost on a fixed cut is one half the sum of two cut-norm rectangles, so the change is bounded uniformly in the cut. Taking infima proves continuity without needing a priori attainment. The missed mass of the marked cut also converges: changing its sign sets on a small-measure region costs at most that region's measure on a bounded graphon. Consequently the limit is triangle-free, has B>=1/25, and the retained cut is optimum.

For the degree integrals, if U is a bounded kernel difference and A is any measurable set, then

    || integral_A U(.,y) dy ||_1 <= 2 ||U||_cut.

Split the x integral into the nonnegative and the negative regions to see this. The degree function thus converges in L1. A signed field Wf is the difference of two such set integrals, and the change due to varying f is bounded in L1 by its own L1 change. Hence the signed cut penalties a_f=−f(Wf) converge in L1 too. The last two hypotheses imply d_W=4B and a_f=0 almost everywhere on the limiting T. But mass(T) is at least 539/1000+rho, contradicting the exact marked theorem. The same argument actually proves the uniform conclusion mass(T)<539/1000 for some eta>0, since any limiting mass at least 539/1000 contradicts the strict exact theorem.

For the stationary application, take T where |d_W−4B|<=eta. The first-order penalties are nonnegative and their expected value is d_W−4B. In particular d_W>=4B. Averaging spatially over T, some optimum cut in the law has integral_T a_f at most eta, or at most 2eta if one instead chooses a convenient approximate witness. Apply the uniform theorem with the correspondingly smaller initial tolerance. This step does not require passing an entire law of cuts to the limit.

This stability result is a restriction on potential counterexamples, not a proof that such counterexamples must put enough mass near the floor to contradict it.

### Near-maximizers without a stationary cut law

Write B* for the triangle-free supremum. For sufficiently small eps>0 and gamma>0, every triangle-free W satisfying b=B(W)>=B*−eps² has

    mass{ x : |d_W(x)−4b|<=gamma } < 539/1000.

The tolerance is again qualitative. The point is that no stationary cut law or saturation is assumed. A single targeted weight perturbation supplies the nearly optimal, nearly zero-field cut that the marked compactness theorem needs.

For the marked set T in the display and t=mass(T), reweight vertex measure by density 1+eps(t−1_T). It is strictly positive and has integral one. The resulting graphon, represented on its reweighted probability space, remains triangle-free, so its optimum is at most B*. Pick an actual cut with reweighted cost at most B*+eps²<=b+2eps². Let C be its original missed mass, C_T its original missed mass inside T, and I=integral_T m_f. Multiplying the two endpoint factors in every missed edge yields the exact identity

    C_reweighted=(1+eps t)^2 C − eps(1+eps t) I + eps² C_T.

One has C>=b and C_T>=0. Hence I>=2bt−(9/4)eps, using b<=1/4 from a fair cut. This gives integral_T a_f<=gamma+(9/2)eps. The reweighting density is at least 1−eps, so C<=(b+2eps²)/(1−eps)^2 and C−b<=2eps for eps<=1/4, again using b<=1/4.

To control the absolute value, let h=(−a_f)_+. Switching an independent set of vertices with negative penalty decreases missed cost by the integral of h there, which can be at most C−b. For almost every root its positive neighborhood is independent. Test its negative-penalty subset, and average over roots; this gives integral d_W h <= C−b, because the inclusion probability at x is at least d_W(x). On T the degree is at least 1/10 when eps and gamma are sufficiently small: b>=1/25−eps² by the balanced pentagon lower bound on B*. Thus integral_T h<=10(C−b)<=20eps. Finally

    integral_T |a_f| = integral_T a_f + 2 integral_T h
                    <= gamma+(89/2)eps.

The hypothesis on degrees gives integral_T |d_W−4b|<=gamma. The preceding compactness theorem now applies, with each error tending uniformly to zero as eps and gamma do. The result covers near-maximizing weighted finite graphs of arbitrary order by their step-graphon representations.

The same reweighting gives a degree-tail statement. For every 0<eps<=1/4 and b>=B*−eps²,

    integral (4b−d_W)_+ <= (9/2)eps + 2 sqrt(2eps).       (10)

Indeed take T={d_W<4b} in the reweighting argument (which did not use the definition of T to obtain I>=2bt−(9/4)eps and C−b<=2eps). With h=(−a_f)_+ one has h<=d_W. Split at degree sqrt(2eps): the low-degree portion of integral h is at most sqrt(2eps), and the higher-degree portion is at most (C−b)/sqrt(2eps)<=sqrt(2eps) by the neighborhood switching estimate. From integral_T a_f>=−integral h and the bound on I, rearrange to obtain (10).

Consequently there is a fixed gamma>0 such that for every tau>0, all sufficiently near-maximizing triangle-free graphons have at least 461/1000−tau of their mass at degrees strictly higher than 4b+gamma. Choose gamma from the uniform near-floor bound. By (10) the mass at degrees less than 4b−gamma tends uniformly to zero as b approaches B*. Remove that set and the near-floor set, whose mass is strictly below 539/1000. This does not say how large gamma is or force the high-degree region to belong to a known solvable class.

### Stronger low-tail estimate by removing small marked sets

There is a sharper estimate than (10) that does not require a perturbed cut. Set Delta=B*−b. For any measurable A of mass r, cut its complement optimally and use fair signs on A. In graphons this can be expressed using the relaxed sign f=0 on A and approximating it weakly by actual signs, as in the stationary construction. All edges incident with A then contribute half their mass, at most half the integral of d_W over A. Hence

    b <= B*(1−r)^2 + (1/2) integral_A d_W
    integral_A (4b−d_W) <= 2 Delta (1−r)^2 + 2 b r².     (11)

In the atomless graphon representation, partition the low tail {d_W<4b} into sets of mass at most sqrt(Delta). There are at most 1/sqrt(Delta)+1 nonempty sets after grouping to full mass except the last. Sum (11) and use the fact that the sum of the squared masses is at most sqrt(Delta). This gives the explicit improvement

    integral (4b−d_W)_+ <= (2+2b) sqrt(Delta)+2 Delta.

At Delta=0 the same conclusion follows by arbitrarily fine partitioning. For a fixed gap gamma>0 and b>0, if Delta<gamma²/(16b), the mass where d_W<=4b−gamma is at most 4 Delta/gamma: choose A there of mass equal to the smaller of its full measure and gamma/(4b). The quadratic term in (11) is then at most gamma r/2, so r<=4 Delta/gamma. The strict assumption on Delta shows r must be the full measure. This stronger estimate leaves unchanged the qualitative size of the upper degree gap obtained by marked compactness.
