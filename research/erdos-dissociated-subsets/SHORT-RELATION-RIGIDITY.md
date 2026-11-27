# Short-relation rigidity: no two-valued linear witness

Let P be a least-cardinality positive-set counterexample to [Erdős #963](https://www.erdosproblems.com/963), and d=d(P), so |P|=2^d. Let R be the rational span of the coefficient vectors of all ternary relations on P whose support has size at most d+1. Then

    R^⊥ contains no nonzero function on P taking at most two real values.

This is a restriction on the short relation presentation, not on all linear relations of the numbers. In particular, no nonempty proper group of points can have its coefficient sum balanced in every short ternary relation. It excludes least failures made from two sufficiently separated magnitude clouds. The full conjecture remains open.

## The affine extraction fact

A set is affinely dissociated if it has no nonzero ternary relation whose coefficients sum to zero. Every finite real set X of size M≥1 contains an affinely dissociated subset of size at least 1+ceil(log₂ M). This is the [binary residue-tree argument](https://erdosproblems.ai/wiki/research/erdos_963/affine_coherence): preserve all ternary relations and distinctness by a generic integer functional on a rational coordinate model of X. A leaf in its binary residue trie has at least ceil(log₂ M) branching ancestors, since a binary tree of branching depth h has at most 2^h leaves. Choose that leaf and one point from each sibling branch. The differences to the leaf have distinct 2-adic valuations. In a balanced relation, subtracting the leaf value reduces to a ternary relation of these differences, impossible by the unique least valuation.

On any portion of P on which every ternary relation of length at most d+1 is balanced, this implies |portion|≤2^(d(portion)−1). Indeed any affinely dissociated subset of size more than d(portion) would give one of size d(portion)+1≤d+1, whose required ordinary relation would be balanced.

## A two-valued witness contradicts minimality

Suppose h∈R^⊥ is nonzero. Every nonzero level of h, as a set of points, has all its short relations balanced: applying h to such a relation gives the level value times the coefficient sum. Hence the affine extraction bound applies on every nonzero level.

If h has only one value, it is a nonzero constant and already bounds |P|≤2^(d−1). Now let A and B be its two nonempty levels.

- If A has value zero and B has nonzero value, no size-d dissociated set in A can exist. Appending any point of B would give a required short relation with coefficient ±1 at that point and all other coefficients in the zero level, contradicting h∈R^⊥. Thus minimality gives |A|≤2^(d−1)−1, while the affine extraction gives |B|≤2^(d−1). Their sum is too small.
- Suppose both values a,b are nonzero and b/a is not an integer. Similarly no size-d dissociated subset of A can be extended by a point of B and then have a short relation, since it would require b/a to be an integer. Thus d(A)≤d−1. The affine bounds give |A|≤2^(d−2), |B|≤2^(d−1), again too small. If a/b is not an integer instead, interchange A and B.
- The only remaining distinct-value possibility has b=−a, because both ratios are integers. Negate all elements of B. This preserves dissociation and distinctness (the original set was positive). The witness condition says all short ternary relations in the resulting signed set are balanced on the full set. The affine extraction bound again gives |P|≤2^(d−1).

## Separated clouds as one application

Suppose P=A∪B with B nonempty, all elements of A at most M, and all elements of B in [c−w,c+w], where c>(d+1)max(M,w). Applying a nonzero total integer coefficient on B in a relation of length at most d+1 would contribute at least c from the center. The deviations on B and the entire contribution from A have combined magnitude at most (d+1)max(M,w), which cannot cancel it. Thus the B-indicator would be a forbidden two-valued witness. This shows how magnitude separation creates a forbidden relation-preserving affine lift; it is not a general guarantee that a counterexample decomposes into two such clouds.

## Three levels are almost excluded as well

One may first negate a point whenever its witness value is negative, changing h to |h|. This does not alter dissociation dimension of any subset and preserves the short-relation witness property with reoriented coefficients. The signed points stay distinct because the original set was positive. All proper-subset numerical bounds remain valid by returning to the corresponding positive subset.

If a witness has value zero and only two distinct positive magnitudes a<b, denote its fiber dimensions by d₀,d_a,d_b. One may append representatives from both nonzero fibers to a dissociated zero-fiber set: any relation of size at most d+1 projects to a ternary relation on the two distinct positive numbers a,b, so both coefficients must vanish. Hence d₀≤d−2. One can append a representative of value a to the b-fiber, since a/b is not an integer, giving d_b≤d−1. The proper-subset bound on the zero fiber and the affine bounds on the positive ones imply

    |P| ≤ (2^(d−2)−1) + 2^(d−1) + 2^(d−2) = 2^d−1,

a contradiction. If there is only one distinct positive magnitude after reorientation, the earlier two-valued result applies.

If the three magnitudes are all positive, write them a<b<c. Since a is not an integer multiple of either larger value, the two larger fibers have dimension at most d−1. Together with affine extraction this bounds the three sizes by 2^(d−1), 2^(d−2), 2^(d−2). Their sum is exactly 2^d, so every bound must be tight. In particular a maximum dissociated d-set can be selected in the a-fiber. Appending a representative of value b or c forces the respective ratios b/a and c/a to be positive integers at most d.

If a+b≠c, the two distinct nonzero residues a,b modulo c are dissociated: the only potential balance of support at most two would be a+b=c (the difference is nonzero and smaller than c). Hence one can append a representative from each smaller fiber to a dissociated subset of the c-fiber and preserve dissociation as long as the total size is at most d+1. This would force d_c≤d−2, a contradiction. Thus a three-positive-level witness in a least failure would have to have magnitudes exactly a, ka, (k+1)a for an integer 2≤k≤d−1, with saturated fiber sizes 2^(d−1), 2^(d−2), 2^(d−2), respectively.

The last pattern is not excluded by this argument. In particular, the result is not a proof that every short-relation witness has four or more magnitudes.

[Coordination #1101](https://github.com/1337isnot1337/solved-conjectures/issues/1101).
