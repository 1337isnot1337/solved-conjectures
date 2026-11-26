# A limit of the three-root mismatch method

This records a specific obstruction encountered in [Erdős #811](https://www.erdosproblems.com/811). It concerns three-root data alone, not an actual rainbow-free balanced graphon.

For three roots, consider the joint law of their three incident hues to one random outside vertex. Its three marginals are uniform. Each pair of roots yields a set of unordered unequal hue pairs, the palettes of their two-edge paths. In a zero-rainbow-six-cycle graphon one cannot select one palette from each of the three root pairs with all six hues distinct: doing so would replace the three sides of the triangle of roots by three rainbow two-edge paths.

A proposed converse inference was that, if the expected sum of the three disagreements is substantially above $5/2$, then the label partitions of at least one root pair must agree after coarsening. The number $5/2$ is the average over unconstrained triples of roots of a balanced six-color graphon. The following exact coupling rules out any such threshold below three, even when arbitrary nontrivial coarsenings rather than just three-plus-three parity partitions are allowed.

## Exact coupling

Choose one of the following rows with positive probabilities $1-2\epsilon,\epsilon,\epsilon$, then choose $a\in\{0,\ldots,5\}$ uniformly and use the joint hue tuple $(a,b(a),c(a))$.

| Choice | $b(0)\dots b(5)$ | $c(0)\dots c(5)$ | Disagreements summed over the six values of $a$ |
| --- | --- | --- | --- |
| 1 | 435102 | 120453 | 18 |
| 2 | 054321 | 012345 | 8 |
| 3 | 432105 | 105432 | 16 |

These are permutations, so all marginals are uniform. The expected disagreement sum is $3-2\epsilon$, arbitrarily close to three. The unequal pair supports, in positions $12,23,31$, are respectively
\[
\{04,13,15,24,25\},\quad
\{03,05,14,15,23,24,25\},\quad
\{01,02,12,25,34,35,45\}.
\]
No disjoint triple of pairs covers all six hues. At the same time every two-coordinate bipartite overlap graph (the two six-label copies joined by the positive joint pairs, including equal pairs) is connected. Thus neither coordinate pair has any common nontrivial coarsened partition, even if the two coarsenings may assign different label subsets to their classes: any such common partition would be constant on each connected component of that overlap graph.

The [small exact check](check_three_root_obstruction.py) checks disjointness and connectedness directly, without using an optimizer. This does not contradict global row structure that uses relations between several triples of roots or the symmetry of the full underlying graphon. It says we cannot force any exact row atom from a single high-disagreement triple and its forbidden matching test alone. Coordination: [#870](https://github.com/1337isnot1337/solved-conjectures/issues/870).
