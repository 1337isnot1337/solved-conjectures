# Review of the Bollobás–Erdős–Tuza transversal bounds

The first question of Erdős #611 asks for a sublinear set meeting all maximal cliques when every maximal clique has size at least a fixed fraction of the order. Taking complements gives the maximal independent sets in this package. Cooper and Hollars also ask for a transversal of just the large maximal independent sets in an arbitrary graph. The lower construction concerns the first question. The induced-biclique theorem also applies to their stronger formulation. The unrestricted questions remain open. [Erdős–Gallai–Tuza](https://doi.org/10.1016/0012-365X(92)90681-5) · [Erdős #611](https://www.erdosproblems.com/611) · [Cooper–Hollars, §§1 and 7](https://arxiv.org/html/2607.15486v1)

## Independent mathematical review, 26 November 2026

For the lower bound I reconstructed the maximal independent sets of a graph substitution by projecting onto its base. A proposed transversal fails exactly when one maximal base support uses only fibers in which a maximal independent set can avoid the proposed vertices. With equal fiber transversal costs this gives the exact product rule. In the labelled base, a set of at most $`r`$ vertices leaves a distinct eligible row for every selected independent label. Filling the remaining rows gives a disjoint maximal set. Any $`r+1`$ labels hit all maximal sets.

In the recursion the floors and ceilings preserve $`a_t/\rho_{t-1}\ge2`$ and bound $`\rho_t/\rho_{t-1}`$ between $`a_t/4`$ and $`2a_t`$. The fractional losses of minimum maximal-set size are summable. The logarithmic loss at level $`t`$ is of order $`t\log(t+1)`$ and the logarithm of its order is of order $`t^2\log(t+1)`$. For an intermediate order, unequal independent twin classes retain transversal cost one. Comparing to the next level loses at most a constant times the square of the preceding relative transversal number, preserving the exponent claimed for every sufficiently large order. [Recursive proof](PROOF.md)

I separately checked the upper limit within the recursive model. The all-label support bounds the product of the order-inflation factors. The distinct-label row support bounds the sum of the fractions of labels used by rows, once the preceding minimum maximal set size is at least four. At most a bounded number of initial levels can fail this condition because the orders at least double and earlier hollowness is at least the final hollowness. AM–GM and telescoping the transversal costs then give the stated loss. The fixed seed and the specified fiber restrictions are essential hypotheses. [Construction-specific ceiling](RECURSION-LIMIT.md)

For the upper bound, two independent sides make a common-neighbor count an induced-biclique test even when the ambient independent sets overlap. A subset and its common neighbors are necessarily disjoint. Counting the same incidences from the high-degree vertices bounds the number of them in an independent set. The sampled vertices simultaneously detect all small high-degree neighborhoods that miss a positive fraction of a block, and have a small low-degree neighborhood. Maximality forces a neighbor at every sample point avoided by a maximal set. The residual graph has independence number below half the threshold. Adding the estimates over the disjoint blocks gives the stated bound. With a growing biclique side the proof uses a fixed number of bands and retains a sample of size $`n^{o(1)}`$, while its expected low-degree neighborhood is $`o(n)`$. [Induced-biclique proof](INDUCED-BICLIQUES.md)

## Reproducible checks

Run these commands from the repository root using standard Python.

```sh
python3 results/erdos-611-clique-transversals/check.py
python3 results/erdos-611-clique-transversals/check_recursive.py
python3 results/erdos-611-clique-transversals/check_structure.py
```

The first replay checked 40 base graphs, 3,552 maximal independent sets and 163,470 proposed smaller transversals. The second independently enumerated maximal sets in three substitutions on 16, 24 and 36 vertices and checked 150 recurrence steps with exact rational arithmetic. The third, written during publication review, checked all 4,096 choices of a marked set across 64 graph substitutions and the incidence identity on 89,697 pairs of independent blocks across all 1,024 labelled graphs on five vertices. These finite checks exercise the combinatorial lemmas. The asymptotic estimates follow from the written arguments.

## Scope and prior work

Cooper and Hollars prove a lower bound of order $`n^{1/3}/\log n`$ and give upper bounds for cographs and split graphs. Cheng and Xu study maximum independent sets under the same induced-subgraph exclusion. Their maximality requirement is different. The repository’s earlier note gives a random lower bound of order $`\sqrt{n\log n}`$ and an upper bound at bounded modular width. The reviewed recursive bound precludes every uniform fixed power saving, while still allowing the conjectured sublinear upper bound. Searches of the original clique-transversal formulation, the complement formulation, the cited preprints, and follow-up work located no prior proof of these two bounds. This is a bounded literature review. [Cooper–Hollars](https://arxiv.org/abs/2607.15486) · [Cheng–Xu](https://arxiv.org/abs/2405.18264) · [Earlier repository note](../../docs/bollobas-erdos-tuza-research.md) · [Source history](https://github.com/1337isnot1337/solved-conjectures/tree/fcb8f206e55e4c0991a59e7913870daacc801e4b/research/erdos-611-clique-transversals) · [Tracking issue #830](https://github.com/1337isnot1337/solved-conjectures/issues/830)
