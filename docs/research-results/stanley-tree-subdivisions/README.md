# Recognizing trees after long subdivisions

**For every fixed reduced tree, almost every independent choice of integer lengths for all its edges gives a tree recognizable among all trees from its path counts and degree sequence.** An explicit certificate recovers all edge lengths and their incidences. If every branch vertex has degree three, the unlabelled histogram of distances between vertex pairs suffices on its own, even when the competitor has arbitrary degrees. The failure probability for lengths uniform in $`1,\ldots,t`$ is at most a constant times $`k^5/t`$ on any reduced tree of order $`k`$. Stanley’s general question remains open. [Path-distance certificate and proof](PATH-DISTANCE-CERTIFICATE.md) · [Independent review and earlier work](PATH-DISTANCE-REVIEW.md)

## Distances between leaves

The multiset of leaf-to-leaf distances determines the total length of a generic reduced metric tree. For a binary target it also determines the unweighted topology. Every possible change of lengths comes from permuting the two-pendant sums at cherries in a binary refinement, and the factorial bound on the number of alternatives is sharp. With at least five leaves, the absence of a trivalent parent of two leaves guarantees full recovery of the weighted tree. The length invariant imposes a rational obstruction on every competitor with more leaves in the ordinary distance-histogram problem. [Total length](LEAF-DECK-LENGTH.md) · [Classification](CHERRY-CLASSIFICATION.md) · [Application](SCALAR-PENDANT-OBSTRUCTION.md) · [Sources and independent review](LEAF-DECK-REVIEW.md)

## When the histogram alone suffices

Fix any reduced tree skeleton with at least two branch vertices and prescribe an arbitrary rooted decoration at each end. Vary all exterior arm orders and any selected internal path lengths independently through $`[1,t]`$. Among the $`p`$-parameter assignments, all except $`O(t^{p-1})`$ give trees identified among all finite trees by the ordinary chromatic symmetric function. The other internal paths may have any fixed positive lengths. [Subdivision theorem](DECORATED-SUBDIVISION-DENSITY.md) · [Review and checks](DECORATED-SUBDIVISION-REVIEW.md)

If two finite metric trees have the same distribution of distances between uniform arclength samples, the tree with more leaves has at most twice its number of independent rational edge-length relations in extra leaves. A generic tree of any topology is identified against every rival with at most two such relations. For an arbitrary bound $`D`$ on this number, a finite ambiguity test across all topologies and all leaf surpluses needs at most $`4D`$ rival leaves. [Unmarked theorem](DISTANCE-CANCELLATION-CODIMENSION.md) · [Marked theorem](HEIGHT-RELATION-KERNEL.md) · [Review and checks](DISTANCE-NULLITY-REVIEW.md)

For a rival with $`c`$ extra leaves, an ordinary distance histogram matching a generic tree with at least $`97c`$ leaves forces matching signed profiles at two parents and a common labelled subtree on all but at most $`4c`$ target leaves. Across all tree topologies it suffices to test targets with fewer than $`97c`$ leaves for an ambiguity of that surplus. A marked test through $`4c+1`$ leaves decides whether ambiguities occur at every target leaf count at or above $`97c`$, or at none. Its uniform outcome remains open. The proof is written and internally reviewed. [Theorem and reduction](LINEAR-LEAF-SURPLUS.md) · [Independent review and sources](LINEAR-SURPLUS-REVIEW.md) · [Checks](verify_parity_root_transfer.py)

For every topology with at least 28 leaves, a generic subdivision is identified by its ordinary vertex-distance histogram among all rivals with at most two extra leaves, with every degree unrestricted. The marked two-extra-leaf theorem holds for every target order when the marked nonzero heights are independent. Smaller unmarked targets are open in general. [Unmarked proof and certificate](TWO-SURPLUS-TAIL.md) · [Marked proof](MARKED-TWO-SURPLUS.md) · [Independent review](MARKED-TWO-SURPLUS-REVIEW.md)

