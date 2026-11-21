# Erdős 617: three full cliques isolated in the intersection graph

21 November 2026. This strengthens the forced-three-cliques deduction. It remains a necessary condition for a hypothetical counterexample, not a proof of the full conjecture or a bounty claim. The argument depends on the Abiad–Kumar–Pragada localized independence theorem cited below.

## Statement and terminology

Let `r>=6`, and let `H` be the edge-critical reduction of a sparsest color graph in a hypothetical balanced coloring of `K_(r^2+1)` with `r` colors. Then at least three full cliques of `H` are disjoint from every other full clique of `H`.

Here a full clique means a copy of `K_r`. A clique isolated in the *full-clique intersection graph* need not be an isolated connected component of `H`: it may have edges to vertices outside the clique. The conclusion concerns intersections of full cliques, not the absence of such attachment edges.

Only the preserved necessary conditions listed in `erdos617-edge-critical-reduction.md` are used. The edge-deleted graph is not treated as a new literal color class partition.

## Preliminary bounds

Write `n=r^2+1` and `B=(r^3+r)/2`.

Distinct full cliques meet in at most one vertex, so their internal edge sets are disjoint. If there are `q` full cliques, then

```math
q\binom r2\le e(H)\le B,
\qquad
q\le r+1 \quad(r\ge4).
\tag{1}
```

The last inequality follows from `(r^2+1)/(r-1)=r+1+2/(r-1)`. The localized independence estimate also requires at least `2r+1` vertices in full cliques, so `q>=3`.

If `H` is disconnected, every full clique is an entire connected component, as proved in the edge-critical companion note. Therefore all full cliques are isolated in their intersection graph, and the conclusion follows from `q>=3`.

Assume for the rest of the proof that `H` is connected. Then every full-clique vertex has degree at least `r`, and a vertex shared by two full cliques has degree at least `2r-2`. These degree bounds are proved in `erdos617-forced-three-cliques.md`.

The same note proves that if a set `X` of `h` vertices meets every full clique and `D=e(H)-e(H-X)`, then

```math
D\le\left(\frac{3h}{2}-1\right)r-\frac{(h-1)^2}{r}.
\tag{2}
```

This follows by applying the localized independence bound to the `K_r`-free induced graph `H-X`.

## An edge cover and independent representatives

Let `L` be the full-clique intersection graph, and let `b` be the number of isolated vertices of `L`. If all its vertices are isolated, `b=q>=3` and there is nothing to prove.

Otherwise, the subgraph induced by the nonisolated vertices has an edge cover with `a` edges, where

```math
1\le a\le q-b-1.
```

For example, take a maximal matching, then add an incident edge for every unmatched vertex; there are no isolated vertices in this subgraph. Choose the shared vertex of `H` corresponding to each edge in the cover. These `a` centers meet every nonisolated full clique. They are distinct because edge-criticality forbids an original vertex in three full cliques.

Now choose one vertex from each of the `b` isolated full cliques, successively, avoiding adjacency to every chosen center and every previously chosen representative. Every previously chosen vertex lies outside the current clique and forbids at most one of its vertices. Since

```math
h=a+b\le q-1\le r,
```

there are at most `h-1<=r-1` forbidden vertices, so every choice is possible.

The resulting set `X` meets all full cliques. The `b` representatives are pairwise nonadjacent and have no edges to the `a` centers. Hence

```math
e_H(X)\le\binom a2.
```

The degree bounds give

```math
D=\sum_{x\in X}d_H(x)-e_H(X)
  \ge a(2r-2)+br-\binom a2.
\tag{3}
```

Subtracting the necessary upper bound (2) from (3) gives

```math
F_b(a)
=r\left(1+\frac{a-b}{2}\right)
 -\frac{a(a+3)}2
 +\frac{(a+b-1)^2}{r}.
\tag{4}
```

For fixed `b` and `r>=4`, this is a concave quadratic in `a`, because its quadratic coefficient is `-1/2+1/r<0`. Thus its minimum on `1<=a<=r-b` is attained at an endpoint.

## Ruling out zero, one, or two isolated cliques

The endpoint values in (4) are:

| `b` | `F_b(1)` | `F_b(r-b)` |
| --- | --- | --- |
| 0 | `3r/2-2` | `r/2-2+1/r` |
| 1 | `r-2+1/r` | `r/2-1+1/r` |
| 2 | `r/2-2+4/r` | `r/2-1+1/r` |

Every entry is positive for `r>=4`. Consequently `F_b(a)>0` throughout the allowed interval when `b` is 0, 1, or 2. This contradicts the simultaneous bounds (2) and (3).

Therefore `b>=3`.

The displayed arithmetic already works for `r>=4`. The research statement is recorded for `r>=6`, the general range currently under investigation; the previously settled smaller cases are not claimed as new solutions.

## Refinement when some full cliques intersect

Two additional deductions show that, in the connected case, the presence of an intersecting pair forces at least **four** isolated vertices of the full-clique intersection graph.

### The total number of full cliques is at most `r`

