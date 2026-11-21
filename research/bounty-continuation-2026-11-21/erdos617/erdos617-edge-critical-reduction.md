# Erdős 617: edge-critical reduction and full-clique intersections

21 November 2026. These are structural deductions for a hypothetical counterexample. They do not complete the general conjecture, establish priority, or support a bounty claim. The external independence inequality used below is identified in `erdos617-local-clique-bound.md` and `erdos617-forced-two-cliques.md`.

## What the reduction preserves

Choose a color graph with at most the average edge budget `B_r=(r^3+r)/2` on `n=r^2+1` vertices. Repeatedly delete edges while preserving independence number at most `r`, until no further deletion is possible. Call the resulting graph `H`.

The following conditions survive:

1. `|V(H)|=r^2+1` and `alpha(H)<=r`.
2. `e(H)<=B_r`.
3. Every inherited upper bound on the edge count of an induced vertex set, including the hereditary palette caps, remains valid.
4. Every vertex outside a full clique `Q=K_r` of `H` has at most one neighbor in `Q`.

For the last point, any full clique of `H` was already a full clique before deletion, and deletion cannot add a neighbor. Equivalently, the retained `(r+1)`-set upper bound itself implies the external-neighbor condition.

The reduced graph is not asserted to be a color class in a new literal partition of the complete graph. Deleted edges are simply discarded; they are not recolored. Every deduction after this reduction must use only the preserved conditions, not a new simultaneous coloring.

In fact `alpha(H)=r`. Otherwise deleting any edge could increase independence number by at most one and would preserve the threshold. The edgeless graph has independence number `r^2+1>r`, so at least one edge remains. Minimality therefore means

```math
\alpha(H-e)=r+1\quad\text{for every }e\in E(H).
\tag{1}
```

The forced-two-cliques proof applies to these preserved conditions, so `H` contains two disjoint full cliques.

## Full cliques in a component of smaller independence number

Let `C` be a connected component of `H` with independence number `a<r`, and suppose `C` contains a full clique `Q=K_r`.

An independent `a`-set in `C-Q` would forbid at most `a<r` vertices of `Q`, and hence would extend through `Q`. Thus

```math
\alpha(C-Q)\le a-1.
```

The reverse inequality follows because an independent set in `C` uses at most one vertex of `Q`. Hence equality holds.

Any edge from `Q` to `C-Q` would then be redundant for the independence number. Deleting it leaves `Q` complete, so every independent set still uses at most one vertex of `Q` and at most `a-1` vertices of `C-Q`. This contradicts (1). There are no such cross edges, and connectedness gives `C=Q`.

Therefore, if `H` is disconnected, every full clique is an isolated connected component. Independence numbers add across components, and every proper nonempty component has independence number less than `r`, so the preceding argument applies to each component containing a full clique.

The clique-coverage estimate from the localized independence bound requires at least `2r+1` vertices lying in full cliques. Thus a disconnected `H` has at least three isolated `K_r` components. In particular:

```math
\boxed{\quad
\text{If the maximum full-clique packing has size two, }H\text{ is connected.}
\quad}
\tag{2}
```

## Three full cliques cannot share a center

First recall two consequences of the external-neighbor condition. Distinct full cliques meet in at most one vertex. If three full cliques intersect pairwise, they have a common vertex; otherwise their three different intersection vertices violate the condition for one of the cliques.

We now prove that no vertex of the edge-critical graph `H` belongs to three full cliques.

Suppose `Q_1,Q_2,Q_3` share a center `z`. Write `A_j=Q_j\{z}`. These are disjoint cliques of order `r-1`, with no edges between different `A_j`: an extra cross edge would give its endpoint two neighbors in the corresponding full clique, counting `z`.

Choose `u` in `A_1`. By (1), deleting the edge `zu` creates an independent set of size `r+1`. The set must contain both `z` and `u`, because those are the only endpoints whose adjacency changed. Write it as

```math
\{z,u\}\cup S,\qquad |S|=r-1.
```

Every vertex of `S` is outside all three full cliques, because it is nonadjacent to `z`.

Each vertex of `A_2` must have a neighbor in `S`. Otherwise that vertex could be added to the independent set `S\cup{u}`, producing `r+1` independent vertices in `H`. But each member of `S` has at most one neighbor in `Q_2`. Since both sets have size `r-1`, the edges between `S` and `A_2` form a perfect matching. The same argument applies to `A_3`.

Choose any `s` in `S`, and let `b_2,b_3` be its respective matched neighbors in `A_2,A_3`. Then

```math
(S\setminus\{s\})\cup\{u,b_2,b_3\}
```

is an independent set in `H`: the matching property removes all adjacencies to `S\{s}`, and different noncentral blocks have no cross edges. Its size is `r+1`, a contradiction.

Thus every vertex lies in at most two full cliques.

## The full-clique intersection graph

Let `L` have one vertex per full clique of `H`, joining two when they intersect. The preceding facts imply:

- `L` is triangle-free.
- Its independence number equals the maximum number of disjoint full cliques in `H`.
- Every edge of `L` corresponds to a different shared vertex of `H`, because an original vertex belongs to at most two full cliques.

If there are `q` full cliques, their union therefore has exactly

```math
qr-e(L)
\tag{3}
```

vertices.

Suppose the full-clique packing number is two. Then `L` has neither a triangle nor an independent triple, so `q<=5` by the elementary `R(3,3)=6` argument. The clique-coverage lower bound also gives `q>=3`, because two full cliques cover at most `2r` vertices.

There are only the following possible intersection graphs:

| Number of full cliques | Possible intersection graph `L` | Vertices in their union |
| --- | --- | --- |
| 3 | A three-vertex path | `3r-2` |
| 3 | One edge and one isolated vertex | `3r-1` |
| 4 | A four-cycle | `4r-4` |
| 4 | A four-vertex path | `4r-3` |
| 4 | Two disjoint edges | `4r-2` |
| 5 | A five-cycle | `5r-5` |

For completeness, the classification follows because both `L` and its complement are triangle-free. On five vertices, the degree is exactly two at every vertex, forcing a five-cycle. On four vertices, every degree is one or two, giving the three listed possibilities. On three vertices, there must be at least one edge and at least one nonedge.

There are six rows because the packing-two situation allows two shapes on three cliques, three on four cliques, and one on five cliques. This classifies only how the full cliques intersect. It does not classify the remaining vertices, all other edges, or the original coloring.

## Remaining gap

The reduction gives a connected edge-critical graph when the packing number is two, together with the intersection patterns above. Maximum independent sets and essential-edge certificates impose further restrictions on attachments to the cliques, but no argument here excludes all six patterns.

Packing numbers at least three also remain. The earlier exclusion of a packing of size `r` does not eliminate that intermediate range. The general bounty target is still unresolved.
