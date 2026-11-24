# Tuza's conjecture — overlap credits and whole-triangle covers

**Status: partial research (2026-11-24), not a resolution.** This note extends [the initial conditional matching reduction](README.md). It does not require all anchored K4 blocks to be edge-disjoint. The resulting sufficient conditions do not hold for every graph. Priority is unestablished; no independent review or Lean verification is claimed. Known packing structure and the related effective-family techniques are credited as in the initial note, notably Chalermsook, Khuller, Sukprasert and Uniyal (arXiv:2001.00257v2).

## Definitions

Choose a maximum edge-disjoint triangle packing P maximizing the number of rigid (type-3) packed triangles. All other packed triangles are flexible. As proved in the initial note, each rigid R determines a unique anchored K4 K_R, whose only packed edges are those of R; any nonpacked triangle meeting only rigid packed triangles is a private face of one K_R. These facts do not require edge-disjointness of the K4 blocks.

Let r be the number of rigid packed triangles and f the number of flexible packed triangles, so ν(G)=r+f. The overlap graph O has one vertex for each rigid packed triangle and an edge RS when K_R and K_S share at least one edge. Let s be the size of a maximum matching of O.

For each flexible T, let F_T consist of the nonpacked triangles meeting T in a packed edge and no other flexible packed triangle in a packed edge. Call T *bad* if at least one U in F_T meets a rigid packed triangle R that is nonisolated in O. Otherwise call T *good*. Let B be the bad flexible set and b=|B|, and let g=f-b be the number of good flexible triangles.

The point of the bad/good definition is that it only excludes a flexible triangle from the common-base argument if an overlapping rigid block can participate in its exchanges. There is no requirement that all rigid blocks be isolated.

## Lemma 1 — overlap credit

All packed rigid triangles and all nonpacked triangles hitting only rigid packed triangles can be covered with at most 2r-s edges.

Proof: Choose a maximum matching of O. For each matched pair R,S, pick an edge e in K_R ∩ K_S. In each block take e and the opposite edge of that block, covering all four faces. This uses at most three distinct edges for the two blocks. For every unmatched block take any opposite pair. The union has size at most 2r-s and hits all the desired triangles, using the private-face classification. Additional coincidences between selected edges can only reduce the cost. QED.

## Lemma 2 — common base for good flexible triangles

For a good flexible triangle T, if F_T is nonempty then every member of F_T shares a common packed edge b_T with T.

Proof: The exchange proof in Parts B and C of the initial note localizes to these T. In detail, if U,V in F_T were edge-disjoint, all rigid R touched by U or V would have isolated K_R in O. In each such K_R, U and V forbid at most one edge apiece, since each uses a packed edge of T outside K_R. At least one forbidden edge belongs to R. The two forbidden edges, if distinct, cannot be opposite: the endpoints of the opposite edge would both be outside T, as R and T intersect at the shared endpoint of the packed R edge and a T edge. The apex of K_R is not in T because that would introduce a packed T edge into K_R. A triangle containing the opposite edge cannot also contain an edge of T. Thus there is a face avoiding U and V in every affected K_R. The faces are pairwise edge-disjoint because all affected blocks are isolated. Replacing T and the affected R's by U,V and those faces increases the packing cardinality.

Therefore F_T is pairwise edge-intersecting. If two members of F_T used different packed edges of T, their outside vertex would have to be the same x, giving a K4 on T and x. Any packed edge among its three spokes from x to T belongs to a rigid R touched by one of the two members; no R can contain two such spokes, as its third edge would belong to T. All those R have isolated blocks. Replace each R using a spoke by the face of K_R opposite x. These faces avoid each other and every unaffected packed triangle, and free all three spokes. Each formerly rigid block still contains exactly one packed face (isolation of the affected blocks ensures that the changed faces cannot introduce packed edges into any unaffected block). Thus every former rigid block is still represented by a rigid packed triangle, and T is now rigid as well. This contradicts the type-3 maximality of P. QED.

## Main reduction

