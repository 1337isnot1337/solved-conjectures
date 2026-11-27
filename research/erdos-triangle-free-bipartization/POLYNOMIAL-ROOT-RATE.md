# Polynomial sample size for rooted maximum-cut rules

Let W be any triangle-free graphon, and let U_k be the per-root-type maximum-cut envelope: sample k labelled roots, observe the induced root graph, and choose a Boolean rule that colours a new vertex from its k adjacency bits. The choice of rule may depend on the induced labelled root graph, not on the latent root positions. Let m(W) be the minimum ordered monochromatic density.

There is an absolute constant C such that, uniformly for all triangle-free W and 0<ε<1/2,

    m(W) ≤ U_k(W) ≤ m(W)+ε
    whenever k ≥ C ε^(-4).

This gives a polynomial-sized sampled graph for the constructive rooted envelope. It is not a finite flag certificate for the sharp, zero-error inequality in [Erdős #23](https://www.erdosproblems.com/23). The proof uses density sampling only to choose a cut rule; it does not substitute the MaxCut of a small sampled graph for that of W.

## Stagewise replacement

Choose an optimal sign cut f (or an arbitrarily close measurable cut). Introduce L artificial stages of mass 1/L, each a copy of the same probability space and initially carrying f. At stage j replace the sign on the jth copy by a Boolean response g_j depending on root adjacency bits. The signs on stages i<j have already been chosen; write u_i(x) for their conditional mean at coordinate x given the root state used so far. Stages i>j still carry f. The true external signed field at x is

    H_j(x) = (1/L)[∑_{i<j} T_W u_i(x) + (L−j) T_W f(x)].

Use one shared seed batch of s₀ roots to estimate T_W f(x) at every stage, simply averaging their adjacency bits to x times their f-signs. Those s₀ labels are the only ones guessed later. The shared estimator's mean absolute error, averaged over x and the seed, is at most 1/√s₀. Although the earlier stage rules also use this seed, no conditional unbiasedness of the seed estimator is needed; its absolute error is bounded unconditionally for the fixed f.

For every pair (j,i) with i<j, provide a distinct fresh batch of s roots. Estimate T_W u_i(x) by averaging the s adjacency bits between x and the batch, multiplied by g_i evaluated at those roots using their adjacencies to the shared seed and earlier batches. At the true guess, conditional on x, the seed data with positions, and the earlier stage data with positions, the current batches are independent and unbiased for these field terms. This remains valid for nonbinary W: the profile bits at a fresh batch vertex are sampled independently of its edge to x conditional on the positions and earlier state. Their contribution to the field estimate, after division by L, has conditional variance at most (j−1)/(L²s)≤1/(Ls). Adding the shared estimate times (L−j)/L, the expected absolute error of Hhat_j, averaged also over x, is at most 1/√(Ls)+1/√s₀.

Choose g_j(x) to minimize sign times Hhat_j(x). Since (g_j−f)Hhat_j≤0, we have (g_j−f)H_j≤2|H_j−Hhat_j|. The change of ordered monochromatic mass with respect to the other stages is the integral of this expression divided by L. The change wholly within the replaced stage is at most p/L², where p=∫W. Summing over stages shows that the expected ordered monochromatic density of the stage mixture is at most

    m(W) + 2/√(Ls) + 2/√s₀ + p/L.

The mixture can be represented on the original space by the mean sign across its copies, given the adjacency profile. All training-root predictions for earlier stages are computable from the induced training-root graph. The above argument does not ask the algorithm to observe any latent positions.

## Convert a stage mixture to Boolean rules with short seeds

Let L be a power of two. For each pattern σ on the training roots, its candidate stage-averaged sign has positive probability equal to an integer multiple of 1/L. Add a fresh batch of a anchors that are ignored by the stage rules, but included in the full K-bit profile to be rounded. Pick a uniform random affine map from F₂^K to F₂^(log₂ L), and interpret its output as an integer in [0,L−1]. For each profile, compare its value to the number of stages in which that profile is positive. This gives a deterministic Boolean rule for each seed. The outputs of a uniform affine map are uniform individually and independent on any two distinct inputs. Thus, on pairs with different profile bits, the average over seeds exactly preserves the stage mixture's expected cut. Identical profiles incur an increase at most their edge mass.

For almost every edge xy, triangle-freeness makes their neighborhoods disjoint in support, so a random new anchor gives equal adjacency bits at the two ends with probability exactly 1−d(x)−d(y). The a independent extra anchors therefore bound the expected same-profile edge contribution by

    ∫∫ W(x,y)(1−d(x)−d(y))^a dxdy
      ≤ ∫ d(x) exp(−a d(x))dx ≤ 1/(ea).

Here the edge contribution weights each pair by W(x,y), and the disjointness statement holds for almost every pair with W(x,y)>0. This bound needs no information about twin classes or minimum degrees.

## Select the actual rule using independent validation pairs

Draw one affine seed independently before validation, and hold it fixed while comparing guesses. The family now comprises all guesses of f-signs on the shared seed batch; its logarithmic size is O(s₀), independent of the number of other training roots. There is no need to validate all seeds: we average the performance over a uniform seed, and the per-type minimum is at most the expected cost of any randomized selection of Boolean rules. Equivalently for each W a seed with no worse average performance can be fixed in advance. The family is finite even though exhaustive selection can be expensive.

Add n independent validation pairs of roots. Conditional on the positions and induced data of the training roots and extra anchors, each candidate's observed monochromatic edge indicator on these pairs has its actual expected ordered cost as mean, and the n indicators are independent. Candidate rules use only the profiles to the training roots and extra anchors, not to validation pairs. Uniform Hoeffding and the union bound show that

    n = O(τ^(-2)(s₀ + log(1/δ)))

suffices to estimate every candidate within τ with probability at least 1−δ. Select the candidate of least empirical cost, breaking ties by a fixed enumeration. This selection is a function of the induced labelled root graph. On the good event its true cost is at most the oracle candidate cost plus 2τ; on the bad event the excess is at most one. The oracle may depend on the latent positions through the true guessed signs, since the uniform validation event holds for every candidate at the fixed seed. Average the oracle cost over the independent seed.

Take L of order ε⁻¹ and a power of two, s and a of order ε⁻¹, s₀ of order ε⁻², and τ,δ proportional to ε, with constants giving total error at most ε. Then K=binom(L,2)s+s₀+a=O(ε⁻³) and n=O(ε⁻⁴). Counting every validation endpoint as a root gives the asserted bound. Additional unused roots cannot hurt. Soundness of the envelope follows by testing these measurable or fractional cuts, as in [ROOT-CONVERGENCE](ROOT-CONVERGENCE.md).

The stagewise sampling is adapted from the dense MaxCut approach of [Goldreich, Goldwasser and Ron](https://www.wisdom.weizmann.ac.il/~oded/PDF/ggr-jacm.pdf). This statement is about an actual Boolean adjacency-profile rule, not value-coreset complexity: [Bender and Krauthgamer](https://arxiv.org/abs/2611.03205) give the sharper O(ε⁻²) sampling scale for estimating the value and explicitly distinguish cut oracles. Its useful extra point here is that the final action is a single **Boolean profile rule** selected only from labelled root edges. Tie vertices need not be greedily rounded simultaneously, and the latent optimal labels are never supplied to the algorithm.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
