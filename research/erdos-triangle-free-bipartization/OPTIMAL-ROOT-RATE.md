# Sharp sample order for the Boolean rooted MaxCut envelope

There are absolute constants c,C>0 such that, for every k≥1,

    c/√k ≤ sup_W [U_k(W)−m(W)] ≤ C/√k,

where W ranges over triangle-free graphons. The lower bound already holds in the hard density band of [Erdős #23](https://www.erdosproblems.com/23), by [weighted pentagons](ROOT-LOWER-BOUND.md). The new upper argument adapts Bender–Krauthgamer's value-coreset recovery lemma into a rule selected using **only** the labelled root graph and the queried vertex's adjacency bits. Their recovery LP directly uses all vertices' edges to the sample; here an online optimization over root moments eliminates that global access. This settles the uniform sample order of this envelope, not Erdős's sharp zero-error deletion bound.

## 1. The moment-matching criterion from the sample

Work first with a finite simple triangle-free graph G on N vertices, normalized to give each vertex mass 1/N. Take a primary sample R=(X₁,…,X_q) drawn uniformly with replacement. Pick a maximum cut of the induced labelled sample, with fixed tie-breaking. Denote by a the vector of masses of the sample points assigned to its first side (counting copies), and set r_i=(A a)_(X_i), where A is the original zero-one adjacency matrix. Every r_i is computable from the observed sample graph and lies in [0,1].

For a vertex v define its primary profile φ(v)=(A_(v,X_i))_(i=1)^q. A fractional first-side selector b(v)∈[0,1] has moment error

    L(b) = (1/q)∑_i |r_i−E_v[φ_i(v)b(v)]|.

Use [Bender–Krauthgamer, §3, Lemmas 3.3–3.4](https://arxiv.org/html/2611.03205v1#S3). In their notation b as a cut mass vector has coordinates b(v)/N and K=A at uniform sampling. For each primary sample their matching argument supplies a b with L(b)≤2Δ, where Δ is their sample-comparison discrepancy. Their comparison inequality implies for every fractional selector b that the normalized unordered cut value is at least F−8Δ−L(b), with F the true optimum. The last step uses their value comparison |F_sample−F|≤4Δ. Finally they show E Δ≤12/√q at uniform sampling. These cited statements hold for arbitrary finite simple graphs; triangle-freeness will be used only in the Boolean rounding step.

The existence of a good selector does not depend on allowing unrelated choices for vertices with the same profile: averaging b within every primary-profile class preserves every moment exactly.

## 2. Learn just the moments, using a second independent sample

Let D=[−1,1]^q. For c∈D put

    f(b,c) = (1/q)c·(r−E[φ b]).

Thus L(b)=max_c f(b,c), and a best response minimizing f at fixed c is the Boolean threshold g_c(φ)=1[c·φ>0]. There is no need to know the distribution of φ to compute this response.

Use s fresh independent vertices Y_1,…,Y_s as additional roots. Initialize c_1=0. At step j put b_j=g_(c_j), observe z_j=φ(Y_j), and make projected gradient ascent on c using the vector

    vhat_j = (r−z_j b_j(z_j))/q.

The update c_(j+1)=Proj_D(c_j+η vhat_j), with η=q/√s, uses only the edges from Y_j to primary roots. Conditional on the primary sample and the preceding steps, vhat_j has mean v_j=(r−E[φ b_j])/q. Both gradients have Euclidean norm at most 1/√q.

The usual one-line projection estimate gives, for every c∈D,

    ∑_j (c−c_j)·vhat_j
      ≤ ||c−c_1||²/(2η) + (η/2)∑_j||vhat_j||² ≤ √s.

For the corresponding sum with v_j, taking expectation loses at most another √s. Indeed the chosen-c_j term is a martingale sum with mean zero. The maximum comparator error over c is bounded by the ℓ¹ norm of ∑(vhat_j−v_j); each coordinate has martingale variance at most s/q² because z_{j,i}b_j(z_j)∈[0,1]. Summing Cauchy–Schwarz bounds over the q coordinates gives at most √s.

Let bbar=(1/s)∑ b_j, itself a fractional rule on the primary profile. For a true minimizer b*, the best-response inequalities give f(b_j,c_j)≤f(b*,c_j)≤L(b*) for every j. The regret bound therefore implies, conditional on the primary sample,

    E L(bbar) ≤ L(b*)+2/√s ≤ 2Δ+2/√s.

The moment-matching criterion yields an expected normalized cut value at least F−10 EΔ−2/√s. Thus q and s of the same order suffice. This is a statement about the cut of the whole graph, not just its restriction to the two samples.

## 3. Round to one Boolean rule per root outcome

Choose s a power of two so that bbar is an exact multiple of 1/s. Add h fresh independent anchors to the profile, but not to the gradient updates. Round each full profile to a fixed bit by comparing bbar to a uniform hash in {0,…,s−1}, using a random affine map over F₂ as in [POLYNOMIAL-ROOT-RATE](POLYNOMIAL-ROOT-RATE.md). The hash outputs on two distinct profiles are independent and uniform, so on distinct profiles this preserves the expected cut of the fractional rule. Identical profiles lose at most their ordered edge mass.

Triangle-freeness gives disjoint neighborhoods at the endpoints of every edge (including in the graphon limit). As shown in the earlier note, the expected edge mass with identical bits at the h extra anchors is at most 1/(eh), uniformly over G. Taking h of order √q and s of order q gives overall ordered cost gap O(1/√q) using q+s+h=O(q) roots. The reference maximum sample cut, all gradients, and all threshold parameters are determined by the induced labelled root graph; the user-supplied vertex only needs its adjacency profile. Random affine seeds are harmless since the deterministic minimum for each root type is at most the conditional average of these rules.

Finally every triangle-free graphon is a cut-distance limit of simple triangle-free graphs, by sampling. Both m and each U_k are continuous in cut distance: U_k is a finite sum over root types of minima of finite lists of induced-density expressions. Hence the estimate passes to arbitrary, including nonbinary, triangle-free graphons. Padding unused roots and adjusting constants gives the bound for all k.

The same upper order holds for every fixed clique-free class, by replacing the triangle-free rounding collision estimate with [PROFILE-COLLISIONS](PROFILE-COLLISIONS.md). More precisely an additive ε upper bound needs O(ε⁻²+r/ε) roots when K_r is excluded. This is a direct consequence of the same learned rule and the different number of extra anchors.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
