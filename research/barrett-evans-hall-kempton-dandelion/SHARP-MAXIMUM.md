# The sharp graph–complement maximum

Let $`a(G)`$ denote the second smallest eigenvalue of the combinatorial Laplacian of a finite simple graph. For every graph on at least two vertices,
```math
\max\{a(G),a(\overline G)\}\ \ge\ 2-\sqrt{2}.
```
Equality holds precisely when $`G`$ is isomorphic to the four-vertex path. Thus $`2-\sqrt2`$ is the supremum asked for by Afshari, Akbari, Moghaddamzadeh and Mohar. They supplied the extremal example in the closing question of their 2018 paper. [Original closing question](https://arxiv.org/pdf/1806.06770#page=5)

## Proof

A graph of diameter at most two has algebraic connectivity at least one. This is Lemma 5 of Einollahzadeh and Karkhaneei. If a graph is disconnected, its complement has diameter at most two because vertices in different components become adjacent and vertices in the same component have a common neighbor outside it. If a graph has diameter at least four, its complement also has diameter at most two. Indeed, if there were an adjacent pair in the graph with no common nonneighbor, the pair would form a dominating edge and the graph would have diameter at most three. Hence it remains to consider two connected complementary graphs of diameter exactly three. [Diameter lemma, p. 6](https://arxiv.org/pdf/1901.02047#page=6)

Write $`D_n`$ for the complementary algebraic-connectivity sum of the dandelion on $`n`$ vertices and $`\phi=(1+\sqrt5)/2`$. The [reviewed dandelion minimum at diameter three](PROOF.md) bounds the sum for the two graphs from below by $`D_n`$. Barrett, Evans, Hall and Kempton proved $`D_n>3-\phi-1/n`$ for $`n\ge5`$. In these orders,
```math
a(G)+a(\overline G)\ \ge\ D_n
>3-\phi-\tfrac15>\tfrac{59}{50}>4-2\sqrt2 .
```
The last two strict comparisons follow from $`\sqrt5\lt56/25`$ and $`\sqrt2>141/100`$ by squaring positive numbers. The maximum is at least half the sum, so equality is impossible for these orders. [Dandelion spectrum, Lemma 4.3 and Theorem 4.4](https://arxiv.org/pdf/2201.04225#page=16)

Diameter three requires at least four vertices. On four vertices the vertices of a diametral path exhaust the graph, and each possible additional edge would shorten that path. Thus the only remaining graph is $`P_4`$. Its complement is another $`P_4`$ and its Laplacian spectrum is $`0,2-\sqrt2,2,2+\sqrt2`$. This proves the bound and the equality classification.

## Scope and review

Codex derived this corollary in the WadeDavis research session from the repository’s proof of the dandelion conjecture. The author of the deduction and a second Codex reviewer independently checked the diameter reduction, rational comparisons, equality cases and the scope of the primary sources. The proof uses the [diameter-three theorem and its computer-assisted certificates](REVIEW.md). The subsequent [extension to every connected complementary pair](CONNECTED-EXTENSION.md) gives a second route to its sum bound. There is no Lean formalization.

The original authors proved a uniform bound of two fifths and gave the four-vertex upper example. Einollahzadeh and Karkhaneei proved the sum bound one and an asymptotic maximum bound tending to one. The latter settles sufficiently large orders without identifying the minimum over all orders. Barrett and coauthors identified the proposed exact constant as a conditional consequence of their eccentricity Conjecture 1 and reported numerical plots through ten vertices. Here their dandelion Conjecture 2, already proved in this entry, supplies the comparison for every order. [Afshari et al.](https://arxiv.org/pdf/1806.06770#page=5) · [Einollahzadeh–Karkhaneei, Theorems 1 and 2](https://arxiv.org/pdf/1901.02047#page=13) · [Barrett et al., §2](https://arxiv.org/pdf/2201.04225#page=3)

The bounded literature check also covered Afshari’s 2024 eccentricity estimates, the normalized-Laplacian problem of Faught, Kempton and Knudson, and Kempton, Zaitzeff and Muthuprakash’s 2026 complementary upper bounds. These statements leave the sharp absolute lower bound for the ordinary Laplacian maximum unresolved. The separate weighted-graph result in this catalogue concerns a different objective. [Afshari 2024](https://arxiv.org/html/2407.02535v1) · [Faught, Kempton and Knudson 2024](https://doi.org/10.1016/j.amc.2024.128920) · [Kempton, Zaitzeff and Muthuprakash 2026](https://arxiv.org/html/2606.12751v1) · [Weighted result](https://github.com/1337isnot1337/solved-conjectures/tree/main/results/barrett-evans-hall-kempton-se)

The [small-order checker](check_sharp_maximum.py) enumerates every labelled graph of orders two through five. It uses integer positive-definiteness tests for the rational threshold $`59/100`$ and verifies the four-vertex path spectrum by polynomial evaluation. The written deduction handles all orders.
