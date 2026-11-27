# Prior-art audit

The target is [Erdős–Galvin–Hajnal (1975), Problem 11 in §15](https://www.renyi.hu/~p_erdos/1975-24.pdf),
near the end of §15. Section 16 explicitly calls the
$`(6,3)`$-instance at $`\aleph_2`$ the simplest unresolved
instance. The proof here is uniform in $`n`$, the parameter
in the original question.

| Primary source checked | What it does and does not establish |
| --- | --- |
| [Erdős–Galvin–Hajnal 1975, opening definitions and Theorem B](https://www.renyi.hu/~p_erdos/1975-24.pdf) | Their $`(r,i)`$-systems are exactly the uniform systems in which each $`(i+1)`$-set belongs to at most one edge. Theorem B(b) already gives the requested existence under GCH. We claim no novelty for that conditional result. |
| [Same paper, §§12, 15 and 16](https://www.renyi.hu/~p_erdos/1975-24.pdf) | Theorem 15.15 gives unconditional examples of larger cardinality, and already gives the case $`n=2`$ on $`\aleph_2`$. Theorem 15.18 takes a product of entire hypergraphs; its larger-coordinate factor by itself must exceed the chromatic threshold. The proof here instead chooses **one** label per row pair from a ZFC strong coloring, controlling intersections by row-pair uniqueness. Problem 11 asks precisely for removal of the extra cardinality or extra axiom for all $`n`$ in its range. |
| [Shelah 1997, *Colouring and non-productivity of $`\aleph_2`$-C.C.*](https://shelah.logic.at/files/198837/572.pdf) | Theorem 1.1 is the primary source for the exact strong pair-coloring input, with a strictly stronger finite-block requirement. Its published application is non-productivity of the chain condition; it does not state the half-overlap hypergraph result. |
| [Rinot–Todorčević 2013, p. 119 and main theorem](https://www.impan.pl/shop/publication/transaction/download/product/89041) | Gives the stronger rectangular square-bracket relation for successors of all infinite regular cardinals and credits earlier work on the ordinary square relation. The primary paper explains the naming collision: its “rectangle” is a rectangle in the domain of a pair coloring, not a hyperedge on a grid. This supplies an alternate cited input, not a prior write-up of the target construction. |
| [Erdős–Hajnal 1985 survey](https://www.renyi.hu/~p_erdos/1985-08.pdf) and [*Obligatory hypergraphs*, arXiv:2403.11223](https://arxiv.org/abs/2403.11223) | The modern obligatory-hypergraph work discusses what must embed without fixing the host size to $`\aleph_2`$. The omission of an intersection pattern on some possibly larger host does not answer the exact-cardinality existence problem. |
| [Hajnal–Juhász–Soukup–Szentmiklóssy 2010, Proposition 1.1 and §3](https://arxiv.org/pdf/1004.0181#page=9) | Corollary 3.3 proves a high conflict-free chromatic number at the same half-overlap parameters. Its even-width construction uses unions of two whole finite blocks, so coloring each block with two colors gives a proper ordinary coloring for block size at least two. Lemma 3.4 and Corollary 3.5 already use a strong pair coloring for odd-width conflict-free examples. Here the row-pair label selects a common finite set of columns that forces an ordinary monochromatic edge. |
| [Zapletal, *Coloring redundant algebraic hypergraphs*](https://people.clas.ufl.edu/zapletal/files/rectangles2.pdf) | An alternate-keyword hit for uncountably chromatic rectangle hypergraphs, concerning algebraic Euclidean rectangles and forcing models rather than one rectangle per row pair on an ordinal grid. |

Searched the exact Problem 11 wording and notation, author/title
variants, finite $`(6,3)`$ naming collisions, exact host and
chromatic cardinals under alternate terminology, and set-theoretic
rectangle and strong-coloring applications. Also checked the
direct [Erdős library entry](https://erdosproblems.ai/wiki/library/set_theory/erdos_1975_set_systems_having_large_chromatic_number)
and repository issues for overlapping claims. The existing ordinal-square, rainbow-star and Shelah-avoidance entries concern ordinary graphs. A graph edge has two vertices, whereas Problem 11 prescribes pairwise intersection bounds for uniform hypergraphs of arbitrarily large finite edge size. No prior explicit
unconditional resolution of the all-uniformity Problem 11 was
located in this search. This is not a claim to have surveyed
all print-only references. In particular, the strong coloring
itself is entirely credited to its original sources.
