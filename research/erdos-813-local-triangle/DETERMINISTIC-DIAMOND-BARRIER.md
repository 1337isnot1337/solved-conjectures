# Erdős–Hajnal local triangle conjecture

**A deterministic test for globally correlated cuts.** At the published vertex retention rate, the cut assignment may be chosen arbitrarily, even after seeing the retained set. With high probability over that retained set, any cut graph with independence number at most the square root of its order and with no spindle must have polynomially fewer *concurrent-core diamonds* than a fair random cut graph. The test depends on the count of just one four-vertex pattern, not on split independence.

## The tips cannot all disappear

Call two geometrically incident secants *unsplit* if their labels at the shared pencil are equal, so they are not adjacent in the split graph G. Let M be the number of secants in any retained set and let α be the independence number of G. Every retained pencil containing k lines contributes at least k²/4−k/2 unsplit pairs, because its two sign classes have total size k. Summing over pencils and using Cauchy–Schwarz, with (q+1)M total incidences and q³+1 pencils, the average unsplit degree D satisfies
```math
D\ge \frac{(q+1)^2 M}{2(q^3+1)}-(q+1).
```
In particular D≥M/(4q) when M≥4q(q+1).

For each u, let U(u) be its unsplit neighbor set. An edge vw of G[U(u)] yields a triangle of geometric tip incidences in which the only actual split edge is vw. Its three pencil points are distinct, since a single pencil's binary cuts cannot have exactly one edge on three lines. By the elementary independence bound in each G[U(u)] and another Cauchy–Schwarz application, the total number of these tip configurations, counted by distinguished apex u, is at least
```math
\frac{M D^2}{2\alpha}-\frac{M D}{2}.
```
So if α≤D/2 then at least MD²/(4α) such configurations exist, regardless of correlations.

## A test involving one diamond instead of a whole spindle

For u,v an unsplit pair with intersection X, a *concurrent-core diamond* is an ordered core pair (A,B) with the five actual edges uA,vA,uB,vB,AB, such that A goes through X and B does not. Require A to satisfy the Baer-direction admissibility condition of the [nine-pencil construction](NINE-PENCIL-SPINDLES.md). This ensures that with the tips and either core prescribed there are at most q+1 geometric choices for the other core. Let D₄ be the number of all such ordered patterns in the retained split graph.

Let p=(log q)²/q and retain vertices independently. With probability tending to one, the following bounds on the retained set hold at once:
1. Each geometric pencil retains O(q(log q)²) secants.
2. Each geometric secant has O(q²(log q)²) retained geometrically incident other secants.
3. For each prescribed pair of tips and one prescribed core, the number of retained candidate partners in an admissible diamond is O((log q)²).

The third statement uses the q+1 completion bound. Each assertion is a binomial upper tail, and there are only polynomially many fixed geometric sets to check, so Chernoff and a union bound prove all three uniformly. They depend only on the retained set, not on any later choice of pencil cuts.

Fix u and an unsplit v. Form a bipartite graph of possible concurrent and nonconcurrent cores with one edge for each retained concurrent-core diamond. Its maximum degree is O((log q)²) by the third bound. If it has no matching of size three, endpoints of a maximal matching cover its edges, so it has only O((log q)²) edges. Otherwise call v rich for u. By the first bound it has at most O(q(log q)⁴) edges in all cases.

In a spindle-free graph the rich tips for fixed u are independent: if v,w are two adjacent rich tips, select any core pair for the u,w diamond. A three-edge matching of cores for the u,v diamond supplies a pair avoiding those two core vertices. Neither opposite tip can be one of the other diamond's cores, because both opposite tips are unsplit with u while every core is adjacent to u. The resulting seven distinct vertices give a spindle. Thus there are at most α rich tips for each u. With the second occupancy bound, this proves
```math
D_4=O\bigl(M(q^2+\alpha q)(\log q)^4\bigr)
\qquad\text{for every spindle-free assignment.}
```
When α≤√M and M=Θ(q³(log q)²), the right side is O(q^(11/2)(log q)⁷).

## Comparison with ordinary random cuts

In the full geometry there are Θ(q¹⁰) admissible labeled concurrent-core diamonds: choose an incident ordered pair of tips in Θ(q⁷) ways and then its admissible cores in Θ(q³) ways. The four distinct pencils carry one two-edge star and three single-edge tests, so their fair-split probability is 2⁻⁵. The expected retained count is Θ(q¹⁰p⁴)=Θ(q⁶(log q)⁸).

This count is concentrated up to its constant scale. The number of patterns containing any given one prescribed line is O(q⁶) by unitary transitivity and incidence counting. With two line labels prescribed, the maximum completion count is O(q³): for prescribed tips use the diamond count; with one tip and one core choose the missing tip incident to the prescribed core (or through the fixed pencil), then its partner in O(q); when both cores are prescribed choose the shared pencil point on the concurrent core and two points on the other core. With three labels prescribed, O(q) possibilities remain: if a core is missing use admissibility, while if a tip is missing it must join the known shared pencil point to the other core. Four labels leave O(1). Thus the relative variance has contributions O(q^(c_r−10)p^(-r)) for r=1,2,3,4 and exponents c=(6,3,1,0), all tending to zero. Vertex-disjoint patterns use disjoint fair incidence bits even if they share a pencil.

Consequently, a globally coordinated cut attempting to preserve α≤√M while eliminating spindles must suppress the concurrent-core diamond count by a polynomial factor relative to the fair model. This does not prove such suppression always raises α, nor exclude a different graph construction. It is a concrete necessary condition rather than a resolution of Erdős #813.
