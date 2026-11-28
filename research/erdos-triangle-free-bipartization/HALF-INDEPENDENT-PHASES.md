# Complement-phase dispersion at a half independent set

This gives a quantitative obstruction to almost consistent proper colourings of the complement of a half independent set in [Erdős Problem 23](https://www.erdosproblems.com/23). Weights are arbitrary nonnegative product weights, with no bound on support order. It is not a theorem excluding all disconnected complements.

Normalize total mass to one. Let B>1/25 be the minimum unordered loss in a triangle-free weighted graph admitting a stationary law of optimum sign cuts (every vertex has expected monochromatic degree d=2B). Let X be independent of mass one half, and put Y=V minus X. Every cut in this law is proper on Y, by the [induced balance identity](INDUCED-OPTIMUM-BALANCE.md). Fix **any** proper sign assignment tau of Y, and orient each sample f of the law either way. Put F_f={y in Y: f(y) differs from tau(y)}, and define the attachment-edge disagreement

    eta = E_f e(X,F_f).

Then eta>1/100000. The comparison is weighted by attachment edges, not by the number of vertices, and no expansion hypothesis on Y is required. One can in particular choose orientations to minimize disagreement with tau. This includes the case of an exactly consistent law as eta=0, even if Y is disconnected.

## Derive approximate weighted Hall conditions

Write U,V for the shores of tau, with masses u,v, set m=max(u,v), t=e(Y), and W=uv−t. For each sample f retain its signs on X and substitute tau on Y. Split each vertex of X into false twins according to its probabilities of the two signs, obtaining parts R,S classified by whether their sign agrees with U or V, respectively. This preserves the minimum loss: a cut of the clone graph can be rounded by selecting one sign per original vertex with its clone proportions and preserving every edge's expected cost. Write A(x),C(x) for the attachment degree of each clone into the same and opposite tau-shore, respectively. Write ell(y) for the attachment degree of y into its same-sign part of X. Count all integrals in original masses, and put M=integral_X A=integral_Y ell and K=integral_X C.

In any old optimum the loss at an individual x in X is the smaller of its two attachment degrees. That smaller degree changes by at most d_(F_f)(x) under substitution of tau. If m_tau(x) denotes the smaller attachment degree with tau, it follows that

    |m_tau(x)−d| ≤ E_f d_(F_f)(x).

The actual adjusted degree A can exceed m_tau by at most 2 d_(F_f)(x), and C≥m_tau. Old and adjusted degrees integrated on Y differ in absolute value by at most eta, since only the incidence to F_f changes. Thus

    integral_X |A−d| ≤ 3 eta,
    integral_X (d−C)_+ ≤ eta,
    integral_Y |ell−d| ≤ eta,
    |M−B| ≤ eta.                                          (1)

For R and U, define h_1 as the sum of their two integrated same-link degree errors in (1), divided by d. Define h_2 for S,V analogously. Then h_1+h_2≤4 eta/d and |mass(R)−u|≤h_1, |mass(S)−v|≤h_2, simply by counting the same-link masses twice. For y in V, N_R(y) sends all its U edges outside N_U(y) by triangle-freeness. Comparing its degree lower bound to the incoming upper bound of that available U mass gives d_R(y)+d_U(y)≤u+h_1. The symmetric bound holds for y in U. Integrating gives

    e(R,V) ≤ W+v h_1,    e(S,U) ≤ W+u h_2.

If u=m, the first left side is at least d(u−h_1)−eta by (1); if v=m, use its symmetric version. Consequently, with the smaller shore at most 1/4,

    K ≥ B−eta,    K ≤ 2W+4 m eta/d,
    W ≥ d m − eta − (1/4+d)4 eta/d ≥ d m−17.5 eta.          (2)

## A rooted cut and exact margins

Let L=d_X and J=d_Y on Y. Each degree of the whole graph is at most one half by stationarity and triangle-free neighborhoods. In the cut separating X from Y the loss is t, so t≥B. Flipping any subset of the independent shore U, or of V, bounds each shore's contribution to the integral of (J−L)_+ by t−B. Since integral_Y L=M+K and integral_Y J=2t, it follows that integral_Y (L−J)_+≤M+K−2B.

The Hall bounds above give L+J≤d+m+kappa on Y, where kappa=(ell−d)_+ plus h_1 on V or h_2 on U. Its integral is at most eta+4m eta/d. Using 2L≤d+m+kappa+(L−J)_+ and L≤1/2 gives

    4 integral_Y L² − 2 integral_Y LJ
      ≤ (d+m)(4K−d+4 eta) + 2 eta+8m eta/d.               (3)

Indeed the left side is 2 integral L²+2 integral L(L−J). The first term is bounded by multiplying the pointwise bound on 2L by L; for three resulting copies of L(L−J)_+ use L≤d+m+kappa and (L−J)_+≤1/2.

Now use the [rooted quadratic cut](EQUITABLE-THREE.md): choose a root from X in its normalized probability measure, colour its Y-neighborhood plus and the rest of Y minus. For another independent X draw let P be its attachment into plus and D=A+C its full degree into Y. Give it a sign of mean (D−2P)/D; the case D=0 incurs zero loss. Averaging gives loss t+4 integral L²−2 integral LJ−E[P²/D]. The [mixed inverse-degree argument](HALF-INDEPENDENT-CORE.md) with Q=E[AC] and H=E[AC(A+C)] gives

    E[P²/D] ≥ 4 Q³/(W H),                                 (4)

using that the product of the two shore attachment indicators is supported on the missing U–V pairs. The expectations here and below are in the normalized X measure. The positive lower bound on Q below guarantees positive denominators.

Assume eta≤.00001. Equations (1)–(2), t>.04, W=uv−t, and u+v=.5 give

    m<.276,  d<.086,  t<.0427,  W<.0225,
    .03999≤K≤.04514.

For example t≤m(.5−m−d)+17.5 eta; the right side is below .04 at m=.276 when d≥.08, and decreases for larger m. The same inequality yields t≤.0625−d/4+17.5 eta≤.042675. Since d=2B and the cut X versus Y pays t, we get d≤2t<.086. Substitute these constants in (3), obtaining an upper bound .362(4K−.08)+.000311.

To lower-bound (4), by (1) we have Q≥2dK−6m eta≥.16K−2 eta≥.0063784. For comparison replace A by d and C by C_*=max(C,d), writing the resulting moments as Q_*,H_*. The expected absolute directional changes are at most 6 eta and 2 eta, respectively. Since all variables being compared are at most m, expanding the products (or integrating the first derivatives) gives

    |Q−Q_*|≤2.208 eta,  |H−H_*|≤1.829 eta.

The bounds d≤C_*≤m and E[C_*]≤2K+2 eta imply

    H_*/Q_* ≤ 2d+m(1−d/(2K+2 eta)) < .204.

Indeed use C_*²≤(m+d)C_*−md, as in the exact fixed-phase proof. Consequently H/Q<.204+(1.829+.204*2.208) eta/.0063784<.208. Formula (4) then gives E[P²/D]≥21.6 K², by comparing 4(.16−.00002/.03999)²/(.0225*.208) to 21.6. Thus

    B < .0427 + .362(4K−.08) + .000311 − 21.6 K² < .038.

The quadratic is decreasing for K≥.03999 and its value at .03999 is less than .038. This is a contradiction.

## The dominant component must be genuinely but not too far from spanning

For a finite support, let the largest component of Y have mass .5−r. Since t>.04 and each component has at most one quarter its mass squared in edges, the largest exceeds .25, and t≤[(.5−r)²+r²]/4 forces r<.118. Normalize the optimum law so its orientation on the largest component is fixed. Choose tau on every other component by its majority orientation under that law. This gives eta≤e(X,Y outside the largest component)/2≤r/4. Therefore r>1/25000.

Conversely, let W_1 be the missing pair mass between the two shores of the largest component. Its internal edge mass is at least t−r²/4, since the rest has at most r²/4 edges. Hence W_1≤.0225−.25r+.5r². Each x in X has a cheaper attachment to this component of at most sqrt(W_1), since the two opposing attachment sets determine a missing rectangle. Choose signs for X to minimize their cost to the properly coloured largest component. Orient every other component by a fair sign, cutting all of its internal edges. The whole expected loss is at most sqrt(W_1)/2+r/4. For .114≤r<.118 this is at most .04: after squaring the nonnegative right-hand side .08−r/2, the equivalent bound is .0161−.17r+.25r²≤0, negative at .114 and decreasing throughout this interval. Contradiction. Thus every hypothetical half-independent stationary counterexample has

    1/25000 < r < 57/500.

The structural phase-dispersion statement is stronger than the lower restriction on r: an arbitrarily large disconnected complement still fails if its orientations can be aligned at sufficiently small attachment-edge cost.

The scalar comparisons are reproducible with [verify_half_independent.py](verify_half_independent.py).