The ordinary vertex-distance histogram identifies a generic subdivision of any fixed reduced tree among every competitor with at most one extra leaf. The proof covers arbitrary branching and both integer subdivisions and the metric-tree arclength law. [One-extra-leaf theorem](ONE-EXTRA-LEAF.md) · [Independent review](ONE-EXTRA-LEAF-REVIEW.md) · [Degree verifier](verify_one_extra_leaf.py)

A finite calculation decides generic identification over all tree topologies when competitors may have a bounded number of extra leaves. The number and degrees of the high-degree vertices are unrestricted, and a failing family has a witness with quadratically many leaves in the allowance. For a single high hub of arbitrary degree, a different tree with the same histogram needs at least two additional leaves and a surplus growing at least linearly with that hub’s degree. [Theorem and exact bounds](LEAF-SURPLUS-KERNEL.md) · [Independent review and sources](LEAF-SURPLUS-REVIEW.md) · [Finite checks](verify_leaf_surplus.py)

For every fixed topology a generic subdivision has the fewest leaves of any tree with its ordinary distance histogram and is the unique representative at this minimum. The histogram alone determines generic subdivisions with arbitrary degrees when each branch at every high-degree vertex contains sufficiently many leaves. The marked proof isolates a common labelled subtree and rules out a single extra leaf. [Exact hypotheses and proof](ROBUST-HUB-DISTANCES.md) · [Sources and attribution](ROBUST-HUB-SOURCES.md) · [Independent mathematical review](ROBUST-HUB-REVIEW.md) · [Exact finite checks](verify_marked_visibility.py)

Every fixed reduced tree with one four-valent vertex and otherwise trivalent hubs is generically determined among all trees by its ordinary distance histogram alone. For independently chosen subdivision lengths from 1 through t the exceptional proportion is at most a topology-dependent constant divided by t. This settles the first positive degree-excess class. [Proof](QUARTIC-DISTANCE-RIGIDITY.md) · [Marked rigidity](MARKED-QUARTIC-RIGIDITY.md) · [Independent review and checks](QUARTIC-DISTANCE-REVIEW.md)

For any prescribed positive degree excess, there is a finite procedure deciding generic identifiability for every reduced tree of that excess, including arbitrarily many trivalent hubs. A counterexample to generic identifiability would yield one with at most twelve times the excess minus two reduced vertices. The first positive class is settled above; higher classes remain open. The same question can be posed for the single arclength distance distribution of a metric tree. [Decision for one topology](PATH-HISTOGRAM-DECISION.md) · [Fixed-excess theorem](FIXED-EXCESS-REDUCTION.md) · [Continuous formulation](METRIC-TREE-DISTRIBUTION.md) · [Independent review](FIXED-EXCESS-REVIEW.md)

## Subdivision at a branch vertex

**Choose any branch vertex of any finite tree. Subdivide each incident edge independently. Once all these edges are sufficiently long, the ordinary chromatic symmetric function determines the resulting tree among all trees.** The distal rooted trees can have arbitrary shapes, and one arm can be longer than all the others combined. The proof recovers the unmarked branch vertex, the rooted ends, the arm orders and their matching.

Let $`r\ge3`$ be the branch degree. Remove each arm’s initial chain of unary roots. If $`L`$ is the largest remaining order minus one, a sufficient minimum arm order is $`\max(3,L+1,2rL)`$. [Simultaneous subdivision theorem](HUB-SUBDIVISIONS.md) · [Independent review](HUB-SUBDIVISIONS-REVIEW.md)

## Arbitrary internal trees

For any fixed internal topology and rooted terminal caps, the ordinary chromatic symmetric function identifies the entire tree for a proportion tending to one of independent exterior-arm orders in the stated intervals. The proof recovers the unmarked ends and then the labeled internal splits, including the lengths of paths between branching vertices. [Exact theorem and proof](ARBITRARY-CORE.md) · [Independent review](ARBITRARY-CORE-REVIEW.md) · [Split reconstruction checker](verify_core_splits.py)

