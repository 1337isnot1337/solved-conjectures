# Erdős 617: reviewed packing restrictions

21 November 2026. The general paid conjecture remains unresolved. These notes contain necessary conditions, reconstructed prior arguments, and obstructions to proposed proof methods. They are not a completed bounty solution. Mathematical novelty has not been established.

## Exact target

For every integer `r >= 3`, every edge coloring of `K_(r^2+1)` with `r` colors must have an `(r+1)`-vertex set omitting at least one color. The [original Erdős–Gyárfás paper](https://doi.org/10.1016/S0012-365X(98)00323-9), [live paid target](https://conjectures.io/problems/erdos617-erdos-617), and existing [issue 45](https://github.com/1337isnot1337/solved-conjectures/issues/45) specify this general statement. A positive check for one value of `r` would not complete it.

In a hypothetical counterexample, every color graph has independence number at most `r`. At least one color graph has at most the average edge count

```math
B_r=\frac{r(r^2+1)}2.
```

The current route forces structure in such a sparse color without initially assuming a clique packing.

## Reviewed deductions

| Note | Exact conclusion | Remaining limitation |
| --- | --- | --- |
| [Localized clique bound](erdos617-local-clique-bound.md) | If `t` vertices lie in full `K_r` cliques, then `e(G) >= B_r+(r^2+1)/r-t/2`; a sparse color has `t >= 2r+1`. | Covered vertices do not give a disjoint packing. |
| [Two disjoint full cliques](erdos617-forced-two-cliques.md) | Every sparse color contains two vertex-disjoint `K_r` cliques. | Two cliques do not satisfy the earlier large-packing hypotheses. |
| [At most five cliques when packing number is two](erdos617-packing-two-many-cliques.md) | For `r >= 6`, a sparse color with no three disjoint full cliques has exactly three, four, or five full cliques in total. | These configurations, and larger packing numbers, are not excluded. |
| [Minimal independence-ratio cores](erdos617-critical-cores.md) | A minimal deficient induced core has order `ar+1`, minimum degree at least `r`, and the stated density restrictions. The cases `a <= 3` and `a=r` are excluded in the recorded range. | The middle range survives; a ratio-minimal graph cannot be assumed chromatic-critical. |
| [One-color obstruction](erdos617-one-color-review.md) | An infinite family satisfies the weak local edge cap and sparse budget, but violates the stronger hereditary palette condition. | It refutes an auxiliary implication, not the conjecture. |

The first three deductions use the localized independence inequality in Abiad, Kumar, and Pragada, *Localization of the Caro–Wei bound and its applications to bipartiteness*, arXiv:2609.00210v1, Theorems 2.2–3.1 ([primary PDF](https://borowiecki.dev/pdf/2609.00210)). The coordinator and reviewer read the theorem and its proof. The two-clique and at-most-five arguments received independent step-by-step checks within this campaign.

## Prior-work correction

The [earlier local-independence record](https://erdosproblems.ai/wiki/research/erdos_617/independent/growing_local_independence_range) already proves the independence-number-three exclusion and gives a pentagon-core obstruction to the weak one-color route. Those ideas were rediscovered during this work, then identified by the literature audit. The companion notes explicitly credit the earlier record. They must not be counted as new solutions or novel partial theorems.

The earlier [repository packing argument](../../../docs/erdos-gyarfas-balanced-coloring.md) assumes a sufficiently large packing and an appropriate independent set in the residue. The present two-clique conclusion does not discharge those assumptions. No complete proof, counterexample coloring, Lean verification of this target, submission, or payment is claimed.
