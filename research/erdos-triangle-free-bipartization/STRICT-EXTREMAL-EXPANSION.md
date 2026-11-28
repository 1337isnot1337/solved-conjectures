# Erdős's triangle-free bipartization conjecture

## Strict expansion at a maximum-density extremizer

A structural reduction for [Erdős #23](https://www.erdosproblems.com/23), not a resolution. Use mass-one triangle-free graphons and unordered edge masses. Let B* be the supremal missed mass, and let e* be the maximum edge mass among its maximizers. These two maxima exist by graphon compactness. Work at a maximizer W with e(W)=e*. This is the same selection used in the [saturation theorem](SATURATED-GRAPHON-EXTREMIZER.md).

For every measurable partition A,S of masses a,s>0, its crossing edge mass q satisfies

    q > 4 B* a s.                                         (1)

Moreover for every fixed 0<tau<=1/2 there is a uniform positive additive gap in (1) for tau<=a<=1−tau, over all graphons attaining both maxima. Neither gap is asserted to hold at an arbitrary maximizer without the edge-density selection.

### Proof

For a region U let beta_U be its induced minimum missed mass without renormalizing, and let e_U be its unordered edge mass in the original weights. Cut A and S optimally and reverse one orientation at random. This upper-bounds B* by beta_A+beta_S+q/2. The bound beta_U<=B* mass(U)^2 gives q>=4B*as. Equality makes both induced normalized graphs independent global maximizers of the missed mass. Their normalized edge masses are therefore at most e*, by the definition of e*. Consequently

    e* = e_A + e_S + q <= e*(a²+s²)+4B*as,

which is impossible since e*>2B*.

For completeness, any triangle-free graphon with nonzero edge mass has B(W)<e(W)/2. Its positive neighborhoods are independent almost everywhere and cover the positive-degree region by countably many independently sampled roots. They give a countable independent partition there. Some two distinct classes have positive link mass. Give those classes opposite signs and give the rest the relaxed sign zero. This reduces the fair-cut cost e(W)/2 by half the link mass. Approximation by actual cuts gives the same strict bound. In the maximizing problem B*>=1/25 by the balanced pentagon, so zero edge mass is not possible.

For the uniform gap, suppose partitions with a,s>=tau approach equality. Pass to a convergent subsequence in the two-colour cut metric while retaining which vertices are marked A or S; see [Grebík–Pikhurko, Theorem 7.1](https://pikhurko.github.io/E/GrebikPikhurko26ejp.pdf). The masses and crossing edge mass converge. Triangle density, e, and B are cut-continuous, so the limit is still a maximizer attaining e*. Both limiting parts have positive mass. Their crossing mass equals the excluded value in (1), a contradiction.

### Apply the gap to pairs of optimum cuts

For an agreement/disagreement partition of two optimum cuts at W, the [agreement-block identity](OPTIMUM-CUT-OVERLAPS.md) says that B*=beta_A+beta_S+q/2 exactly. Thus

    (B* a²−beta_A)+(B* s²−beta_S) = (q−4B*as)/2.

If both blocks have mass at least tau, the sum of their induced loss deficits is bounded uniformly away from zero. In particular at least one of their normalized induced graphs has missed mass bounded away from B*. The conclusion is stronger than saying merely that each block separately has missed mass at most B*. This does not yet identify which block is cheaper, or reduce every extremizer to a known template.

### An explicit strengthened expansion on a different extremizer

For lambda>0 choose W_lambda maximizing the **single** objective F_lambda(W)=B(W)+lambda e(W) among triangle-free graphons. Let F be its maximum, b_lambda=B(W_lambda), and e_lambda=e(W_lambda). This choice gives a uniform bound down to arbitrarily small parts:

    q >= [4F/(1+2 lambda)] a s
      >= [4b_lambda+4 lambda(e*−2B*)/(1+2 lambda)] a s.    (2)

In particular the minimum weighted degree of W_lambda lies a positive gap above 4b_lambda. This is an explicit gap conditional on the chosen lambda and the extremal values, not an effective estimate on the floor of the original maximizers.

For the proof the two induced regions satisfy beta_U+lambda e_U <= F mass(U)^2. Combine optimal internal cuts with an independent fair relative orientation on the two blocks; the crossing edges contribute q/2 to loss and lambda q to the density term. Thus

    F <= F(a²+s²)+(lambda+1/2)q.

This gives the first bound in (2). Comparison against an original lexicographic maximizer gives F>=B*+lambda e*. Since b_lambda<=B*, it follows that e_lambda>=e*. Now 4F/(1+2 lambda)−4b_lambda=4lambda(e_lambda−2b_lambda)/(1+2 lambda), proving the second bound. If c is the coefficient in (2), a positive measure set of vertices of degree below c−epsilon would contain arbitrarily small sets A of mass a, and q<=integral_A d< a(c−epsilon) contradicts q>=c a(1−a). Hence d>=c almost everywhere.

A density-sensitive maximizer is also a near-maximizer of B: Mantel gives b_lambda>=B*−lambda(1/4−e*). In particular if the conjecture fails, some sufficiently small positive lambda retains b_lambda>1/25. Thus it suffices to study a hypothetical counterexample chosen by this regularized objective, which has the explicit expansion and minimum-degree advantages above. This does not by itself raise the minimum degree to the thresholds of any known structural graph class.

For a finite partition with masses a_i and total between-part edge mass Q, use an independent fair orientation of each optimal induced cut. The same proof gives Q>2B*(1−sum a_i²) at a lexicographic maximizer whenever the partition is nontrivial, and Q>=[2F/(1+2lambda)](1−sum a_i²) at a regularized maximizer. In the lexicographic case equality would force every positive-mass induced region to maximize B and hence have normalized edge mass at most e*. The argument also applies to fractional partitions: adjoin a fresh atomless coordinate to split each vertex into copies according to its fractional mark. The lifted kernel has the same e and B, since averaging the cut over the fresh coordinate gives a relaxed sign with the same cost.