## Two unmarked hubs

**All exterior lengths can vary independently when the rooted cap shape is determined by its number of leaves and the largest such count is below the sum of the smallest counts required at one hub.** This includes arbitrary repetitions of the same rooted cap. Unit caps, mixtures of several shapes, equal lengths, arbitrarily dominant arms and central length one are permitted under the stated cap condition. [Theorem and exact cutoff](TWO-HUB-FREE-LENGTHS.md) · [Review](TWO-HUB-SUBDIVISIONS-REVIEW.md)

For arbitrary rooted ends, a complementary theorem permits the longest exterior arm to exceed the sum of the other arms by an arbitrarily large factor. Its proof determines the two possible length assignments from one-edge cuts and uses a polynomial divisibility bound to distinguish them, even after regrouping. [Dominant-arm scope and proof](DOMINANT-ARM.md)

Choose two branch vertices joined by a path whose internal vertices have degree two. Each hub has at least two exterior arms, with arbitrary, possibly repeated rooted ends. Under a size condition on these exterior arms, the ordinary invariant recovers both hubs, the lengths and rooted ends, and their division between the hubs. The joining path can have any positive length. The condition allows unbounded ratios between the longest and shortest exterior arms. A separate identity distinguishes any exchange of two unequal arm orders between distinct rooted ends at a branch vertex. [Two-hub theorem and transposition identity](TWO-HUB-SUBDIVISIONS.md) · [Review and prior work](TWO-HUB-SUBDIVISIONS-REVIEW.md)

## Single-edge subdivisions and other recognition theorems

**Every edge of every finite tree can be subdivided sufficiently many times that the resulting tree is determined among all trees by its ordinary chromatic symmetric function.** Suppose deleting the original edge leaves components of orders $`g`$ and $`h`$, with $`g\ge h`$. Replace the edge by a path. A sufficient total order for the resulting tree is

```math
n\ge\max(2g-1,2g+h-3).
```

For example, component orders 5 and 8 give a sufficient order of 18. The proof recovers two rooted trees after removing the initial chains of vertices with one child. It applies also to balanced or nearly balanced edges whose endpoints have arbitrary degrees, under an explicit condition on the two remaining orders. The earlier proof gave the sufficient bound $`4g-3`$. [Balanced-edge proof](BALANCED-ARMS.md) · [Independent review](BALANCED-ARMS-REVIEW.md) · [Earlier subdivision proof](PROOF.md)

A separate recognition theorem concerns the unique centroid of a tree. Let $`b`$ be the order of its largest branch. If at least $`b-1`$ leaves are adjacent to the centroid, the ordinary chromatic symmetric function determines the tree. This permits arbitrary shapes for the other branches and includes the threshold $`b-1`$. [Centroid proof](LEAF-HUB.md) · [Independent review](LEAF-HUB-REVIEW.md)

For two other families, form a tree by attaching the roots of identical branches to one new vertex.

- Three or more copies of any rooted tree are distinguishable among all trees. [Repeated-branch proof](REPEATED-BRANCHES.md)
- With exactly two copies, recognition holds under a condition on consecutive orders of descendant subtrees. It also holds when the combined branches one level below the hub can be recovered from the specified truncation. The first condition covers all rooted trees in which every vertex has an even number of children, including full binary trees. [Two-branch theorem and proof](TWO-BRANCHES.md)

