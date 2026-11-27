# An effective universal root count

The preceding [qualitative convergence theorem](ROOT-CONVERGENCE.md) has a uniform quantitative version. For some absolute C, for every 0<ε<1/2 and every triangle-free graphon W,

    U_k(W) ≤ m(W)+ε  whenever k ≥ exp(C ε^(−24) log(1/ε)).

No claim of sharpness is made. The bound is large; its point is an effective all-graphon root count from a fixed error, not a finite-order certificate for Erdős #23.

## A finite feature partition with uniform expected error

Use the kernel K of T² as in [ROOT-CONVERGENCE.md](ROOT-CONVERGENCE.md). Fix r=(ε/100)³, a bin width Δ=r⁴, and k₀=ceil(r^(−8)) independent anchor locations a_j. Quantize each feature K(·,a_j) on a grid of width Δ with an offset in [0,Δ), yielding a finite partition P. For now the offset is arbitrary. Let Q be the projection by conditional expectation onto functions constant on P, and W_P the kernel of QTQ.

Write T in its orthonormal eigenbasis. Since its Hilbert–Schmidt norm is at most 1, at most r⁻² eigenvalues have |λ_i|>r and their absolute values sum to at most r⁻¹. For any such eigenfunction φ_i of norm 1, the Monte Carlo estimator

    φ_hat_i = (λ_i^(−2)/k₀) ∑_{j=1}^{k₀} φ_i(a_j) K(·,a_j)

has mean φ_i because T²φ_i=λ_i²φ_i. Its mean-square L² error is at most r⁻⁴/k₀, since ||K(·,a)||₂≤1 and ∫φ_i²=1. Approximating each K-column by its bin value costs at most Δ in L², uniformly over the offset. Projecting the estimator onto P thus costs at most λ_i^(−2)Δ times the average of |φ_i(a_j)|, whose expectation is at most 1. Therefore

    E ||(1−Q)φ_i||₂ ≤ r^(−2)(k₀^(−1/2)+Δ).

The low eigenvalues contribute at most r in operator norm. The triangle inequality over the high eigenvalues gives

    E ||(1−Q)T||op ≤ r + r^(−3)(k₀^(−1/2)+Δ) ≤ 3r.

Symmetry yields ||T−QTQ||op≤2||(1−Q)T||op. With the cut norm in its rectangle convention, c_P=||W−W_P||cut≤||T−QTQ||op, so E c_P≤6r.

## Same-cell rounding cost from triangle-freeness

The cost of any fractional cut changes by at most 2c_P on replacing W by W_P, by the layer-cake representation of both product terms. A cut and its P-conditional expectation have identical cost on W_P. Thus the best fractional P-rule costs at most m(W)+4c_P, by approximating the infimum and taking a limit.

Write s_C for the measure of cell C, and p_CC for the mean of W on C×C. The within-cell edge mass D_P=∑s_C²p_CC is the possible rounding error. The diagonal-cell contribution to the triangle density gives ∑(s_C p_CC)³≤t(K₃,W_P)≤3c_P, the last inequality by the counting lemma and t(K₃,W)=0. Hölder gives

    D_P ≤ (∑s_C^(3/2))^(2/3) (∑(s_C p_CC)³)^(1/3) ≤ (3c_P)^(1/3).

Round each cell independently and minimize among deterministic cell assignments. Their optimal expected cost is at most m(W)+24r+(18r)^(1/3) after Jensen. This calculation is uniform in W and in the offset.

## Learn from the finite root graph

Average the offset uniformly in [0,Δ). For fixed true and estimated feature values, the probability their bins differ is at most their absolute difference divided by Δ. The probe estimator with q roots has expected absolute error at most 1/√q in each feature. For both fresh endpoints the misbin probability is therefore at most 2k₀/(Δ√q). Choose q=ceil((40k₀/(Δε))²); this term is at most ε/20. As in the qualitative proof, a misbin bounds the cost difference uniformly over all bin-colour rules.

The number of bins is at most M=(ceil(1/Δ)+2)^k₀, so there are at most 2^M rules. For l independent validation pairs, conditional Hoeffding and a union bound give the tail bound 2^(M+1) exp(−2l t²) for the largest empirical error exceeding t. With t=ε/20 and l=ceil(C₀ ε⁻²(M+log(1/ε))) for a sufficiently large absolute constant C₀, the expected largest error is at most ε/10. Choosing the validation minimizer therefore increases expected cost by at most ε/5. Sum these terms with 24r+(18r)^(1/3), less than ε. This argument averages the offset only as a proof device: for each W some fixed offset gives no larger cost (or an arbitrarily small further error), and it defines a deterministic admissible rule on the labelled root graph.

The root total k₀+q+2l is bounded by exp(C ε⁻²⁴ log(1/ε)). Further roots can be ignored. This proves the claim.

[Coordination issue #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
