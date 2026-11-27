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

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
