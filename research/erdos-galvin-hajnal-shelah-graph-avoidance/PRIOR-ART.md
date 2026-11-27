# Prior-art audit

Target: Problem 4 on p. 450 of
[Erdős–Galvin–Hajnal, *On set-systems having large chromatic number
and not containing prescribed subsystems* (1975)](https://www.renyi.hu/~p_erdos/1975-24.pdf).
The only unresolved direction in that paper is whether the
requested Shelah-free graph is provably obtainable in ZFC
or from CH. Theorem 6.6 already gives the positive side
of consistency under $`V=L`$.

| Source checked | Scope and attribution |
| --- | --- |
| [Erdős–Galvin–Hajnal 1975, Definition 6.4 and Theorem 6.6](https://www.renyi.hu/~p_erdos/1975-24.pdf) | This is the exact problem and definition. Credits their positive model; it does not give any negative model or formulate the club-slot reduction. |
| [Hajnal–Máté 1975, publisher record](https://doi.org/10.1016/S0049-237X(08)71956-6) | The original HM graph work, cited as source [19] by EGH for the $`V=L`$ construction. The accessible publisher record does not expose the full chapter. Its results about the HM class are also identified in the primary 1978 and 2024 papers below. |
| [Avraham–Devlin–Shelah 1978, §2 Theorem 2.1 and §3](https://shelah.logic.at/files/95244/81.pdf) | Credit this paper for the negative consistency theorem for HM graphs under GCH. Its graph theorem is stated for the finite-or-cofinal lower-neighborhood class, not for all graphs avoiding the EGH Shelah configuration. No conversion of an arbitrary Shelah-free graph is stated there. |
| [Shelah 1977, *Whitehead groups may not be free, even assuming CH*](https://shelah.logic.at/files/95916/64.pdf) | Related search hit citing the Avraham–Devlin–Shelah project in preparation. Its named graph question (C) is a different edge partition problem involving coloring number. |
| [Erdős–Hajnal 1978, *Embedding theorems for graphs*, §5](https://www.renyi.hu/~p_erdos/1978-09.pdf) | An exact-keyword collision. Here “Shelah graph” refers to subgraphs of a graph obtained from a well-ordering and a second order, not EGH's uncountable graph with infinitely many neighbors in one countable set. |
| [Erdős–Hajnal 1985 survey](https://www.renyi.hu/~p_erdos/1985-08.pdf), [Komjáth–Shelah 1988](https://shelah.logic.at/files/95727/303.pdf) | The constructions discussed for the omission of a complete countable bipartite graph do not give the required conclusion: an uncountable almost-disjoint family of infinite subsets of a countable set can form a Shelah graph without containing a complete countable bipartite graph. |
| [Rinot's primary paper](https://papers.assafrinot.com/rinot17.pdf) | Explicitly points out the 1978 CH countermodel for HM graphs, and distinguishes the finite-or-cofinal condition from merely giving all lower neighborhoods order type at most $`\omega`$. |
| [Lambie-Hanson–Uhrik 2024, §§1 and 3](https://doi.org/10.1112/mtk.12261) | Gives newer HM constructions from one Cohen real and generalizations on other trees. The generalized tree construction is not a construction of a Shelah-free graph on $`\omega_1`$ in every model. Their introductory HM independence is credited, not claimed as new. |

Also checked the source's adjacent [Problem 3 wiki entry](https://erdosproblems.ai/wiki/library/set_theory/erdos_1975_set_systems_having_large_chromatic_number/problem_3),
modern references to Problem 3 as Erdős #1176, and exact-phrase,
author/title, and terminology searches combining “Shelah graph”,
“Hajnal–Máté,” “countably chromatic,” “SAD,” and “CH.”
Problem 3 concerns simultaneous chromatic number; it is not
this avoidance problem. The current search found no prior
explicit answer to Problem 4 or publication of this exact
club-slot reduction. This is a negative search result,
not a claim of bibliographic exhaustiveness.


## Alternate terminology and scope

[Bowler–Geschke–Pitz](https://arxiv.org/abs/1609.01042) call the
bipartite version a Halin $`(\aleph_0,\aleph_1)`$-graph.
Every Shelah graph in the 1975 sense contains one of these:
delete edges within the countable set and within its complement.
Thus searching for avoidance of these bipartite graphs **as
subgraphs** is equivalent and was also checked. The normal-spanning-tree
papers study these graphs primarily as obstructions **as minors**;
that is not the requirement in Problem 4.

[Bowler–Carmesin–Komjáth–Reiher](https://doi.org/10.1007/S00493-019-4045-9)
use the more general name $`\mu`$-barricade and combine
barricades and stationary ladder obstructions to characterize
**colouring number**, rather than chromatic number. This is
closely related prior structural work. Neither one of their
two obstructions alone characterizes countable chromatic
number: in particular, a bipartite barricade itself is
two-colourable. Their theorem is not the proposed reduction
of the entire barricade-free graph to induced HM-type pieces.

Their regular-cardinal argument also uses a club of closure
points of an ordinal bound function. Credit that as related
prior use of the standard closure move. The point here is to
sort the countable intervals into one-vertex slots, preserve
chromatic number via that partition, and apply the 1978 GCH
model theorem to the resulting HM-type induced graphs.

## Catalogue and formal-library check

A 27 November 2026 check of both permanent branches by author names, source PDF, Problem 4, Shelah-graph avoidance, barricades and Hajnal–Máté graphs found this research package and its original tracking issue. The same 1975 paper supplies two catalogued questions about labeled rainbow stars. Those ask for configurations with girth and palette conditions. Problem 4 asks whether an uncountably chromatic graph can avoid a Shelah subgraph. The separate half-overlap issue in the same source concerns Problem 11 and uniform hyperedges on the second uncountable cardinal. Searches of Mathlib, Formal Conjectures and the Archive of Formal Proofs for the named avoidance statement found no matching formal theorem. [Rainbow-star girth result](https://github.com/1337isnot1337/solved-conjectures/tree/273d4489b3cdc8769b56023620ad89a3d0f2a5fd/results/erdos-galvin-hajnal-rainbow-star-girth) · [Continuum rainbow-star result](https://github.com/1337isnot1337/solved-conjectures/tree/273d4489b3cdc8769b56023620ad89a3d0f2a5fd/results/erdos-galvin-hajnal-continuum-rainbow-star) · [Half-overlap problem](https://github.com/1337isnot1337/solved-conjectures/issues/1040) · [Original avoidance issue](https://github.com/1337isnot1337/solved-conjectures/issues/1037)
