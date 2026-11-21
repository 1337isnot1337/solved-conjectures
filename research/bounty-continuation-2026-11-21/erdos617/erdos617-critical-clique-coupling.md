# Erdős 617: essential-edge exchanges between full cliques

21 November 2026. These are conditional structural deductions for a hypothetical counterexample. They do not resolve the conjecture, establish novelty, or constitute a bounty submission. The graph below is the spanning edge-critical reduction described in the companion `erdos617-edge-critical-reduction.md` written by the independent reviewer.

## Hypotheses

Fix `r>=6`. Let `H` be a graph with

```math
|V(H)|=r^2+1,\qquad \alpha(H)=r,\qquad
\alpha(H-e)=r+1\quad(e\in E(H)).
```

Assume every vertex outside a clique `Q=K_r` has at most one neighbor in `Q`. These properties hold after choosing a sparse color in a hypothetical balanced coloring and deleting redundant edges while preserving independence number at most `r`.

The reduced graph need not itself be a complete-graph color class. No argument below recolors deleted edges or invokes a new complete edge partition.

Call a clique of order `r` a full clique. Distinct full cliques intersect in at most one vertex. The companion note proves that no vertex of `H` lies in three full cliques. If the maximum number of disjoint full cliques is two, the intersection graph of all full cliques has one of six shapes: `P3`, `K2+K1`, `C4`, `P4`, `2K2`, or `C5`.

## 1. A forced-neighbor exchange

**Lemma.** Let full cliques `A` and `B` meet at `z`, and let a full clique `C` be disjoint from both. Every vertex of `A\{z}` has a neighbor in `C`.

Choose `u in A\{z}`. Since the edge `zu` is essential, deleting it gives an independent set

```math
\{z,u\}\cup S,\qquad |S|=r-1.
```

Every vertex of `S` is outside `A union B` and is nonadjacent to `u`. Also, `u` is nonadjacent to every vertex of `B\{z}`, since its only permitted neighbor in `B` is `z`.

Each vertex of `B\{z}` must have a neighbor in `S`: otherwise it would extend the independent `r`-set `S union {u}`. The two sets each have `r-1` vertices, and every member of `S` has at most one neighbor in `B`. Consequently the edges between `S` and `B\{z}` form a perfect matching.

If `S` avoids `C`, the set `S union {u}` is an independent `r`-set disjoint from `C`. Otherwise, `S` meets `C` in exactly one vertex, say `a`. Replace `a` by its matched neighbor `b in B\{z}`. The replacement is nonadjacent to the other members of `S` and to `u`, and lies outside `C`. Thus in either case there is an independent `r`-set `I` disjoint from `C` and containing `u`.

Every vertex of `C` must have a neighbor in `I`; otherwise `I` could be extended. Since `|I|=|C|=r` and each member of `I` has at most one neighbor in `C`, these edges form a perfect matching. In particular `u` has a neighbor in `C`. This proves the lemma.

The reviewer independently checked this argument. The lemma forces actual edges; it does not assume that every vertex belongs to a maximum independent set.

### Immediate small-pattern consequences

- For intersection graph `K2+K1`, every private vertex of either intersecting clique has a neighbor in the third clique. Each of the two resulting cross matchings has at least `r-1` edges.
- For intersection graph `P4`, the matching between the two endpoint cliques has at least `r-1` edges.
- For intersection graph `2K2`, each matching between cliques in different intersecting pairs has at least `r-1` edges.
- For intersection graph `C5`, each matching between disjoint cliques has at least `r-1` edges. The five such matchings obey an additional compatibility condition, proved next.

The conclusion “at least `r-1`” cannot by itself be strengthened to an exact matching on private vertices. A perfect matching may pair each exceptional shared vertex with a private vertex on the other side.

## 2. The two possible induced structures when the intersection graph is `C5`

Suppose the five full cliques are `Q_i`, indexed by integers modulo five, with `Q_i` meeting precisely `Q_(i-1)` and `Q_(i+1)`. Write

```math
x_i=Q_i\cap Q_{i+1},\qquad
P_i=Q_i\setminus\{x_{i-1},x_i\}.
```

Each `P_i` has `r-2` vertices. The private blocks are disjoint. There are no edges between private blocks whose cliques intersect, and the edges between private blocks of disjoint cliques form a matching.

For the disjoint pair `Q_i,Q_(i+2)`, the lemma shows that every vertex of `Q_i\{x_(i-1)}` and every vertex of `Q_(i+2)\{x_(i+2)}` is matched across the pair. The edge `x_i x_(i+1)` is already present inside `Q_(i+1)`.

The two exceptional vertices, `x_(i-1)` and `x_(i+2)`, are nonadjacent. More strongly, any neighbor of either in the opposite clique must be private. For example, `x_(i-1)` cannot be adjacent to `x_(i+1)`, because it already has the neighbor `x_i` in `Q_(i+1)`. It cannot be adjacent to `x_(i+2)`, because it already has the neighbor `x_(i+3)` in `Q_(i+3)`.

Let `epsilon_j` be one if `x_j` has a neighbor in `Q_(j+3)` and zero otherwise. This is the sole full clique disjoint from both cliques containing `x_j`. The cross matching on `Q_i,Q_(i+2)` covers all but possibly one vertex on each side. Therefore either both exceptional vertices are unmatched or both are matched, and

