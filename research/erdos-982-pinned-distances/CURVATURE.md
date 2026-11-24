# A curvature test for near-injective pinned distances

**Partial result related to Erdős #982, not a resolution.** For every degree d≥2, any n-point subset of the graph of a real polynomial of degree d has a pin determining n−1−O_d(n^(5/7)) distances. The same holds on every real noncircular, nonsingular conic, with absolute implied constant. In each case, for every fixed ε∈(0,2/7), all but O_d(n^(1−ε)) pins miss only O_d(n^(5/7+ε)) of the possible n−1 distinct distances. None of these statements requires the selected points to be in convex position.

The proof uses the real-grid [Elekes–Szabó theorem of Solymosi and Zahl](https://arxiv.org/abs/2211.13294), Theorem 1.4, building on [Raz, Sharir and de Zeeuw](https://arxiv.org/abs/1504.05012), but no computer algebra is needed. No priority over an unpublished or unindexed result is asserted. The previous reproducible direct checks of conic nondegeneracy in [CONICS.md](CONICS.md) are optional, not dependencies.

## 1. The local arclength obstruction

For a real-analytic immersed plane curve γ with a local parameter t, put D(x,y)=||γ(x)−γ(y)||². Use ordinary bilinear squared distance in the complexification, without complex conjugation. Locally the analytic divided difference

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

For an arclength-parametrized curve, the squared chord expansion is

    D(x,x+u) = u²−κ(x)²u⁴/12−κ(x)κ′(x)u⁵/12+O(u⁶),       (2)

where κ is the signed curvature. Indeed with T=γ′ and N the unit normal, the second, third and fourth derivatives are κN, κ′N−κ²T, and (κ′′−κ³)N−3κκ′T. Taylor expansion and dot products give (2). In particular there is no cubic term. Substituting the analytic branch z=h(x,x+u) with derivative −1 gives z=x−u+O(u³): if its quadratic coefficient were nonzero, D(x,z) would have a nonzero cubic coefficient. Comparing the quadratic terms in (1) now forces A′′(x)=0 at every x near s. Since A′ is nonzero, A is affine and (1) requires z=x−u exactly. Equation (2) then forces κ(x)κ′(x)=0 identically near s.

**Curvature test.** If an irreducible residual distance-equality algebraic surface contains this diagonal branch at a real point where κκ′≠0, that component is nonexceptional for Elekes–Szabó. A real-analytic nonconstant squared curvature provides such a point.

## 2. Irreducibility for every polynomial graph

Let γ(t)=(t,f(t)), where f∈R[t] has degree d≥2 and leading coefficient a_d≠0. Then the residual divided-distance polynomial is

    F=(y+z−2x)+S(y,z)[f(y)+f(z)−2f(x)],
    S(y,z)=(f(y)−f(z))/(y−z).

We prove F is irreducible in C[x,y,z]. If d=2 a Euclidean similarity reduces the curve to γ(t)=(t,t²). For that graph F=(y+z)(y²+z²−2x²+1)−2x; over C(y,z) its x-discriminant, divided by 4, is (s²+1)²+s²q² for s=y+z and q=y−z. This has two distinct linear factors as a polynomial in q over C(s) and is not a square. The polynomial is primitive because the coefficient of x is −2, giving the claim.

Suppose d≥3. The polynomial S is squarefree: f(y)−f(z), considered over C(z) as a polynomial in y, has no common root with f′(y), whose roots are constants, and its leading coefficient is a nonzero constant, so it has no factor in C[z] alone. The same holds after dividing by y−z. The coefficients of F as a polynomial in x are primitive over C[y,z]: its leading coefficient is −2a_d S and the coefficient of x is −2−2a₁S, with gcd 1.

If F factors nontrivially into positive x-degree factors in C(y,z)[x], Gauss's lemma gives primitive factors A(x),B(x) in C[y,z][x]. Choose any irreducible factor π of the nonconstant S. Because π divides the leading coefficient of F exactly once, one of A,B, say B, retains its x-degree modulo π. Their reductions have product y+z−2x, a linear polynomial over the fraction field of C[y,z]/(π). It follows that B has x-degree 1. Thus a rational root R∈C(y,z) is necessary for reducibility.

In fact R cannot have a pole at any irreducible π. If π does not divide S, a pole makes the leading-degree term in F(R,y,z) uniquely smallest in π-adic valuation. If π divides S and v_π(R)=−k≤−1, the leading term has valuation 1−dk. Every term of degree j with 2≤j<d has valuation at least 1−jk, the linear term has valuation −k, and the constant term has nonnegative valuation. The leading term is again uniquely smallest since d≥3. Either contradicts F(R,y,z)=0. With no poles at irreducible polynomials R must itself be polynomial.

Let b=deg R. The constant term f(y)S+f(z)S+y+z has total degree 2d−1. For b≥1 the highest degree in S f(R) is d−1+db; for b=0 it is at most d−1. The remaining linear term in R has smaller degree than the largest of those two. Thus b=1 is necessary. Write R=Ay+Bz+C and take the highest-degree terms after canceling the leading homogeneous part of S. We need

    2(Ay+Bz)^d = y^d+z^d.

The pure monomials require A and B both nonzero, but then the mixed monomial y^(d−1)z has nonzero coefficient on the left. Contradiction proves irreducibility. The argument for d=2 uses the canonical parabola parameter, which suffices to count distances because similarity preserves all equalities.

The signed curvature of the graph is f′′/(1+f′²)^(3/2) in the orientation of increasing t. It is nonzero somewhere because d≥2, and tends to zero as |t|→∞. Its square is not constant. Therefore the curvature test applies.

## 3. Noncircular conics

Parabolas were covered above. For ellipses and hyperbolas use the irreducible complex polynomial F_p found in [CONICS.md](CONICS.md), § Ellipses and hyperbolas: coincident parameters y=z were removed, and the real parameter domain avoids the zeros of the denominators. In a local real analytic chart, the remaining factor defining the surface is a nonvanishing analytic multiple of the same divided difference, so it contains the diagonal branch used in §1. Semiaxes a≠b give differing curvatures at an ellipse's axis vertices (a/b² and b/a²). A hyperbola has positive unsigned curvature at its axis vertex and curvature decaying to zero along its branches. Thus the curvature test applies to each. It must fail for a circle, on which a regular n-gon has only floor(n/2) distances from every pin.

## 4. Count

Polynomial graphs, parabolas and hyperbolas already use real parameters. For the ellipse, use the real half-angle parameter u=tan((θ−θ₀)/2) by choosing the omitted point θ=θ₀+π outside the finite sample. This is a Möbius change of the original parameter t=e^(iθ) in each variable. It is birational with coordinate-wise inverse. The irreducible residual surface remains irreducible after applying the change and taking Zariski closure: outside finitely many coordinate hyperplanes the map is an isomorphism, the original irreducible surface is not contained in any excluded hyperplane, and a closure of an irreducible image is irreducible. Clearing denominators and discarding factors supported only on excluded coordinate hyperplanes gives its defining polynomial. The degree is bounded by a fixed function of the original degree, uniformly in θ₀. The curvature test applies directly in the new chart, which is analytic at every finite sampled angle and at a point of varying curvature.

Apply Solymosi–Zahl's Theorem 1.4 to the Cartesian cube of these n real parameters. The surface is not a coordinate cylinder, since all three divided-distance partials are nonzero at the local diagonal. The curvature obstruction rules out the group form. Apart from the discarded obvious y=z family, all ordered isosceles triples of the original point set map injectively to zeros of F. So there are O_d(n^(12/7)) such triples. For each pin the deficit in its count of distinct distances is at most half the number of its ordered isosceles triples. The asserted one-pin bound follows by averaging; the most-pins bound follows by Markov's inequality. Degree bounds for F are uniform across conics, hence so are the constants.

The unbalanced bound in the same theorem yields a sharper tail. If k pins each miss at least T distinct distances, use their k parameters as the first grid factor and all n parameters in the other two. Then kT is at most the number of ordered collisions and hence

    kT ≪_d k^(4/7)n^(8/7)+n^(3/2).

At least one term dominates half the sum, so

    k ≪_d n^(8/3)/T^(7/3)+n^(3/2)/T.

In particular, for any fixed c>0 only O_(d,c)(√n) pins miss cn or more distances. Thus all but O_d(√n) pins already beat the exact Erdős floor(n/2) threshold in these families, with no convexity assumption.

## Extent and next step

This argument handles arbitrary degrees for polynomial graphs and a conic family with no assumptions on number or placement of sampled points, beyond distinctness. It is not a coefficient improvement for unrestricted #982. The key generalization question is to classify irreducible components of the residual equal-distance equation on other algebraic curves: the curvature obstruction controls the component seen by the local real diagonal, but does not rule out group-like additional components disjoint from that branch. For arbitrary convex polygons no fixed algebraic carrier of bounded degree is available.

Relevant prior work to distinguish from the pinned conclusion: [Pach–de Zeeuw, *Distinct distances on algebraic curves in the plane*](https://arxiv.org/abs/1308.0177) concerns the total distance set. The more recent [Solymosi–Zahl preprint, §1.1](https://arxiv.org/pdf/2211.13294) and [Raz–Sharir, *Distinct Distances on Pfaffian Curves*, Corollary 1.3](https://doi.org/10.1007/s00454-026-00872-4) likewise concern the global distance set and give Ω(n^(3/2)); they do not give the pinned near-injectivity conclusion. The [two-chain argument](README.md) gives the exact floor(n/2) threshold at every order for its subclasses, as opposed to the large-n threshold consequence here.
