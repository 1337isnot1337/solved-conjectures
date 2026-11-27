# A lower bound on the Boolean rooted-cut sample size

For each integer k≥1 there is a triangle-free step graphon W in the hard density band of [Erdős #23](https://www.erdosproblems.com/23) such that

    U_k(W)−m(W) ≥ 1/(200√k).

Thus uniform additive approximation by the Boolean rooted envelope needs Ω(ε⁻²) roots, even on weighted pentagon blow-ups with isolated mass. The obstruction is not simply failure to sample a class: small differences in weights are needed to choose which edge to leave uncut. This complements the constructive O(ε⁻⁴) upper bound in [POLYNOMIAL-ROOT-RATE](POLYNOMIAL-ROOT-RATE.md).

## Two rotated weightings of one template

Set t=7/8, a=1/5, and δ=1/(100√k). Put total mass t on five pentagon classes and leave the remaining mass isolated. On the pentagon, conditional weights are a−4δ on one light class and a+δ on the four others. Use two placements of the light class, at cyclic positions 0 and 2. These two weighted graphons are isomorphic by rotation.

The ordered edge density, common to both, is 2t²(1/5−5δ²), which is between 0.305 and 0.307, wholly within the hard band. An optimal cut leaves only one of the two edges incident to the light class uncut. Indeed a class-constant colouring does this, every class-constant colouring misses at least one edge, and the finite multilinear objective in the fractions of individual classes on each side permits rounding to whole classes without loss. The cheapest-edge sets of the two placements are disjoint.

For any colouring c of the five classes, let L₀(c),L₂(c) be its ordered monochromatic cost above optimum under the two placements. The gap between the weight of a heavy-heavy edge and a light-heavy one is 5δ(a+δ) before the factor 2t². A colouring with just one missed edge cannot use a cheapest edge in both placements. If more than one edge is missed, its excess in either placement is at least this same gap: at most two distinct edges are cheapest, and the number of missed edges on a pentagon is odd, so there is a missed heavy-heavy edge. It follows that universally

    L₀(c)+L₂(c) ≥ 2t² δ.

## Information supplied by the roots

Let s∈{0,1,2,3,4,*}^k be a labelled sequence of latent root classes, with * the isolated class. Under the two placements it has laws P₀ and P₂. For a fixed sequence s, the observed root graph and the profiles of all five possible evaluation classes are identical in the two calculations: these data use template adjacency, not weights. Consequently any per-type Boolean rule, even if chosen with full prior knowledge of the weighted graphon, assigns a single common class colouring c(s) in the comparison. Its expected excess under P₀ equals its expected excess under P₂, because rotation sends one law to the other and preserves the entire unlabelled-in-class root observation and evaluation cost.

The one-root chi-squared divergence of the two class laws is at most 500δ²: only two masses differ, by 5tδ each, and each differing mass is at least t/10. For independent root draws chi-squared plus one multiplies, so

    χ²(P₀ || P₂) ≤ exp(500kδ²)−1 = exp(1/20)−1 < 1/4.

Therefore their total variation is at most (1/2)√χ² < 1/4. This last inequality is Cauchy–Schwarz on the likelihood difference. Summing the two expected losses over the smaller of the two probabilities at each sequence gives

    E_(P₀) L₀(c(s)) + E_(P₂) L₂(c(s))
       ≥ 2t²δ (1−TV(P₀,P₂)) ≥ (3/2)t²δ.

Since the expectations are equal, the gap for the given rule is at least (3/4)t²δ >1/(200√k). The bound holds for every rule (including the one minimizing cost conditional on each rooted type); randomizing does not improve it. This proves the claimed lower bound.

The two graphons are not counterexamples to the Erdős deletion bound. They demonstrate a rate limit for approximating the true optimum with rooted Boolean information.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
