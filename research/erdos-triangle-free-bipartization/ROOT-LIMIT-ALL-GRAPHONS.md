# Exact obstruction to convergence of Boolean profile cuts

Let W be any graphon. For each positive-mass class of vertices having the same **binary** neighborhood row, inspect the value of W on the class's diagonal square. It is either zero or one, almost everywhere. Call the classes with value one the binary clique twin classes, and let ω be the sum of their squared masses. Form W⁰ by setting W to zero on those squares and leaving all other values unchanged.

Then the Boolean rooted cut envelope satisfies the exact formula

    lim_(k→∞) U_k(W) = ω + m(W⁰),

where m is the minimum ordered monochromatic density. In particular, the obstruction to recovering optimum with rooted Boolean recipes is exactly the forced sameness of these actual clique twins. For every fixed clique-free graphon ω=0, recovering the qualitative statement of the [sharp sample theorem](OPTIMAL-ROOT-RATE.md). This is an envelope theorem, not the sharp deletion bound in Erdős #23.

## Binary twins and the lower bound

Treat rows as elements of L²; the row map is measurable and the positive-mass equality classes are its countably many atoms. For a binary row atom A, symmetry forces W constant almost everywhere on A×A, since on that square it is separately constant in each coordinate. The constant is binary. For vertices within each such class their rooted adjacency bits are the same almost surely, for any finite number of roots, since the common row is binary.

Thus every Boolean profile rule pays exactly the total ω from the clique squares. Its remaining cost is the cost of a (possibly fractional) cut in W⁰ and is at least m(W⁰). For the fractional interpretation, condition on the root state with positions; the profile bits for two new vertices are independent given their positions. The usual convex-box fractional cut cost has the same infimum as the measurable sign-cut cost, for instance by fine step approximation and splitting cells in the prescribed proportions. Hence U_k(W)≥ω+m(W⁰) for every k.

## The auxiliary envelope bound with an explicit collision term

For any graphon V let

    Q_h(V) = ∫∫ V(x,y) Pr[their adjacency bits agree at h independent anchors] dxdy.

The finite-graph proof in [OPTIMAL-ROOT-RATE](OPTIMAL-ROOT-RATE.md) applies without triangle-freeness up to rounding. Its rounding loss is at most Q_h even before any estimate on Q_h. Therefore it gives, for absolute C and an auxiliary sample size s a power of two,

    U_(q+s+h)(V) ≤ m(V) + C/√q + C/√s + Q_h(V).

For general V, pass from finite simple graph samples using the counting lemma: for fixed q,s,h the envelope, m, and the weighted collision event Q_h are continuous in cut distance. The triangle-free and K_r-free proofs estimate Q_h uniformly under their additional assumptions; this formulation does not assume either.

Write Δ(x,y) for the probability of one profile disagreement. Its integrand can be written as

    (V_x−V_y)² + V_x(1−V_x) + V_y(1−V_y).

Thus Δ=0 exactly when both rows are binary and equal. Dominated convergence yields

    lim_h Q_h(V) = ∫∫ V(x,y)1[Δ(x,y)=0] dxdy,

which is exactly the clique-twin square mass of V: nonatomic equality classes contribute zero pair measure.

For V=W⁰ this limit is zero. Deletion cannot create a new adjacent binary-twin pair involving a removed class A: if x∈A and y outside with W⁰(x,y)=1, then almost everywhere on A the W⁰-row of x is zero and that of y is one, hence they differ. The rows of vertices outside every removed class are unchanged. An adjacent pair of equal binary unchanged rows, if it contributes positive pair measure, would be in an original removed class. Therefore W⁰ has no positive-mass clique twins and U_k(W⁰) decreases to m(W⁰).

## Simulate the deletion without latent coordinates

Fix a root count k and a rule for W⁰. In a sample from W, take k primary roots and also h independent diagnostic anchors. To simulate the adjacency between two primary roots, keep their observed bit except set it to zero if their diagnostic profiles agree. Make the same edit when obtaining a new vertex's simulated profile to the primary roots. Both operations use only observed adjacency bits: the first is a function of the enlarged root graph, and the second is a function of that root graph and the queried vertex's bits.

Within a removed class the diagnostic bits always agree, so the deletion is exactly correct. For any other observed edge pair, except for a null set, either Δ>0 or the edge has zero weight. If the true simulated edge must remain, the probability that its two diagnostic profiles agree is (1−Δ)^h, tending to zero almost everywhere. A union bound over the fixed number of pairs among the k roots and two evaluation vertices shows that the joint simulation is exact with probability tending to one. Couple the correct simulated graph with a sample from W⁰ by sharing all original edge bits and deleting exactly the designated clique squares.

Use the W⁰ rule on the simulated root type and profile. On the evaluation pairs outside the removed squares its limiting cost is at most U_k(W⁰); on the removed squares it is always monochromatic, because every true-twin class really has identical complete profiles. Thus limsup_h U_(k+h)(W)≤ω+U_k(W⁰). Send k to infinity and combine with the lower bound to prove the formula.

The convergence is pointwise over all W, not uniform: dense loops cannot be manufactured by a Boolean rule on an entire constant binary clique. Zero-one clique-free graphons do not have this obstruction.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
