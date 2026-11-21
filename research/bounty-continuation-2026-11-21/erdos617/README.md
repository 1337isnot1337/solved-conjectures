# Erdős 617: reviewed structural reductions

21 November 2026. The general paid conjecture remains unresolved. These notes contain necessary conditions, reconstructed prior arguments, and obstructions to proposed proof methods. They are not a completed bounty solution. Mathematical novelty has not been established.

## Exact target

For every integer `r >= 3`, every edge coloring of `K_(r^2+1)` with `r` colors must have an `(r+1)`-vertex set omitting at least one color. The [original Erdős–Gyárfás paper](https://doi.org/10.1016/S0012-365X(98)00323-9), [live paid target](https://conjectures.io/problems/erdos617-erdos-617), and existing [issue 45](https://github.com/1337isnot1337/solved-conjectures/issues/45) specify this general statement. A positive check for one value of `r` would not complete it.

In a hypothetical counterexample, every color graph has independence number at most `r`. At least one color graph has at most the average edge count

```math
B_r=\frac{r(r^2+1)}2.
```

The current route forces structure in such a sparse color without initially assuming a clique packing. Delete redundant edges until the color graph is independence-critical, and call it H. For r≥6, the reviewed proof chain now shows that all full cliques of order r in H are pairwise disjoint, and there are at least three.

If H is connected, their number q satisfies q(q−1)<r. Every residue vertex either has exactly one neighbor in each full clique or no neighbor in their union. A minimum-degree vertex is of the latter kind and has degree at most r−1. If H is disconnected, each full clique is a whole component, leaving a K_r-free residue with r(r−q)+1 vertices and independence number r−q. These restrictions do not eliminate all configurations.

Edge deletion alone loses the literal coloring partition. An explicit recoloring restores one: assign every deleted edge to one other color. The reduced color retains independence number r, and every other color's independence number can only decrease. Later cross-color arguments use this new coloring. The established sparse edge budget remains valid; H need not remain a sparsest color.

The [October 2026 Xia–Szeider paper](https://arxiv.org/abs/2610.24484) proves the case r=5. It does not settle the general target, and it is not counted as our work.

## Reviewed deductions

| Note | Exact conclusion | Remaining limitation |
| --- | --- | --- |
| [Localized clique bound](erdos617-local-clique-bound.md) | If `t` vertices lie in full `K_r` cliques, then `e(G) >= B_r+(r^2+1)/r-t/2`; a sparse color has `t >= 2r+1`. | Covered vertices do not give a disjoint packing. |
| [Two disjoint full cliques](erdos617-forced-two-cliques.md) | Every sparse color contains two vertex-disjoint `K_r` cliques. | Two cliques do not satisfy the earlier large-packing hypotheses. |
| [At most five cliques when packing number is two](erdos617-packing-two-many-cliques.md) | For `r >= 6`, a sparse color with no three disjoint full cliques has exactly three, four, or five full cliques in total. | Intermediate step; the subsequent proofs exclude packing number two. |
| [Edge-critical reduction](erdos617-edge-critical-reduction.md) | Preserves the needed conditions, proves the component restriction, and excludes three full cliques through one vertex. The packing-two case has six intersection patterns. | The component restriction is credited as prior work; the six-pattern stopping point is superseded below. |
| [Isolated full cliques](erdos617-three-isolated-full-cliques.md) | The full-clique intersection graph has at least three isolated vertices; in the connected case it has at most r vertices. | This is an input to the general disjointness proof, not an assumption of its conclusion. |
| [Essential-edge exchange](erdos617-critical-clique-coupling.md) | An intersecting pair forces neighbors in every disjoint full clique. Internal-edge certificates must meet all other full cliques. | Supplies forced edges and identifies a remaining compatibility gap. |
| [All full cliques are disjoint](erdos617-disjoint-full-cliques.md) | An intersecting pair would force both a small residue independence number and too many edges. | Global disjointness applies to H; the original color may have additional full cliques destroyed by deletion. |
| [Residue attachments](critical-clique-attachments.md) | Residue vertices have exactly one neighbor in every full clique or none in their union. | Does not eliminate the latter vertices. |
| [Connected small-packing bound](erdos617-connected-small-packing.md) | A minimum-degree vertex has no full-clique neighbor, and q(q−1)<r. | Connected H only; the disconnected branch remains unresolved. |
| [Near-clique blocks](erdos617-near-clique-obstructions.md) | Maximal cliques of order r−1 intersect in 0, 1, or r−2 vertices; merging the last kind gives blocks meeting in at most one vertex. The total overlap has an explicit bound. | Cross edges and the uncovered residue still prevent an independent-transversal conclusion. |
| [Independent residue coverage check](near-clique-blocks.md) | Independently verifies the block structure and forces substantial coverage after minimum-degree deletion. | Coverage is not a clique factor or a solution. |
| [Weighted independence bound](weighted-two-level-akp.md) | Gives an exact optimized attachment bound, in particular fewer than r√(2r+1) attached residue vertices. | A uniform surviving parameter region is proved; this calculation does not close the case. |
| [Cross-color restrictions](erdos617-cross-color-rook-reduction.md) | In the full-matching branch, the other colors form column partitions on the clique union, with constrained residue attachments. | Exceptional residue vertices survive; full matching is not proved in general. |
| [Minimal independence-ratio cores](erdos617-critical-cores.md) | A minimal deficient induced core has order `ar+1`, minimum degree at least `r`, and the stated density restrictions. The cases `a <= 3` and `a=r` are excluded in the recorded range. | The middle range survives; a ratio-minimal graph cannot be assumed chromatic-critical. |
| [One-color obstruction](erdos617-one-color-review.md) | An infinite family satisfies the weak local edge cap and sparse budget, but violates the stronger hereditary palette condition. | It refutes an auxiliary implication, not the conjecture. |

The independence and packing deductions use the localized independence inequality in Abiad, Kumar, and Pragada, *Localization of the Caro–Wei bound and its applications to bipartiteness*, arXiv:2609.00210v1, Theorems 2.2–3.1 ([primary PDF](https://borowiecki.dev/pdf/2609.00210)). The coordinator and reviewers inspected the theorem and its proof. The current proof chain received independent step-by-step checks by the three other research agents. It has not been formalized in Lean.

The [direct six-pattern exclusion](erdos617-forced-three-cliques.md) and the earlier two-clique and at-most-five arguments are retained as intermediate proof steps. Their older stopping points are superseded by general disjointness. The [degree-averaging obstruction](degree-averaging-obstruction.md) gives an exact counterexample to a proposed auxiliary bound, not to the coloring conjecture.

## A separate extremal normalization

The [disconnected-branch analysis](erdos617-disconnected-residue.md) first identified the exact component-deficit and local-clique-deficit inequality left by the sparse budget. A subsequent [extremal normalization](erdos617-extremal-core-normalization.md) changes the optimization family: minimize edges over all graphs satisfying the necessary independence and hereditary palette bounds, whether or not they are realizable in a simultaneous coloring.

In that family, closed-neighborhood and clique-replacement arguments prove that an edge-minimum graph consists of q isolated full cliques and exactly one connected residual core R. With s=r−q, the same core satisfies

```math
|R|=rs+1,\quad\alpha(R)=s,\quad\omega(R)\le r-1,
\quad\delta(R)\ge r,\quad q\ge3,\quad s\ge4.
```

It is independence-critical and ratio-minimal: every proper induced subgraph W has |W|≤rα(W). All reviewers checked the replacement proofs, including preservation of every palette cap. The same proof gives |N[S]|≥r|S|+1 for each nonempty independent set S in R.

The core still satisfies a nonempty permitted edge interval. The connected-case bound q(q−1)<r and the cross-color arguments concern a different graph and cannot be transferred to this normalization. The normalization is a reduction, not an exclusion of the core or a coloring construction.

The [compression-gap audit](erdos617-core-compression-gap.md) proves that replacing any nonempty subset of the final core by isolated cliques of order at most r necessarily raises its independence number. Independent-set neighborhood expansion is already implied by ratio-minimality. For a genuine (r+1)-critical subgraph F, the audit retains its order f, extra induced edges a, and boundary edges b and proves

```math
(r-2)(f-r-1)+2ra+rb\le qr^2.
```

This is a legitimate transfer of the Kostochka–Yancey edge bound; it does not assume the whole core is chromatic-critical. The inequality still leaves a nonempty permitted range. Even an unproved spanning-critical hypothesis would only give 2s≤r+2, which does not eliminate every surviving configuration.

## Prior-work correction

The [earlier local-independence record](https://erdosproblems.ai/wiki/research/erdos_617/independent/growing_local_independence_range) already proves the independence-number-three exclusion and gives a pentagon-core obstruction to the weak one-color route. Those ideas were rediscovered during this work, then identified by the literature audit. The companion notes explicitly credit the earlier record. They must not be counted as new solutions or novel partial theorems.

The [earlier clique-residue record](https://erdosproblems.ai/wiki/research/erdos_617/independent/clique_residue_and_affine_repair), sections 3 and 7.3, already contains the boundary matching obstruction and the disconnected-component restriction. The list lemma in the disjointness proof is a special case of Bernshteyn–Kostochka–Pron's [DP-degree-colorability theorem](https://arxiv.org/pdf/1609.00763), Theorem 9. These are existing results.

The audit has not located the full all-disjoint reduction or the connected q(q−1)<r combination in those records. That limited search result does not establish priority. The earlier [repository packing argument](../../../docs/erdos-gyarfas-balanced-coloring.md) assumes a sufficiently large packing and an appropriate independent set in the residue. The present restrictions do not discharge those assumptions. No complete proof, counterexample coloring, full-target Lean verification, submission, or payment is claimed.

The [final source and scope audit](prior-work-and-scope-audit.md) records the exact prior overlap, reviewed hypotheses, current sponsor status, and limits of the search.
