# Negami's planar cover conjecture: status and all-cover route

20 November 2026. No proof or counterexample claimed.

## Target and status

Every connected graph has a finite planar cover if and only if it embeds in the projective plane. By the established forbidden-minor and Y–triangle reductions, the unresolved implication is equivalent to proving that K_(1,2,2,2) has no finite planar cover, of any fold.

Primary sources inspected:
- Annor–Nikolayevsky–Payne, *Three Theorems on Negami's Planar Cover Conjecture*, arXiv:2412.19560v2, 17 July 2026. Full HTML read through its structural setup and connectivity proof: https://arxiv.org/html/2412.19560v2 . It proves minimal covers must be 4-connected and excludes the all-apex-wheel class, but explicitly does not settle unrestricted covers.
- Annor thesis abstract, *Graph covers: topological and combinatorial perspectives*, Bulletin of the Australian Mathematical Society 114 (2026), 554–556, published online 23 October 2026, https://doi.org/10.1017/S0004972726102111 . Still records only structural restrictions and the exclusion of folds below 14.
- Author publication list: https://scholars.latrobe.edu.au/mspayne/publications . Confirms the recent structural paper and the 2025 peer-reviewed finite-fold exclusion.
- Hlineny original reduction paper: https://www.fi.muni.cz/~hlineny/papers/c4e2final.pdf . Describes the forbidden-minor/Y–triangle reduction and remaining K_(1,2,2,2) case.
- Mohar's historical problem page: https://www.sfu.ca/~mohar/Problems/PLANECOV.HTM . Warns that an old announced solution had a flaw and was withdrawn.

Additional searches for proof, counterexample, 2026 updates, and GitHub reports found no full resolution. A secondary ProofAtlas investigation explicitly retains open descent/realization obligations; it is not a solution. Source freshness and explicit mathematical scope were checked rather than relying on the word 'proof' in a title.

## Exact all-cover contraction framework

This is a derived restatement of the standard local structure, not a claim of novelty. Let G be a hypothetical minimal n-fold planar cover of K_(1,2,2,2). There are n apex vertices (degree6) and 6n other vertices (degree5), hence |V|=7n and |E|=18n. Each nonapex vertex has exactly one apex neighbor. Therefore the apex stars partition V into n connected seven-vertex cells.

Inside one cell, remove its apex and call the remaining induced graph the rim. Lemma 4 (the peripheral-cycle facial lemma) of Annor–Nikolayevsky–Payne, https://arxiv.org/html/2412.19560v2, implies every rim edge bounds a triangular face with the apex; it must join consecutive ports in the apex rotation. Consequently each rim is a linear forest or the entire six-cycle. Let t be the total number of rim edges, and put R=6n-t>=0.

Contract each apex star to one vertex and delete the resulting rim loops. Every deleted rim loop bounds its own apex triangle before contraction. The result is a connected loopless planar multigraph H on n vertices with

    |E(H)|=12n-t=6n+R,
    |F(H)|=5n+R+2.

The minimum-cover 4-connectivity assumption ensures original faces are bounded by simple cycles. The contraction may create bridges, but face boundary lengths counted with multiplicity are still at least2: loops have been removed and the graph is connected with edges. If D is the number of length-two faces, Euler's formula gives

    D = |E(H)|-3|V(H)|+6 + sum_{faces length>=4}(length-3)
      = 3n+R+6 + sum_{faces length>=4}(length-3).

This is exact, not just an asymptotic bound. In particular at least 3n+R+6 digon faces appear after contraction.

## Why this alone does not solve the conjecture

An H-digon need not correspond to an original bigon (G is simple). Its original boundary can run within one or both seven-vertex cells. In particular an original octahedral triangle with one internal rim edge becomes a digon. Thus a proof cannot simply declare the many digons impossible. The cyclic order and distinct neighbor-label requirements at the six ports must enter the argument.

For comparison, the original embedding satisfies

    sum_{faces of G}(length-3)=3n-6.

The contraction deletes exactly t apex-triangle faces. Across the other faces it removes 2R star-edge incidences and t rim-edge incidences, for total length loss 2R+t=6n+R. Substituting these counts recovers the preceding Euler identity, so counting the same deficit twice supplies no additional inequality.

Next precise target: classify which digons in H can be realized by legal pairs of port arcs while maintaining locally bijective labels, then find a global obstruction or a surgery valid for every fold. No finite-fold threshold search is being proposed.

## All-cover structural lemma: parallel bundles have length at most five

**Status:** the argument below passed an independent mathematical review of its strip reduction and label constraints. This is not formal verification, a claim of novelty, or a full Negami proof. The source establishes length at most three under its stronger all-wheel assumption; the present candidate allows arbitrary rim paths.

In the contracted loopless multigraph H, call e_1,...,e_L a parallel bundle if they join the same two cell vertices, and each consecutive pair bounds a digon face. Its edges occur consecutively in opposite cyclic orders at those two vertices.

