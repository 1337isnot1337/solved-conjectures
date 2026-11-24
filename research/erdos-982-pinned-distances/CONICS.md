# Near-injective pinned distances on noncircular conics

**Partial progress related to Erdős #982, not a resolution.** For every real nonsingular ellipse other than a circle, every real nondegenerate hyperbola, and every parabola, an arbitrary n-point subset has a pin determining at least n−1−O(n^(5/6)) distinct distances. No convexity assumption on the sampled points is needed. The bound holds for all sufficiently large n with an absolute implied constant across these three conic classes. This invokes, and does not improve, the general Elekes–Szabó bound of Raz, Sharir and de Zeeuw. We have not established priority for the conic specialization.

## Analytic-combinatorial input

Use [Raz–Sharir–de Zeeuw, *Polynomials vanishing on Cartesian products: the Elekes–Szabó theorem revisited*, Thm. 1.1](https://arxiv.org/abs/1504.05012): if F in C[x,y,z] is irreducible of bounded degree and each variable occurs, then either the number of zeros in an n×n×n Cartesian product is O(n^(11/6)), with constant depending only on the degree, or, outside a lower-dimensional exceptional set, the surface is locally given by an equation φ₁(x)+φ₂(y)+φ₃(z)=0 with locally invertible analytic functions.

At any smooth point with all F_x,F_y,F_z nonzero, let x=g(y,z) locally, and write D_y=∂_y−(F_y/F_x)∂_x and D_z=∂_z−(F_z/F_x)∂_x for differentiation along this graph. A necessary condition for the analytic additive form is

    H = D_y[(D_z F_y)/F_y − (D_z F_z)/F_z] = 0.

Indeed g_y/g_z=F_y/F_z, while the additive form makes this ratio equal to φ₂′(y)/φ₃′(z), whose mixed logarithmic derivative vanishes. The relation is rational in x,y,z. If additive form holds generically on an irreducible surface, clearing denominators implies that the numerator vanishes on the whole surface. Thus a single valid calculation H≠0 rules out the exceptional alternative. The calculation may be at a complex point not parametrizing a real vertex.

## Ellipses and hyperbolas

By translation and Euclidean rotation, write a noncircular ellipse as (a cos θ,b sin θ), a>b>0; use t=e^(iθ) and identify (a(t+t^(-1))/2, b(t−t^(-1))/(2i)). A hyperbola has coordinates (a(t+t^(-1))/2,b(t−t^(-1))/2) with t∈R\{0}, a,b>0, and both branch signs included. The parametrizations are one-to-one on their respective real loci.

The squared distance for parameters t,y is, after a positive scaling,

    (t−y)^2[1−2p/(ty)+(ty)^(-2)],

with p=(a²+b²)/(a²−b²)>1 for the ellipse and p=(a²−b²)/(a²+b²)∈(−1,1) for the hyperbola. Subtracting the corresponding expression with z in place of y, and setting y≠z, gives the polynomial

    F_p(t,y,z)=P(2p−2P)t²+(P²−1)S t+P(2−2pP),   P=yz, S=y+z.

Thus the ordered isosceles triples from an n-point sample yield distinct zeros of F_p in the triple product of its parameter set. The point t=0 is not allowed as a curve parameter, but this does not affect the validity of the containing zero count.

### Irreducibility

Throughout, p≠±1. The coefficients as a quadratic in t are relatively prime in C[y,z]. The leading and constant coefficients have gcd equal to a scalar multiple of P: for p≠0 their other factors are P−p and P−1/p, which are coprime, and p=0 gives the same conclusion directly. The middle coefficient (P²−1)S is not divisible by either y or z.

Let E=C(P,S) and L=C(y,z)=E(√(S²−4P)). The discriminant is

    Δ=(P²−1)^2 S² − 4P²(2p−2P)(2−2pP).

As a polynomial in S over C(P), Δ has two simple roots over the algebraic closure, since its constant term is nonzero as a rational function of P. It is not proportional to S²−4P: proportionality would require the polynomial identity P²(2p−2P)(2−2pP)=P(P²−1)^2, impossible by degrees. Thus neither Δ nor Δ/(S²−4P) is a square in E; the latter has simple zeros not canceled by its denominator. A nonsquare a∈E becomes a square in E(√d) only if a/d is a square in E, by expanding (u+v√d)^2 and comparing the √d term. Hence Δ is nonsquare in L. Gauss's lemma gives irreducibility in C[t,y,z].

### Nondegeneracy certificate

It suffices to treat p>0 and p=0: F_{−p}(it,iy,iz)=−F_p(t,y,z) preserves the exceptional analytic property.

For p>0, p≠1, use the two samples

    (y,z)=(p,1) or (p/2,2),   t=2p/(y+z).

Both lie on F_p=0, since P=p. Their F_t are respectively (p−1)(p+1)^2 and (p−1)(p+1)(p+4)/2, always nonzero in scope. Use the [attached exact calculation](ellipse-differential.py) to differentiate and simplify H. For sample 1, define

    A=8p^11−3p^10−339p^9−573p^8−520p^7−404p^6−418p^5
      −408p^4−272p^3−113p^2−27p−3,
    a=p^3−2p^2−2p−1.

The nonzero partial conditions and H≠0 can fail only at roots of M₁=Aa. For sample 2, the analogous bad polynomial is M₂=(p−4)Bbc, where

    B=128p^15−1820p^14−79359p^13+500452p^12−1238447p^11
      −616156p^10+1129936p^9+4340468p^8+1319168p^7−5877760p^6
      −5439488p^5+432128p^4+4915200p^3+1835008p^2−786432,
    b=12p²−17p−4, c=p^4−12p^3+4p+16.

Reduction mod 17 preserves degrees 14,22. Euclidean remainders starting from (M₂,M₁) have (degree, leading coefficient) mod 17 sequence

    (14,8), (13,12), (11,7), (10,2), (9,12), (8,5), (7,9),
    (6,10), (5,10), (4,15), (3,13), (2,7), (1,3), (0,9).

In particular the reductions are coprime; the degree preservation ensures the integer polynomials are coprime over Q. They therefore have no common complex root. At least one sample is valid for every in-scope p>0.

For p=0, use (y,z)=(1,2), t=(9+√209)/16. The partials are −√209, (17+9√209)/16, and (11+3√209)/8. The exact value of H is

    153(4160063√209+83695095) /
      [3971(11+3√209)^2(17+9√209)^2] > 0.

Thus the nonexceptional bound applies for all relevant p. The round ellipse (circle) is excluded; the n−o(n) conclusion is false there, as witnessed by the regular n-gon.

## Parabolas

A Euclidean similarity reduces any parabola to γ(t)=(t,t²). Dividing D(x,y)−D(x,z) by y−z gives

    F=(y+z)(y²+z²−2x²+1)−2x.

As a polynomial in x it is primitive due to the constant coefficient −2 of x. Dividing its discriminant by 4 gives (s²+1)²+s²d², s=y+z, d=y−z, a product of two distinct nonassociate linear factors in d over C(s). This is nonsquare in C(s,d), so F is irreducible. At (x,y,z)=(0,3i/5,4i/5), the three partials are −2, −42/25, −56/25, and the [exact derivative calculation](parabola-differential.py) gives H=52237/25200≠0. Hence the same nonexceptional bound applies.

## Pinned conclusion

For each real pin x, let m_r be the number of other vertices at distance r. The loss from n−1 distinct values is ∑_r(m_r−1), at most ∑_r binom(m_r,2), half the ordered collision count from x. The total over all pins is O(n^(11/6)), so the average loss is O(n^(5/6)). In particular one pin gives the bound in the heading, and for every fixed ε∈(0,1/6) all but O(n^(1−ε)) pins have loss O(n^(5/6+ε)). This asymptotic does not by itself give the exact floor(n/2) threshold for every n.

For the parabola, the earlier [two-chain theorem](README.md) supplies the exact all-order bound: split at the axis, assigning the vertex to either side if sampled. From either endpoint of either chain, both absolute coordinate differences are nondecreasing along that chain, and the horizontal difference is strictly increasing. The two chains are consecutive in the cyclic order of the sample because the strictly convex graph is one convex hull boundary chain. Its closing hull edge connects its two horizontal extrema. The ellipse also has the exact all-order bound by the centrally symmetric-body corollary of the same theorem.

## Prior-work checks

Primary related works include [Pach–de Zeeuw, *Distinct distances on algebraic curves in the plane*](https://arxiv.org/abs/1308.0177), concerning the total number of distances, not a common pin, and [OpenAI's weak pinned planar distance preprint](https://github.com/openai/math/tree/main/preprints/The-weak-pinned-planar-distance-theorem-September-23-2026), which states a general n^(1−ε) lower bound for most pins, not n−o(n) on conics. Search phrases combining pinned distance, isosceles triple, conic, ellipse, parabola and the exponent did not reveal this exact specialization. This is not a priority claim; further literature audit is appropriate.
