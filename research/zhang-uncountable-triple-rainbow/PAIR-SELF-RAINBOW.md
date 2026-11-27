# Self-rainbows for pairs of countable ordinals

A local obstruction check for [Zhang’s Question 5.4](https://arxiv.org/pdf/1809.00649#page=15), separate from the resolution of Question 5.5 in [#1087](https://github.com/1337isnot1337/solved-conjectures/issues/1087). This note does not resolve Question 5.4.

**Theorem.** Let θ be an infinite countable ordinal. Every finitely bounded colouring of [θ]² has a rainbow of order type θ if and only if θ has finite final remainder 0 or 1. This includes θ=ω^ω and ordinals above it. The positive part works simultaneously for any finite family of bounded pair colourings.

**Negative part.** If the finite final remainder is at least two, fix the final two points u and v. Every full-order-type subset contains both and some point x earlier than both. Pair {x,u} and {x,v} into their own two-element colour class for each x<u; make remaining classes singletons. A full-order-type subset cannot be rainbow. Indeed if θ=λ+m with λ a limit and m finite, a subset missing a point of the final m has order type at most λ+(m−1).

## Ordered leaf trees

For an infinite indecomposable block of order type ω^α, choose an ordered tree of successive intervals, rooted at the whole block. A node of rank zero is a singleton leaf. If α=β+1, split the node into successive children of type ω^β. If α is a nonzero limit, split it into successive children of types ω^(βₙ) for strictly increasing βₙ cofinal in α. In both cases child indices are the natural numbers. Along any branch ranks strictly decrease, hence every branch is finite although there need not be a finite uniform depth bound. For a general infinite θ use the finitely many infinite blocks of its Cantor normal form, with repeated terms represented by separate roots, and keep its single terminal point if any.

Fix a free ultrafilter D on ω. Recursively equip the leaves of each node s with an ultrafilter Uₛ: principal for a leaf, and otherwise the D-sum of the child ultrafilters. In particular a set is Uₛ-large at a nonleaf precisely when its restrictions are large in D-many children.

Let f be a k-bounded colouring. For each node s define a graph Eₛ on the entire underlying ordinal, putting a≠b adjacent if
     
    {x in leaves(s) outside {a,b}: f({a,x})=f({b,x})} belongs to Uₛ.

Each graph has degree at most k−1. Otherwise, take k neighbours of a and intersect the k large witnessing sets; any x in their intersection produces k+1 distinct pairs of one colour. By the definition of the sum, a pair not adjacent in Eₛ is not adjacent in Eₜ for D-many children t of s.

## Fusion

Maintain a finite rainbow B of selected points (initialize with the terminal singleton, if present), and finitely many active nonleaf nodes (initialize with all roots). Require B to be independent in Eₛ for every active node s. Schedule every active node to be processed infinitely often, using a fair queue that appends a new node when activated. At each visit choose an unused child of s later than those already selected at s.

* If the children are nonleaves, choose the next child t so that all pairs from B remain nonadjacent in Eₜ. Each such pair is allowed in D-many children and only finitely many conditions are imposed. Activate t.
* If the children are leaves, choose the next leaf x. Exclude the finitely many points appearing in any pair whose f-colour already occurs on [B]². For all active nodes t and all b∈B, exclude the finitely many Eₜ-neighbours of b. Exclude previously selected points. Finally, for each a≠b in B, the condition f({a,x})≠f({b,x}) is Uₛ-large: the invariant says a,b are not adjacent in Eₛ. A finite intersection of these large sets, with the finite exclusions removed, is still large. Add x to B.

All children of any one node have the same status (leaves or nonleaves), except that a rank-limit node can have an initial leaf child if its first index is rank zero. In that case ignore that child and use the same nonleaf rule. Only finitely many children are ignored.

The maintained conditions imply the final union is a rainbow. Every active nonleaf keeps infinitely many children; in limit rank the selected child indices are cofinal in ω. Induction on rank now shows the selected leaves below an active node have its full original order type. Concatenating across the roots, including the terminal point if present, gives θ. To handle finitely many colourings, impose the finitely many graphs per active node and take the union of the finite exclusions.

**Consequence for triple constructions.** Fixing the last vertex of a proposed triple rainbow and importing a local bad pair colouring cannot refute Question 5.4 via any full-type countable prefix with final remainder 0 or 1. Conversely, reductions that use only collisions in pairs with a fixed last point may have such rainbows even when the global triple colouring does not. This is an arity-two lemma, not a claim about arbitrary triple colourings on ω₁.

Sources checked for the distinction: [Abraham–Cummings–Smyth, *Some results in polychromatic Ramsey theory*](https://doi.org/10.2178/jsl/1191333845); [Zhang, §5](https://arxiv.org/pdf/1809.00649#page=15); [Jakob–Zhang, *A Topological Rainbow Ramsey Theorem*](https://arxiv.org/abs/2605.03828). [*A Polychromatic Ramsey Theory for Ordinals*](https://cs.auckland.ac.nz/~jliu036/MFCS2013.pdf) concerns finite-colour ordinal Ramsey degrees, not bounded fibres as used here. No priority is claimed for the classical infinite rainbow theorem on ω.
