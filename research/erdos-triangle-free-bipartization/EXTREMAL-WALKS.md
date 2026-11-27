# All maximum cuts of an extremizer have short crossing walks

Let W be a global triangle-free graphon maximizing its unordered bipartization cost C. Let B be the crossing kernel of any optimal measurable cut. Then almost every ordered pair has a B-walk of length at most 18, in the sense that the corresponding walk kernel is positive. In fact, for almost every pair on a monochromatic edge, the sum of B-walk kernels of lengths 4, 6, …, 18 has a fixed universal positive lower bound. This is an extremal reduction for the distance-weighted approach to [Erdős #23](https://www.erdosproblems.com/23), not a proof of its sharp inequality.

## Expansion is inherited by every optimal crossing kernel

For a measurable set S of measure s, [global extremality](FRACTIONAL-COLOR-EXPANSION.md) gives W(S,Sᶜ)≥4C s(1−s). Flipping S in the chosen maximum cut can only lose crossing mass. Thus B(S,Sᶜ)≥W(S,Sᶜ)/2≥c s(1−s), where c=2/25 since the balanced pentagon gives C≥1/25. Here K(A,D) denotes the integral of a kernel K over A×D, without a factor of two. In particular the B-degree is at least c almost everywhere: if it is ≤c−η on a positive-measure set, take an arbitrarily small positive-measure subset S of that set. Then B(S,Sᶜ)≤(c−η)s contradicts the expansion lower bound for s<η/c.

## A quantitative graphon ball lemma

Write Bʲ(x,y) for the j-step walk kernel, and Fᵢ=∑_{j=1}^i Bʲ. For almost every x, define

    δ_i = (1/1250)·16000^(1−i),
    S_i(x) = {z : F_i(x,z) ≥ δ_i}.

The B-degree bound and 0≤B≤1 imply |S₁|≥(c−δ₁)/(1−δ₁)>79/1000. Moreover S_i⊂S_(i+1). If s=|S_i|<1, expansion shows that the function h(z)=∫_{S_i} B(v,z)dv has mean at least cs on S_iᶜ and is bounded by s. Hence the proportion of S_iᶜ where h≥cs/100 is at least (c−c/100)/(1−c/100)>79/1000. On this portion,

    F_(i+1)(x,z) ≥ (T_B F_i(x,·))(z) ≥ δ_i cs/100 ≥ δ_i/16000.

The last inequality uses s≥79/1000. Consequently 1−|S_i|≤(921/1000)^i. In particular |S₉(x)|>13/25, because (921/1000)^9<12/25. This calculation works also for nonbinary kernels.

For almost every pair x,y, the two sets S₉(x), S₉(y) intersect in measure at least 1/25. By symmetry and the definition of kernel convolution,

    (1/25)δ₉² ≤ ∫ F₉(x,z)F₉(z,y) dz ≤ 9 ∑_{i=2}^{18} Bⁱ(x,y).

The coefficient of Bⁱ is at most 9, since it counts ordered decompositions i=j+k with 1≤j,k≤9. On a monochromatic edge the odd powers of B vanish because B is bipartite. The two-step kernel also vanishes there almost everywhere by triangle-freeness: ∫W(x,y)B²(x,y)dxdy≤t(K₃,W)=0. The asserted bound for lengths 4,6,…,18 is therefore δ₉²/225.

For any proposed exact walk-distance inequality aimed at contradicting the existence of a maximizing counterexample, unbounded crossing path lengths can thus be ruled out at the outset. Plain support positivity alone would not permit thresholding in a finite sampled test; the displayed lower bound is on the sum of actual walk masses and avoids that issue. It does **not** certify a uniform shorter individual distance for all edges, or prove the sharp weighted inequality.

[Coordination issue #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
