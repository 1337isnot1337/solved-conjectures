# Achour's conjecture

Status: an independently reviewed reduction, not a resolution. Target tracking: [issue 185](https://github.com/1337isnot1337/solved-conjectures/issues/185).

## Exact target

Hassine Achour's [primary source](https://github.com/hermespromox/degree-independent-domination-saturation-conjecture/blob/b7d8ac7e911e19f23b40588b251be03d73105bd6/paper.tex), archived as [DOI 10.5281/zenodo.21801900](https://doi.org/10.5281/zenodo.21801900), conjectures that every finite simple connected nontrivial graph satisfies

```math
s(G)\leq\left\lceil\frac{\Delta(G)i(G)}2\right\rceil,
```

where `s` is the minimum cardinality of a maximal matching and `i` is the independent domination number. This is distinct from the author's degree-spread conjecture, which is already refuted by a known regular-graph example.

## Reduction to efficient domination at the degree bound

It is enough to prove the conjecture for graphs `J` with an efficient dominating set `D` of cardinality `k` such that every member of `D` has degree `Delta(J)`. Equivalently, `J` consists of `k` disjoint stars with `Delta` leaves each, together with arbitrary edges among their leaves, subject to connectivity and the maximum-degree bound.

More precisely, for any connected nontrivial graph `G`, writing `Delta=Delta(G)` and `k=i(G)`, there is a connected simple graph `J` satisfying

```math
\Delta(J)=\Delta,\qquad |V(J)|=(\Delta+1)k,
\qquad i(J)=k,\qquad s(G)\leq s(J).
```

### Construction

Choose a minimum independent dominating set `D` in `G`. For each vertex `v` outside `D`, put `r_v=|N(v) intersect D|`, which is positive. Replace `v` by `r_v` vertices forming a clique. Assign these copies bijectively to the neighbors of `v` in `D`, and join each copy to its assigned neighbor only. Choose one distinguished copy of each `v`; represent every old edge between vertices outside `D` by the edge between their distinguished copies.

A distinguished copy has degree

```math
(r_v-1)+1+(\deg_G(v)-r_v)=\deg_G(v)\leq\Delta.
```

Every other copy has degree `r_v<=Delta`. Members of `D` retain their original degrees. Contracting each copy clique recovers `G`, so the split graph is connected. Add `Delta-deg_G(d)` new pendant neighbors to each `d` in `D`; call the resulting graph `J`. These additions preserve connectivity and the degree bound, while ensuring that every member of `D` has degree exactly `Delta`.

Every vertex outside `D` has exactly one neighbor in `D`, and `D` remains independent. The closed neighborhoods of its members therefore partition the vertex set into sets of size `Delta+1`. Thus `|V(J)|=(Delta+1)k`. Any dominating set in a graph of maximum degree `Delta` has cardinality at least `|V(J)|/(Delta+1)=k`, while `D` is independent dominating. Hence `i(J)=k`.

### Edge-domination transfer

Use the standard identity between the minimum edge-domination number and the minimum maximal-matching number, recalled in the primary source and proved in Yannakakis–Gavril, [*Edge dominating sets in graphs*](https://doi.org/10.1137/0138030).

Let `F` be an edge dominating set of `J`. Map its edges back to edges of `G` as follows:

- An edge representing an old edge maps to that old edge.
- An edge within the copy clique of `v` maps to any fixed old edge incident with `v`.
- An added pendant edge at `d` maps to any fixed old edge incident with `d`.

The required old incident edges exist because `G` is connected and nontrivial. Let `F_0` be the set of image edges, discarding repetitions; then `|F_0|<=|F|`.

For any old edge `e=uv`, take its designated lift in `J`. That lifted edge meets an edge `f` of `F`. If the shared endpoint is an old member `d` of `D`, the image of `f` is incident with `d`. If the shared endpoint is a copy of an old vertex `v`, the image of `f` is incident with `v`, including when `f` is inside a copy clique. A newly added pendant edge meets a lift only at its old center. In every case the image of `f` dominates `e` in `G`. Therefore `F_0` is edge dominating and

```math
s(G)=\gamma_e(G)\leq|F_0|\leq|F|.
```

Taking `F` minimum proves `s(G)<=s(J)`. Any proof for all graphs `J` in the reduced class would therefore prove the full conjecture. A counterexample in this class would also refute the full conjecture.

## Remaining obstruction

Write `H=J-D`. Its order is `Delta*k`, its maximum degree is at most `Delta-1`, and its vertices are partitioned into the `k` neighborhoods of the centers. If `H` has a perfect matching, that matching is already maximal in `J` and has the desired cardinality. The unresolved case is when `H` has no perfect matching. A maximum matching of `H` followed by greedy matching to `D` need not stay within the desired budget; the choice and replacement of matched edges matter.

For cubic efficient domination, triangle components of `H` lead to a hypergraph-transversal formulation. Other odd components and the interactions through even components require additional arguments. These observations are partial progress and contribute no solved conjecture.

## Review and initial priority audit

The analysis agent independently checked the construction, degree formula, connectedness, exact domination number, and edge-domination transfer on 21 November 2026. No gap was found in this reduction.

Both web search engines, the original primary repository, global GitHub issue searches for the exact DOI and author/parameter combination, and searches for equivalent terminology have been used. No earlier resolution of this saturation bound was found in these searches. This is an ongoing bounded audit, not a universal absence claim.
