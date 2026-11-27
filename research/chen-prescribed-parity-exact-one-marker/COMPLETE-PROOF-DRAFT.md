# Chen’s prescribed-parity exact-one-marker conjecture

**Candidate proof, not independently reviewed.** This gives an affirmative
answer to the second question in [Chen, Problem 6.5](https://arxiv.org/pdf/2609.26158#page=14).
For every positive integer t there is f(t) such that a finite undirected
supply graph with a matching of demand pairs, each with its own prescribed
parity, either has simple eligible paths for t **different** demands of
vertex congestion at most two, or has a vertex set of size at most f(t)
intersecting every eligible path. The bound does not depend on the number
of demands. Closing each path by its unique marker gives the cycle
formulation without changing its vertex set.

## 1. Parameters and tangle

Write h(t) for the [parity-free bound](https://github.com/1337isnot1337/solved-conjectures/blob/bff783fd9bbe010663047ecaa93deb8fa6a3296a/results/chen-parity-free-exact-one-marker/PROOF.md).
Set f(1)=0. For t≥2 let s=50t. Choose the parameter of the structural
theorem below large enough that its odd clique has at least 7t branch
trees and its two wall alternatives meet the respective size thresholds
in the routing lemmas, including the handle count. Let w be its input
wall size, and z its deletion bound. Choose Θ depending only on t so that
it is at least z+2, (2s+2)^3+2, and the tangle order sufficient for an
aligned w-wall. Use e.g.
```math
f(t)=\max\{3\Theta,\ \Theta+(t-1)f(t-1),\ z+(t-1)+h(t)\}.
```

If a counterexample has no packing of size t, the induction hypothesis
for t−1 and the assumed transversal number greater than f(t) give the
[eligible-path tangle and s free whole pairs](FREE-TERMINALS.md), §§1–3.
For every separator of size less than Θ, all surviving eligible paths
are in the same component. This property is stronger than merely having
one component with large transversal. It follows because a component of
transversal greater than f(t−1) contains a (t−1)-packing, to which an
eligible path in another component could be added; if all positive
components were small their covers plus the separator would suffice.

By Robertson–Seymour's tangle-to-wall theorem (e.g. [Heinlein,
Theorem 6.2](https://d-nb.info/125238162X/34#page=59)), take an aligned wall.
Apply the one-label parity specialization of
[Huynh–Joos–Wollan’s structural theorem](https://arxiv.org/pdf/1605.07082#page=29),
stated in precisely the needed graph formulation as [Heinlein,
Theorem 7.2](https://d-nb.info/125238162X/34#page=66). Its aligned
outcomes are an odd clique, an all-odd-brick wall, a bipartite wall
with a pure odd linkage, and a bipartite large block after bounded
deletion. Both successive tangle alignments are inherited by truncation.
In either wall-routing application the ambient graph is the **original
supply graph**, so the free terminal set need not avoid vertices
deleted to obtain the structural model. If a separation of order less
than the number of roots has an entire modeled row on one side, the
clean wall track and row argument in the routing lemmas forces that
side to be large. This is the separation condition used when applying
the rooted-grid theorem to that *particular* wall.

## 2. The three routing outcomes

* **Odd clique.** Use [the free-pair argument](FREE-TERMINALS.md), §4.
  The relevant clique tangle has order `ceil(2p/3)` for p branch trees.
  At order less than 2t, a side containing an intact branch tree off
  the separator intersects all branch trees: adjacency forbids any
  other branch tree disjoint from that side. Therefore a separation of
  that order with all selected terminals on the other side contradicts
  freeness. Kawarabayashi–Wollan–Reed, Lemma 3.3, routes the t selected
  pairs integrally with the requested parities. If one defines an odd
  clique by all model triangles having odd length, the two definitions
  agree: color the branch trees properly, and write b_ij for the
  connector bit 1 plus its two endpoint colors. Every triangle has
  bit sum 1. Switching color on branch i by b_1i+1, for i≠1,
  makes every connector bit equal to 1.
* **Odd bricks.** [Odd-brick routing](ODD-BRICK-ROUTING.md) uses 9t
  whole pairs from the free terminal set. The fixed pairings are
  routed with a private odd face as a parity switch, giving simple
  paths of congestion two.
* **Odd handles.** [Odd-handle routing](ODD-HANDLE-ROUTING.md) uses
  50t free whole pairs. The handles of the structural theorem are
  disjoint paths with distinct top nails and no other wall vertices;
  purity is not needed. Free terminal arms can be moved to leave t
  private handles. The annular routing gives demand paths, not
  walks: the two internal connections belonging to a demand that
  uses a handle have disjoint angular intervals. All other overlaps
  are between different demands at load at most two.

Each outcome contradicts the absence of a packing.

## 3. The bipartite large-block outcome

Let Z be the deletion set, |Z|≤z, H=G−Z, and B the bipartite large
block in H. A component of H−V(B) has at most one neighbor in B
(the gate). Otherwise the component supplies an external path
between two distinct vertices of B, contradicting maximality of
the block. For a vertex of B, regard the vertex itself as its gate.

Every eligible path in H meets B. Indeed, a path missing B is
contained in one component C of H−V(B). The separation putting C
opposite B in H has order at most one. Lifting it to G adds Z to
the separator. The definition of the large block orients towards
B in the wall tangle and hence in the eligible-path tangle. More
explicitly, the lifted small side on the C side does not contain
B: putting B on that small side in the opposite orientation would
contradict its large-block property. The lifted separation is within
the aligned wall tangle's order: the large-block assertion uses
separations of order at most |Z|+1, as in Heinlein §6 and the last
paragraph of the proof of Theorem 7.1. An eligible path in C
avoids the separator and is on the small side, which is impossible.
This also excludes any eligible path in a component of H not
attached to B.

Retain only demands having an eligible path in H. If the two
terminals of a retained demand have the same gate v, every such
path contains v and meets B only there: an excursion from v
into any part beyond that gate would force v to repeat. For
different same-gate positions, representative paths are disjoint,
since they only occupy their gate and the fringe attached there.
Thus at most t−1 such gates exist. Put them in the cover.

For each retained demand d with distinct gates a_d,b_d, choose one
eligible path in H as witness and keep its two exterior arms,
one from each terminal to its own gate, with the arm of a terminal
in B allowed to have length zero. The arms of d are disjoint and
visit no other vertex of B. Every eligible path for d has a
simple a_d–b_d segment in B; it cannot make an excursion through a
fringe component and return to the same gate. Conversely **every**
simple a_d–b_d path in B lifts, with the fixed two arms, to an
eligible path. This lift is simple, and its parity agrees with
the witness because all a_d–b_d paths in the bipartite block
have the same parity.

To keep the parity-free demand graph a matching even when gates
are shared, add two private degree-one leaves for each such d at
a_d and b_d, and pair those leaves. Supply paths for this new
matching consist exactly of a gate-to-gate path with its two
private leaves. A congestion-two packing for t distinct leaf
pairs would lift to the same number of distinct original demands.
Inside B the load is unchanged. Outside B any shared vertex is in
a one-gate fringe and every route using it also used that same
gate in B, so outside load is at most two. By the absence of this
packing, the parity-free theorem gives a cover of size at most
h(t) in the leaf graph. Map every leaf in the cover to its gate
and keep all block vertices. This meets every eligible original
path of distinct gates: project its actual block segment, append
the private leaves, and use the parity-free cover. This direction
does not require its actual arms to be the chosen witnesses.

Together with Z and the at most t−1 same-gate positions, the
cover has size at most z+(t−1)+h(t), a contradiction. The induction
is complete.

## Source and review boundary

Chen explicitly leaves the matching question open. Exact-title,
Problem 6.5, exact-one-marker, and prescribed-pair parity searches
found the statement and neighboring results but no prior resolution
of the unrestricted question. The nearest primary comparisons are
[Marx–Wollan](https://arxiv.org/abs/1411.0871) (integral packing
fails to have a uniform bound for matching demands),
[Kwon–Yoo](https://arxiv.org/abs/2411.05372) (fixed finite-label
A-paths), [Chekan et al.](https://arxiv.org/abs/2408.16344) (fixed
finite-label S–T paths), and [Gollin et al.](https://arxiv.org/abs/2102.01986)
(cycle label avoidance, not the exact-one filter as stated).
These results do not supply the distinct prescribed-pair packing
asserted here. The geometric inputs and case joins above should
receive a fresh proof review before publication. This file makes
no claim about Chen’s separate moving-core Problem 6.6.
