# The sharp Erdős bound for every Vega template

**Theorem.** Every graph homomorphic to a Vega graph satisfies the sharp weighted bound in [Erdős Problem 23](https://www.erdosproblems.com/23). Together with [the circular-three argument](CIRCULAR-THREE.md), this handles homomorphisms to both unbounded Andrásfai and Vega families, with arbitrary product vertex weights and arbitrary edge deletions in the fibers. In fact, when the unordered edge mass is at most 4/25 in total vertex mass one, the Vega bound has uniform gap: the cut cost is at most 399/10000. The general triangle-free conjecture remains open.

The proof applies beyond the classical Vega family. Start with any core (M) carrying a proper three-colouring (M_1,M_2,M_3) whose cyclic orientation is acyclic. Add the six-vertex crown (a_i,b_i) ((1le ile3)), with edges (a_i b_j) for (i
e j); join each of (a_i,b_i) to all of (M_i). Add vertices (x,y), join (x) to all (a_i), (y) to all (b_i), and join (xy). There are no other edges. This template is triangle-free. The proof works directly on graphs mapping to it, with arbitrary missing edges between fibers. We group their vertices by the template fibers, use the inherited label cuts, and retain actual edge masses in the calculations. In particular each actual fiber pair has edge mass at most the product of its two vertex masses.

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

This closes the weighted template comparison for the two named families in the Brandt–Thomassé structure theorem above its minimum-degree threshold. It also handles preimages with edge densities well below that threshold. It does not derive either homomorphism for a general middle-band counterexample. The full Erdős conjecture remains open.Set \(m=\max(x,y)\) and \(m'=\min(x,y)\). We have \(L\le m(s-t)-(m-m')r\), because both \(A,B\ge r\) and the actual apex–crown masses are bounded by their products. For fixed \(x,y,h\) the resulting upper bound on \(\Phi\), using \(K>2\tau\), is a convex quadratic in \(s\in[t+2r,1/2]\). Compare its endpoints:
- At \(s=t+2r\) the bound on \(L\) is \(rt\). As \(xy\ge h>\tau\), we have \(t> .138\), while \(t\le1/2-2r\). The function \((1-2r-t)^2+5rt\) is decreasing there, since its derivative is at most \(-1+5r<0\). Also \(22h+4K>30\tau\). The endpoint upper bound is therefore \((1-2r-.138)^2+5r(.138)-30\tau=.38949296\).
- At \(s=1/2\) we have \(L\le m(1/2-r)-m^2-xy+r m'\), and \(m'\le(1/2-2r)/2\). Completing the square in \(m\) gives \(L\le(1/2-r)^2/4+r(1/2-2r)/2-h<.057-h\). The endpoint upper bound on \(\Phi\) is at most \(.25+5(.057)-35\tau=4397/12000\).

Both are below \(1951/5000=.3902\), contrary to (1).

## When the outer mass is greater than one half

Now \(c<1/2\). The first comparison with \(\beta(M)\le c^2/25\) gives \(Q>2b-2c^2/25\). The second then forces \(h>(5b-e)/2-c^2/25\ge .01975-.04c^2\).

For \(.17\le c<1/2\), use \(L\le m(s-m-m')\le s^2/4-h\) and \(K\ge0\). We obtain
\[
 \Phi\le c^2+\tfrac54(1-c)^2-27h
 <3.33c^2-2.5c+.71675.
\]
This convex quadratic is at most the larger of its endpoint values .387987 and .29925 on \([.17,.5]\), below .3902.

For \(0\le c<.17\), use the total edge budget \(L\le e-Q-h\), and drop the favorable \(-4K\) term. Substituting the lower bounds on \(Q,h\) gives
\[
 \Phi\le c^2+5e-5Q-27h <2.48c^2+18.5e-77.5b
 \le 2.48(.17)^2+18.5(.16)-77.5(.0399)=-.060578.
\]
This finishes the last contradiction. The numerical comparisons are terminating rational arithmetic, and the proof does not use extremal stationarity, numerical optimization, or finite-order graph enumeration.

## Consequences and scope

The strict bound \(\beta\le399/10000\) holds when \(e\le4/25\). At larger \(e\), the [dense-tail result](https://arxiv.org/abs/2103.14179) already gives the sharp coefficient \(1/25\) for all triangle-free graphs. This proves the stated claim for all weights.

In particular a middle-band counterexample to Erdős 23 must be more than \(1/10000\) in unordered product edge-edit mass from the Vega homomorphic class. Edits of this much would leave the new edge mass below \(4/25\), so its cut cost is at most .0399; reversing the edits then adds at most .0001. Together with the stronger circular-class gap this gives the same robustness for the union of the two template families in the Brandt–Thomassé structure theorem. It does not force an unrestricted middle-band graph close to either family.