Choose the rigid cover from Lemma 1 and all three edges of each bad flexible triangle. Also choose b_T for each good flexible triangle with nonempty F_T. Let D be the nonpacked triangles not yet covered. By the definitions and Lemmas 1–2, each triangle in D meets at least two good flexible packed triangles.

Let H be the hypergraph on the good flexible triangles with one hyperedge for the set of good flexible triangles touched by each member of D (duplicates do not matter for the vertex-transversal number, but they remain separate left vertices in the matching problem). Every hyperedge has size 2 or 3.

Define:
- c_T=1 for a good T with nonempty F_T, and c_T=2 otherwise.
- d=|D|-M, with M the maximum cardinality assignment from D to touched good flexible T subject to c_T.
- h=minimum size of a vertex transversal of H (a set of good packed triangles meeting every hyperedge), with h=0 for D empty.

Then

    τ(G) ≤ 2ν(G)+min{ b-s+d, b-s+2h-g }.

Proof of the first bound: select the shared packed edge for every assigned residual triangle and one arbitrary edge from each of the d unassigned triangles. Add one edge for any good packed triangle that remains uncovered. Such a triangle has an empty F_T and no assigned triangle, so its capacity is unused. Good packed triangles account for at most 2g edges plus the d extra edges. Rigid blocks cost at most 2r-s and bad packed triangles cost at most 3b. The total is at most 2r-s+3b+2g+d=2ν+b-s+d.

Proof of the second bound: take all three edges of each of the h good flexible triangles in a vertex transversal of H, and take one edge (the already selected b_T when applicable, an arbitrary packed edge otherwise) of each remaining good flexible triangle. This covers the residual and all packed triangles, while preserving the initial cover. Good flexible triangles cost at most 3h+(g-h)=g+2h; the total is at most 2r-s+3b+g+2h=2ν+b-s+2h-g. QED.

### Consequences and limitations

* A maximum matching in the overlap graph pays for bad flexible triangles and residual matching deficiency whenever s ≥ b+d. No assumption of globally disjoint rigid blocks is needed.
* The whole-triangle cover permits budgets of three edges at one flexible triangle and one at another. It covers K5 with a size-four transversal even though the first note's matching has deficiency two. More generally, if H is 2-colorable with no monochromatic hyperedge, each color class is a vertex transversal, so h≤g/2. Thus s≥b suffices for the conjecture in this case. In particular this applies when the graph on good flexible triangles joining any two that are touched by a common residual triangle is bipartite. This is an unbounded-size structural condition, not a fixed graph-order verification.
* These bounds can still fail to certify the conjecture. For example K7 with a Steiner triple system as its maximum packing has no rigid or bad triangles, and its 28 nonpacked triangles are residual. Each of the seven packed triangles has capacity two, so d≥14. The incidence hypergraph has as edges the nonconcurrent triples of the seven Fano-plane lines; any four distinct lines include a nonconcurrent triple, because two distinct lines meet in exactly one point. Thus an independent set has size at most three, and h≥4. Both bounds can exceed 2ν even though a balanced bipartition gives a size-nine triangle cover. The construction is sufficient, not necessary.
* For an unrestricted proof, one would need a structural inequality controlling the penalties or a third construction that can efficiently cover dense incidence cores. No such inequality has been established here. The overlap credit is not an assertion that b≤s in general.
* Related known structural work is credited in README.md. Searches for the exact overlap-credit and whole-triangle budget formulation did not locate an exact prior statement in the sources examined; this is not a comprehensive novelty certificate.

## Exact computational check

The companion check_overlap.py enumerates maximum packings, filters by maximum rigid count, constructs the overlap matching and covers, and tests both displayed bounds with exact integer bitmasks. On NetworkX 3.6.1, the complete graph atlas yielded 3,733 lexicographically optimal packings of triangle-containing graphs; 32 had overlapping rigid blocks. The matching bound alone certified 2,426, the whole-triangle bound alone 3,230, and at least one bound certified 3,309, in 1,053 different graphs. Among the 32 overlapping-block packings, 24 yielded a certificate, in six distinct graphs. These are diagnostics of the construction with a deterministic choice of the rigid cover, not independent proofs of new finite-order cases or a resolution of Tuza's conjecture.
