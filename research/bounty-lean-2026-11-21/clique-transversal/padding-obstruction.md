# Padding does not repair the single-edge reduction

The parent and worker independently observed that the restriction `γ(G)<n/2`
does not rescue the failed deletion lemma. This note records a connected
counterexample to that proposed reduction. It is not a counterexample to
Erdős151.

Let `I` be the 12-vertex icosahedral graph from
`edge-deletion-obstruction.json`. The verified values are

```math
\gamma(I)=6,\qquad \gamma(I-e)=7\quad(e\in E(I)).
```

Let `C` be a five-cycle on vertices `12,13,14,15,16`, in that cyclic order.
Take the disjoint union of `I` and `C`, then add the bridge `0–12`. Call the
result `G`.

Every maximal triangle of `I` remains a maximal clique of `G`. Every cycle
edge remains a maximal two-vertex clique. No clique crosses the bridge
except the bridge itself. Consequently a clique-avoiding set of `G` uses
at most six vertices of `I` and at most two vertices of `C`, so `γ(G)≤8`.

Conversely, take any six-vertex witness for `I` and add `{13,15}`. The latter
is independent in `C` and avoids vertex 12. Thus the combined set contains
neither a cycle edge nor the bridge, and it remains clique-avoiding in `G`.
It has size eight. Therefore

```math
|V(G)|=17,\qquad \gamma(G)=8\lt17/2.
```

The triangle edges of `G` are exactly the thirty edges of `I`. After deleting
any such edge, the maximal cliques within `I−e` remain maximal in the joined
graph; the bridge cannot extend a clique of size at least two. The same
restriction argument gives `γ(G−e)≤7+2=9`. A seven-vertex witness from the
certificate for `I−e`, together with `{13,15}`, gives the reverse inequality.
Hence

```math
\gamma(G-e)=9>8\quad\text{for every triangle edge }e\text{ of }G.
```

Connectedness and a strict half-order threshold therefore both fail to fix
the lemma. No additional search is needed to establish this obstruction.

The failure is local to the icosahedral part. It suggests that further
global size thresholds on `γ(G)` cannot justify a local deletion rule
without an additional structural mechanism. We are not pursuing more such
threshold repairs.
