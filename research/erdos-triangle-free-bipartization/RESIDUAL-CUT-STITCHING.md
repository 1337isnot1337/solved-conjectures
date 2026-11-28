# Stitching a biased root cut to an optimized exterior

Partial research for [Erdős Problem 23](https://www.erdosproblems.com/23). This strengthens a fixed rooted cut construction. It does not yet establish a stronger universal numerical bound.

Fix any bipartition of a fixed part B of a finite weighted graph G. Write X for its complement and e_X for the unordered edge mass inside X. Let each x in X have original mass w_x and a chosen bias f_x in [-1,1]. Write Q(f) for the expected monochromatic edge mass when each exterior sign is independently assigned with mean f_x and the signs on B are fixed. Introduce residual vertex masses r_x = w_x(1-|f_x|). Write e_r and beta_r for the edge mass and minimum monochromatic edge mass on G[X] with masses r, respectively.

Then the minimum cut cost satisfies

    beta(G) <= Q(f) + beta_r - e_r/2.

In particular, the correction is always nonpositive, since an independent fair cut costs e_r/2 in expectation.

## Proof

Choose any sign vector g on X. Select a single uniform common sign epsilon. Given epsilon, independently assign each exterior sign with mean

    f_x + epsilon (1-|f_x|) g_x.

Both possible means are in [-1,1]. Every exterior sign still has unconditional mean f_x, so the mean cost of attachments to B is unchanged. For distinct x,y the unconditional mean of the product of their signs is

    f_x f_y + (1-|f_x|)(1-|f_y|)g_x g_y.

An edge xy is monochromatic with probability one half plus one half this correlation. Thus the additional expected cost is half the sum of r_x r_y g_x g_y over edges inside X, which equals the monochromatic r-mass of g minus e_r/2. Choose a minimum cut for r. The result includes the two limiting constructions: all f_x zero gives an optimal exterior with its two equally likely alignments; all |f_x| equal to one gives the fixed signs on the exterior.

## Application to an edge root

In a triangle-free graph, use opposite signs on N(u) and N(v) for an edge uv. For exterior x, let A_x and B_x be its weighted degrees to the two shores. With appropriately oriented sign convention use the clipped bias f_x = clip((B_x-A_x)/t,-1,1) from [the two-hop cut](TWO-HOP-PENTAGON-CUT.md). It retains exactly the same attachment estimate and permits subtraction of

    max(0, e_r/2 - 2 s_r²/47),

where s_r is the total residual mass, by the [Balogh–Clemen–Lidický universal bound](https://arxiv.org/abs/2103.14179). If the normalized residual density is in either proved tail, the number 2/47 can be replaced by 1/25. If its positive-weight support is induced-P6-free, the [sharp weighted induced-path result](INDUCED-PATH-FREE.md) applies instead, including its gap version at the relevant density. In a least-support weighted counterexample one can always use beta_r <= s_r²/25: the exterior omits the root vertices, and this is a proper-support comparison, not an application of the conjecture to the original graph.

One can also use residual graph components separately. For example a bipartite residual graph gives the exact correction -e_r/2, even when the residual graph is too sparse for a quadratic density-based bound to give any correction.

## Example separating the two constructions

Use root edge uv with weights .10 each. Add edges u-b, v-a, a-x, x-y and y-b, giving a six-cycle. Give a,b masses .15 each and x,y masses .10 each. Add a disjoint pentagon whose vertices have mass .06 each. With t=.10, the clipped biases force x,y to their correct opposite sides, and give the five pentagon vertices zero bias. The clipped independent exterior costs .009; the unbiassed optimal exterior costs .0036 plus .015 in attachment losses. The stitched cut costs .0036, which is optimal for this example since the pentagon alone requires that much. The comparison concerns the same edge root, not the best choice of a root over the whole graph.

The unresolved step is to force a large residual correction, or an equivalent gain, across the remaining arbitrary triangle-free profiles. The nonlinear residual weights depend on both root neighborhoods. Polynomial lower bounds on the correction, if found, could be added to a localized flag relaxation.

## A quantitative gain over fair exterior alignment

Let s be the original mass of X, let d_X(x) be the original degree mass from x into X, and let D_x be the attachment mass into the minus shore of B minus the attachment mass into the plus shore. Put F0 equal to the deterministic cost within B, plus half the B-to-X edge mass, plus c s². Here c is any constant in [0,1/4] for which each residual reweighting under consideration has beta_r <= c s_r². For example use c=2/47 universally in the triangle-free case, or c=1/25 conditionally at a least-support counterexample if X is proper.

Fix amplitudes l_x in [0,1] and set f_x equal to l_x times the sign of D_x (choose a sign at zero). Set M=sum w_x l_x, and let J be the sum of w_x w_y l_x l_y over exterior edges whose assigned signs disagree. Substitution into the stitching formula gives

    beta(G) <= F0 - (1/2) sum_x w_x l_x (|D_x|-d_X(x)+4cs)
                   + c M² - J.

To check this, the incident gain is -(1/2) sum w_x l_x |D_x|. The combined exterior term Q(f)-e_r/2 contributes +(1/2) sum w_x l_x d_X(x) minus J: in the quadratic part the signed product minus the unsigned product vanishes on equal-sign edges and equals -2 l_x l_y on opposite-sign edges. Finally c s_r² = c(s-M)².

Now define H_x=(|D_x|-d_X(x)+4cs)_+ and choose l_x=H_x. This is feasible because |D_x| <= 1-s and 4c <= 1. Cauchy–Schwarz gives M² <= s sum w_x H_x². Dropping the helpful term -J yields, for every candidate root and its fixed shores,

    beta(G) <= F0 - (1/2-cs) sum_x w_x H_x².

For an edge root, |D_x|-d_X(x)=2 max(A_x,B_x)-d(x), where d(x) is the full degree mass. Thus the gain comes from vertices where one root shore sees a large share of the vertex's incident mass. This bound applies irrespective of how many edges are outside the root and is strict relative to F0 whenever H is positive on positive mass. It also retains the option to use the exact J term.

The deterministic recursively recut exterior, multiple recursive parts, and fractional profile assignments appear in the [Plasma middle-band record](https://erdosproblems.ai/wiki/research/triangle_free_bipartization/proof_sketch) under (P'), (I), and (I_r). The present addition is the specific degree-adaptive bias formula, its exact residual MaxCut correction, and the explicit squared gain over the fair-alignment upper bound. That gain has not yet been shown large enough for all middle-band graphs.
