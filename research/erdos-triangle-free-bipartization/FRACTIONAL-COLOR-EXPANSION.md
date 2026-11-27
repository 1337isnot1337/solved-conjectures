# Fractional-colouring exclusion and expansion at a maximizer

Two independent reductions for [Erdős #23](https://www.erdosproblems.com/23).

## Fractional chromatic number

Every triangle-free finite graph G with

    χ_f(G) ≤ 6394/2397 = 2.6675…

satisfies the full bipartization bound, including all positive vertex weights and arbitrary edge-deleted blow-ups of G. In particular χ_f≤8/3 suffices.

Indeed, normalize a fractional colouring of total weight c=χ_f into a probability distribution on independent sets. Each vertex belongs to the sampled independent set with probability at least 1/c. For any edge uv the two membership events are disjoint. The sampled cut putting the independent set on one side therefore crosses each edge with probability at least 2/c. So β(G)≤(1−2/c)e_w. Pull this distribution back for all blow-ups or subgraphs, since independently of weights it provides the same per-edge guarantee.

If normalized ordered edge density p=2e_w/N² is at most 3197/10000, we get β/N²≤(3197/20000)(1−2/c)≤1/25 exactly for c≤6394/2397. If p is at least 3197/10000, use [Balogh–Clemen–Lidický’s dense-tail theorem](https://arxiv.org/html/2103.14179): in finite unweighted graphs rational vertex weights pass to large integral blow-ups, the normalization by binomial edges only helps at equality, and real weights follow by continuity (approximate within the high-density side when p is strictly larger; equality is already covered by the fractional cut). This exclusion does not require an odd-minor hypothesis. It also applies to any graph admitting a homomorphism into such a template, since the sampled cut events pull back.

## Edge expansion at a graphon maximizer

Let W be a global triangle-free graphon maximizer and put C=m(W)/2, so C≥1/25. For every measurable partition A,B with measure a,b, the unordered A–B edge mass satisfies

    w(A,B) ≥ 4C ab ≥ (4/25)ab.

To see this, first take optimal cuts independently inside A and B. Each costs at most C times the square of its part's mass, since rescaling either nonzero part to a probability space gives another triangle-free graphon. Choose the relative orientation of the two cuts to pay at most half the boundary mass. Thus C≤C(a²+b²)+w(A,B)/2, giving the inequality. It also gives a hereditary-deficit refinement: the right side can be increased by twice the sum of the deficits C a²−β(W[A]) and C b²−β(W[B]), where β denotes unordered mass. No uniqueness of the maximizing cut is needed.

This strong expansion is an additional restriction on a true extremizer. It is not asserted for general graphs having bipartization near the target.

[Coordination issue #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
