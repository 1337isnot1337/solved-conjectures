# Fractional Erdős–Pósa for prescribed-pair paths without parity

For any finite undirected graph and any demand pairs, let
tau be the least number of vertices meeting every path between
a demanded pair, with endpoints eligible for removal. Let T be
the maximum fractional packing of those paths with unit vertex
capacities. Then

    tau <= (32 + 8 H_floor(32T)) T ,

where H_m is the m-th harmonic number, with H_0=0. In particular
the bound depends on the fractional value, not on the number
of demands or the order of the graph.

For a demand matching of nonedges, adding the demanded edges
and closing exactly one such edge around a supply path
preserves both parameters. This is a fractional result for the
parity-free family in [Chen, Problem 6.5](https://arxiv.org/pdf/2609.26158#page=14).
It does not bound the transversal in terms of congestion-two
packings, nor address prescribed parity in a nonbipartite supply
graph. The argument uses standard metric-partition ideas, with
a bound on the number of centers from the unit vertex measure.
It is not represented as a resolution of Problem 6.5.

## Fractional vertex lengths and a small net

By finite linear programming duality choose nonnegative
vertex weights w of total T such that every demand path has
total vertex weight at least one. Delete every vertex of
weight at least 1/32, at a cost of at most 32T vertices.
In the surviving supply graph give every edge uv length
(w(u)+w(v))/2, and in each component use the resulting
shortest-path pseudometric d. For any surviving demand
ends s,t in the same component, every path between them has
edge length equal to its total vertex weight minus
(w(s)+w(t))/2. Consequently d(s,t)>31/32. In particular a
component with diameter at most 1/2 cannot contain both ends.

In every component of diameter greater than 1/2, take a
maximal set of centers with pairwise distances greater than
1/8. Every vertex of the component is within 1/8 of one.
The balls of radius 1/16 around centers are disjoint, also
across components. Each such ball contains vertex weight
at least 1/32. Indeed the center has eccentricity greater
than 1/4, so take a shortest simple path to a point at distance
greater than 1/4. The prefix through the last vertex within
distance 1/16 lies in the ball and has edge length greater
than 1/32: the next edge has length less than 1/32. Prefix
vertex weight is at least prefix edge length. Thus there are
at most floor(32T) centers altogether.

## Random radii with a harmonic rather than linear loss

Use one uniformly random radius R in [1/8,1/4] and a uniformly
random permutation of the centers. For a vertex v in a
component with centers, let c(v) be the first center in
that component with d(c(v),v) <= R+w(v)/2. It exists by
the net property. Keep v with cluster label c(v) if
d(c(v),v) < R-w(v)/2; otherwise delete v. Events of exact
equality may be ignored since R has a continuous law.

No edge uv between kept vertices joins different clusters.
For otherwise, suppose c(u) is earlier than c(v). Then

    d(c(u),v) <= d(c(u),u) + (w(u)+w(v))/2
                < R+w(v)/2 ,

contradicting the definition of c(v). Accordingly every
surviving component in this part has diameter at most 2R
in the original surviving-graph pseudometric: all its
vertices are within R of the same center. Those components
left untouched already had diameter at most 1/2. All surviving
demand ends are therefore separated.

To bound the expected number of deletions, fix v, order
its possible centers by nondecreasing distance d_j, and
condition on R. If center j is eligible, all earlier indices
by distance are eligible too, so the probability it is the
earliest eligible center in the random permutation is at
most 1/j. For it also to cause deletion, the radius must lie
in the interval |R-d_j| <= w(v)/2, of length w(v). Averaging
the conditional bound over the radius interval of length
1/8 and summing over j shows that v is deleted with probability
at most 8w(v) H_floor(32T). Summing over vertices and adding
the initial deletions gives the claimed bound by averaging.

## Scope checks

The proof handles arbitrary demand graphs rather than only a
matching, and hinges on allowing removal of terminals at unit
cost. When the supply graph is bipartite, the parity-constrained
variant reduces to the same theorem by discarding demands with
the wrong bipartition parity. In a nonbipartite graph a walk
of the right parity need not yield a simple path of that parity:
lifting to the bipartite double cover is not a proof of that
variant. Also, T is not the half-integral packing number.
Known superconstant gaps between fractional multiflow and
congestion-two routing cannot simply be replaced by a constant
factor. The outstanding question is whether a bound in terms
of congestion two alone exists, especially with parity.

Sources for comparison: [Marx–Wollan on integral valid paths](https://arxiv.org/abs/1411.0871);
[Chen's marker formulation](https://arxiv.org/abs/2609.26158);
[Kratsch–Wahlström, Lemma 23, quoting approximation in terms of
the integral optimum](https://pure.royalholloway.ac.uk/files/36953364/Accepted_Manuscript.pdf).
