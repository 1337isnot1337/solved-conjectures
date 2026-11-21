# Remaining simultaneous-deletion route

This is an unproved sufficient statement, not a claimed theorem.

For a graph `G`, define

```
σ(G) = min { α(F) : F is a spanning triangle-free subgraph of G }.
```

If one could prove `σ(G)≤γ(G)` for every finite graph, Erdős151 would follow:
every candidate `F` has `α(F)≥H(n)`, hence `H(n)≤σ(G)≤γ(G)`.

This is weaker than requiring `F` to have an edge in every maximal clique
of `G`. It only bounds the largest independent set of `F`; it allows some
small maximal cliques of `G` to remain independent in `F`.

It is also different from the rejected single-edge deletion lemma. In the
icosahedral graph, every first edge deletion increases `γ`, but a spanning
perfect matching is triangle-free and has independence number six, equal
to `γ(I)`. Simultaneous deletion therefore survives that example.

## Exact finite formulation

For a proposed bound `r=γ(G)`, introduce a binary variable `x_e` for every
edge of `G`, indicating that the edge is kept in `F`. The conditions are

```
sum(x_e : e is an edge of triangle T) ≤ 2      for every triangle T of G;
sum(x_e : e has both ends in S) ≥ 1           for every (r+1)-vertex set S.
```

The first family makes `F` triangle-free. The second says that no independent
set of size `r+1` exists. A complete feasible assignment would establish
`σ(G)≤r` for that graph. An infeasible system would refute the simultaneous
subgraph reduction, but would not by itself refute Erdős151, because a
different triangle-free graph on the same number of vertices could still
have independence number at most `r`.

Equivalently, color the edges of the complete graph red or blue, requiring
that only edges of `G` may be red. The red graph must contain no triangle,
and the blue graph, including every original nonedge of `G`, must contain
no complete graph on `r+1` vertices.

## Restrictions before computation

The edge-coloring lemma in `reductions.md` already proves `σ(G)≤γ(G)`
whenever `G` is not edge-Ramsey for two triangles. Testing ordinary small
graphs on that side of the condition cannot expose a new obstruction.

Adding edges that belong to no triangle cannot change whether a graph has
a red/blue coloring with no monochromatic triangle. In particular, attaching
a triangle-free graph to an edge-colorable triangle core using only new
edges that lie in no triangles cannot produce an Erdős151 counterexample.
Such edges can all be forced red in the sufficient subgraph construction.

The work so far has produced neither a general proof of this simultaneous
reduction nor a counterexample to it. No new unconstrained numerical search
is being treated as a substitute for that missing argument.
