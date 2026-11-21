# Restrictions on a counterexample to Erdős151

These are elementary route checks, not a resolution or a novelty claim.
The full target is reserved in [issue #228](https://github.com/1337isnot1337/solved-conjectures/issues/228).

Let `G` be a finite simple graph on `n` vertices. A big maximal clique is an
inclusion-maximal complete vertex set of size at least two. Write `γ(G)` for
the largest size of a vertex set containing no big maximal clique of `G`.
Complementation gives `γ(G)=n−τ(G)`. The conjecture is `γ(G)≥H(n)`, where
`H(n)` is the minimum independence number of a triangle-free graph on `n`
vertices. Singleton maximal cliques are deliberately ignored.

## Triangle-free subgraph criterion

Suppose a spanning triangle-free subgraph `F` of `G` has an edge inside every
big maximal clique of `G`. Every independent set of `F` then contains no big
maximal clique of `G`: containing such a clique would contain its chosen edge.
Consequently `γ(G)≥α(F)≥H(n)`.

The criterion is sufficient. It does not hold for every graph: take a
`K4`-free edge-Folkman graph `G`, meaning that every red/blue coloring of its
edges has a monochromatic triangle. All triangles of `G` are maximal. If
such an `F` existed, color its edges red and the other edges blue. The red
graph is triangle-free by assumption, and the blue graph is triangle-free
because every triangle has a red edge. This contradicts the Folkman property.

Existence of the needed Folkman graphs is established independently of this
argument; a primary source is Linyuan Lu, *Explicit construction of small
Folkman graphs*, SIAM Journal on Discrete Mathematics 21(4) (2008), 1053–1060,
[DOI 10.1137/070686743](https://doi.org/10.1137/070686743),
[author PDF](https://people.math.sc.edu/lu/papers/f234.pdf).
The paper constructs a 9,697-vertex example. This refutes the stronger
criterion as a universal strategy; it does not refute Erdős151.

## An edge-Ramsey necessary condition

**Lemma.** If the edges of `G` can be colored red and blue with no
monochromatic triangle, then `γ(G)≥H(n)`.

**Proof.** Start with the red spanning subgraph. Recolor every edge that lies
in no triangle of `G` red. Recoloring these edges cannot create a red triangle,
since such a triangle would be a triangle of `G` containing a recolored edge.
No blue triangle is created by deleting blue edges.

Every maximal two-vertex clique is an edge contained in no triangle, so it is
now red. Every maximal clique of size at least three contains a triangle;
that triangle has a red edge because the coloring has no blue triangle.
The red spanning graph is therefore triangle-free and has an edge in every
big maximal clique. Apply the preceding criterion. ∎

Thus any counterexample must satisfy the **edge**-Ramsey property
`G → (K3,K3)`. If it is also `K4`-free, it must be an edge-Folkman graph.
This condition concerns Ramsey arrowing; the unrelated 20-vertex bipartite
graph also called the Folkman graph is not an eligible example.

## Vertex partitions and one-vertex extensions

If `V(G)=A∪B` and both induced graphs `G[A]` and `G[B]` are triangle-free,
color edges within the parts red and edges across the parts blue. A red
triangle would lie in one part, and the blue graph is bipartite. The lemma
applies. In particular, a counterexample cannot be obtained by adding just
one or two vertices, with arbitrary new edges, to a triangle-free graph.

For a one-vertex extension there is also an explicit subgraph. Suppose
`G−v=T` is triangle-free. Let `N=N_G(v)` and let `N0` be the vertices of `N`
that are isolated in the induced graph `T[N]`. Keep all edges of `T`, and
keep precisely the edges `vu` with `u∈N0`. Call the resulting spanning graph
`F`.

There are no triangles within `T`, and a triangle through `v` would require
an edge between two vertices of `N0`, which does not exist. A maximal edge
not containing `v` remains in `T`. A maximal edge `vu` has no common neighbor
of its endpoints, hence `u∈N0` and is kept. Finally, every maximal clique of
size at least three must be a triangle `vxy`, and its edge `xy` remains in
`T`. Thus `F` satisfies the criterion.

This rejects the idea of extending a triangle-free Ramsey-critical graph
by one vertex to obtain a counterexample at the next Ramsey threshold.

## Additional elementary filters

For every vertex `v`, its open neighborhood contains no maximal clique of
`G`: a clique contained in that neighborhood can be extended by `v`.
Therefore

```
γ(G) ≥ Δ(G),     γ(G) ≥ α(G).
```

A counterexample must have both `Δ(G)<H(n)` and `α(G)<H(n)`.

Every properly five-colored graph has a triangle-free red/blue edge coloring:
color the edges between its color classes using the five-cycle coloring of
`K5`, whose red and blue graphs are both five-cycles. A triangle has three
distinct vertex colors, so it cannot become monochromatic. Consequently a
counterexample must have chromatic number at least six.

## Prior-art caution

The asymptotic relaxation `τ(G)≤n−c√(n log n)` is already known from Joret,
Micek, Reed, and Smid, *Tight Bounds on the Clique Chromatic Number* (2021),
[DOI 10.37236/9659](https://doi.org/10.37236/9659). It does not establish the
exact extremal value `H(n)` in Erdős151.

A search index also exposes a prior research README attributed to
`edisonymy/erdos-lean-research`, claiming finite verification through order 39
and a vertex-Ramsey necessary condition. The named GitHub repository returned
404 when fetched on 21 November 2026, so its proof files were not audited.
This is a prior-art lead, not a verified theorem or a source for our proofs.
No novelty or solved-conjecture count is assigned to the elementary lemmas
above, and the conjecture remains unresolved here.

## A second proposed all-graphs reduction is false

A weaker strategy would not demand that one triangle-free subgraph have an
edge in every maximal clique. Instead, it would repeatedly delete a triangle
edge `e` satisfying `γ(G−e)≤γ(G)`. If such an edge always existed, the process
would eventually yield a triangle-free graph `F` with
`H(n)≤α(F)=γ(F)≤γ(G)`, proving the full conjecture.

The necessary deletion lemma is false. The icosahedral graph on 12 vertices
has `γ=6`, but deleting any of its 30 edges gives a graph with `γ=7`. All of
its edges lie in triangles. Thus no first deletion is available.

`edge-deletion-obstruction.json` supplies the explicit graph, a six-vertex
clique-avoiding set, and a seven-vertex clique-avoiding set after each edge
deletion. The independent standard-library verifier
`verify_edge_obstruction.py` reconstructs every maximal clique and exhausts
all vertex sets of the next size to verify optimality. It checks all 30
deletions, without relying on graph symmetry or a numerical optimizer.

```sh
python verify_edge_obstruction.py
```

This graph does not refute Erdős151. The obstruction only says that such a
proof cannot insist that `γ` never increase after each individual edge
deletion. A simultaneous deletion or a different triangle-free graph could
still work. For example, a perfect matching in the icosahedral graph already
gives a triangle-free spanning subgraph with independence number six.

The initial diagnostic `test_edge_deletion.cpp` missed this obstruction in
all 32,768 labeled graphs on six vertices and 500 random graphs at each order
7 through 12. `edge-deletion-log.jsonl` preserves those negative searches.
The exact structured example, not those positive samples, rejects the lemma.
