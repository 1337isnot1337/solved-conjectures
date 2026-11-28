# The sharp Erdős bound for every Vega template

**Theorem.** Every graph homomorphic to a Vega graph satisfies the sharp weighted bound in [Erdős Problem 23](https://www.erdosproblems.com/23). Together with [the circular-three argument](CIRCULAR-THREE.md), this handles homomorphisms to both unbounded Andrásfai and Vega families, with arbitrary product vertex weights and arbitrary edge deletions in the fibers. The general triangle-free conjecture remains open.

The proof applies beyond the classical Vega family. Start with any core (M) carrying a proper three-colouring (M_1,M_2,M_3) whose cyclic orientation is acyclic. Add the six-vertex crown (a_i,b_i) ((1le ile3)), with edges (a_i b_j) for (i
e j); join each of (a_i,b_i) to all of (M_i). Add vertices (x,y), join (x) to all (a_i), (y) to all (b_i), and join (xy). There are no other edges. This template is triangle-free. The theorem proves the sharp bound for its arbitrary vertex weightings. A cut of a full product-weighted template pulls back to any homomorphic preimage, after summing the weights in the fibers: actual edge mass between any two fibers is at most their product.

For the Vega graphs themselves, the core is the circular Andrásfai graph, or the one indicated deletion, with three consecutive colour classes; the scaling-to-circumference-three argument in [the gluing note](CIRCULAR-CORE-GLUING.md) shows that this specific colouring is acyclic in the required cyclic orientation. See [Łuczak–Polcyn–Reiher, Section 4.1](https://arxiv.org/abs/2002.01498) for the template definition. The deletions of (y) and/or an inner vertex are allowed by assigning zero weight. The earlier gluing proof only needed a small (xy)-mass; the proof below has no such restriction.

## Three basic comparisons

Normalize the masses to sum to one. If the template supports a counterexample, maximize its minimum cut cost (eta) over its simplex of weights. At any zero weights discard those vertices for stationarity; in the remaining support the weights are an interior maximizer. Write
- (c) for the mass of (M), (s=1-c) for its outer complement, and (z=e(M));
- (A=sum_i a_i, B=sum_i b_i, t=x+y, h=xy, L=xA+yB), using vertex names also for weights;
- (K=sum_{i
e j} a_i b_j) for the crown edge mass and (Q=sum_i(a_i+b_i)mu(M_i)) for the attachment mass.

The total unordered edge mass is (e=z+K+Q+L+h). By the [known density tails](https://arxiv.org/abs/2103.14179) a counterexample has (ele3197/20000). The circular core theorem gives both (eta(M)le c^2/25) and (eta(M)le c^2/44+z/11), the latter directly from the median cut comparisons, even when it is not the better bound.

The following three cut estimates will suffice:
1. The entire outer graph is bipartite, with shores ({a_1,a_2,a_3,y}) and ({b_1,b_2,b_3,x}). Cut it, optimize the core, and align them fairly, so (etaleeta(M)+Q/2).
2. Give (M_i,a_i,b_i) auxiliary label (i), and give (x,y) the same fourth label. Choose a uniform 2-versus-2 cut of those four labels and reverse it on the outer block. This crosses all attachments, misses one third of ordinary internal edges, and misses (xy) always. Hence (etale(e-Q+2h)/3).
3. Give the three core classes constant signs, uniformly choosing which one is isolated, and put (a_i,b_i) opposite the sign of (M_i). Now cut (xy) in a fair random orientation. This crosses all attachments, charges one third of (z+K), and charges (L/2), so (etale(e-Q-h)/3+L/6).

If (eta>1/25), the third comparison gives (Q<e-3/25-h+L/2). Insert this into the first comparison using its linear core bound, and substitute (z=e-Q-K-L-h). After multiplication by 44, the required inequality is
[
 Phi:=c^2-4K+5L-22h>98/25-22ege4033/10000.
	ag{1}
]

## When the outer mass is at most one half

We first describe a shared rule for the cuts used here. If a balanced split has (D) mass of internal equal-label edges and (U) mass of cross edges with different labels, using four auxiliary labels as above gives (etale(E+2D+2U)/3), where (E) is the internal edge mass. Separately optimize the two blocks and fairly align them; the classical neighborhood bound on each block gives (etale1/8+e/2-3E/2). Cancelling (E) yields
[
 etale1/44+e/11+6(D+U)/11.
	ag{2}
]
Thus (D+Ule 	au=201/40000) suffices throughout the middle band.

Place the entire outer block in the first shore and fill it to mass (1/2) using a prefix of the core's topological order. A false twin can be split at the median without changing optimum. Keep the core labels in the first shore, and rotate them down by one in the second. Give (a_i,b_i) the rotated label of (M_i); keep (x,y) at the fourth label. All cross edges match and the only equal-label internal edge is (xy). Thus the supposed counterexample requires (h>	au).

For any index (i), instead give (y) the rotated label of (M_i) and recolour its neighbor (b_i) to the fourth label. This fixes the internal defect, creates no new one, and causes wrong cross edges only from (b_i) to the (M_i) suffix. The symmetric move using (x,a_i) also works. Writing (c_i') for the suffix mass of (M_i), failure therefore implies (a_i c_i'>	au) and (b_i c_i'>	au) for every (i). As (sum_i c_i'=1/2), Cauchy–Schwarz gives (A,B>18	au=r=1809/20000).

In a different balanced split put (x,a_i) in the first shore and (y,b_i) in the second, filling to balance with a prefix of (M). This is possible because each of the two outer portions has mass at most (sle1/2). Keep (x,y) at label four; on the (a_i) use the suffix labels, and on the (b_i) use the prefix labels. All attachments and (xy) are compatible. Only three crown edges can be wrong. Reversing both the core order and the direction of its cyclic labels gives the opposite three wrong crown edges. Their two masses add to (K), so (2) forces (K>2	au).

Set (m=max(x,y)) and (m'=min(x,y)). We have (Lle m(s-t)-(m-m')r), because both (A,Bge r). For fixed (x,y) the resulting upper bound on (Phi), using (K>2	au), is a convex quadratic in (sin[t+2r,1/2]). It suffices to compare its two endpoints:
- At (s=t+2r) the displayed bound on (L) is (rt). Also (t>7/50=.14) from (h>	au), and (tle1/2-2r). Over that interval ((1-2r-t)^2+5rt) is decreasing, since its derivative is at most (-1+5r<0). Using (22h+4K>30	au), the endpoint upper bound is ((.8191-.14)^2+5(.09045)(.14)-30	au=.37374181).
- At (s=1/2), the bound on (L) is at most (m(1/2-m-m')le 1/16-h). Thus the endpoint upper bound on (Phi) is at most (9/16-35	au=.386625).

Both are below (4033/10000), contrary to (1).

## When the outer mass is greater than one half

Now (c<1/2). The first comparison with (eta(M)le c^2/25) gives (Q>(2/25)(1-c^2)). The second then forces (h>803/40000-c^2/25), in particular both (x) and (y) have positive mass.

For (4/25le c<1/2), use (Lle m(s-m-m')le s^2/4-h) and (Kge0). We obtain
[
 Phile c^2+	frac54(1-c)^2-27h
 <3.33c^2-2.5c+.707975.
]
This convex quadratic is at most the larger of its endpoint values .393223 and .290475 on ([.16,.5]), below (4033/10000).

For (0<c<4/25), use [induced cut balance at the weighted maximizer](INDUCED-OPTIMUM-BALANCE.md): every independent neighborhood has mass at most (1/2). Applied to (x,y) this gives (A+yle1/2, B+xle1/2), hence (Lle t/2-2h). Moreover (Qle c(s-t)) while (Q>(2/25)(1-c^2)), so (t<1-.92c-.08/cle.3528); the right side is increasing for (cle.16). Here (h>.019051). It follows that
[
 Phile c^2+	frac52t-32h<.0256+	frac52(.3528)-32(.019051)=.297968.
]
The case (c=0) is bipartite. This closes the final contradiction to (1). Every decimal in the proof is a terminating rational; no numerical optimization or finite-order graph enumeration is used in the theorem.

## Scope

This closes the weighted template comparison for the two named families in the Brandt–Thomassé structure theorem above its minimum-degree threshold. It also handles preimages with edge densities well below that threshold. It does not derive either homomorphism for a general middle-band counterexample. The full Erdős conjecture remains open.
