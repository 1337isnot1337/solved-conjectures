# A covering family of half independent sets forces a cheap cut

An exact all-order exclusion for stationary counterexamples to [Erdős Problem 23](https://www.erdosproblems.com/23). Work with product vertex mass, normalized to one, or a triangle-free graphon. Let B be the minimum unordered monochromatic mass, and suppose a law of optimum sign cuts has expected monochromatic degree d=2B at almost every vertex.

**Theorem.** If the half-mass independent sets cover almost the whole space, then B<1/25 whenever the unordered edge mass is at most 3197/20000. Consequently a stationary counterexample in the unresolved density band must have a positive-mass region belonging to **none** of its half independent sets. The density range above 3197/20000 is covered by [Balogh–Clemen–Lidický](https://arxiv.org/abs/2103.14179). The coverage assumption is not proved for a general maximizer.

Here coverage is modulo null sets: as proved in the [dictionary theorem](HALF-INDEPENDENT-DICTIONARY.md), if B≥1/25 there are at most eight distinct such sets modulo null sets, so the union is measurable and independent of representative choices.

## Four tests suffice in the covering case

Assume B≥1/25. Partition by signatures of membership in the entire family of half independent sets. Each positive-mass signature s has a positive-mass complement bar(s), with the same mass: the stationary monochromatic kernel M has constant degree d and is supported only on complementary signatures. This last assertion follows since M vanishes inside each half independent set, and also inside its complement by degree balance. The partition found in the exact dictionary theorem has at most five pairs and represents all the half independent sets, so the full membership partition has at most five pairs as well. In fact it has at most four here. The [maximal-signature argument](HALF-INDEPENDENT-DICTIONARY.md) for exactly five pairs gives a unique maximal signature and its complement, the all-one and all-zero signatures of positive mass. This argument applies to the full finite family with zero error; its proof does not depend on family size when the error is zero. The all-zero cell contradicts coverage.

Choose a subfamily of the original independent sets minimal by inclusion subject to having both membership values on every paired block. This property is feasible by taking the whole family: the all-zero signature is absent, and the all-one signature is absent by complement closure. If the subfamily has at least three members, each of its members must uniquely contribute one of the two membership values in some paired block. A block can witness this uniqueness for at most one member: with at least three members, its two values cannot both occur only once. Thus the subfamily has size at most the number of pairs, hence at most four. A subfamily of size at most two needs no argument.

Let I_1,...,I_k be these tests. Every vertex lies in at least one and at most k−1 of these sets, modulo null sets. This does not require their signatures to distinguish all original cells.

## A probability law on independent sets of coverage 3/8

Fix an actual optimum sign f from the stationary law for which every monochromatic edge has complementary test signatures, up to null sets. Such a sign exists since the expected monochromatic mass of noncomplementary pairs is zero. Let p_s be the fraction of the selected tests containing signature s. We have 1/4≤p_s≤3/4 and p_bar(s)=1−p_s.

Choose an independent set by the following mixture.

1. With probability one half, choose one of the k test sets uniformly.
2. With probability one half, choose one sign of f uniformly. Within that sign, independently for each complementary pair of signatures choose one shore. Choose s with probability a_s=3/2−2p_s and bar(s) with probability 1−a_s. Include all vertices of the chosen sign and the chosen shores.

Each a_s lies in [0,1] and a_s+a_bar(s)=1. In the second option no monochromatic edge survives inside the selected subset, because its endpoint signatures would have to be complementary. Thus this is a law on independent sets. Every vertex has inclusion probability

    p_s/2 + a_s/4 = 3/8.

An edge has disjoint membership events at its two endpoints, so the cut consisting of the sampled independent set and its complement crosses each edge with probability 3/4. Its expected loss is at most e/4. Hence, within the stated band,

    B ≤ e/4 ≤ 3197/80000 < 1/25,

the desired contradiction. The construction is a fractional-colouring certificate with total weight 8/3, but it uses the optimum-sign information to get the extra independent sets. It has no bounded-order assumption.

## A robust variant for four near-half tests

Suppose instead the stationary graph has k≤4 independent sets each of mass at least (1−ε)/2. Let u be the mass missed by all the tests, and let v be the mass belonging to all tests. Pairwise complement mass imbalance in the stationary monochromatic kernel is at most kε, as in the dictionary proof, so v≤u+kε. All noncomplementary signature pairs jointly have unordered M mass at most d kε/2. There is an optimum f with at most this much monochromatic cost on those pairs. Remove those same-sign edges, and remove all edges incident to the all-zero or all-one signature classes. The latter operation costs at most (u+v)/2 by the original degree cap of one half. On the remaining support the same independent-set law works verbatim, ignoring the isolated exceptional vertices. Restoring the edges adds at most their total mass, so

    B ≤ e/4 + (3/4) [u + k(1+d)ε/2].

In particular this proves the sharp conjectured bound in the middle band whenever u+k(1+d)ε/2≤1/20000. The exact covering theorem is the zero-error case with a certified subfamily of at most four tests. The robust statement does not assert such tests exist for an arbitrary near maximizer.
