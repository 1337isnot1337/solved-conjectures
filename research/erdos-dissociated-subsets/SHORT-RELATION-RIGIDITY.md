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

[Coordination #1101](https://github.com/1337isnot1337/solved-conjectures/issues/1101).
