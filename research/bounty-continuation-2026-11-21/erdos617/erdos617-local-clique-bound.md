# Erdős 617: consequences of a localized independence bound

21 November 2026. These are necessary conditions for a hypothetical balanced coloring, not a solution of the conjecture. Priority for these applications has not been established.

## External theorem

Aida Abiad, Hitesh Kumar, and Shivaramakrishna Pragada, *Localization of the Caro–Wei bound and its applications to bipartiteness*, arXiv:2609.00210v1, dated 31 August 2026, prove in Theorem 3.1 that

```math
\alpha(G)\ge\sum_{v\in V(G)}\frac{2}{d_G(v)+c_G(v)+1},
```

where `c_G(v)` is the order of the largest clique containing `v`. Their Theorem 2.2 gives the stronger quadratic inequality

```math
x^\mathsf{T}(I+C+A)x\ge\frac{2}{\alpha(G)}
\quad\text{when }x\ge0,\quad\sum_vx_v=1,
```

with `C=diag(c_G(v))`. The primary paper, including the minimizing-vector and private-neighbor proof of this inequality, was read from this [PDF copy](https://borowiecki.dev/pdf/2609.00210). The arXiv landing and HTML pages were unavailable to the retrieval tool. This note relies only on the stated independence inequalities, not the paper's later spectral results.

## Edge count and vertices in full cliques

Let `n=r^2+1`. Suppose `G` is a color graph in a hypothetical balanced coloring. Then `alpha(G)<=r` and `omega(G)<=r`. Put

```math
t(G)=\bigl|\{v:v\text{ lies in a }K_r\text{ of }G\}\bigr|,
\qquad B_r=\frac{nr}{2}.
```

The uniform vector in the quadratic inequality gives

```math
n+\sum_v c_G(v)+2e(G)\ge\frac{2n^2}{r}.
```

Since `sum c_G(v)<=(r-1)n+t(G)`, rearrangement yields

```math
\boxed{\quad e(G)\ge B_r+\frac nr-\frac{t(G)}2.\quad}
\tag{1}
```

Consequences:

- A color graph containing no `K_r` has more than the average edge budget.
- Any color graph at or below the average budget has at least `ceil(2n/r)=2r+1` vertices belonging to `K_r` cliques.
- Summing (1) over all colors gives

```math
\sum_{i=1}^r t(G_i)\ge2n.
\tag{2}
```

Thus a sparse color must contain at least three distinct full cliques. They need not be vertex-disjoint. This distinction prevents a direct invocation of the existing theorem excluding `r` disjoint full cliques of one color.

There is a modest integer refinement. The quantity `n+sum c_G(v)+2e(G)` is an integer, so it is at least `ceil(2n^2/r)=2r^3+4r+1` for `r>=3`. Consequently,

```math
2e(G)\ge2B_r+2r+1-t(G),
\qquad
e(G)\ge B_r+r+1-\left\lceil\frac{t(G)}2\right\rceil.
```

Summing the second inequality over the colors gives

```math
\sum_i\left\lceil\frac{t(G_i)}2\right\rceil\ge r(r+1),
\qquad
\sum_i t(G_i)\ge2r^2+r=2n+r-2.
\tag{3}
```

These counts concern vertices covered by full cliques, not a disjoint clique packing.

## How full cliques can intersect

The local palette condition implies that every vertex outside a color-`i` clique `Q=K_r` has at most one color-`i` neighbor in `Q`. It follows that distinct full cliques of that color intersect in at most one vertex.

Furthermore, three pairwise-intersecting full cliques must have a common vertex. Otherwise their three different intersection vertices would put an external vertex adjacent to two vertices of one full clique.

If `q` full cliques share a center, their other vertices form `q` mutually nonadjacent `(r-1)`-cliques in that color. Indeed, an extra cross edge would give its endpoint two neighbors in a full clique, counting the shared center. The number `q` is at most `r-1`: if `q=r`, any vertex outside their union can be added to an independent transversal chosen from the `r` noncentral blocks, because it forbids at most one vertex in each block. Such an outside vertex exists since their union has only `r(r-1)+1<n` vertices. This gives a forbidden independent set of size `r+1`.

These incidence restrictions and (2) retain useful information beyond a single clique-number bound. They still do not guarantee enough disjoint full cliques, or control all edges outside those cliques. No full contradiction was obtained.
