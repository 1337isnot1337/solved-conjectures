# Exactness for a single favorable root type on a finite template

There is a natural distinction between averaging the per-type Boolean bounds U_k and asking whether **one** positive-probability type has a good Boolean rule. Define

    V_k(W) = min_[types σ of positive probability] min_[Boolean rules g]
             E[ordered monochromatic density of g | σ].

It still satisfies V_k≥m, but it does not weight rare types by probability. For a finite zero-one graphon W, reduce its template H by merging false twins. Assume H is a simple graph, all its class weights are positive and its adjacency rows are distinct. Then:

1. Some finite V_k equals m if and only if there is a whole-template optimum cut whose entire orbit under Aut(H) is optimal at the given weights.
2. Even without such a cut, for fixed W there are constants C,c>0 such that 0≤V_k−m≤C exp(−ck) for all sufficiently large k.

This gives a precise nonzero-error obstruction for the one-favorable-type approach to [Erdős #23](https://www.erdosproblems.com/23). In particular finite templates do **not** automatically have a conditionally exact rule just because enough roots can see every class.

## Necessity: ambiguity under renaming the template

For each latent sequence of root classes, the induced root graph is known, and a profile rule gives a class-constant cut. An optimal graphon cut can be taken class-constant because its objective is affine separately in each class fraction and H has no loops. If an expected conditional cost equals m, the realized cut must be optimal for every latent sequence giving its observed type: all sequences have positive probability and none can beat m.

Fix one such sequence and a template automorphism α. Applying α to every class in the sequence preserves the observed root graph. The profile of α(v) at the renamed sequence equals the profile of v at the original one, so the cut obtained from the same rule is the α-translate of the original cut. This proves the orbit requirement.

## A type that identifies the template up to its automorphisms

Choose a root sequence meeting every class. Its observed root graph has exactly |V(H)| distinct neighborhood rows, because all distinct template rows are observed. Two roots mapped to the same underlying class must have identical rows. Any sequence reproducing this type therefore uses at least |V(H)| classes and hence uses them all. Once all classes are present, distinct underlying classes cannot have equal observed rows either. Thus the observed twin groups determine the underlying class labels up to an automorphism of H, and the new vertex's profile identifies its class relative to those groups.

If a cut whose whole orbit is optimal exists, use its labels in this type. Conversely the previous section rules out any exactly optimal type if the orbit requirement fails. Additional roots can be padded or counted using a type containing all classes.

## Exponential posterior identification at fixed weights

Let w_i>0 be the underlying weights. For k sufficiently large, pick a type from a sequence with multiplicities n_i=k w_i+O(1) for every class, using integer rounding with ∑n_i=k. Every class occurs. In this type the possible latent sequences are precisely the automorphism images of the chosen sequence, and their probabilities are proportional to ∏_i w_(α(i))^n_i.

Relative to the chosen embedding, the exact log probability ratio is

    ∑_i n_i log(w_(α(i))/w_i) = −k D(w || w_α) + O_W(1).

Here D is the finite probability divergence and is positive unless α preserves the weight vector. Since H has finitely many automorphisms, the conditional probability of a non-weight-preserving image is O_W(exp(−c_W k)); if none exists the rule is already exact. Use any optimum cut in the chosen orientation. Images that preserve the weights remain optimal, and the cost gap on the remaining event is at most one. This proves the exponential bound.

For a pentagon with one light class and four equal heavier classes, the orbit requirement fails: optimal cuts leave a light-incident edge, but its rotations range over all edges. Thus V_k>m for every finite k at these fixed weights, although V_k tends to m exponentially. The [uniform averaging result](OPTIMAL-ROOT-RATE.md) is a different statement and has worst-case gap of order k⁻¹ᐟ² across weights.

## Sharp uniform order over the weights of a fixed template

Although the exponential rate is pointwise at each fixed weight vector, the following stronger uniform statement holds:

    sup_[positive weights on H] (V_k−m) = O_H(1/k).

For the pentagon the order 1/k is sharp, with examples again in the middle density band.

**Upper bound.** Sort the weights w₁≤⋯≤w_r. Choose multiplicities n_i≥1 increasing with adjacent increments at least b, where b≥c_r k for sufficiently large k. For example start with n_i=1+(i−1)b for b=floor(2(k−r)/(r(r−1))) and give any remainder to n_r. This type still identifies the template up to automorphisms, even though it may be rare.

Write ℓ_i=log w_i. For an automorphism α, the negative log posterior ratio relative to the chosen orientation is

    ∑_i n_i(ℓ_i−ℓ_(α(i)))
      = ∑_(j=2)^r (n_j−n_(j−1)) [∑_(i≥j)ℓ_i−∑_(i≥j)ℓ_(α(i))].

Every bracket is nonnegative, since the sorted top set maximizes the sum. Moreover if α moves a value across indices i and α(i), some bracket is at least |ℓ_i−ℓ_(α(i))|. If ℓ_i>ℓ_(α(i)), take the top set starting at i: its image includes the latter low value, replacing a value at least ℓ_i. If ℓ_i<ℓ_(α(i)), take the top set starting at i+1: its image omits the latter high value and includes a replacement at most ℓ_i. Other replacements cannot decrease the bracket. Hence the posterior ratio is at most exp(−b D_α), where D_α=max_i|w_i−w_(α(i))|, using that log differences dominate weight differences on (0,1].

Use an optimum cut in the chosen orientation. For any fixed cut its ordered cost changes by at most 2||w−w_α||₁ under the weight permutation, by expanding the difference of the two product measures. The optimum itself does not change under automorphisms. Thus conditional excess is at most ∑_α 2r D_α exp(−b D_α)≤2r|Aut(H)|/(e b), proving uniform O_H(1/k).

**Lower bound.** Use the rotated pentagon example of [ROOT-LOWER-BOUND](ROOT-LOWER-BOUND.md) but with δ=1/(100k), and the same component and isolated masses. The two placements induce the same distribution of observed root types. For any latent sequence, the probability ratio of the placements lies between exp(−5/16) and exp(5/16): each differing single-root mass ratio is at most 1+(5/16)/k. The same bounds hold after conditioning on any one observed type, because that type's probability is identical in both placements. Thus the conditional overlap of the two laws is at least exp(−5/16)>2/3, uniformly in the type. At any latent sequence the two candidate regrets still sum to at least 2(7/8)²δ, and the two expected regrets are the same by rotation, even conditionally on the type. Therefore each type and each Boolean rule has regret greater than 1/(200k). This proves the matching uniform lower bound.

The conditional one-type gap can therefore be smaller than the k⁻¹ᐟ² averaged gap even on the same template, but it still need not vanish at any finite k.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