Every original port has exactly 4-d_rim external edges, at least two. Moreover these external edges form one contiguous block in the cell rotation: a rim edge bounds an apex triangle, so any existing rim edges and the apex edge are consecutive at the port; the external edges occupy the remaining contiguous interval. Every port whose full external block lies strictly inside a bundle therefore contributes at least two bundle edges.

For six consecutive edges in a longer bundle, no cell port can repeat after leaving it: there are six distinct ports per cell and every port contributes at least two external edges, so a return would require at least twelve edges. The two port sequences are therefore monotone within this window.

A three-edge fan within a bundle is impossible. If three consecutive edges share one port, they meet three consecutive distinct ports on the other side. The middle port has only that one edge in the bundle, yet is strictly interior in the other cell's port sequence, contradicting its external degree at least two. Similarly a simultaneous change of both ports between consecutive edges is impossible within a bundle of at least three edges: on either side of that transition a component endpoint has external degree one and is not an endpoint port of the whole bundle. Equivalently the ordered simple bipartite strip consists of one alternating path when its length is at least three. For precision, a port repeat after leaving it requires at least 1+5·2+1=12 edges. If both endpoints change at an interior transition, compare with the preceding edge: simplicity prevents it sharing both endpoints with the transition edge, so one port block is a singleton strictly inside the bundle. At the first transition use the following edge instead. A whole cyclic bundle is also impossible: each cell has at least twelve external edges, so it would contain the forbidden six-edge window. Thus no choice of cyclic cut changes the argument.

Thus a putative bundle of length at least six contains, after swapping its two cells, the alternating six-edge pattern

    a0-b0, a0-b1, a1-b1, a1-b2, a2-b2, a2-b3.

Ports a1,b1,b2 are interior. Each therefore has external degree exactly two and rim degree exactly two. Their rim neighbors are the previous and next ports in the strip. Identify port labels with the six vertices of the base octahedron; for a label x let -x denote its unique opposite nonneighbor.

The four octahedral neighbors of a1 are exactly a0,a2,b1,b2, all distinct. Set x=a1. The six labels are consequently {x,-x,a0,a2,b1,b2}.

At b1, its known neighbors are a0,x,b2. Its opposite label cannot be any of those three, cannot be itself, and cannot be -x (whose opposite is x). It must therefore be a2. Its fourth neighbor b0 is then -x. By the same argument at b2, its opposite is a0 and its fourth neighbor b3 is -x. Hence b0=b3, contradicting distinct labels within one cell.

The label contradiction itself is exact and independent of fold number. Exhaustive enumeration of the six labels confirms that the interior-neighbor constraints admit patterns of lengths3,4,5, but no pattern of length6 or more (through the maximum eleven distinct-port alternating edges). This finite check is a sanity test of a general structural lemma, not a search for a finite-fold counterexample.

Collapsing maximal bundles therefore gives a no-digon planar multigraph whose edge weights are at most five and whose vertex weighted degrees are 24-2t_v. The all-wheel source improves the bound to three on wheel-wheel bundles; a global proof would still need degree/face restrictions for cells with rim defects.

## Consequence: minimum collapsed degree four beyond all wheels

Use the preceding general bundle bound and its port-strip reduction. Collapse each maximal bundle to one edge, retaining its multiplicity as weight, obtaining the no-digon plane multigraph J. If a cell has t_v rim edges and r_v=6-t_v, its weighted degree is

    24-2t_v = 12+2r_v.

If r_v>=2, weights at most5 immediately imply degree at least4. If r_v=0, the wheel's external degree is12, and every bundle incident to it has length at most4: the length-five endpoint argument below excludes five on either wheel. This alone gives degree at least3, not4. The published bound at most3 applies to two wheels, not automatically to a wheel paired with an arbitrary rim-path cell. The mixed case is handled separately below.

For r_v=1, the rim is a path through all six ports, and their external degrees in path order are (3,2,2,2,2,3). A hypothetical degree3 would need bundle lengths (5,5,4).

For a length-five strip with edges

    a0-b0, a0-b1, a1-b1, a1-b2, a2-b2,

the two interior-port equalities force

    b0=-a1, b1=-a2, b2=-a0.

At a0, the two strip neighbors are -a1 and -a2 and the known rim neighbor is a1. If a0 had rim degree2, its fourth octahedral neighbor would have to be a2, producing the prohibited rim triangle a0-a1-a2. Thus a0 has rim degree at most1. Symmetrically b2 has rim degree at most1. Each length-five bundle therefore consumes two external edges at a defective endpoint port in each cell.

In the six-port path case, the two five-edge bundles must anchor at opposite endpoints (one endpoint has only three external edges, insufficient for two bundles taking two each). Each extends inward over the next full degree-two port and one edge of the following port. The unused four external edges form two separated intervals: one across the missing rim edge and one between the middle ports. They cannot be one bundle. Thus degree3 is excluded for the r_v=1 case, using the established strip reduction.

For the wheel case, length4 is possible in the strip constraints, so its incidence pattern must exclude covering all twelve external edges with three such bundles.

### Wheel–nonwheel incidence restriction

A length-four alternating strip is

    a0-b0, a0-b1, a1-b1, a1-b2.