Codex derived these partial results in the WadeDavis research session. Separate project reviewers checked the balanced-edge and leaf-centroid arguments, the earlier subdivision theorem, the repeated-branch comparison and the two-branch parity and moment arguments. The proofs use Stanley's spanning-forest expansion and build on rooted forest-polynomial factorization. The results have written proofs and exact finite checks. They have no Lean formalization. Stanley's isomorphism question for arbitrary trees remains open. [Stanley, §2](https://sites.math.washington.edu/~billey/classes/Hopf.algebra/bulletins/stanley.1995.pdf) · [Rooted forest polynomials](https://arxiv.org/abs/2002.08186) · [Research issue #315](https://github.com/1337isnot1337/solved-conjectures/issues/315)

## Reproduction

Run these commands from the repository root with standard Python.

```sh
python3 docs/research-results/stanley-tree-subdivisions/verify_marked_quartic.py
python3 docs/research-results/stanley-tree-subdivisions/verify_quartic_rows.py
python3 docs/research-results/stanley-tree-subdivisions/verify_fixed_excess_pruning.py
python3 docs/research-results/stanley-tree-subdivisions/verify_path_distance_certificate.py
python3 docs/research-results/stanley-tree-subdivisions/verify_core_splits.py
python3 docs/research-results/stanley-tree-subdivisions/verify_two_hub_free_lengths.py
python3 docs/research-results/stanley-tree-subdivisions/verify_dominant_arm.py
python3 docs/research-results/stanley-tree-subdivisions/verify_two_hub_subdivisions.py
python3 docs/research-results/stanley-tree-subdivisions/verify_hub_fringe_recognition.py
python3 docs/research-results/stanley-tree-subdivisions/verify_hub_assignment.py
python3 docs/research-results/stanley-tree-subdivisions/verify_balanced_paths.py
python3 docs/research-results/stanley-tree-subdivisions/verify_leaf_hub.py
python3 docs/research-results/stanley-tree-subdivisions/verify_long_subdivision.py
python3 docs/research-results/stanley-tree-subdivisions/verify_centroid_edge.py
python3 docs/research-results/stanley-tree-subdivisions/verify_two_branches.py
```

The [path-distance checker](verify_path_distance_certificate.py) checks the defect identity on all 2,287 nontrivial unlabelled trees through order 13 and recovers all 108 reduced topologies through that order under a generic weighting. It also tests 816 literal subdivisions.

The [independent-length checker](verify_two_hub_free_lengths.py) recovers 127 examples from boundary coefficients. The [dominant-arm checker](verify_dominant_arm.py) compares 5,408 cut profiles, 108 length exchanges and 224 regroupings.

The [two-hub checker](verify_two_hub_subdivisions.py) covers 18,984 exterior profiles, 23 joins with fully enumerated forests and connected subsets, and 36 assignments of distinct or repeated rooted ends. It also checks an ambiguity for one-edge counts and the transposition identity.

The [structural checker](verify_hub_fringe_recognition.py) compares 2,288 unlabelled trees through order 13 and reconstructs 27,027 folded arm-size profiles. The [assignment checker](verify_hub_assignment.py) tests ten size configurations with mixed rooted ends, including ties, a central edge with equally sized sides and a longest arm exceeding the sum of the others.

The [balanced-edge checker](verify_balanced_paths.py) compares 1,457 rooted pairs, including 393 certified inputs representing 280 unrooted trees, and exercises the improved endpoint for both parities. The [leaf-centroid checker](verify_leaf_hub.py) inventories 434 trees through order eleven and selected larger controls, exercises 27 final-layer restorations and rejects 15 off-centroid controls.

The earlier subdivision checker compares 200 rooted shapes with direct edge-subset enumeration, tests 1,446 unordered arm pairs and compares 434 unrooted trees of orders 3–11. It also checks both threshold parities for endpoint orders 5 and 8 and every path order from 2 through 22. The repeated-branch checker tests 660 multisets for the three- and four-copy comparison. The two-branch checker examines 8,116 unordered arm pairs through order eight. [Subdivision checker](verify_long_subdivision.py) · [Repeated-branch checker](verify_centroid_edge.py) · [Two-branch checker](verify_two_branches.py)
