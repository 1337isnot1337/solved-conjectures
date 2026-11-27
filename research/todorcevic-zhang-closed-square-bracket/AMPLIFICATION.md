# Full-range amplification

A bridge between Questions 5.1 and 5.2 of [Todorčević–Zhang, §5](https://arxiv.org/html/2606.05790v1#S5). See [#1089](https://github.com/1337isnot1337/solved-conjectures/issues/1089).

## A universal ccc upgrade

Suppose a ground pair colouring c:[κ]²→ω₁ has uncountable range on every A of order type ω₁ closed in its supremum. There is a ccc extension in which g∘c realizes all ω₁ colours on every such A. The same forcing works for every κ and every such ground witness at once.

Let P be the finite partial functions g on ω₁ with g(ξ)≤ξ whenever ξ is in the domain, ordered by extension. It is ccc: thin any uncountable set of domains to a Δ-system and then thin to agreement on the root, which has only countably many assignments. The generic union is total. For each ground unbounded S⊆ω₁ and each η<ω₁, the conditions giving g(ξ)=η at some ξ∈S form a dense set, since a fresh ξ≥η is available. Consequently g[S]=ω₁ for every ground unbounded S.

Any eligible A in the extension contains an eligible ground B: take a ground continuous cofinal ω₁-sequence in sup A, pull A back to a club on ω₁, and use ccc ground-club covering. Thus c″[B]² is a ground unbounded S and (g∘c)″[A]²=ω₁. If the range of κ includes singular cardinals, the proof still works, as it depends only on the local supremum having cofinality ω₁.

In particular the two assertions at each fixed κ are equiconsistent (with the same ground cardinals preserved), and the universal statements of 5.1 and 5.2 are equiconsistent when both are restricted to regular κ. This is not a ZFC implication from 5.2 to 5.1. Conversely, a model with a negative answer to 5.2 at κ cannot be turned into a positive answer to 5.1 there by ccc forcing, by invariance of 5.2 in [REDUCTIONS.md](REDUCTIONS.md).

## A no-forcing upgrade at arity four

Under the same hypothesis on c, in the ground model there is a colouring of 4-sets by ω₁ realizing every colour on each closed copy of ω₁. Fix a strong pair colouring d on ω₁ ([Todorčević 1987](https://doi.org/10.1007/BF02392561)). For a<b<u<v, assign d({c(a,b),c(u,v)}) if the two arguments are distinct (0 otherwise). In an eligible A, recursively take ω₁ successive disjoint pairs with distinct c-values. At each countable stage discard the bounded initial segment containing all preceding pairs and use the witness property on the closed tail, excluding the countably many previous colours. The d-values on the uncountable set of selected pair colours give the full range as required.
