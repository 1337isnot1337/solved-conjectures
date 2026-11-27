# Source match and bounded priority audit

**Target and significance.** [Erdős, §3, p. 137 of the 1982
reprint](https://combinatorica.hu/~p_erdos/1982-24.pdf#page=7) first
states the edge-bipartization benchmark with $\chi(G)>p$ for every
cardinal $p>\aleph_0$, and then proposes replacing the exponent
$3/2$ by $1+\epsilon$ for every positive $\epsilon$. The proof
candidate preserves the arbitrary-cardinal quantifier, the
bipartite (two-color) endpoint, and the literal bound at every
finite order. It is not a finite parameter case. It shows that
almost-linear power-law edge deletion budgets do not bound global
chromatic number by any cardinal.

The 1982 article is a reprint of Erdős, *Problems and results on
finite and infinite combinatorial analysis II*, L'Enseignement
Mathématique 27 (1981), 163–176. This is a different paper from
Erdős's Combinatorica 1 (1981), 25–42 [problem survey](https://www.renyi.hu/~p_erdos/1981-16.pdf),
whose §VII states the construction at **exactly** $\aleph_1$.

## Primary-source exclusions

1. [Erdős–Hajnal–Szemerédi, Annals of Discrete Mathematics 12
   (1982), 117–123](https://doi.org/10.1016/S0304-0208%2808%2973497-2),
   Definition 3.1 and Theorems 3/3.A/4. Part (a) reaches two
   colors at exponent $3/2$. Part (b) reaches exponent
   $1+\epsilon$ for some larger finite palette. Their induction
   tracks the **total** number of exceptions, and uses more
   colors; the proof candidate propagates the maximum number of
   exceptions assigned to each center and keeps two colors.
2. [Lambie-Hanson, Advances in Mathematics 369 (2020),
   107176](https://arxiv.org/abs/1902.08177), §4 Theorem A and
   Claim 4.1. The forest-layer construction directly gives
   $h_G(n)\le(n-1)g(n)$ for any prescribed divergent multiplier
   at **exact** $\chi(G)=\aleph_1$; see
   [the priority correction](PRIOR-RESOLUTION.md). It does not
   give the arbitrary chromatic cardinal quantifier. Its vertex
   set of size $2^{\aleph_1}$ must not be confused with its
   chromatic cardinal.
3. [Howe–Huffman–Kohlmeyer–Kruer, A ZFC Counterexample to Taylor's
   Conjecture on Finite Subgraphs](https://hexagonmath.org/pdf/2611.00746v1),
   Proposition 2.1 and Theorem 1.1. Their compactness benchmark
   explains why that kind of fixed countable forest-layer
   filtration is not an automatic way to reach chromatic
   numbers above the continuum. If each finite initial segment
   of the layer filtration has a finite proper coloring and
   its tail excludes increasingly long odd cycles, the product
   of those finite colorings is already a proper coloring of
   cardinal at most $2^{\aleph_0}$. This does not constrain the
   present proof, whose local two-colorings may vary with the
   chosen vertex set and order.
4. [Plasma AI, Erdős Problem 111](https://github.com/plasma-ai/erdos-111),
   October 2026. The primary work concerns the separate
   converse: an everywhere linear edge-deletion budget forces
   countable colorability. It does not construct examples for
   any fixed superlinear exponent.
5. [Avart–Łuczak–Rödl, On generalized shift graphs](https://doi.org/10.4064/fm226-2-6),
   and [Hajnal's notes, Fact 1 after Definition 42](https://www.mathtube.org/sites/default/files/lecture-notes/Hajnal.pdf).
   Standard shift chromatic-cardinal and odd-girth facts are
   established. The disjoint-type constructions address slow
   growth of the finite-subgraph **chromatic number** and are
   not a two-color edge-deletion bound. The present proof
   supplies the missing hereditary defect-orientation estimate.

## Search scope

Lookups on Nov 27, 2026 covered the exact article and §3 language,
the separate exact-$\aleph_1$ wording, “edge bipartization,” “almost
bipartite,” “higher shift graph,” “ordered edge graph,” “arbitrary
cardinal,” “arbitrarily large chromatic number,” the two-color
$n^{1+\epsilon}$ bound, and the citation trails above. Also checked
the community Erdős #111 record, the source linked by the October
2026 converse, recent finite-age work, the prior working report
and the project's main/research index, issues and PRs. No prior
proof of the precise arbitrary-cardinal two-color conjecture
was located. This is a bounded search, not a priority guarantee.

Repository coordination: [#1014](https://github.com/1337isnot1337/solved-conjectures/issues/1014)
was closed as a prior exact-cardinal resolution. The distinct
scope is pinned in [#1015](https://github.com/1337isnot1337/solved-conjectures/issues/1015).
