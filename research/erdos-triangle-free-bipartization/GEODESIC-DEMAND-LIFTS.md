# Preserving long broken-edge distances in finite lifts

A transfer for the auxiliary distance question in [Ferudun, §7](https://arxiv.org/html/2606.28041v1), not a resolution of [Erdős Problem 23](https://www.erdosproblems.com/23). It lets a search choose rational edge masses separately from vertex masses **without** weakening maximum-cut optimality or replacing the actual crossing distances by fractional ones.

Let T be a connected simple bipartite supply graph. Vertex i has positive rational mass p_i, with total mass one. Each supply edge ij has capacity p_i p_j. A demand ij has endpoints on the same supply shore and has rational mass z_ij in [0,p_i p_j]. Assume the graph obtained by adding all positive demand pairs to T is triangle-free. Suppose the positive demands can simultaneously be routed along supply paths with congestion at most one.

Then there is a simple unweighted triangle-free graph G, with a specified maximum cut, whose normalized broken-edge mass and normalized distance moment are exactly

    beta(G)/N² = Σ z_ij,
    Gamma(G)/N² = Σ z_ij (dist_T(i,j)+1)².

Here N is the number of vertices in G, and Gamma computes the distances in the actual crossing graph of the specified cut. The routing paths need not themselves be shortest. For T a tree, the routing hypothesis is equivalent to the load of the unique paths fitting every supply capacity. For a path, an interval of a demand loads exactly the consecutive links between its endpoints.

## Construction

Choose a common denominator N large enough that n_i=N p_i is an integer, and so is q_ij n_i and q_ij n_j on each demand link, where q_ij=z_ij/(p_i p_j). Replace class i by n_i independent vertices. Use all pairs across each supply edge. On a demand pair ij use any simple biregular graph of density q_ij between its two classes. For example, give each row q_ij n_j consecutive columns in cyclic order; advance the start by that row length for the next row. No column repeats within a row, and the total number of slots is divisible by n_j, so each column has degree q_ij n_i. All original edges project to the triangle-free support, hence the lift is triangle-free.

Use the bipartition of T to colour the classes. Supply edges cross and demand edges are monochromatic. To prove optimality, normalize each original edge capacity to 1/N². Divide the route for each class pair across its actual demand edges equally. For a route through several supply classes, pick every intermediate vertex independently uniformly in its class. At the two endpoints the joint distribution comes from the selected demand edge. Each marginal there is uniform by biregularity. Since the route has at least two edges, no supply link sees both constrained endpoints; it has the uniform product marginal on its two classes. Therefore on each actual supply edge the total load is the class-link load divided by n_i n_j, at most p_i p_j/(n_i n_j)=1/N².

For any change of signs, let A be the set of vertices flipped from the specified cut. Every demand edge crossing the boundary of A whose status would improve uses at least one routing supply edge across that boundary. Unit routing proves that the improved demand mass cannot exceed the original crossing mass lost. The stated parity colouring is therefore a true optimum, not just stable under one-vertex changes.

The actual crossing graph is precisely the complete blow-up of T. Projection of any actual crossing path gives a supply walk of the same length. Conversely a shortest supply path lifts to a path between any designated endpoints of its two classes. It follows that the actual crossing distance between the endpoints of every demand edge equals dist_T(i,j), proving the two normalized identities.

## Exactness for a tree-host search

Conversely, if the parity cut of any complete supply-tree blow-up is a maximum cut, flip the full classes on one side of a tree edge. Only that one complete supply rectangle is lost, while exactly the demand edges whose unique projected paths use the edge are recovered. This gives the class capacity condition independently of the detailed demand adjacency. Thus the rational interval-capacity model for a path, or the unique-path capacity model for a tree, precisely captures when a candidate complete supply lift is admissible. A strict rational violation of the distance-moment bound in that model would produce an actual unweighted counterexample to the auxiliary inequality for a specified maximum cut. It would not automatically refute the bipartization conjecture.

A check against a tempting false novelty: a path on g+1 classes with odd g, half-weight first and last classes, unit weights on the others, and demands (0,g−1) and (1,g), attains the auxiliary bound. But the first and last classes are false twins in the full graph. Merging them gives the usual balanced C_g, not a new extremizer. Thus overlap of two long routed demands can coexist with equality without producing a genuinely different obstruction. Exploratory optimization of path data did not produce a strict violation; no finite completeness conclusion is intended.
