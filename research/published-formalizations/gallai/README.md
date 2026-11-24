# Gallai’s longest-path conjecture

Status: **incomplete formalization; compilation and kernel replay pending**.

This work formalizes an existing published disproof. It is not a new mathematical discovery and makes no claim of priority for the formalization. The owner’s current request explicitly authorizes this published-resolution campaign; tracking issues are [#534](https://github.com/1337isnot1337/solved-conjectures/issues/534) and [#539](https://github.com/1337isnot1337/solved-conjectures/issues/539).

## Exact statement

For every nonempty finite connected simple undirected graph, there is a vertex contained in every longest simple path. A path is longest among all paths in the graph, regardless of endpoints. This is different from Gallai’s edge-decomposition conjecture.

The Lean proposition `Published.GallaiLongestPath.Conjecture` quantifies over arbitrary finite vertex types and Mathlib simple graphs. It uses `SimpleGraph.Connected`, `SimpleGraph.Walk`, `Walk.IsPath`, and `Walk.support`. The candidate endpoint `not_conjecture` negates the entire universal assertion.

## Published disproof and attribution

- Tibor Gallai posed the question at the September 1966 Tihany colloquium. It appeared as Problem 4 in *Theory of Graphs*, edited by Erdős and Katona, Academic Press, 1968.
- Hans Walther supplied the first counterexample in 1969.
- The particular 12-vertex graph used here was independently obtained by Walther and Hans-Joachim Voss, and by Tudor Zamfirescu.
- Exact primary source formalized: T. Zamfirescu, *On longest paths and circuits in graphs*, **Mathematica Scandinavica 38 (1976), 211–239**, §3.1, **Theorem 8**, printed **pp. 228–229**, **Figure 11**. [DOI](https://doi.org/10.7146/math.scand.a-11630) · [publisher PDF](https://journals.msp.org/mscand/article/download/2014/2013/2045).
- Independent statement and figure cross-check: F. Chen, *Order of the smallest counterexample to Gallai’s conjecture*, **Czechoslovak Mathematical Journal 68 (2018), 341–369**, Conjecture 1.1 and Figure 1. [DOI](https://doi.org/10.21136/CMJ.2018.0422-16).

Zamfirescu counts vertices when defining path length and states that this graph has maximum path length 10. Mathlib counts edges; the candidate theorem therefore proves an upper bound of 9 and constructs a path of 9 edges omitting every possible vertex.

The construction splits one vertex of the Petersen graph into three leaves, each attached to a different former neighbor. No claim about minimal possible order is formalized. The existence of this single graph refutes the original universal conjecture in full.

## Source correspondence

Figure 11 is labeled from top to bottom: top leaf 0, top branch vertex 1, the next row 2 and 3, middle row 4 and 5, bottom row 6 through 9 from left to right, and bottom leaves 10 and 11.

| Vertex | Neighbors |
| --- | --- |
| 0 | 1 |
| 1 | 0, 2, 3 |
| 2 | 1, 4, 8 |
| 3 | 1, 5, 7 |
| 4 | 2, 5, 6 |
| 5 | 3, 4, 9 |
| 6 | 4, 7, 10 |
| 7 | 3, 6, 8 |
| 8 | 2, 7, 9 |
| 9 | 5, 8, 11 |
| 10 | 6 |
| 11 | 9 |

The publisher’s scanned Figure 11 was rendered and visually inspected on 2026-11-24. Edge crossings in the drawing are not vertices. The graph has 12 vertices and 15 edges.

## Proof architecture

1. Prove that a finite depth-first search gives an upper bound for every nonrepeating vertex path. The lemma applies to arbitrary neighbor lists, and assumes only the literal adjacency-chain and no-repetition conditions.
2. Evaluate the bound at all 12 starting vertices using Lean’s ordinary kernel reduction.
3. Transfer the bound to every actual Mathlib simple path through its support list.
4. Verify 12 explicit path witnesses, one omitting each vertex.
5. Convert each witness to a Mathlib walk with `Walk.ofSupport`, prove that it is a path and is longest, and contradict the conjectured common vertex.

This replaces the primary source’s appeal to the hypohamiltonian Petersen graph with a complete finite certificate for exactly the same published graph.

## Duplicate and scope audit

The 2026-11-24 main and research branches, issue and PR searches, pinned Mathlib source, and broader Lean searches were checked under Gallai, Walther, Voss, longest-path intersection, and common longest-path vertex. The repository’s imported Sylvester–Gallai proof and external Gallai path-decomposition work are different statements. No matching prior Lean proof was located. This is a bounded search, not proof of formalization priority.

## Verification status and remaining work

An independent Python traversal found 1,368 oriented simple vertex paths, maximum 10 vertices, and 84 maximum paths; it supplied witnesses omitting each vertex. These computations are development checks only.

The first local compiler attempt ended with exit 137 during a workspace-wide memory failure. No local pass is claimed. The workspace subsequently became unavailable. The source was preserved in a draft review branch for hosted Lean validation.

Remaining gates:

- Strict Lean 4.35.0 compilation of the complete module.
- Independent source-statement and proof review.
- Transitive axiom audit over all owned public and private declarations.
- Stock kernel replay.
- Repository registration and exact-tree publication checks.

No partial result counts toward the campaign’s ten completed named formalizations.
