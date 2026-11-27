# When can a finite rooted maximum-cut envelope be exact?

For a triangle-free graphon with positive edge density, the following are equivalent:

1. The Boolean rooted envelope U_k equals the true minimum m at some finite root count k≥1.
2. U₁=m.
3. For almost every root x, its single random adjacency bit gives an optimal cut (in the fractional sense if W is nonbinary).

Moreover, the only positive-density triangle-free graphons with these properties are complete bipartite graphons (the two parts need not balance) and the balanced pentagon blow-up. In the nonbipartite case the one-bit condition first forces regularity and m=p−2p², then forces the balanced pentagon. This identifies an exact barrier for [Erdős #23](https://www.erdosproblems.com/23): **a finite-root certificate of U_k≤2/25 throughout the middle band exists if and only if the true supremum of m in that band is strictly below 2/25.** Mere pointwise convergence, even at the [sharp sampling rate](OPTIMAL-ROOT-RATE.md), does not remove the strict-gap requirement.

## Collapse to repeated rows

Suppose U_k=m. Choose a minimizing Boolean rule for each induced labelled root type; the lists are finite. Conditional on the latent root positions and their observed type, any such rule defines a fractional cut on the graphon by averaging its output over the queried vertex's profile bits. This cut costs at least m. Equality in expectation therefore means these conditional fractional cuts are optimal almost surely.

Fix a typical x, writing W_x for its row as an L¹ function. The L¹ row space is separable and the row distribution gives positive mass to every neighborhood of almost every realized row. For each integer j, there is positive probability that all k roots have rows at L¹ distance less than 1/j from W_x. There is thus a configuration from this event whose rule is conditionally optimal. Among the finitely many Boolean rules, choose a subsequence with one fixed rule g as j tends to infinity.

At a queried vertex y, couple every bit from the chosen roots to an independent Bernoulli bit of mean W(x,y). The integrated probability of any disagreement is at most the sum of the k row distances, less than k/j. Therefore the fractional cut selectors converge in L¹ to

    q_x(y) = P_g(W(x,y)),

where P_g(t) is the probability that g returns one on k independent Bernoulli(t) bits. The fractional objective is continuous in L¹, so q_x is optimal. The rule g is not constant because constant cuts have cost p>m.

For 0<t<1, every bit pattern has positive probability; since g is nonconstant, 0<P_g(t)<1. Thus the fractional region of q_x is exactly {y:0<W(x,y)<1}. By the [triangle-free fractional rounding lemma](GRAPHON-EXTREMIZERS.md), an optimal fractional cut may be changed arbitrarily on its fractional region with no cost change: there are no edges there and the first variation vanishes there. At the ends t=0,1 the values of P_g are g(0,…,0) and g(1,…,1). If they coincide, the arbitrary change just described yields a constant optimal cut, impossible. Hence they differ. Change q_x on its fractional region to W_x, or 1−W_x according to those endpoint values. This proves the one-bit optimality property for almost every x. The other implications are immediate by testing the one-bit rule or padding unused roots.

## What a one-bit optimum implies

For almost every x, the ordered monochromatic cost of the W_x selector is p−2 T_W d(x), with d=T_W1. Indeed expansion gives the cross term twice and the quadratic term vanishes by triangle-freeness. Thus T_W²1=c1, where c=(p−m)/2>0.

The graphon is connected in the measurable sense. Otherwise there is a positive-mass partition A,B with no edges between its parts. If both parts have edge mass, a one-bit cut rooted in A puts all of B on one side, and can be improved by cutting B separately. If one part has no edge mass, a root there gives a constant cut. Both contradict the asserted almost-everywhere optimality.

Set r=√c. The nonnegative symmetric kernel of T_W² has constant row sum r², so its operator norm is r² and ||T_W||_op=r (the upper bound is the Schur test, and the constant function attains it for T_W²). If d is not identically r, then h=d−r1 is a nonzero eigenfunction for eigenvalue −r. Pointwise, T_W|h|≥|T_Wh|=r|h|. The operator norm forces equality. Also |h|>0 almost everywhere, since its positive set would otherwise be separated from its complement. Equality in the triangle inequality for the integral defining T_Wh now forces the sign of h to change at almost every edge. This makes W bipartite.

If W is not bipartite, it is therefore regular with d=p, and the one-bit formula gives m=p−2p². If W is bipartite, m=0. For a fractional zero-cost cut, every positive edge has both endpoints deterministic with opposite signs; since almost every vertex has positive degree by connectedness, the optimal single-bit selector W_x must take only zero and one almost everywhere. A neighborhood cut in a connected bipartite graphon can have cost zero only if the neighborhood is the entire opposite side modulo null sets: every omitted point of that side has positive degree to the first side and would leave positive monochromatic mass. Hence W is complete bipartite. Both conclusions use only information about exact equality, not a stability estimate.

## Classify the regular nonbipartite case

Random splitting gives m≤p/2, so m=p−2p² forces p≥1/4. The [Balogh–Clemen–Lidický universal bound](https://arxiv.org/html/2103.14179), m≤2/23.5, rules out p∈[1/4,0.3197], since p−2p²>0.115 there. Their dense-tail theorem then gives m≤2/25. Both results transfer to graphons by sampling, and the edge-density comparison in the dense tail is strict here. The formula for m on p≥1/4 yields p≥2/5.

Because W is nonbipartite, some odd cycle has positive homomorphism density. Otherwise every finite random graph sampled from W would be bipartite almost surely, forcing m=0 by cut continuity and hence bipartiteness by cut attainment. Let ℓ≥5 be the least odd length with positive density. For almost every such cycle of roots x₀,…,x_(ℓ−1), a new vertex has at most two neighbors in its support on the cycle, and any such pair is at cyclic distance two. To see this, joining two roots by the new vertex and using their odd-length cycle arc gives a shorter odd cycle whenever its complementary even arc exceeds two. The smaller odd-cycle density is zero, so by Fubini no such positive-edge configuration exists almost surely. Three distinct roots cannot be mutually at cyclic distance two on an odd cycle of length at least five. Thus ℓp=∑d(x_i)≤2. It follows that ℓ=5 and p=2/5, and almost every additional vertex has exactly two incident root edges of weight one.

Partition vertices by their two root neighbors, with class V_i for the pair x_(i−1),x_(i+1). Nonconsecutive classes (and equal classes) share a root, so edges only run between consecutive classes, by triangle-freeness and Fubini. All five classes have positive mass, or the template would be bipartite. If w_i=|V_i|, regularity gives w_(i−1)+w_(i+1)≥2/5 for each i. Summing shows equality at all five; regularity then requires every allowed cross pair to have weight one. The five equations give w_i=1/5 (subtract two equations to get periodicity by four, which is coprime to five). Thus W is exactly the balanced pentagon blow-up up to equivalence.

Conversely every complete bipartite graphon, every empty graphon, and the balanced pentagon have an optimal one-bit cut. For the pentagon a neighborhood cut leaves only one edge between blow-up classes uncut, and every whole-class cut leaves at least one; multilinear rounding shows that splitting classes cannot improve it.

## The middle-band consequence

The middle-density interval lies inside [0.24,0.32], where p−2p²≥0.1152>2/25. Thus any triangle-free graphon in that interval with m=2/25 must have U_k>m for every finite k; it is not complete bipartite. Violations m>2/25 are already excluded by U_k≥m whenever such a certificate is available. In particular an exact certificate via some U_k excludes equality as well as violation in the band. Compactness of the triangle-free density band in cut distance and continuity of m upgrade that exclusion to a strict uniform gap. Conversely, a strict band gap yields such a certificate for sufficiently large k by the uniform [root sampling theorem](OPTIMAL-ROOT-RATE.md).

This is a necessary and sufficient criterion for the *rooted-envelope approach* to an exact finite certificate. It neither proves the strict gap nor excludes other exact certificates.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
