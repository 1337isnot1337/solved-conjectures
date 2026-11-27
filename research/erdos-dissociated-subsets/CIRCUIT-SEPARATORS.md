# Separator restrictions for a least dissociation counterexample

For a finite positive set P, call C⊆P a circuit when C is inclusion-minimal among supports of nonzero ternary relations. Thus a subset is dissociated exactly when it contains no circuit. Join two vertices in the circuit graph if some circuit contains both.

If a least-cardinality counterexample to [Erdős #963](https://www.erdosproblems.com/963) has d=d(P), then |P|=2^d. Its circuit graph is in fact 2^(d−1)-vertex-connected. More quantitatively, if P splits into proper sets P₁,P₂ that overlap in t elements and no circuit meets both exclusive parts, then at least one P_i has at most 2^t−1 elements. A stronger connectivity bound follows by removing the separator entirely, as shown below. These are reductions, not thresholds from finite enumeration.

## Glue maximum dissociated sets across the separator

Put T=P₁∩P₂ and d_i=d(P_i). Choose maximum dissociated B_i⊆P_i. Retain all B_i outside T and retain from T only those selected in both B₁ and B₂. In the resulting union B, the intersection with P_i is a subset of B_i. A circuit cannot cross the two exclusive parts, so B contains no circuit. Its size is

    |B| = d₁+d₂−|(B₁∪B₂)∩T| ≥ d₁+d₂−t.

In a least-cardinality failure each proper P_i satisfies |P_i|≤2^(d_i)−1. If both d_i≥t+1, then d≥d₁+d₂−t≥max(d₁,d₂)+1, so

    |P|=|P₁|+|P₂|−t≤2^(d₁)+2^(d₂)−2−t≤2^d−2−t,

a contradiction. Thus one d_i≤t, giving |P_i|≤2^t−1. A disconnected circuit graph would allow t=0 with both parts nonempty; a cut vertex would allow t=1 with both proper parts of size at least two. Both are impossible. A two-element separator forces some P_i of size at most three and at least three.

Finally, if |P|>2^d, remove a vertex. The new set still has size at least 2^d and dimension at most d, contradicting minimality. Hence equality |P|=2^d holds.

## Half-order vertex connectivity

Let n=2^d, as above. If two disjoint nonempty sets A,B have no circuit meeting both while contained in A∪B (in particular, if no edge of the circuit graph joins them), then d(A∪B)=d(A)+d(B)≤d. Both A and B are proper subconfigurations, so their sizes satisfy the conjectured bounds. For positive integers a=d(A), b=d(B) with a+b≤d,

    |A|+|B| ≤ 2^a+2^b−2 ≤ 2^(d−1).

For the last inequality the maximum comes from a=1, b=d−1 (or their interchange), by convexity of the exponential on the fixed-sum line. Thus deleting fewer than n/2 vertices cannot disconnect the circuit graph. Its minimum degree is at least n/2. If exactly n/2 vertices separate it, any partition of the remaining vertices with no cross edge must have one side of size one and the other of size n/2−1; equality in the exponential bound also forces their dimensions to be 1 and d−1. For d≥3 this means such a separator leaves exactly two components, one isolated vertex.

One can also state a link condition stronger than minimum degree. Every set of n/2 vertices avoiding a fixed v contains a full circuit minus v. Indeed any such set has dimension d, because otherwise it would itself be a smaller counterexample. Append v to a maximum dissociated set of that size d to get a circuit, and the circuit must contain v. In particular it is not enough for possible relations on v merely to meet each half; an entire member of the circuit link must lie in each half-sized test set.

## Multiple pieces

The gluing bound extends to k pieces with common separator T and disjoint nonempty exclusive parts, provided every circuit is contained in one piece. Keep all chosen basis elements outside T and keep a separator element only if all k bases chose it. For any separator element the loss in summing basis sizes is at most k−1, giving

    d(P) ≥ ∑_i d(P_i) − (k−1)|T|.

The proof uses every minimal ternary support, not merely three-term Schur triples, nor a single presentation that might omit a crossing circuit. The remaining challenge is exploiting connectivity and still finding a larger basis in a highly connected signed-relation configuration.

[Coordination #1101](https://github.com/1337isnot1337/solved-conjectures/issues/1101).