The interior port b1 has rim neighbors b0,b2 and external neighbors a0,a1, all four distinct.

1. Suppose the two-port side A is a wheel. Then a0,a1 are adjacent rim ports, hence not opposite. Among the four neighbors of b1, the opposite of a0 must be b0 or b2; edge a0-b0 excludes b0, so b2=-a0. Similarly b0=-a1. The other rim neighbor of a0 and the other rim neighbor of a1 must both be -b1, since their two external neighbors have already been specified. This would close a rim triangle, impossible in a six-cycle. Thus A is not a wheel.

2. Suppose the three-port side B is a wheel. If a0,a1 are not opposite, the same complement-pair argument gives b0=-a1, b2=-a0. At b0 the two as-yet-unused neighbor labels are b2 and -b1. Using b2 as a rim neighbor would close the rim triangle b0-b1-b2, so its other rim neighbor must be -b1. The same holds at b2, again impossible in a six-cycle. Consequently a0 and a1 are opposite, and b0,b2 are also opposite. Thus the four-edge strip is centered at a straight port of the wheel: a port whose two rim neighbors have opposite labels.

A six-cycle on the octahedral labels has at most two straight ports. Indeed each straight port corresponds to one of the three opposite pairs at distance two on the cycle. Three such pairs would form a perfect matching using only distance-two edges of C6, impossible because those edges preserve parity and each parity class has odd size three.

Each length-four bundle uses both external edges of its straight center, so distinct bundles cannot use the same center. A wheel therefore has at most two incident length-four bundles, no length-five bundle, and all other weights at most three. Three incident bundles cannot have total weight12: equality would require three length-four bundles. Hence its collapsed degree is at least four.

Together with the r>=2 and r=1 cases, this completes the minimum-degree-four deduction. An independent review found no gap in these arguments; novelty has not been established. No triangular-face bound at degree4 or5 has been proved, so Euler discharging still does not settle Negami's conjecture.

## Why minimum degree four is not yet enough

The wheel-only paper finishes by proving that collapsed degree-four vertices meet no triangular faces and degree-five vertices meet at most three. Those estimates cannot simply be reused for mixed cell types: a four-edge wheel–nonwheel bundle, excluded by the all-wheel hypothesis, is now possible. The corresponding degree-four wheel may have cyclic weights (4,2,4,2), rather than (3,3,3,3). A rim-path cell can have a potential (5,2,5,2) pattern. These new face corners need separate compatibility analysis.

For a six-port rim path supporting two five-bundles, the path labels are forced, up to symmetry and reversal, to

    (1,2,3,-2,-3,-1).

Proof sketch: normalize the first three ports to (1,2,3); the five-strip identities force the external neighbor of the third port to be -1. Its next rim neighbor cannot also have label -1, so the fourth port is -2. The opposite-end five-strip forces the final two ports to be (-3,-1); the other order would duplicate the fourth port's neighbor of label3. The two residual intervals have neighbor-label pairs (-2,3) and (1,-1), respectively. This supplies concrete boundary data for the missing triangular-face analysis, but no global discharge rule is established here.

## Local caution: mixed triangles require a genuinely new discharging rule

A compatibility sketch suggests that the old vertexwise no-triangle estimate is not a formal consequence of the new weight bounds. For a wheel with rim order (1,2,-1,3,-2,-3), a four-bundle centered at2 can connect its ports(1,2,-1) to opposite ports(3,-3) in a second cell. The wheel's residual two-bundle between ports(-1,3) connects to opposite ports(-2,2) in a third cell. At the common wheel port-1, the first two external edges meet labels-3 and-2. These labels are adjacent in the base octahedron, and an edge between them does not immediately duplicate a required neighbor label in either other cell. Thus it is not legitimate to declare this mixed face impossible merely because the all-wheel proof ruled out its different weight-three configuration. This sketch is not a completed extendible planar-cover patch or a counterexample; it isolates the missing compatibility checks.

## Defect-sensitive strengthening

The following further consequence passed a separate independent review. Write r=6−t_v for the defect of one cell. In the collapsed graph J:

- r≥3 implies degree at least5.
- r≥5 implies degree at least6.

Indeed a length-five bundle occupies a three-port rim path, with external-incidence counts (2,2,1), or its reversal. Its middle port contributes its entire external block of size2. If t_v≤3, two such rim paths cannot coexist: disjoint paths require at least four rim edges; overlapping paths lie in a single three- or four-vertex path. In the three-vertex case their full middle blocks overlap. In the four-vertex case one path's full middle port receives at least one additional incidence from the other path. Both violate external capacity2. Thus a cell with t_v≤3 supports at most one weight-five edge. Four incident bundles would have total weight at most5+4+4+4=17, whereas r≥3 gives total weight12+2r≥18. Hence degree≥5.

If t_v≤1, there is no three-port rim path, so no weight-five bundle. Total weight is at least22, and every edge weight is at most4. Therefore degree≥6.

These refinements restrict all possible degree-four cells to rims with at least four edges. They still do not supply the missing triangular-face inequalities or a global contradiction. In particular, neither a full solution nor a novelty claim follows from the degree bounds.
