# Erdős's triangle-free bipartization conjecture

## Switching at the degree floor

A necessary structural condition for the saturated extremizer in [Erdős #23](https://www.erdosproblems.com/23). This is not an all-graph proof.

Use total vertex mass one and unordered edge masses. Let B be the minimum missed mass and let W be the zero-one triangle-free extremizer from the [stationary law construction](SATURATED-GRAPHON-EXTREMIZER.md). Thus d(x)>=4B almost everywhere, and its common law of optimum signs f has expected missed degree 2B at almost every vertex. Write M for W times the probability of a missed edge in this law, and put T={x:d(x)=4B}, S=T^c.

Then:

1. Almost every edge inside T is missed by almost every cut in the common law.
2. More generally, for almost every y,
   
       2 integral_T (W−M)(x,y) dx <= d(y)−4B.              (1)

3. For almost every optimum sign in the law and almost every y, let d_S(y) and m_(S,f)(y) be its original and missed degrees into S. Then

       d_S(y)−2m_(S,f)(y) >= d_T(y).                      (2)

In particular the original degree into S is at least that into T. The conclusion is local to each vertex. It is not obtained merely by bounding the total cost of a cut.

### Proof

For any optimum sign f put a_f(x)=d(x)−2m_f(x); this is nonnegative almost everywhere by the first-order optimality condition (or by switching an independent neighborhood subset). In the common law E a_f(x)=d(x)−4B, so for almost every f, a_f vanishes almost everywhere on T. Fix such a cut. For X and Y independent, lying on opposite f signs, switch all their vertices. Changing each side separately would increase the missed mass by integral_X a_f + integral_Y a_f. This sum counts the cost of each crossing X–Y edge twice, when in fact switching both ends leaves its status unchanged. Therefore optimality implies

       2 e(X,Y) <= integral_X a_f + integral_Y a_f.       (3)

For any independent X in one sign of T, its first term on the right is zero. Inequality (3) for every independent Y on the opposite sign says a_f(y)>=2d_X(y) there almost everywhere: otherwise take a positive-measure piece of its strict violation inside one of the countably many independent partition classes from the saturation proof.

To let X vary with y, first take a countable L1-dense family among all characteristic functions of independent subsets of the given sign of T. Such a family exists because L1 is separable and every subspace of a separable metric space is separable. Discard the union of the resulting exceptional null sets of y. For each remaining y, the neighborhood subset of T on the sign opposite to y is independent, since almost all neighborhoods are independent. Approximate that characteristic function by the countable family. Because W<=1, the integrals against W(y,.) converge. This proves, simultaneously for almost every y,

       2 integral_T W(y,x) 1_{f(x)!=f(y)} dx <= a_f(y).   (4)

The two sign choices use two countable families. For y in T the right side is zero, so the first conclusion follows. Averaging (4) gives (1), by Fubini and the jointly measurable representatives of the optimum signs. Finally, move the left side in (4) to the right and cancel the contributions of missed neighbors in T. The resulting inequality is (2).

In fact (2) means that if the optimum signs on S are held fixed, changing the signs on T arbitrarily cannot create a beneficial single-vertex flip at a vertex of S: its signed excess of crossing edges into S already dominates its entire degree into T. It does not assert optimality against many flips on S at once.

### Robust aggregate form near the floor

For every measurable region A, let X(A) denote the unordered mass inside A of crossing edges in the common optimum law. Let delta=ess inf d>0. Then

    X(A) <= (1/(2 delta)) integral_A (d−4B).               (5)

In particular, if d<=4B+eta on A, its internal crossing mass is at most eta mass(A)/(8B).

To prove (5), fix an optimum sign f. Independently sample a uniform root and a uniform threshold in [0,1] for each of the two f signs. In each sample keep the intersection of its root neighborhood with A on its own sign, restricted further to points for which the threshold is at most delta/d(x). Each resulting set is independent. The marginal inclusion of each point on its sign of A is exactly delta, and choices on opposite signs are independent. Apply (3) and average over those choices. The left becomes 2 delta² times the internal crossing mass of A for f. The expected right is delta integral_A a_f. Now average over f and divide by delta². This proof works uniformly for graphons, not only for an atomic cut.

### Mass and density constraints on the floor locus

Let t be the mass of T and let e_T, e_S denote the unordered edge masses induced by T and S. The conclusions above imply

    e(T,S) = 4Bt−2e_T,
    expected missed mass in S = B(1−2t)+e_T,
    e_S >= 2B(1−t)+e_T.                                (6)

The first identity integrates the degree on T. For the second, missed degree 2B on T counts its internal edges twice; those edges are all missed. For the inequality, integrate (2) over S and substitute the two identities. In particular e_T>=B(2t−1). If t>=1/2, (6) then gives e_S>=B, while the triangle-free Mantel bound gives e_S <= (1−t)^2/4. Therefore any counterexample has t<3/5: if t<1/2 this is immediate, and otherwise 1−t>=2 sqrt(B)>2/5.

There is also an upper control e_T<=2Bt². To see it, choose optimal cuts of the two induced regions independently, then flip one sign at random. The expected cost is at most beta(T)+beta(S)+e(T,S)/2, where beta uses the original masses. Global extremality bounds beta(T)<=Bt² and beta(S)<=B(1−t)² by renormalization. Substitute the first formula in (6) and compare with B. Approximating the induced infima suffices if no cut attains them. This last upper control needs only global extremality and the value of the degree integral on T.

If T is independent, a further exact simplification holds: the restriction of almost every stationary optimum f to S is already optimum for W[S], with cost B(1−2t). Indeed all T vertices have zero field for f and have no edges inside T, so the missed mass on T–S equals half its edge mass. After changing the cut on S, independently putting each T vertex on its better sign never charges more than that same half. Thus any improvement on S would improve f. This special case also implies t<=1/2.

### Triangle-free strengthening through missing cross pairs

Put s=1−t. If t>0, the floor locus in a global extremizer also satisfies

    s²/4 − B >= 8B² s/(s+8B).                          (7)

In particular at B>=1/25 it has mass strictly less than 17/30, improving the crude 3/5 bound. The estimate uses only relations at the exact degree floor; (5) is the separate near-floor assertion.

Fix an optimum f from the stationary law as in the pointwise proof. Write S+, S− for its two signs on S, with masses s+,s−. Every point x of T has missed degree and crossing degree both exactly 2B. All its crossing degree goes to S. Thus its two degrees into S have product 2B(2B−d_T(x)), regardless of its sign. Each pair of one neighbor on each side forms a nonedge of W[S], by triangle-freeness.

Let C_S be the unordered crossing mass in S, and D=s+ s−−C_S the mass of its missing cross pairs. In this particular cut its missed mass in S is B(1−2t)+e_T, not just on average: the degree of every x in T is 4B and its field vanishes. Integrating (2) over S gives

    2(C_S − [B(1−2t)+e_T]) >= e(T,S) = 4Bt−2e_T,

so C_S>=B. Consequently D<=s²/4−B. Also (2) gives d_T(y)<=d_S(y)−2m_(S,f)(y), at most the mass of S on the opposite sign. Any missing pair y in S+, z in S− therefore has common-neighbor mass in T at most min(s+,s−)<=s/2.

Count the same neighborhood products over x in T and interchange the integral with that on S+ × S−. It follows that

    4B(Bt−e_T) <= (s/2) D.

By (6) and Mantel, e_T<=s²/4−2Bs. If D0=s²/4−B, the last inequality gives (s/2)D0>=4B(Bs−D0), which is exactly (7). In particular s>=2 sqrt(B), so s>=2/5 if B>=1/25. The right side of (7) increases with B, and its left side decreases with B. For B=1/25, the difference of the two sides is strictly increasing for 2/5<=s<=13/30: its derivative is s/2−8B²·8B/(s+8B)^2>0 there. Its value at 13/30 is negative. This proves s>13/30, hence t<17/30.

### Sharper missing-pair bound: retain the missing-degree moments

In fact, when B>=1/25, the floor mass is strictly less than 539/1000. The following refinement was proposed in a background research pass and independently checked before inclusion.

Suppose otherwise, so 2/5<=s<=461/1000 by (7). Fix the same optimum cut. Write m for its missed mass in S, C for its crossing mass in S, u=s+ s−, D=u−C, and ell=min(s+,s−). As above C>=B, m=B(1−2t)+e_T, and the integrated product of the two S-shore degrees over T is 4B(Bs−m). For y on either shore let a(y) be its missing degree into the opposite S shore. By (2) the degree into T is at most the opposite shore mass minus a(y) minus the missed degree m_S(y). In particular the T-codegree of a missing cross pair is at most the arithmetic mean of the two resulting bounds. Integrating over missing pairs gives

    4B(Bs−m) <= (s/2)D − (s/(2u))D² − (ell/2)m.          (8)

Indeed the two terms in the integral of a(y) contribute the sum of their integrals of a², at least D²/s+ + D²/s− = sD²/u. On a same-shore edge the endpoints have disjoint opposite neighborhoods, so the sum of their missing degrees into the opposite shore is at least that shore's mass. Integrating over same-shore edges gives an integral of a(y)m_S(y) at least s− times the missed mass on S+, plus s+ times that on S−. This is at least ell m. Both shores have positive mass since C>=B.

Set u0=s²/4 and D0=u0−B. Mantel gives m<=D0. Since u<=u0<2B and D<=u−B, the first two terms of the right hand side of (8) increase with D on that interval and are at most (sB/2)(1−B/u). Also 4B−ell/2>0. Write r=s/2−ell, so u=u0−r² and 1/u>=1/u0+r²/u0². Substitute m<=D0 after moving its term to the right and obtain

    4B²s <= (sB/2)(1−B/u0) + (4B−s/4)D0
                  + (D0/2)r − (sB²/(2u0²))r².

Completing the square bounds the last two terms by D0²u0²/(8sB²). Substitute x=u0/B−1 and divide by B² to get the scalar condition

    4s <= 4x + J(x)/s,    J(x)=x−x²+x²(1+x)²/8.          (9)

On the stated range, 0<=x<=52521/160000<1/3. There J is increasing by J'(x)>=1−2x>0, and 0<=J(x)<=x. For fixed s, (9) is easiest to satisfy at B=1/25. Set B to that value, so x'=25s/2>=5. The right side minus 4s then increases with s: its derivative is at least 4x'−4−J(x)/s²>0. But even at s=461/1000 it is negative, with exact gap

    4s−4x−J(x)/s = 2686836265853975519/2416967680000000000000.

This contradicts (9). The moment inequality is for an exact degree-floor locus and does not assume a fixed number of vertices. It does not itself give the analogous near-floor mass bound or settle the full conjecture.
