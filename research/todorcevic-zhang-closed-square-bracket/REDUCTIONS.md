# Todorčević–Zhang’s closed square-bracket problem

Status: structural reductions, not a ZFC or independence claim. [Coordination issue #1089](https://github.com/1337isnot1337/solved-conjectures/issues/1089).

For regular uncountable κ, [Todorčević–Zhang, Strong colorings based on oscillations, §5](https://arxiv.org/html/2606.05790v1#S5) asks for a colouring of pairs by ω₁ with uncountable range (Q5.2), or full range (Q5.1), on every A of order type ω₁ closed in sup A. Here “closed” always means closed in the supremum.

## Pair compression and Club Chang

At ω₂, the following are equivalent:

1. Every pair colouring by ω₁ has countable range on some closed copy of ω₁.
2. For every countable-language structure on ω₂ (expanded by order, the predicate for ω₁, and specified Skolem functions), some elementary submodel X has size ℵ₁, countable intersection with ω₁, and contains a club in sup X.

The second is Club Chang in [Cox–Shelah's preprint](https://arxiv.org/pdf/1809.09280v2). That paper was [withdrawn](https://arxiv.org/abs/1809.09280); do not invoke its attempted consistency proof.

To see 2 ⇒ 1, include the colouring as a binary function. A club subset of X has order type ω₁ after thinning if necessary. Restrict the colouring to pairs in it; all values lie in X∩ω₁. For the converse, expand the given structure by an injection eβ:β→ω₁ for each β<ω₂, encoded by a binary function, and use a countable Skolemization. For α<β define S(α,β)={β} ∪ {ξ<β:eβ(ξ)≤eβ(α)}. Let c(α,β) be the supremum of z+1 for all z<ω₁ in the Skolem hull of S(α,β). The hull is countable, so this gives an ω₁-colouring. Take a closed A of order type ω₁ on which c has countable range and let X be its Skolem hull. For any finite set of at least two arguments drawn from A, take their maximum β and take α among the remaining arguments with greatest eβ-index. All arguments belong to S(α,β). For one argument α choose β later in A; constant terms require no arguments. Thus X∩ω₁ is bounded by the supremum of c on pairs from A, and X has size ℵ₁.

For any β in X, the included injections send X∩β into X∩ω₁. Hence X has order type ω₁, and A is a club in sup X: if there were a point in X at or above sup A, that point would already have uncountably many predecessors. The compression proof works in general with host λ⁺⁺, palette λ⁺, and desired closed order type λ⁺ with range of size at most λ.

The older stationary result ([Garti–Zhang, Lemma 2.20](https://arxiv.org/abs/2007.05935); also Todorčević–Zhang Proposition 3.3) does not give a club witness. The [2026 Basak–Casarosa–Lambie-Hanson–Marun–Veličković, Lemma 4.20](https://arxiv.org/html/2611.18011v1#S4.SS3) obtains ordinal closure under cofinalities strictly below the small transfer cardinal ℵₙ, for n≥1. It does not cover simultaneous countable colour range and closure at countable limits. Collapsing ℵ₁ to ℵ₀ would turn unaddressed ground cofinality-ω₁ cuts into countable cofinality cuts.

## Invariance under ccc

For every regular uncountable κ the Q5.2 assertion is invariant under arbitrary ccc forcing. Both directions use preservation of cardinals and cofinalities.

* If a ground colouring has uncountable range on every eligible A, it remains a witness. Given a new eligible A, set δ=sup A and take a ground increasing continuous cofinal map e:ω₁→δ. The preimage under e of A is club in ω₁ and contains a ground club D. Then e[D]⊆A is a ground closed copy. In particular, any ground witness for the stronger full-range assertion is preserved as well.
* Conversely, suppose each ground colouring has countable range on some eligible A. For a name for a colouring d, take a ground colouring b with b(α,β) strictly exceeding all possible values of d(α,β) (a countable set by the chain condition). A ground closed copy with countable b-range has bounded d-range in the extension. The same proof below a condition applies to a name only forced there to be a colouring.

For clarity, the club-cover fact follows by bounding, for each ξ<ω₁, all possible values of the least member of the named club above ξ. The limit closure points of this ground function form a ground club contained in the named club.

## Unary range, square, and its obstruction

If a map r:κ→ω₁ is unbounded on every closed copy of ω₁, then both questions have affirmative answers at κ. Fix the [Todorčević strong colouring of pairs on ω₁](https://doi.org/10.1007/BF02392561), realizing all ω₁ values on every uncountable set, and colour {a,b} by its value on {r(a),r(b)} when distinct (use 0 otherwise).

At ω₂, a countable-width square sequence supplies such an r. For β of countable cofinality set r(β)=sup{ot(C)+1:C belongs to the square family at β and ot(C)<ω₁}; set r(β)=0 elsewhere. For any club A of order type ω₁ in δ, choose a square club D at δ. It has order type ω₁, and A∩acc(D) is club in δ. At such β the sequence contains D∩β, whose order types are cofinal in ω₁ as β ranges over A∩acc(D). Thus r[A] is unbounded. This gives the full range, not only failure of Club Chang as in Cox–Shelah's Theorem 1. Todorčević–Zhang Proposition 3.3 discusses a stronger **stationary** colouring under width-one square, which is not being claimed at countable width.

In the other direction, the Friedman property that every stationary subset of E^κ_ω contains a closed copy of ω₁ (in particular under MM, by Todorčević–Zhang Proposition 3.2) precludes any such unary r for regular κ>ω₁. Some fibre of r on E^κ_ω is stationary by κ-completeness of the nonstationary ideal. That fibre contains a closed copy on which r is constant. This is not an obstruction to genuinely pair-dependent colourings.