```math
\epsilon_{i-1}=\epsilon_{i+2}.
```

Addition by three cycles through the five indices, so all five values of `epsilon_j` are equal.

### Case A: all five values are zero

Every disjoint-clique matching has exactly `r-1` edges. It consists of the existing shared-vertex edge `x_i x_(i+1)` and a perfect matching between `P_i` and `P_(i+2)`.

Thus the private blocks are cliques of order `r-2`. Their cross graphs are perfect matchings along the five-cycle of disjoint pairs, and empty along intersecting pairs. The five shared vertices induce a five-cycle and have no neighbors in the opposite private block.

### Case B: all five values are one

For every index `i`, let `b_i` be the unique neighbor of `x_(i+2)` in `P_i`. In the matching between `Q_i` and `Q_(i+2)`, the three edges involving shared vertices are

```math
x_i x_{i+1},\qquad
x_{i-1}b_{i+2},\qquad
x_{i+2}b_i.
```

The remaining edges form a perfect matching between `P_i\{b_i}` and `P_(i+2)\{b_(i+2)}`, each of order `r-3`.

The five distinguished vertices `b_i` are pairwise nonadjacent: the two possible cross matchings incident with their private block both omit them, and the other private blocks have no cross edges. Each `b_i` is adjacent to the two shared vertices of its own full clique and to the opposite shared vertex `x_(i+2)`.

This specifies the entire induced graph on the union of the five full cliques up to the five matching permutations. Edges to the remaining vertices are not specified.

## 3. Exact counts and their limits

Let `U` be the union of these five full cliques. In either case,

```math
|U|=5r-5,
\qquad
e(H[U])=5\binom r2+5(r-2).
```

The internal edges of different full cliques are distinct. In Case A the extra edges are five private matchings, each of size `r-2`. In Case B there are five private matchings of size `r-3` and five extra shared-to-private edges. Both totals give the displayed count.

Also `alpha(H[U])=5`. The clique cover gives the upper bound. In Case A, the private lists have at least three choices and their conflict graph is a cycle with matching conflicts, so a greedy coloring with three available choices gives an independent transversal. In Case B the five vertices `b_i` themselves are independent.

The remaining vertex set has order

```math
|V(H)\setminus U|=r^2-5r+6=(r-2)(r-3).
```

No bound proved here on its independence number or its attachments supplies a contradiction to the total sparse-color budget. The matching permutations and the remaining vertices can obstruct a transversal after a large independent set has already been chosen. Classifying the induced clique union is therefore a reduction of the `C5` case, not its exclusion.

## 4. Certificates for internal edges when the full cliques are disjoint

The subsequent combined hitting-set argument excludes all intersections between full cliques in the sparse edge-critical setting. The following restriction applies directly to the remaining case.

Suppose the full cliques `Q_1,...,Q_q` are pairwise disjoint, and put `R=V(H)\setminus union_i Q_i` and `s=r-q`.

**Lemma.** For an internal edge `uv` of `Q_i`, every independent set `T` of size `r+1` in `H-uv` contains exactly one vertex from each other full clique and exactly `s` vertices from `R`.

The set `T` necessarily contains both `u` and `v`. Suppose it misses a different full clique `Q_j`. Both `T\{u}` and `T\{v}` are independent `r`-sets in `H`, disjoint from `Q_j`. Each must perfectly match `Q_j`: every vertex of `Q_j` must be blocked, and each outside vertex has at most one neighbor there.

Their common `r-1` vertices therefore block the same `r-1` distinct vertices of `Q_j`. The two remaining vertices `u,v` must both be adjacent to the final vertex of `Q_j`. That vertex is outside `Q_i` and would have two neighbors in `Q_i`, a contradiction.

Thus `T` meets every other full clique. It meets each exactly once, because that clique remains complete after deletion. Counting leaves

```math
|T\cap R|=(r+1)-2-(q-1)=r-q=s.
```

This identifies a concrete obstruction to a premature conclusion from a larger independence number in `R`. An essential internal edge is witnessed by a residue independent set of order `s`; that particular set need not extend to one of order `s+1`. Replacing it by an unrelated maximum independent set can destroy the certificate's compatibility with the clique representatives.

## Sources and verification boundaries

The target and earlier structural context are recorded in `erdos617-critical-cores.md`; the primary conjecture is Erdős–Gyárfás, *Split and balanced colorings of complete graphs*, Discrete Mathematics 200 (1999), 79–86, https://www.renyi.hu/~gyarfas/Cikkek/92_splitandbalanced.pdf.

The external independence theorem used to reach the sparse critical setting and force two disjoint full cliques is the Abiad–Kumar–Pragada preprint, https://borowiecki.dev/pdf/2609.00210. No external theorem is used in the exchange and five-cycle arguments above beyond the stated hypotheses.

Earlier independent work on this problem is public at https://erdosproblems.ai/wiki/research/erdos_617/independent/growing_local_independence_range and https://erdosproblems.ai/wiki/research/erdos_617/independent/clique_residue_and_affine_repair. The present deductions have not undergone an exhaustive novelty audit and are not presented as new theorems of established priority.
