# The lower oriented general position NP-hardness conjecture

**Theorem.** Deciding whether an undirected graph admits an orientation with general position number two is NP-complete. This remains true for planar bipartite graphs with exactly two vertices of degree one and every other vertex of degree three.

This proves Conjecture 5.3 of [U. Chandran, Di Stefano, Erskine, Haritha, Thomas and Tuite, *The general position number of digraphs*](https://arxiv.org/html/2604.15909v1#S5.Thmtheorem3).

## Two extreme vertices force a spanning geodesic

The general position number of a digraph is the maximum cardinality of a set containing no three vertices on a directed geodesic. A subpath of a directed geodesic is a directed geodesic, so a triple fails to be in general position if and only if some order of its vertices has the middle vertex on a geodesic from the first to the last. Vertices with indegree or outdegree zero, called extreme here, cannot be internal vertices of a directed path.

Let an oriented graph on at least three vertices have two distinct extreme vertices and general position number two. For every other vertex $v$, the triple formed with the two extreme vertices fails to be in general position. The extreme vertices must be the endpoints, and $v$ must be between them. Thus one extreme vertex is a source $s$, the other a sink $t$, and every vertex lies on a shortest directed $s$–$`t`$ path. (For an isolated extreme vertex, or two extreme vertices of the same type, not even one such triple could fail.)

The distances from $s$ distinguish all vertices. Indeed, if distinct $x,y$ other than $s$ had the same distance from $s$, then $s$ could not be internal on a geodesic through $s,x,y$, nor could one of $x,y$ precede the other on an $s$-rooted geodesic: distances strictly increase along such a geodesic. The triple would be in general position. Consequently, any directed shortest $s$–$`t`$ path meets every vertex: it meets each distance level from zero to $d(s,t)$, and every vertex lies in that range with at most one vertex per level.

## Equivalence on graphs with two leaves

Every leaf of an undirected graph is extreme in every orientation. Thus if a graph with at least two leaves has an orientation of general position number two, it has a Hamilton path. This implication is immediate for the two-vertex graph with two leaves as well.

Conversely, suppose an undirected graph has a Hamilton path $v_0,\dots,v_{n-1}$. Orient each path edge towards the next vertex, and every other edge towards its smaller index. Each arc increases the index by at most one. A directed walk from $v_0$ to $v_{n-1}$ therefore uses at least $n-1$ arcs, and the oriented Hamilton path attains that bound. Every triple lies on this geodesic, and any pair is in general position. This is the one-path case of Lemma 4.9 in the conjecture source. Therefore on **all** graphs with at least two leaves, the number-two property is equivalent to Hamiltonian path existence.

An orientation attaining two in a graph with two leaves also determines the ordered Hamilton path uniquely, since the vertices have distinct distances from the source leaf. All chords have to point backwards along that order: a forward arc between nonconsecutive vertices would shorten the spanning geodesic. Hence the construction is a bijection between ordered Hamilton paths and orientations attaining two on these graphs.

## Complexity

Hamiltonian Path is NP-complete on the planar bipartite class with degrees one at exactly two vertices and three elsewhere, by Theorem 23 of [Munaro, *The VC-dimension of graphs with respect to k-connected subgraphs*](https://pureadmin.qub.ac.uk/ws/portalfiles/portal/186487218/paper.pdf#page=12). On that class the equivalence above gives the identity reduction.

For membership in NP, use the orientation as a certificate and compute all directed distances by breadth-first search. For each triple check its six orders for a finite geodesic equality $d(a,b)+d(b,c)=d(a,c)$. The certificate is accepted exactly when every triple has such an order and the graph has at least two vertices. This yields the NP-completeness claim, including the stated planar bipartite restriction.
