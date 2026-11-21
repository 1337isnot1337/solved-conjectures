# Erdős 617: what a rook configuration forces in the other colors

21 November 2026. This is an additional structural route, not a full solution. It explicitly constructs a simultaneous coloring when using other colors after edge deletion. No claim of priority is made; earlier clique-residue and affine-repair research may contain related consequences.

## Explicit recoloring after the critical reduction

Start with a hypothetical balanced coloring, choose its sparse color 1, and delete color-1 edges until the retained graph `H` is independence-critical. There is a simple mathematical way to realize `H` as an actual color class of another hypothetical balanced coloring: give every deleted color-1 edge color 2.

The retained color-1 graph still has independence number `r`. Color 2 only gains edges, so its independence number cannot increase. Every other color graph is unchanged. Thus all color graphs still have independence number at most `r`, and all pairs are again assigned exactly one color.

This is an explicit recoloring argument, not an assumption that deleted edges had silently retained a color. The graph `H` and its edge bound `e(H)<=(r^3+r)/2` are unchanged. It need not remain a sparsest color after the reassignment; the established budget is all that subsequent deductions use.

We may therefore work in this new simultaneous coloring, with `H` itself as color 1. In particular, the residue attachment sets `A` and `Z` from the critical-graph analysis are actual color-1 attachment sets in this coloring.

## Setup and the exact excess identity

Suppose a hypothetical balanced `r`-coloring contains `q` disjoint full cliques `Q_1,...,Q_q` in color 1. Let `U` be their union. Write `M` for the number of color-1 edges between different `Q_i`.

Every other color `j` has independence number at most `r` on the `qr` vertices of `U`. The complementary form of Turán's theorem gives

```math
e_j(U)\ge r\binom q2,
\tag{1}
```

with equality exactly when its graph on `U` is a disjoint union of `r` cliques of order `q`.

All within-row edges have color 1. Counting the edges between rows therefore gives the exact identity

```math
\sum_{j=2}^r\left(e_j(U)-r\binom q2\right)
=r\binom q2-M.
\tag{2}
```

Each summand is nonnegative. The right side measures the number of missing edges from full color-1 cross matchings.

For example, if a residue independent set of size `r-q+1` supplies the previously known boundary matching obstruction, then `M>=(q-1) binom(q,2)` and the total excess in (2) is at most `(r-q+1) binom(q,2)`. This last matching bound is prior work, not established here as a new result.

## Full matchings force column partitions in every other color

If every color-1 matching between two rows is perfect, then `M=r binom(q,2)`. Equation (2) forces equality in (1) for every color `j>=2`.

Consequently, for each such color `j`, its graph on `U` is exactly `r` disjoint `K_q`. Each of these `K_q` meets every row once, because two vertices in the same row have color-1 adjacency. Call these the color-`j` columns.

This conclusion only needs full pairwise color-1 matchings. Their consistency in color 1 is not needed for the edge-count argument. In the branch where the previously proved residue lemma supplies a full color-1 rook graph, the hypothesis holds automatically.

If this configuration was first found in an edge-deleted color-1 graph, the explicit recoloring above makes it the color-1 graph of a balanced coloring. Thus (1) and (2) apply without leaving any edges uncolored.

## Every residue vertex dominates a column in each other color

Fix `j>=2`, and let `v` be outside `U`. The vertex `v` must be adjacent in color `j` to every member of at least one color-`j` column. Otherwise choose one color-`j` nonneighbor of `v` from each of the `r` disjoint columns. There are no color-`j` edges between these chosen vertices, so they and `v` form an independent `(r+1)`-set in color `j`.

This domination conclusion holds for every residue vertex in the simultaneous coloring, without any assumption about criticality.

## Residue vertices attached to every row

Let `A` consist of residue vertices having exactly one color-1 neighbor in every row. For such a vertex, the `r` edges into each full row must use every color exactly once: all `r-1` other colors must occur, and color 1 already occurs once.

Thus each `v` in `A` has exactly `q` color-`j` neighbors in `U`. By the preceding domination fact, these neighbors form exactly one color-`j` column.

If two vertices `v,w` of `A` choose the same color-`j` column, their mutual edge must have color `j`. Otherwise take one vertex from each of the other `r-1` columns; those vertices together with `v,w` form an independent `(r+1)`-set in color `j`.

Hence all `A` vertices selecting a fixed color-`j` column form a clique in color `j`, together with that entire column. Since no monochromatic `K_(r+1)` can occur,

```math
|A\text{ selecting a fixed column}|\le r-q.
```

Partitioning `A` by its chosen column yields

```math
|A|\le r(r-q).
\tag{3}
```

The full residue has `r(r-q)+1` vertices, so at least one residue vertex is outside `A`.

For the edge-critical sparse graph studied in the companion notes, a separate attachment lemma proves that a residue vertex either has one neighbor in every full row or none in any row. By the explicit recoloring, these are now exactly the sets `A` and `Z` in the simultaneous coloring. Consequently `Z` is nonempty, and its vertices have no color-1 neighbors anywhere in `U`.

In fact `|Z|>=2` in this branch. If `|Z|=1`, then `|A|=r(r-q)`, so equality holds in every one of the `r` column-capacity bounds for each other color. That color would contain `r` disjoint full `K_r`, a configuration already excluded by the prior packing theorem. This does not exclude larger `Z`.

## A coding interpretation with a precise limit

For each vertex in `U union A`, record its column label in each of the `r-1` colors other than color 1. Two distinct vertices cannot share two labels, because sharing a label forces their mutual edge to have the corresponding color. Thus any two coordinates identify a vertex uniquely, giving the familiar upper bound `|U union A|<=r^2`.

The one extra vertex of the target graph lies outside this coded set. Residue vertices outside `A` can have additional neighbors in other colors, and they need not have unique column labels. The argument does not dispose of those vertices or show that the coloring is impossible.

The unresolved issue is exactly these exceptional residue vertices and their interactions. A coding bound for the attached vertices alone does not resolve the bounty.

## Prior-work context

- The general conjecture and its sharp affine-plane examples originate in Erdős and Gyárfás, *Split and balanced colorings of complete graphs*, Discrete Mathematics 200 (1999), 79–86, DOI: <https://doi.org/10.1016/S0012-365X(98)00323-9>.
- Prior clique-residue and affine-repair notes: <https://erdosproblems.ai/wiki/research/erdos_617/independent/clique_residue_and_affine_repair>.
- Prior growing local-independence and prescribed-packing notes: <https://erdosproblems.ai/wiki/research/erdos_617/independent/growing_local_independence_range>.
- The repository document [earlier repository note](../../../docs/erdos-gyarfas-balanced-coloring.md) already proves that sufficiently large residue independence forces consistent full cross matchings. This note uses that branch and does not recast it as a new discovery.
