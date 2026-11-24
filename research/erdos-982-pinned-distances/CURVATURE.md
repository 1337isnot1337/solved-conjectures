# A curvature test for near-injective pinned distances

**Partial result related to Erdős #982, not a resolution.** For every degree d≥2, any n-point subset of a degree-d real polynomially parametrized curve in any Euclidean dimension whose image is not contained in a line has a pin determining n−1−O_d(n^(5/7)) distances. This includes every graph of a real polynomial of degree at least two. The same holds on every real noncircular, nonsingular conic, with absolute implied constant. In each case, for every fixed ε∈(0,2/7), all but O_d(n^(1−ε)) pins miss only O_d(n^(5/7+ε)) of the possible n−1 distinct distances. None of these statements requires the selected points to be in convex position.

The proof uses the real-grid [Elekes–Szabó theorem of Solymosi and Zahl](https://arxiv.org/abs/2211.13294), Theorem 1.4, building on [Raz, Sharir and de Zeeuw](https://arxiv.org/abs/1504.05012), but no computer algebra is needed. No priority over an unpublished or unindexed result is asserted. The previous reproducible direct checks of conic nondegeneracy in [CONICS.md](CONICS.md) are optional, not dependencies.

## 1. The local arclength obstruction

For a real-analytic immersed Euclidean curve γ with a local parameter t, put D(x,y)=||γ(x)−γ(y)||². Use ordinary bilinear squared distance in the complexification, without complex conjugation. Locally the analytic divided difference

    F(x,y,z) = [D(x,y)−D(x,z)]/(y−z)

extends through y=z. Fix a real point where γ′≠0 and reparametrize by signed arclength, which is locally an invertible real-analytic change of variables. In arclength coordinates, at (s,s,s) one has F_y=F_z=1 and F_x=−2: to first order about the diagonal, F=y+z−2x. In particular, it is locally a graph x=g(y,z), or alternatively z=h(x,y).

Suppose a residual algebraic distance-equality surface containing this local branch is irreducible and satisfies the exceptional alternative of the Elekes–Szabó theorem. Then in its original algebraic variables the following rational expression is identically zero on the surface wherever defined:

    H = D_y[(D_z F_y)/F_y − (D_z F_z)/F_z],
    D_j = ∂_j − (F_j/F_x) ∂_x.

Here one may use the defining algebraic polynomial in place of the analytic divided difference. The expression on the graph is precisely ∂_y∂_z log(g_y/g_z). To see its vanishing, the exceptional alternative gives a nonempty open patch on which the equation is φ₁(x)+φ₂(y)+φ₃(z)=0 with each φ_i analytic and locally invertible. There g_y/g_z=φ₂′(y)/φ₃′(z). Irreducibility implies that the numerator of H vanishes on the entire algebraic surface; the patch is dense in that surface for purposes of polynomial identities. Thus the conclusion applies even if the diagonal itself lies in the theorem's lower-dimensional exceptional set.

The condition H=0 is invariant under independent analytic reparametrizations of x,y,z: the ratio of the two derivatives is multiplied by a quotient of a function of y and a function of z, and the mixed logarithmic derivative therefore changes by a nonzero coordinate Jacobian factor. Hence H=0 also holds on the local arclength graph centered at (s,s,s). Shrink to a connected neighborhood where g_y,g_z are positive. Then log(g_y/g_z)=a(y)−b(z) for real-analytic a,b. Choose local primitives A′(y)=exp(a(y)), B′(z)=exp(b(z)). In variables u=A(y), v=B(z) we have g_u=g_v; therefore g(y,z)=C(A(y)+B(z)) for a local invertible analytic C. Inverting C gives

    A(y)+B(z)=C^(-1)(x).

The actual diagonal x=y=z implies C^(-1)(x)=A(x)+B(x). Differentiate with respect to y at y=z=x, keeping x fixed and using z=h(x,y) and h_y(x,x)=−1. We obtain A′(x)=B′(x) near s. Subtracting the constant difference, the equation becomes

    A(y)+A(z)=2A(x).                       (1)

For an arclength-parametrized curve, write K(x)=||γ′′(x)||². The squared chord expansion is

    D(x,x+u) = u²−K(x)u⁴/12−K′(x)u⁵/24+O(u⁶).          (2)

To verify it, write v,a,b,c for successive arclength derivatives of γ of orders 1 through 4. Differentiating ||v||²=1 gives v·a=0, v·b=−||a||² and v·c=−3a·b. The coefficient of u⁴ in the squared Taylor series is ||a||²/4+v·b/3=−K/12; the coefficient of u⁵ is v·c/12+a·b/6=−K′/24. In particular there is no cubic term. Substituting the analytic branch z=h(x,x+u) with derivative −1 gives z=x−u+O(u³): if its quadratic coefficient were nonzero, D(x,z) would have a nonzero cubic coefficient. Comparing the quadratic terms in (1) now forces A′′(x)=0 at every x near s. Since A′ is nonzero, A is affine and (1) requires z=x−u exactly. Equation (2) then forces K′(x)=0 identically near s.

**Curvature test.** If an irreducible residual distance-equality algebraic surface contains this diagonal branch at a real point where squared arclength curvature has a nonzero derivative, that component is nonexceptional for Elekes–Szabó.

## 2. Irreducibility for polynomial parametrizations in any dimension

Let γ(t)=a_0+a_1t+…+a_dt^d with real vectors a_j∈R^D and a_d≠0. Translate a_0 to zero. Define the polynomial

    E(x,y,z)=S(y,z)·[γ(y)+γ(z)−2γ(x)],
    S(y,z)=[γ(y)−γ(z)]/(y−z).

The dot product is bilinear after complexifying. E is precisely the residual distance difference divided by y−z. Its content as a polynomial in x over C[y,z] is, up to a nonzero constant, the gcd of the coordinate polynomials of S. Indeed, choose a real orthonormal basis of the real span of a_1,…,a_d. In this basis, each coordinate of S is a complex linear combination of a_1·S,…,a_d·S, because the coefficient vectors span. The nonconstant coefficients of E are −2a_j·S, and its constant coefficient is itself a polynomial-linear combination of the coordinates of S. This proves the content claim. Let F be E divided by this content. For y≠z with γ(y)≠γ(z), the content cannot vanish, so the division loses no collisions of distinct sampled points. At an immersed diagonal γ′(s)≠0, the content likewise does not vanish.

To prove that the primitive F is irreducible, it is enough by Gauss's lemma to prove E irreducible as a polynomial in x over C(y,z). Introduce independent variables Y and s by y=Y/s, z=1/s, and rescale x=X/s. This identifies C(y,z) with C(Y,s), a subfield of the Laurent series field C(Y)((s)). The polynomial

    G(X)=s^(2d−1) E(X/s,Y/s,1/s)

has coefficients in the discrete valuation ring C(Y)[[s]] since E has total degree at most 2d−1. Its reduction modulo s is

    ||a_d||² (1+Y+…+Y^(d−1)) (Y^d+1−2X^d).

This follows by taking the leading homogeneous parts of both vector factors forming E. The reduction has degree d in X and, up to a nonzero element of C(Y), is irreducible in C(Y)[X]: use Eisenstein at the prime Y−ζ for any simple root ζ of Y^d+1. Consequently the leading coefficient of G is a unit in C(Y)[[s]], and reduction gives irreducibility over C(Y)((s)). Explicitly, normalize to a monic polynomial; any factorization over the fraction field has monic factors over the valuation ring by Gauss's lemma, and their degrees do not drop on reduction. This contradicts the irreducibility of the reduction. Hence E is irreducible over C(y,z) and its primitive part F is irreducible over C[x,y,z].

If the image is not contained in a line, squared curvature is nonconstant on some real immersed interval. In fact the parameter derivative γ′ is nonzero for all sufficiently large t, and curvature tends to zero there because ||γ′′(t)||/||γ′(t)||²=O(t^(−d)). If curvature vanished identically on such a tail, the unit tangent would be constant and the polynomial image would lie on a line there and hence everywhere. Thus there is a real immersed point of nonzero derivative of squared curvature. The divided equation near its diagonal is a nonvanishing multiple of F, so the curvature test applies.

## 3. Noncircular conics

Parabolas were covered by polynomial parametrizations in §2. For the other conics, the following elementary algebra verifies irreducibility.

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

In a local real analytic chart the cleared equation is a nonvanishing analytic multiple of the divided distance difference, so it contains the diagonal branch used in §1. Semiaxes a≠b give differing curvatures at an ellipse’s axis vertices (a/b² and b/a²). A hyperbola has positive unsigned curvature at its axis vertex and curvature decaying to zero along its branches. Thus the curvature test applies to each. It must fail for a circle: a regular n-gon has only floor(n/2) distances from every pin.

## 4. Count

Polynomially parametrized curves and hyperbolas already use real parameters; choose one real preimage for each distinct sample point on a polynomial image. For the ellipse, use the real half-angle parameter u=tan((θ−θ₀)/2) by choosing the omitted point θ=θ₀+π outside the finite sample. This is a Möbius change of the original parameter t=e^(iθ) in each variable. It is birational with coordinate-wise inverse. The irreducible residual surface remains irreducible after applying the change and taking Zariski closure: outside finitely many coordinate hyperplanes the map is an isomorphism, the original irreducible surface is not contained in any excluded hyperplane, and a closure of an irreducible image is irreducible. Clearing denominators and discarding factors supported only on excluded coordinate hyperplanes gives its defining polynomial. The degree is bounded by a fixed function of the original degree, uniformly in θ₀. The curvature test applies directly in the new chart, which is analytic at every finite sampled angle and at a point of varying curvature.

Apply Solymosi–Zahl's Theorem 1.4 to the Cartesian cube of these n real parameters. The surface is not a coordinate cylinder, since all three divided-distance partials are nonzero at the local diagonal. The curvature obstruction rules out the group form. Apart from the discarded obvious y=z family, all ordered isosceles triples of the original point set map injectively to zeros of F. So there are O_d(n^(12/7)) such triples. For each pin the deficit in its count of distinct distances is at most half the number of its ordered isosceles triples. The asserted one-pin bound follows by averaging; the most-pins bound follows by Markov's inequality. Degree bounds for F are uniform across conics, hence so are the constants.

The unbalanced bound in the same theorem yields a sharper tail. If k pins each miss at least T distinct distances, use their k parameters as the first grid factor and all n parameters in the other two. Then kT is at most the number of ordered collisions and hence

    kT ≪_d k^(4/7)n^(8/7)+n^(3/2).

At least one term dominates half the sum, so

    k ≪_d n^(8/3)/T^(7/3)+n^(3/2)/T.

In particular, for any fixed c>0 only O_(d,c)(√n) pins miss cn or more distances. Thus all but O_d(√n) pins already beat the exact Erdős floor(n/2) threshold in these families, with no convexity assumption. The constants are also uniform in the ambient dimension for fixed polynomial degree.

## Extent and next step

This argument handles arbitrary degrees and dimensions for polynomially parametrized curves and a conic family with no assumptions on number or placement of sampled points, beyond distinctness. It is not a coefficient improvement for unrestricted #982. The key generalization question is to classify irreducible components of the residual equal-distance equation on other algebraic curves: the curvature obstruction controls the component seen by the local real diagonal, but does not rule out group-like additional components disjoint from that branch. For arbitrary convex polygons no fixed algebraic carrier of bounded degree is available.

Relevant prior work to distinguish from the pinned conclusion: [Pach–de Zeeuw, *Distinct distances on algebraic curves in the plane*](https://arxiv.org/abs/1308.0177) concerns the total distance set. The more recent [Solymosi–Zahl preprint, §1.1](https://arxiv.org/pdf/2211.13294) and [Natarajan–Sheffer, *Distinct Distances on Pfaffian Curves*, Corollary 1.3](https://doi.org/10.1007/s00454-026-00872-4) likewise concern the global distance set and give Ω(n^(3/2)); they do not give the pinned near-injectivity conclusion. The [two-chain argument](README.md) gives the exact floor(n/2) threshold at every order for its subclasses, as opposed to the large-n threshold consequence here.
