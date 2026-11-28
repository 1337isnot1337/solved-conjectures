# Erdős–Galvin–Hajnal’s two-configuration avoidance problem

[Problem 9/B, p. 482](https://old.renyi.hu/~p_erdos/1975-24.pdf#page=58) asks for an $`\aleph_1`$-chromatic triple system on $`\omega_1`$ avoiding the loose triangle $`\mathcal T_1`$ and the system $`\mathcal T_9=\{abx,aby,xyz\}`$ on five distinct vertices. The positive forcing for the stricter four-pattern problem in [#1082](https://github.com/1337isnot1337/solved-conjectures/pull/1082) gives relative consistency of yes. It does **not** settle the negative direction for this weaker question.

## Reduction in the finite-to-one rainbow model

Call a pair *finite* if it belongs to finitely many hyperedges of the given triple system, including zero. Call the other pairs *infinite*. In [Todorčević's 1983 model](https://doi.org/10.1090/S0002-9947-1983-0716846-0), §1, Remark 4, the following holds for **any** triple system on $`\omega_1`$:

> The subhypergraph of triples with at least two finite pairs is countably colorable.

To prove this, form an auxiliary graph on the finite pairs. Join two different finite pairs if an original triple contains both of them. Each auxiliary vertex has finite degree, since an original triple containing a given pair offers only two other pairs. In each auxiliary connected component choose a root, and assign levels by graph distance. Each level of each component is finite. Endpoints of an auxiliary edge have equal or consecutive levels.

Make two finite-to-one colorings of the original pairs. In the first, give one color to each union of levels $`0,1`$, then $`2,3`$, and so on in a component. In the second, give one color to level 0, then another to levels $`1,2`$, another to levels $`3,4`$, and so on. Use separate colors in different components and fresh singleton colors for the infinite pairs. Every auxiliary edge has equal colors under at least one of the two pair colorings. A vertex subset rainbow for both therefore contains no original triple with at least two finite pairs. Apply the rainbow theorem to each coloring and take the common refinement of their two countable vertex partitions.

Thus under the same model's hypothesis, any remaining obstruction to countable colorability is in the subhypergraph of triples with at least two infinite pairs. This applies without assuming that the finite codegrees have a uniform finite bound.

## Structure of the remaining subhypergraph

Suppose now that the original triple system excludes the loose triangle. Write $`L`$ for the graph of infinite pairs. If $`a,b,c`$ are distinct and $`ab,bc\in E(L)`$, then the only possible triple of the original system containing $`ac`$ is $`abc`$. Indeed, for any other triple containing $`ac`$, pick distinct pages off that triple for the two infinite pairs $`ab,bc`$; the resulting three triples are a loose triangle with intersections $`a,b,c`$. In particular $`L`$ is triangle-free.

A triple in the remaining subhypergraph therefore has exactly two infinite pairs. It consists of a path $`a,b,c`$ in $`L`$, and its light pair $`ac`$ has codegree exactly one in the original hypergraph. Moreover $`b`$ is the **unique** common neighbor of $`a,c`$ in $`L`$; applying the previous argument with any other common neighbor contradicts the triple $`abc`$.

So a negative answer to 9/B in this rainbow model would follow from countable colorability of the selected unique-middle wedges in $`L`$, using the further restrictions imposed by $`\mathcal T_9`$. This note does not prove that assertion. In particular it is not enough to countably color all of $`L`$: the graph of infinite pairs can be an arbitrary triangle-free graph, by making infinitely many private pages on each of its edges. Such a construction yields no wedge triples in the remaining subhypergraph.

## Source boundary

The original 1975 paper separates simultaneous avoidance of these two types (9/B) from simultaneous avoidance of four types (9/C). Its Theorems 11.6 and 11.11 and the summary preceding the questions establish individual avoidability under CH, not a joint answer for 9/B. [Li's #593/#1177 preprint](https://arxiv.org/abs/2606.24882) concerns unrestricted-size triple systems, and does not substitute for the $`\omega_1`$-vertex condition here. The two-color shell reduction above is a follow-up to the pair-coloring proof for 9/C, not a claim of a full resolution.
