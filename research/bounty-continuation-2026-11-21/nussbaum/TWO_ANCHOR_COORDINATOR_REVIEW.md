# Independent review of the two-anchor representative lemma

21 November 2026. Reviewed source: `agents/conjectures/nussbaum-two-anchor-and-clique-stabilizers.md`, SHA256 `63d1aecad7e85d42d56fc8fba95a5ce53fb3f440b6b42d9cf9465d4db45a5037`.

## Verdict and scope

The two-anchor system-of-distinct-representatives theorem and the stated consequences pass this independent written review. The cyclic maximal-clique count also passes. These are partial deductions toward the full Nussbaum prize target; they do not settle it, establish priority, or increase the completed-target count. No Lean verification is claimed.

## Checks of the representative construction

1. When the anchors coincide, the opposite corner uniquely identifies the free-coordinate set of a face containing that anchor. Its representative lies in the face.
2. For distinct anchors, complementing coordinates gives zero and one on their difference set and zero on the complement. A face containing either anchor can only fix an outside coordinate to zero. Partitioning by its outside free set therefore gives disjoint representative fibers. Within a fiber, the remaining faces are still distinct and incomparable.
3. A face containing both anchors is free on every differing coordinate. In its outside-free-set class it contains every other face, so the antichain condition forces that class to be a singleton. This case must be removed before forming the two set antichains.
4. For the first anchor, the free sets form an antichain A and are valid opposite corners. For the second anchor, the sets of fixed-one coordinates form an antichain B and are valid opposite corners. No additional incomparability assumption between A and B is needed.
5. A collision is exactly an element of A intersect B. Every cube neighbor of a collision is comparable with it and hence lies outside both antichains. Lower neighbors belong to its first-anchor face; upper neighbors belong to its second-anchor face.
6. The cube is regular of positive degree on the difference set. Counting edges from any subset of collisions gives Hall's condition for a matching into their neighborhood. The collision set itself contains no neighboring pair, so the two sides are disjoint.
7. For each matched neighbor, exactly the representative of the appropriate face moves. Matching injectivity separates new representatives, and their exclusion from A union B separates them from all unmoved representatives. Every collided corner retains exactly one representative. Thus the assignment is an injection into the actual face union, not merely into an auxiliary cube.

## Checks of the consequences

Cube faces satisfy the finite Helly property: pairwise compatible fixed-coordinate specifications are jointly compatible. A cover of the compatibility graph by two cliques therefore gives the required anchors even if the cliques overlap. The weighted two-row grid application follows without any restriction on its multiplicity.

For the cycle application, the length assumption q at least four is used twice. Neighboring-clique anchors of a bundle are distinct because the two neighboring bundles are incompatible. Also, no Boolean vertex can lie in three bundle unions, since those three bundle indices would form a triangle in the cycle. Factoring out the positive-dimensional common cube hull leaves distinct incomparable faces containing a common vertex. Their opposite corners give at least m representatives in the quotient, so each bundle union has at least 2m vertices. The incidence count proves the claimed lower bound for the actual union.

For maximal-clique stabilizers, intersections of distinct maximal cliques are nonempty and pairwise disjoint regions. A shared Boolean vertex would make their union a clique, contradicting maximality. A smallest d-dimensional face therefore meets at most 2^d such regions. Regular cyclic action on orbit states gives clique orbit length p/h, clique size kh, and exactly k cliques of that orbit through any state. Summing proves both identities in the source. If the sum of reciprocal stabilizer orders is at least one, the distinct regions already supply at least p Boolean vertices. Failure of this sufficient condition forces every stabilizer to be nontrivial, but does not itself produce a counterexample or an extension to the remaining cases.

## Remaining gap

Neither cyclic compatibility nor the formula interpolation criterion shown so far supplies a two-clique cover for every component. The source explicitly preserves this gap. Repeating the earlier unweighted grid bound cannot be multiplied by a true-twin multiplicity, because the corresponding Boolean unions may overlap. No full conjecture claim follows from this note.
