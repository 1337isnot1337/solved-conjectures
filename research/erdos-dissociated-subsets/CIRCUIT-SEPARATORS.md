# Separator restrictions for a least dissociation counterexample

For a finite positive set P, call C⊆P a circuit when C is inclusion-minimal among supports of nonzero ternary relations. Thus a subset is dissociated exactly when it contains no circuit. Join two vertices in the circuit graph if some circuit contains both.

If a least-cardinality counterexample to [Erdős #963](https://www.erdosproblems.com/963) has d=d(P), then |P|=2^d. Its circuit graph is connected and has no cut vertex. More quantitatively, if P splits into proper sets P₁,P₂ that overlap in t elements and no circuit meets both exclusive parts, then at least one P_i has at most 2^t−1 elements. In particular a two-vertex separator can only isolate a single vertex on one side (for the chosen split). These are reductions, not thresholds from finite enumeration.

## Glue maximum dissociated sets across the separator

Put T=P₁∩P₂ and d_i=d(P_i). Choose maximum dissociated B_i⊆P_i. Retain all B_i outside T and retain from T only those selected in both B₁ and B₂. In the resulting union B, the intersection with P_i is a subset of B_i. A circuit cannot cross the two exclusive parts, so B contains no circuit. Its size is

    |B| = d₁+d₂−|(B₁∪B₂)∩T| ≥ d₁+d₂−t.

In a least-cardinality failure each proper P_i satisfies |P_i|≤2^(d_i)−1. If both d_i≥t+1, then d≥d₁+d₂−t≥max(d₁,d₂)+1, so

    |P|=|P₁|+|P₂|−t≤2^(d₁)+2^(d₂)−2−t≤2^d−2−t,

a contradiction. Thus one d_i≤t, giving |P_i|≤2^t−1. A disconnected circuit graph would allow t=0 with both parts nonempty; a cut vertex would allow t=1 with both proper parts of size at least two. Both are impossible. A two-element separator forces some P_i of size at most three and at least three.

Finally, if |P|>2^d, remove a vertex. The new set still has size at least 2^d and dimension at most d, contradicting minimality. Hence equality |P|=2^d holds.

## Multiple pieces

The gluing bound extends to k pieces with common separator T and disjoint nonempty exclusive parts, provided every circuit is contained in one piece. Keep all chosen basis elements outside T and keep a separator element only if all k bases chose it. For any separator element the loss in summing basis sizes is at most k−1, giving

    d(P) ≥ ∑_i d(P_i) − (k−1)|T|.

The proof uses every minimal ternary support, not merely three-term Schur triples, nor a single presentation that might omit a crossing circuit. The remaining challenge is exploiting connectivity and still finding a larger basis in a highly connected signed-relation configuration.

[Coordination #1101](https://github.com/1337isnot1337/solved-conjectures/issues/1101).
