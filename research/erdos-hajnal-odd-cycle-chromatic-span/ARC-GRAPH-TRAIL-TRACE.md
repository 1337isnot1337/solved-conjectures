# Arc graphs reduce path span to directed-base trail traces

Partial structural work for [Erdős–Hajnal's odd-cycle
chromatic-span conjecture](https://github.com/1337isnot1337/solved-conjectures/issues/1010).
Kohlmeyer–Kruer's arc graphs disprove a different extraction
conjecture, [Erdős #108](https://hexagonmath.org/pdf/2611.00763v1);
Nguyen–Walczak's treatment is [arXiv:2609.40192](https://arxiv.org/abs/2609.40192).
The following exact reductions explain both the possible connection
and why their bounded-degree result alone does not settle #640.

Let \(D\) be a finite acyclic digraph with maximum outdegree \(d\).
Its arc graph \(A(D)\) has the arcs of \(D\) as vertices, with an
edge when the head of one arc is the tail of the other. For a
simple path \(P=(a_1,\ldots,a_\ell)\) in \(A(D)\) with \(\ell\ge 2\),
let \(v_i\) be the unique shared center of \(a_i,a_{i+1}\), where
the head of one meets the tail of the other. Put
\(X=\{v_1,\ldots,v_{\ell-1}\}\).

**Trace lemma.** Consecutive unequal centers in the sequence
\((v_i)\) are the endpoints of the intermediate arc. After
contracting runs of equal centers, the center sequence is a
trail of \(D\)'s underlying graph, possibly a single vertex, with
vertex set \(X\); its edges do not repeat. Its maximum degree
is at most \(3d\). Moreover,
\[
\chi(A(D)[V(P)])\le 2+\chi(A(D[X])).
\]

For the degree bound, count the edges of the path \(P\) whose
center is a given vertex \(v\). Each is incident at an outgoing
arc of \(v\) and every such arc vertex is on at most two edges
of \(P\). Thus at most \(2d\) distinct arcs incoming to \(v\)
can participate at their head, and in particular at most \(2d\)
trail edges enter \(v\) in the original orientation. At most
\(d\) trail edges leave \(v\). This proves the degree bound
without assuming that the trail itself follows the orientation.

Every arc of \(P\) has at least one endpoint in \(X\). Those with
only their tail in \(X\) form an independent set in the full
induced span: two such arcs cannot have a head-tail coincidence,
since their tails lie in \(X\) and their heads outside it. Those
with only the head in \(X\) similarly form an independent set.
The remaining arcs belong to \(D[X]\). Separate palettes give
the chromatic inequality.

As a consequence, consider a family of acyclic \(D\) with
unbounded \(\chi(D)\). If for each \(D\) every underlying trail
of degree at most \(3d\) has \(\chi(D[X])\le q\) for one constant
\(q\) independent of \(D\), the family of arc graphs disproves
#640. The outgoing-color-set argument gives
\(\chi(A(D))\ge\log_2\chi(D)\), and coloring each arc by the
ordered pair of distinct colors of its endpoints gives
\(\chi(A(D[X]))\le q(q-1)\). Thus every path, and hence every
odd-cycle span, would have uniformly bounded chromatic number.

The cited #108 result bounds the chromatic number of the
bounded-degree **edge subgraph**. The trace lemma needs to bound
the induced graph on its vertices. These are different even for
a trail with degree two: a spanning path of a complete graph
has degree two, while its vertex span is the entire clique.
Consequently the cited bounded-degree pruning does not close
the argument.

## Converse gadget: when the trail sees the full span

Suppose \(T\) is an edge-simple underlying trail visiting every
vertex of a nonempty \(X\subseteq V(D)\), using only \(X\).
Add enough private incoming and outgoing pendant arcs at each
vertex of \(X\), calling the enlarged digraph \(D'\). These
pendants can have distinct new leaf-vertices and preserve
acyclicity. Then \(A(D')\) has a simple path whose induced span
contains \(A(D[X])\).

Walk along \(T\), listing its travel arcs in the traversal order,
regardless of their orientations in \(D\). At the first visit
to \(v\), also list as spikes all arcs of \(D[X]\) whose tail is
\(v\) and that are not travel arcs; do not list them on their
head visits. Insert private pendant arcs at that visit so the
successive arcs alternate between incoming and outgoing at
\(v\). Later visits with no spikes need at most one pendant
arc to connect the consecutive travel arcs. For the initial
and final visits no outer arc is required at the start or
finish. In the degenerate one-vertex case the target graph has
no arcs, so the assertion is vacuous. Each original arc is
listed once, and the padding arcs are distinct. This list is
therefore a simple path in the arc graph. Extra adjacency in
its induced span does not erase any of \(A(D[X])\).

This explains why bounding only the sparse trace edges cannot
suffice for pendant-rich arc constructions: the other arcs
between active centers can all occur as spikes on one path.
Whether the layered random construction can be constrained
to meet the induced trace condition remains open here.
