# Source and novelty audit

## Exact source question

- Ben Cameron and Alexander Clow, [On Gyárfás’ Path-Colour Problem](https://arxiv.org/abs/2506.19100),
  [§7](https://arxiv.org/html/2506.19100v1#S7), Conjecture 7.3 names
  two forbidden graphs, including two disjoint edges. Conjecture
  7.4 asserts the corresponding statement for $P_5$-free graphs.
  The following question asks for the least forbidden induced path order.
  [Theorem 1.5](https://arxiv.org/html/2506.19100v1#S1.SS2) gives
  $\chi\le r+1$ in the first class and path-perfectness in the
  $P_4$-free class. The new transversal construction realizes the
  one-color gap, rather than improving a numerical instance.
- The distinct co-diamond assertion is resolved by
  [PR #1004](https://github.com/1337isnot1337/solved-conjectures/pull/1004).
  It does not prove the two-edge assertion; this construction refutes that
  assertion. Both arms are therefore settled with different outcomes.
- The general [Erdős–Hajnal Problem 640](https://www.erdosproblems.com/640)
  asks whether odd-cycle span bounds chromatic number on all graphs.
  [Chen, August 2026](https://arxiv.org/abs/2608.00691) studies the
  finite-order additive defect. [Chen's other paper](https://arxiv.org/abs/2609.26158)
  studies terminal traces of rich odd cycles. Neither is a resolution of the
  two-edge or $P_5$-free assertion.

## Close earlier constructions

- Paweł Rzążewski,
  [Parameterized complexity of k-Coloring in graphs with no long induced paths](https://arxiv.org/html/2608.17835v3#S4),
  has an August 2026 construction of a different form: four-layer
  selectors, independent single-vertex nonedge gadgets, and a palette
  clique. The paper proves hardness of coloring in the two-edge-free
  class and does not state a path-perfectness result. Its construction
  nevertheless gives another counterexample when specialized to an
  edgeless two-part input; see [the deduction](SELECTORS.md).
  We give the earlier gadgets full credit, and do not claim that the
  present two-clique construction is the earliest graph that could
  be used to refute the conjecture.
- Hoàng, Moore, Recoskie, Sawada and Vatshelle,
  [Constructions of k-critical P5-free graphs](https://www.cis.uoguelph.ca/~sawada/papers/p5c5.pdf),
  §2, construct infinitely many two-edge-free critical graphs by a
  modular construction and a universal join. The base family has
  a spanning cycle in the order of its vertex labels, and adding
  universal vertices preserves traceability. Criticality of that
  family does not imply the counterexample here.
- Cameron, Hoàng and Sawada,
  [Dichotomizing k-vertex-critical H-free graphs for H of order four](https://doi.org/10.1016/j.dam.2021.11.001),
  and Beaton and Cameron,
  [the bipartite-H dichotomy](https://arxiv.org/html/2608.20045v1),
  address finiteness, not traceability. Beaton, Cameron and van Omme,
  [Obstructions to k-colouring H-free graphs](https://arxiv.org/html/2610.10737v1),
  addresses the remaining finiteness cases. These results do not
  say whether a critical graph in the two-edge-free class must
  have a Hamiltonian path.
- Mou and Pasechnik,
  [Edge-dominating cycles, k-walks and Hamilton prisms in 2K2-free graphs](https://ora.ox.ac.uk/objects/uuid%3A5288eed1-87d4-4492-89e5-e878fc08dd93),
  and [Ota and Sanka](https://arxiv.org/abs/2103.06760) use toughness
  hypotheses or weaker spanning objects; an edge-dominating cycle
  need not meet all vertices.

## Search scope

On 27 November 2026, searches used the source title and identifier,
the two exact conjecture numbers, both $2P_2$ and $2K_2$ notation,
and combinations of “path-perfect,” “vertex-critical,” “traceable,”
“nontraceable,” “Hamiltonian path,” and “transversal.” They included
the [Cameron publication list](https://www.smcs.upei.ca/~brcameron/research.html),
the [Clow publication list](https://www.alexanderclow.com/publications),
and the directly related August and October 2026 preprints above.
No earlier explicit resolution of either exact conjecture was found.
That is a search result, not a proof of priority. The mathematical
claim here is a complete explicit disproof and the exact induced-path
threshold, with a new small construction and a separate credited
deduction from known selector gadgets.
