# A pentagon profile cut and the upper side of the pentagon obstruction

This is a root-by-root partial result for [Erdős Problem 23](https://www.erdosproblems.com/23). It requires neither three-colourability nor homomorphism to a fixed graph. Vertex mass is one; e and beta are the unordered edge mass and minimum monochromatic mass. Write Delta for maximum weighted degree.

The underlying five-cut and one-root assignments are from the earlier [pentagon-to-path work](ROOTED-PENTAGON-RATIO.md). The zero-root majority assignment here gives an exact cost and saves another fifth of the zero-root/one-root link. Applying the maximum weighted degree to the exterior then gives the sharper numerical consequences below. The separate [complete-core repair](PENTAGON-REPAIR.md) applies when all neighbouring core classes are completely joined.

## The cut

Fix any pentagon with vertices v_0,...,v_4 in cyclic order. All subscripts are modulo five. Triangle-freeness implies every vertex sees at most two of these roots. Write H_i for the vertices seeing the pair v_(i-1),v_(i+1), L_i for vertices seeing only v_i, and Z for vertices seeing no root. Let H be the union of H_i, L the union of L_i, and R=L+Z. Put r=mass(R), z=mass(Z), and F=sum_i e(L_i,H_i). Let B be the edge mass of L_i-to-L_j edges for neighbouring root indices i,j, each pair counted once.

Then the following weighted cut bound holds:

    beta <= e/5 + Delta*r/5 + (2/5)e(Z)
                  - (2/5)F - (2/5)B - (1/5)e(L,Z).           (1)

Choose uniformly the single pentagon edge whose endpoints will have the same sign; use the alternating signs on the other four edges. Assign all H_i the sign of v_i. Assign all L_i the opposite sign of v_i, and put Z on the sign used on three of the five template labels. For two template labels at cyclic distance one, the probability their signs agree is 1/5; for distance two it is 3/5. Each particular label is on the two-label side in exactly two of the five cuts.

There are no H_i-H_j edges unless their indices are adjacent on the pentagon, since otherwise their common root would complete a triangle. Edges from L_i into H can only meet H_i,H_(i-2),H_(i+2). Those into H_i are cut surely, and at the other two labels the miss probability is 2/5. Any Z-H edge misses with probability 2/5. Because each L_i is independent (all its vertices see the common root), L-L edges are missed with probability 1/5 for neighbouring labels and 3/5 for the other labels. Z-L edges miss with probability 2/5: the L_i sign equals the majority sign precisely when label i was on the minority side. All edges inside Z are charged.

For the algebra, put D_R=e(R,H)+2e(R) for the degree sum on R. The expected loss of these five cuts is exactly

    e/5 + D_R/5 + (2/5)e(Z) - (2/5)F - (2/5)B - (1/5)e(L,Z).

Since D_R<=Delta*r, this proves (1). In particular by weighted Mantel on Z,

    beta <= e/5 + Delta*r/5 + z²/10.                            (2)

## Every pentagon in a counterexample has a substantial poorly attached exterior

In the unresolved middle band e<=3197/20000. For a [weighted least-support extremizer](INDUCED-OPTIMUM-BALANCE.md), Delta<=1/2. If some pentagon has r<=747/10000 then z<=r and (2) gives beta<=.03197+.00747+.000558009<1/25. Thus **every pentagon** has r>747/10000. If Z is empty for that root, the same argument gives the stronger floor r>803/10000. For a general counterexample, without extremal reweighting, the [independent-set cut](BIPARTITE-CORE-HOLES.md) implies Delta<.59; hence every pentagon has r>129/2000 by (2), since .118(.0645)+(.0645)^2/10=.008027025<.00803.

The bound can also be aggregated over pentagons. For a pair x,y let c(x,y) be its weighted common-neighbour mass. Let I_4 be the labeled induced four-vertex path density, counted in path order; let T_5 be the labeled cyclic pentagon density. Mark the path v_0 v_1 v_2 v_3 in the rooted pentagon and let W be the nonnegative product-weight measure on such ordered induced paths. Every valid way to complete an induced four-vertex path to a pentagon is one common neighbour of its endpoints. Thus

    integral 1 dW = I_4,        integral c dW = T_5.

For each rooted pentagon, the mass receiving two root attachments is exactly the sum of the five common-neighbour masses of its distance-two root pairs. Cyclic symmetry and root conditioning show that its pentagon-weighted average is 5 integral c² dW / T_5. In particular it is at least 5T_5/I_4 by Cauchy–Schwarz when T_5>0. The rootwise upper bound therefore imposes at every least-support counterexample

    5 integral c² dW < (9253/10000) T_5,
    5 T_5 < (9253/10000) I_4.                                  (3)

For arbitrary counterexamples one may replace 9253/10000 by 1871/2000. These inequalities are compatible with the [previous lower limits on T_5](TWO-HOP-PENTAGON-CUT.md). They bound the concentration of pentagon completions in addition to their total density, but do not yet rule out the full density band.

Related sources: [Erdős–Faudree–Pach–Spencer](https://combinatorica.hu/~p_erdos/1988-12.pdf) for classical neighborhood cuts, [Balogh–Clemen–Lidický](https://arxiv.org/abs/2103.14179) for the density tails, and [Ferudun](https://arxiv.org/abs/2606.28041) for per-root finite-type envelopes. The cut here uses pointwise one-root versus zero-root sign assignments and keeps their separate edge terms; no new universal full-resolution claim is made.