Let `ell=e(L)`. Edge-criticality implies that each original vertex belongs to at most two full cliques. There are consequently `qr-2ell` vertices belonging to exactly one full clique. Each such vertex has an edge leaving its clique, by connectedness and criticality. None of these edges belongs to the internal edge set of any full clique. Counting each possible such edge at most twice gives

```math
e(H)\ge q\binom r2+\frac{qr-2\ell}{2}
       =\frac{qr^2}{2}-\ell.
\tag{5}
```

If `q=r+1`, the edge budget forces `ell>=(r^2-r)/2`. But `L` is triangle-free, so Mantel's theorem gives `ell<=(r+1)^2/4`. The former is strictly larger for `r>=5`, because `r^2-4r-1>0`. Together with (1), this proves `q<=r`.

This deduction was supplied and independently checked by the other research agents.

### Three isolated cliques leave only one intersecting pair

Suppose `b=3` and some nonisolated vertices of `L` exist. The edge cover in the previous proof now has `1<=a<=r-4`. For `a>=2`, the same concavity argument uses the endpoint values

```math
F_3(2)=\frac{r^2-10r+32}{2r}>0,
\qquad
F_3(r-4)=\frac{r^2-6r+4}{r}>0
\quad(r\ge6).
```

The first numerator is `(r-5)^2+7`; the second is positive for `r>=6`. Hence an edge cover with at least two centers is impossible. The only remaining intersection graph is one edge together with three isolated vertices: its nonisolated component consists of exactly two intersecting full cliques.

### Exchange lemma around an intersecting pair

Let full cliques `A,B` intersect at `z`, and let another full clique `C` be disjoint from both. For every `u` in `A\{z}`, edge-criticality supplies an independent set

```math
\{z,u\}\cup S\quad\text{in }H-zu,
\qquad |S|=r-1.
```

The members of `S` lie outside `A` and `B`. Every vertex of `B\{z}` must have a neighbor in `S`, or it could join `S\cup{u}` to form an independent `(r+1)`-set. Since each member of `S` has at most one neighbor in `B`, these edges form a perfect matching.

If `S` avoids `C`, then `S\cup{u}` is an independent `r`-set outside `C`. If `S` meets `C`, it meets it in exactly one vertex `v`; replace `v` by its matched vertex in `B\{z}`. The resulting set is again an independent `r`-set outside `C` and still contains `u`.

Any independent `r`-set outside `C` must cover every vertex of `C` by its neighborhoods, or it could be extended. As each member has at most one neighbor in `C`, every member has exactly one such neighbor. In particular, `u` has a neighbor in `C`.

Therefore the edges from `A\{z}` into `C` form a matching hitting `r-1` vertices of `C`. The same is true for `B\{z}`. Their two images overlap in at least `r-2` vertices. Every vertex in that overlap has two distinct neighbors outside `C`, and hence has degree at least `r+1`.

This exchange lemma was derived by the conjectures agent and independently reviewed here. Its full companion discussion is in [essential-edge exchanges](erdos617-critical-clique-coupling.md).

### Excluding the remaining pair plus three isolated cliques

For each of the three isolated cliques, choose one of the at least `r-2` vertices of degree at least `r+1`. Choose successively while avoiding adjacency to `z` and to earlier choices. There are at most three forbidden vertices at any step, while `r-2>=4`, so the choice is possible.

Together with `z`, these representatives form an independent four-vertex set `X` meeting every full clique. Thus

```math
D\ge(2r-2)+3(r+1)=5r+1.
```

The transversal bound (2) for `h=4` gives `D<=5r-9/r`, a contradiction.

Consequently a connected reduced graph has either at least three pairwise disjoint full cliques and no intersecting pair, or at least four full cliques each disjoint from every other full clique.

## Scope of the conclusion

The reduced graph has three full cliques, each disjoint from every other full clique of that reduced graph. It follows that the original color graph contains three disjoint full cliques. Edge deletion can destroy additional original full cliques, so the stronger global-disjointness statement is asserted for `H`, not automatically for the original color graph.

Nothing in this proof excludes three or more isolated full cliques with further vertices attached to them. In the presence of intersections the minimum is now four, but the same attachment gap remains. Those attachment edges, the remaining full cliques, and their independence constraints still require analysis. The full conjecture remains unresolved.

## Sources and dependencies

- Aida Abiad, Hitesh Kumar, Shivaramakrishna Pragada, *Localization of the Caro–Wei bound and its applications to bipartiteness*, arXiv:2609.00210v1, 31 August 2026, Theorems 2.2 and 3.1. Primary PDF: <https://borowiecki.dev/pdf/2609.00210>.
- `erdos617-local-clique-bound.md`: localized inequality and clique coverage.
- `erdos617-edge-critical-reduction.md`: properties preserved by deletion and component isolation.
- `erdos617-forced-three-cliques.md`: clique-vertex degree bounds and the high-degree transversal inequality.

This is a uniform proof, not a numeric case or a claimed resolution of the bounty. No novelty claim is made.
