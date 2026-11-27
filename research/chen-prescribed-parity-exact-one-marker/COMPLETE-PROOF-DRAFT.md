# Chen’s prescribed-parity exact-one-marker conjecture

**Proof draft, independently re-read without a gap found.**
The independent check was an AI mathematical review, not external
human refereeing. The exact checked revision is recorded below.
 This gives an affirmative
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
One can equivalently obtain h(t) from the same free-set lemma and a
[rooted ordinary grid](SIGNED-EXTENSION.md#an-alternative-parity-free-input),
without using the fractional-packing argument.
Set f(1)=0. For t≥2 let s=50t. Choose the parameter of the structural
theorem below large enough that its odd clique and its two wall
alternatives meet the respective size thresholds in the routing lemmas,
including the handle count. Let w be its input
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

* **Odd clique.** The [odd-clique grid construction](ODD-CLIQUE-VIA-GRID.md)
  converts the aligned odd clique into a grid model all of whose unit
  faces lift to odd cycles. An entire model row on the far side of a
  low-order separator contains an intact clique branch tree, which
  forces that side to be large. The free roots can therefore be added
  to this very grid. The same private-face parity switches as in the
  odd-brick case complete the routing, without a separate parity
  linkage theorem.
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
contradict its large-block property. The large-block outcome includes the admissibility of the deletion
for the wall tangle: in Heinlein §6, a large block of G−Z is defined
for |Z| at most the tangle order minus two. The lifted separation of
order at most |Z|+1 is therefore within that wall tangle's order.
This is also the definition used by Huynh–Joos–Wollan in Theorem 22. An eligible path in C
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
asserted here. A further close predecessor is
[Kawarabayashi–Reed, SODA 2009](https://doi.org/10.1137/1.9781612973068.128)
on deciding whether a specified list of k demands can all be routed.
Its structural overview also uses odd cliques, odd wall faces and
parity-breaking paths. This is closely related routing work, but a
fixed-k feasibility algorithm neither chooses k demands from an
unbounded matching nor supplies a small transversal when that
selection cannot be made. The tangle and free-whole-pairs reduction
addresses this difference. This file makes no claim about Chen’s
separate moving-core Problem 6.6.

An independent mathematical re-read of revision `1cf98b4` (proof blob
`c62f73c65adbe00b6e0d932e1887d37cfdd6c04f`) found no gap in the
free-whole-pair proof or the four structural outcomes. It rechecked
the model-preserving augmentation in Marx–Seymour–Wollan 2.1, the
strict tail-exchange step for odd handles, the simple-path and
congestion conditions in the annulus, and the lifted one-gate
separator in the bipartite large block. Later edits added citations
and the following scope links; they do not change that argument.

The [all-even grid example](WHY-CONGESTION-TWO.md) shows that
congestion one cannot work. A separate
[odd-cycle reduction](COVER-LOWER-BOUND.md) gives a lower bound of
order t log t for any admissible cover function, even when all
demands are even and all terminals are private leaves.
