# Boundary and source audit

This is about the nondegenerate formulation of [Erdős #1167](https://www.erdosproblems.com/1167): r≥2, at least two colours, and all targets κ_i>r. See [Erdős–Hajnal, 1971, Problem 2, printed p.20](https://www.renyi.hu/~p_erdos/1971-28.pdf#page=4), [EHMR §24](https://real-eod.mtak.hu/15973/), and [Komjáth, 2025, Problem 2](https://doi.org/10.1017/bsl.2025.1). The conjecture transfers a positive partition relation on 2^λ in arity r+1 down to λ in arity r. Its negated form transfers the other way. The catalogue's already documented counterexamples omit either the two-colour condition or κ_i>r; neither is being counted.

## Any target above λ makes the premise false

In particular, an extra hypothesis κ_i≤λ is unnecessary once the two intended nondegeneracy conditions are retained. This follows from the classical Erdős–Hajnal–Rado negative triple relation 2^λ↛(λ⁺,4)³ and the following elementary arity padding. A proof of the special triple relation is included to make the reduction independent of cardinal arithmetic.

The usual lex order on binary sequences of any infinite ordinal length α has no monotonically increasing or decreasing well-ordered sequence longer in cardinality than |α|. Induct on α. A monotone sequence of cardinality larger than |α| has that many distinct adjacent pairs. Charge each adjacent pair to its first difference δ<α. At a fixed δ, the prefix of length δ cannot repeat for two such pairs: a monotone sequence crosses each fixed prefix's 0/1 cut only once. The distinct prefixes from the charged pairs form a monotone sequence in the lex order on 2^δ. By induction there are at most max(ℵ₀,|δ|) such pairs for each δ, with finite lengths immediate. Summing over δ gives the bound.

Independently well-order the entire binary domain. On any triple declare blue if its well-order-largest point lies strictly between the other two in lex order, red otherwise. There is no blue 4-set: once c lies between a and b for the first three points a<b<c in the auxiliary well-order, the fourth would have to lie in both disjoint open lex intervals between a,c and b,c. In a red set each point is a new lex minimum or a new lex maximum relative to all its earlier points in the auxiliary order. Its two types form lex-monotone sequences, so the total size is at most λ. This is the well-order/lex betweenness construction, equivalent by reversing the roles of the auxiliary endpoints to the usual version.

For r+1≥3, colour a set by the colour of its first three points in the auxiliary well-order. If an (r+2)-set were blue, pad each triple of its first four points with the same last r−2 points, giving a blue 4-set in the original triple colouring. If a set of cardinality λ⁺ were red, discard its final r−2 points when present (or pass to its first λ⁺ points), so each triple in the resulting λ⁺-set can be padded. This would give an impossible red λ⁺-set.

Now assign red to an index with κ_i>λ and blue to any distinct index. The blue target is at least r+2 and unused colours cannot yield their targets. Hence the entire proposed upper arrow is false. This addresses the oversized-target concern in the [catalogue discussion](https://www.erdosproblems.com/forum/thread/1167); it is not a disproof of the range-corrected question.

## A palette at least λ also makes the premise false

On each increasing lex (r+1)-set, take as colour its ordered list of r consecutive first differences (defined as in [PALETTE.md](PALETTE.md)). There are at most λ such lists, and the first and last (r+1)-subsets of an ordered (r+2)-set have different lists: equality would force consecutive first differences to coincide. Thus there is no monochromatic (r+2)-set at all.

## What remains after the reductions

We can assume all κ_i≤λ and the palette size is <λ. For finite palettes in source arity two, if exactly one target is infinite the lower arrow follows already from the Erdős–Dushnik–Miller theorem: combine the finite targets' colours into blue. Any infinite blue clique would contain a required finite monochromatic clique by ordinary infinite Ramsey. If it does not exist, the complementary colour has a clique of cardinality λ. This argument does not apply to infinitely many finite-target colours.

The 1971 primary source singles out arity two with one singular target and the others finite. That remains open in this work: the binary sign-doubling method cannot duplicate the unique large target. The all-infinite-palette theorem in [PALETTE.md](PALETTE.md) applies to arity three, including that arity's otherwise uncovered single-singular infinite-palette profile.
