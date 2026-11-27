# Continuous block reduction

For either target (full range or uncountable range), the least uncountable cardinal without a closed square-bracket colouring must be regular. In particular the regular-cardinal restriction in Question 5.2 does not change its universal assertion.

**Lemma.** Let θ be a limit ordinal and ⟨bᵢ:i<λ⟩ a strictly increasing continuous cofinal sequence with b₀=0, where λ is an infinite regular cardinal. Use block Iᵢ=[bᵢ,bᵢ₊₁) and index π(x)=i for x∈Iᵢ. Suppose colourings with the desired property exist on each Iᵢ (in its inherited order) and on λ; the property is vacuous in a countable domain. Then there is such a colouring on θ.

Colour same-block pairs with that block's colouring, and different-block pairs with the colour of the pair of indices. Fix an eligible A of order type ω₁. If R=π[A] is countable, the first occurrences of all its indices fall within one countable initial segment of A, so π is constant on a tail. This closed tail is eligible inside its block.

If R is uncountable, its order type is ω₁, by enumerating indices by first occurrence. R is already closed in its supremum. Indeed, for any nonzero i<sup R with R∩i cofinal in i and i a limit point, continuity gives sup(A∩bᵢ)=bᵢ; this follows using any representative in A of each index in R∩i. Since some index in R is above i, bᵢ<sup A. Closedness of A gives bᵢ∈A, hence i∈R. Now the index colouring on R supplies the desired range, all of it realized by cross-block pairs of A.

If κ is a least failing singular cardinal, use λ=cf κ and take bᵢ cofinal and continuous in κ. Every block embeds as an initial segment of a strictly smaller cardinal (choose a cardinal larger than bᵢ₊₁). The hypothesis for λ follows by minimality, or is vacuous if λ is countable. The lemma contradicts failure at κ. It is important to colour cross-block pairs: a closed A of order type ω₁ can meet uncountably many blocks even when sup A<κ.

The argument additionally shows, for any regular κ, that a witness on the index order of any club in κ works on κ provided all gaps admit witnesses. For κ=ω₂ those gaps have cardinality at most ω₁, and arbitrary injections into ω₁ followed by the ordinary strong pair colouring give the full-range property in every block. This is useful when an argument controls only the suprema in a prescribed club: colour pairs of floor indices on that club and use the same gap construction.

[Original questions](https://arxiv.org/html/2606.05790v1#S5) · [#1089](https://github.com/1337isnot1337/solved-conjectures/issues/1089)
