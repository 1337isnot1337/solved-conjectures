# An obstruction to order-invariant finite-tuple graphs

Every graph built from a countable list of tags on finite increasing tuples, with adjacency determined entirely by the two tags and joint order-and-equality pattern, is either not K₄-free or has a countable edge colouring with no monochromatic triangle.

More precisely, take an infinite well-ordered set I. For each tag i in a countable index set allow all increasing tuples of some fixed positive finite length dᵢ from I, paired with that tag. (Unused tags may be discarded.) Require that whether two vertices are adjacent depends only on their tags and the joint pattern of order and equalities between their coordinates. There is no assumption on how many distinct patterns define edges.

Colour each edge by its two tags and its joint pattern in a fixed orientation. Use increasing tag order if they differ and increasing lexicographic tuple order if they agree. There are countably many colours.

Suppose a triangle is monochromatic. Its three vertices must share one tag: otherwise the common two-tag edge colour would make the triangle bipartite. Write its three vertices in lex order. Each forward pair of these d-tuples has the same pattern, say P. Define four abstract tuples in lex order, with the internal increasing comparisons and with P prescribed on every forward pair. This is consistent: each transitivity or equality-substitution test involves at most three coordinate occurrences and hence at most three tuple copies, where it is already certified by the given triangle. Quotient the coordinate occurrences by equality and linearly enumerate them. The resulting finite order embeds in I. The four distinct tuples realized there are pairwise adjacent, since each has the certified tag and each pair has pattern P. This contradicts K₄-freeness.

In particular, a deterministic replacement for [Shelah's interleaving forcing](https://shelah.logic.at/files/95854/289.pdf#page=22) that simply picks a fixed subset of the allowed pair patterns cannot work. An arbitrary subgraph of an order-pattern graph need not obey order invariance and is not ruled out; this distinction matters, as the forcing uses such arbitrary subgraphs as conditions.

[#1090](https://github.com/1337isnot1337/solved-conjectures/issues/1090)
