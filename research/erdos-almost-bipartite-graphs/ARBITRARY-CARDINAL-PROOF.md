# Erdős’s arbitrary-cardinal bipartization conjecture

**Independent mathematical review passed on 27 November 2026.** The reviewer checked the [original manuscript](https://github.com/1337isnot1337/solved-conjectures/blob/cc9c1f2ac6c1093c428af3fffefab7d8d7ded45e/research/erdos-almost-bipartite-graphs/ARBITRARY-CARDINAL-PROOF.md) and the publication proof with Git blob `4ff96a752f7cb1680854c9261bd75e5673bae651`. The review covers the arbitrary-cardinal edge-deletion theorem below. The later transitivity and vertex-deletion supplements have separate scopes. This is an internal AI review. The proof has no Lean formalization or external referee report. [Review receipt](https://github.com/1337isnot1337/solved-conjectures/blob/fec1fe27a293f772381d553d22613d8d82eb47ed/results/erdos-arbitrary-cardinal-bipartization/REVIEW.md) · [Original issue](https://github.com/1337isnot1337/solved-conjectures/issues/1015) · [Publication PR](https://github.com/1337isnot1337/solved-conjectures/pull/1016)

**Theorem.** For every real $\epsilon>0$ and every infinite cardinal
$\kappa$, there is a simple graph $G$ with $\chi(G)>\kappa$ such that
every finite subgraph on $n\ge1$ vertices becomes bipartite after
deleting fewer than $n^{1+\epsilon}$ edges.

This is the arbitrary-cardinal upper-bound conjecture in Erdős,
[Problems and results on finite and infinite combinatorial analysis II](https://combinatorica.hu/~p_erdos/1982-24.pdf#page=7),
§3, p. 137 of the 1982 reprint. Its preceding benchmark uses
$\chi(G)>p$ for every cardinal $p$ and a deletion bound of $2n^{3/2}$.
This is not the distinct exact-$`\aleph_1`$ construction in Erdős's
1981 Combinatorica paper, or the linear-budget impossibility question.

## 1. Finite defect orientations of shifts

Let $S_k(I)$ have as vertices the strictly increasing $k$-tuples
of a linearly ordered set $I$. Orient an edge forward when the
next tuple is obtained by dropping the first coordinate and
appending a larger last coordinate. For $k=1$ this is the complete
graph oriented by $I$. For $k\ge2$ the digraph is the directed line
graph of the preceding shift: a $k$-tuple is the unique arc from
its $(k-1)$-prefix to its $(k-1)$-suffix, and edges join consecutive
arcs.

We prove by induction that on any $n$ vertices of $S_k(I)$, one
can two-color the vertices and orient only the monochromatic
edges with maximum outdegree at most $2^{k-1}n^{1/k}$. There is
nothing to check for an empty vertex set. For $k=1$, any
one-coloring and any orientation give outdegree at most $n$.

For $k\ge2$, the chosen vertices correspond to $n$ distinct arcs
of a finite subdigraph $D$ of the preceding shift. Call a vertex
of $D$ a center. Put $T=n^{1/k}$ and call a center heavy when both
its incoming and outgoing arc counts exceed $T$. At most $n/T$
centers are heavy, since the sum of the incoming counts is $n$.
Apply induction to the graph of heavy centers (a subgraph of the
preceding shift), writing $b(v)$ for the color of a heavy center
and using its monochromatic-edge orientation as an auxiliary
orientation.

Our goal at every heavy center $v$ is for incoming arcs to have
color $b(v)$ and outgoing arcs to have color $1-b(v)$. An arc
with at most one heavy end can satisfy its only requirement.
For two heavy ends, both requirements can be satisfied if and
only if the ends have different colors. At an underlying edge
with equally colored heavy endpoints, satisfy the end it points
to in the auxiliary orientation, and let the other endpoint be
the failed incidence. An arc with no heavy end may get either
color. Induction bounds failures at each heavy center by
```math
2^{k-2}(n/T)^{1/(k-1)}=2^{k-2}T.
```

Now orient the monochromatic edges of the current shift. Such
an edge is an incoming/outgoing arc pair at a unique center.
At a light center one side has at most $T$ arcs. Point from the
other side towards that side. At a heavy center a monochromatic
pair must include a failed incidence, because two satisfied
incidences on opposite sides would have opposite colors. Point
towards a failed arc (either direction if both failed).
The number of outgoing edges of an arc attributable to a
center is at most $T$ at a light center and at most the number
of failures at a heavy center. As an arc can be involved at
only its two ends, its total monochromatic outdegree is at most
$2^{k-1}T$. This proves the induction. The result for arbitrary
subgraphs follows by restriction from the graph induced on the
same chosen vertices.

In particular, one can delete at most $2^{k-1}n^{1+1/k}$ edges to
make any finite subgraph of $S_k(I)$ bipartite. The orientation
bound, not merely the total number of deleted edges, is what
controls the heavy-center induction.

## 2. Keep the coefficient fixed while increasing the shift order

For integers $K\ge k$, put $L=K-k+1$. Order the increasing
$L$-tuples of $I$ lexicographically to obtain a new ordered set
$J$. Map each increasing $K$-tuple to its $k$ consecutive
length-$`L`$ windows, considered in order as elements of $J$. The
windows strictly increase and together recover the original
tuple. Along a forward shift the list of windows itself shifts
forward. Thus this is an injective graph homomorphism
$S_K(I)\to S_k(J)$; nonedges need not be preserved. Every
$n$-vertex subgraph of $S_K(I)$ therefore inherits the deletion
bound $2^{k-1}n^{1+1/k}$ with the same $k$, independently of $K$.

Also, $S_K(I)$ has no odd cycle of length at most $2K-1$.
Here is a direct check. Suppose a cycle of odd length
$\ell\le2K-1$ is traversed in the direction for which forward
shifts outnumber backward shifts. Treat forward as $-1$ and
backward as $+1$, and extend the list of $\ell$ signs periodically.
At each cycle vertex let $r$ be the maximum of zero and of
the sums of the sign suffixes of lengths $1,\ldots,\ell$
immediately before that vertex. Then $0\le r\le K-1$, since
a full period has at most $K-1$ plus signs. The update across
the next sign $s$ is $r'=\max(0,r+s)$: extending a full-period
suffix by one sign cannot give a positive contender, because
the period sum is strictly negative and integral. At least
one forward step has $r=0$, since otherwise the updates would
decrease $r$ over a full period. Index tuple coordinates from
zero, and at each position read coordinate $r$. Across a
backward shift the new index is $r+1$ and the read value is the
same. Across a forward shift with $r>0$ the new index is $r-1$
and again the value is the same. Across a forward shift with
$r=0$, the first coordinate strictly increases. The read value
thus strictly increases somewhere around a closed cycle while
never decreasing, impossible.

Fix $\epsilon>0$. First choose $k$ with $1/k<\epsilon$. Choose
an integer $N\ge2$ such that
$2^{k-1}n^{1+1/k}<n^{1+\epsilon}$ for all $n\ge N$. Now choose
$K\ge\max(k,N)$. For $n\ge N$ apply the window embedding and the
order-$`k`$ bound. For $n<N$ the order-$`K`$ shift has no odd cycle
of length at most $n$, so no deletion is needed. This gives the
literal strict budget at every positive integer $n$.

## 3. Make the chromatic cardinal arbitrarily large

If the directed line graph of a digraph is colored with at most
$\kappa$ colors, color each vertex of the original digraph by
the set of colors on its outgoing arcs. This is proper on the
underlying graph: for any arc $x\to y$, its color occurs in
the outgoing set at $x$ but cannot occur at $y$, because it
would be followed by an outgoing arc of the same color. Thus
the original graph can be colored with at most $2^\kappa$
colors. Iterating down the $K-1$ directed line graphs from
$S_K(I)$ to the complete graph $S_1(I)$ shows that
$\chi(S_K(I))\le\kappa$ would imply
$|I|\le\exp_{K-1}(\kappa)$, where $\exp_j$ denotes $j$ iterates
of cardinal exponentiation by base two. Choose $I$ as the
well-ordered successor of this bound. Then
$\chi(S_K(I))>\kappa$. The finite estimates did not depend on
$I$, so this concludes the proof.
