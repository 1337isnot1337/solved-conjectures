# Erdős–Hajnal local triangle conjecture

**Obstacle for Erdős #813.** For q=3^(2j+1) tending to infinity, the random pencil-bipartition on the Hermitian secants in the [Mattheus–Verstraëte construction](https://doi.org/10.4007/annals.2024.199.2.8), followed by independent vertex retention with probability p≥q^(−8/7+ε) for any fixed ε>0, contains a Moser spindle with probability tending to one. This includes the sampling probability (log q)²/q used in their off-diagonal Ramsey application. At that rate, for each fixed η>0 there are at least q^(1−η) vertex-disjoint spindles with probability tending to one.

This rules out a direct transplant of the usual random model, with bounded cleanup, along these prime powers. It does not rule out the use of other prime powers or a choice of the splits, structured thinning, or deletion of a sublinear unbounded number of vertices. It does not settle #813.

## Why the spindle is relevant

The complement formulation of [Erdős #813](https://www.erdosproblems.com/813) asks how small the independence number can be if every seven vertices contain an independent triple. [Bučić–Sudakov](https://doi.org/10.1007/s00493-023-00023-w) prove the lower power improvement and reduce the hard upper direction to small-independence graphs free of K₄ and the graph they call H₇, the Moser spindle. The spindle has two diamonds sharing a degree-two apex, with an edge joining their outer tips. Its seven vertices have no independent triple, so even a noninduced copy is prohibited.

## A fixed frame in the unital

Write i²=−1 in F₉, and use the diagonal Hermitian form on three coordinates. A secant line is specified by a nonzero coefficient triple in its linear equation. Let (u,v,w,a,b,c,d) be the seven lines with coefficients
```
u=(1,0,0)       v=(1,0,i)       w=(1,i,0)
a=(1,2i,2+i)    b=(1,2,2+i)     c=(1,1+i,i)    d=(1,1+i,2i).
```
Here i^3=−i. The unital points at the intersections for the eleven required edges are as follows; direct substitution gives zero in both line equations and zero Hermitian norm.

| Edges | Intersection point |
| --- | --- |
| ua, uc | (0,1,2+i) |
| ub | (0,1,1+i) |
| va | (1,2,i) |
| vb | (1,2i,i) |
| ab | (1,0,2+2i) |
| ud | (0,1,1+2i) |
| wc | (1,i,2) |
| wd | (1,i,1) |
| cd | (1,1+2i,0) |
| vw | (1,i,i) |

At the one repeated point the required local edges form a two-edge star. All other points each carry a single constraint. Thus independent fair pencil signs retain all eleven required edges with probability exactly 2⁻¹¹. Each line is a secant because it contains at least two listed unital points. The lines u,v,w form a projective basis in the dual space, and a has all three basis coordinates nonzero: its coordinates in that basis are 1−i, 1+i, 2. Hence these four lines form a projective frame; no nonidentity projective linear transformation fixes them individually.

For q=3^(2j+1), F₉ embeds in F_{q²} and the q-Frobenius restricts to the 3-Frobenius on it. All of the equations and point inequalities above persist, with the same repeated point, in the unital of parameter q. The fixed pattern therefore has the same split survival probability at every such q.

## Count translated copies and their intersections

Let Γ=PGU(3,q), of order q³(q³+1)(q²−1)=Θ(q⁸); see for example [the projective unitary group in the Hermitian model](https://doi.org/10.1007/s10623-025-01613-z). It acts transitively on the Θ(q⁴) secant lines. This follows by Hermitian polarity, since secants correspond to nonisotropic points and unitary transformations are transitive on nonisotropic lines (normalize the norm and extend an orthogonal basis).

We use these uniform bounds for pointwise stabilizers of specified distinct secants:
- one secant: O(q⁴) by transitivity and orbit–stabilizer;
- two or three: O(q²);
- four or more: O(q), and for the whole seven-line pattern the stabilizer is trivial by the frame.

To see the bounds, switch to the nonisotropic pole lines. An isometry fixing a pole line scales it by a phase of norm one. For two nonorthogonal poles their phases must agree; after dividing by the common scalar the map fixes their two-dimensional span pointwise. If this span is nondegenerate, the action on its orthogonal line offers at most q+1 choices. If it is degenerate, its orthogonal line is its radical. A vector outside the span can move only by c times a generator of that radical. Its norm equation is one nonzero F_q-linear trace condition on c∈F_{q²}, leaving at most q choices. For two orthogonal poles their span is nondegenerate; the phases on the two poles and their third perpendicular line are independent at most, giving (q+1)² after dividing by the center. This proves the two- and three-line bounds. For four distinct poles spanning a two-dimensional space, fixing three lines there forces a common phase and the span argument applies. If the four span all three dimensions, pick a basis among them; the fourth has at least two nonzero basis coefficients, requiring equality of at least two phases. This again gives at most q+1 projective choices.

For each g∈Γ let I_g indicate that its translate of the pattern survives both the splits and the p-retention. Let Z=Σ_g I_g. Its mean is Θ(q⁸p⁷). An ordered pair of translated patterns meeting in exactly r secants can be specified by the first translate and one of constantly many correspondences of r line labels, then by an element in a coset of the stabilizer of those lines. The number of pairs is at most O(q^(8+s_r)), where
```math
(s_1,s_2,s_3,s_4,s_5,s_6,s_7)=(4,2,2,1,1,1,0).
```
This includes the pairs with identical vertex sets, for which each correspondence is fixed by the frame argument. Disjoint vertex sets give independent indicators even when their secants share a unital point, since the local bits are independent per point-line incidence, and the vertex choices are independent as well. Two patterns meeting in r secants jointly survive with probability at most p^(14−r), ignoring all split constraints. Consequently
```math
\frac{\mathrm{Var}(Z)}{\mathbf E[Z]^2}
\ll \sum_{r=1}^7 q^{s_r-8}p^{-r}=o(1)
\qquad\text{if }p\ge q^{-8/7+\varepsilon}.
```
The r=7 term uses strict ε>0, and s_r−8+(8/7)r<0 for every r≤6. Chebyshev now proves the claim of a surviving spindle with probability tending to one.

At p=(log q)²/q, we have Z≥c q(log q)^14 with high probability. The expected number of intersecting surviving pairs is O(q(log q)^16) by the same overlap bounds. For any η>0, Markov bounds this by q^(1+η/2)(log q)^16 with high probability. Make a graph on surviving translated copies, adjacent when the copies share a vertex. The elementary bound that a graph with V vertices and E edges has an independent set of size at least V²/(V+2E) gives at least q^(1−η) disjoint spindles for sufficiently large q. In particular a bounded cleanup cannot remove them all.

## Audit and next obstacle

The [diagnostic script](screen_unital.py) independently constructs the unital and finds spindles in each of 25 seeded splits at q=3,5,7. Only the explicit F₉ coordinates are needed for the proof; the asymptotic order and variance bound do not rely on computation. Bucić–Sudakov already identified H₇ as the relevant forbidden graph. The additional result is the frame-and-second-moment obstruction for the Hermitian random-split construction on this infinite subfield sequence. No claim is made for smaller p, nonrandom splits, or other characteristic. [Coordination issue #925](https://github.com/1337isnot1337/solved-conjectures/issues/925).
