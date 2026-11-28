# Independent colour transversals and the Erdős cut

Partial research for [Erdős Problem 23](https://www.erdosproblems.com/23). Total vertex mass is one, edge mass is the product of the endpoint weights, and A,B,C are the classes of a given proper three-colouring. An independent transversal is a triple with one vertex from each class and no edges among the three. Its density here means the unnormalized product mass on A by B by C, with the order of the classes fixed.

## A density obstruction and its finite structural source

If there is no independent transversal, the cyclic orientation A to B to C to A is acyclic. In fact a shortest directed cycle would be chordless, because any chord together with the returning directed arc makes a shorter directed cycle. Its length is a multiple of three and is at least six, because the graph is triangle-free. The vertices at positions 0,2,4 are independent in an induced cycle of any such length, and have all three colours, a contradiction. Thus the weighted median in a topological order gives the [circular-three cut bound](CIRCULAR-THREE.md), without using saturation. In a template saturated only on inter-colour pairs the converse holds: for every independent transversal the three pairs have common neighbors of the third colours, which together with the transversal form a directed six-cycle.

There is an absolute positive lower bound on independent transversal density in **every** proper three-colouring of any middle-band weighted counterexample. Suppose otherwise and pass to a cut-convergent subsequence of the three-coloured graphons. This is the finite-colour version of graphon compactness (weak regularity partitions can be refined by the three mark classes). The limit remains triangle-free; the coloured induced transversal density is zero; the minimum monochromatic cost remains at least 1/25 by cut-norm continuity. Its edge mass is at most 3197/20000. Every finite random sample from the limit is almost surely triangle-free, properly three-coloured, and free of independent transversals. It therefore has minimum monochromatic mass at most 1/44+e/11, by the preceding order argument. Sampling convergence of cut cost and density gives the same bound for the limit, strictly below 1/25. This contradiction gives the positive lower bound, without claiming an explicit numerical value.

## A directly measurable rooted interface

Fix x in C. Let A_1=N(x) intersect A and B_1=N(x) intersect B; put A_0=A minus A_1 and B_0=B minus B_1. Make A_0 and B_1 the first block, and A_1 and B_0 the second. Any backwards A-to-B cross edge would join A_1 to B_1 and is therefore absent by triangle-freeness.

For a vertex z in C, joining the first block incurs backwards attachment degree d_(B_0)(z), while joining the second incurs d_(A_0)(z). Let Q_x be the missing pair mass in A_0 by B_0, precisely the weighted transversal count rooted at x. The product of these two attachment degrees is at most Q_x, since their neighbor sets form a missing rectangle. Consequently assigning each z to its cheaper block gives a total wrong-way mass at most mass(C) sqrt(Q_x). For nonzero C, at some x this is at most sqrt(mass(C) times the total transversal density).

If an exact total first-block mass is desired, specify the mass of C that has to go in the first block and take that mass in increasing order of d_(B_0)(z)-d_(A_0)(z). This minimizes wrong-way mass for the prescribed balance; split one false-twin atom if needed. For any such root and choice, insert the first-block mass and the measured wrong-way mass in [the one-way inequality](ONE-WAY-SEPARATORS.md). The cheaper individually chosen blocks may be unbalanced, so the rooted estimate alone does not yield an explicit unconditional transversal density threshold.

## Quantitative sampling consequence

The positive lower bound can be made explicit using [Bender–Krauthgamer, Theorem 2.1](https://arxiv.org/html/2611.03205v1#S2), the November 2026 Max-Cut sampling result. Let T denote the independent transversal density (classes in fixed order) and p=2e. For every integer k>=1, independent product-weighted sampling with k slots gives

    beta <= 1/44 + e/11 + e/k + 48 sqrt(p)/sqrt(k) + k³ T/8.

To verify the normalization, let w_v be the positive vertex masses, W_uv the zero-one adjacency matrix, and n the support order. Use A_uv=n² w_u w_v W_uv and p_v=w_v in that theorem. Its scaled kernel K is exactly W, and its moment parameter H is the weighted mean of sqrt(d(v)), at most sqrt(p). The normalized sample has edge weight W_(X_i,X_j)/k² and keeps repeated draws as separate false twins. Its expected total edge mass is (1-1/k)e. Hence the expected sample deletion cost is at least beta-e/k-48 sqrt(p)/sqrt(k).

The sample inherits triangle-freeness and the three-colouring. Without an independent transversal its minimum cost is at most 1/44+e_sample/11 by the acyclic median proof. Otherwise the random cut and weighted Mantel give the bound 1/8. Its probability of any independent transversal is at most k³ T by a union bound over the three ordered slots in their required colours. Therefore the sample's expected cut cost is at most 1/44+e/11+k³ T/8, proving the claim.

For example, every middle-band counterexample with a proper three-colouring must have T>10^(-27) in that colouring. Take k=12000², use sqrt(p)<17/30, and compare

    e/k + 48(17/30)/12000 + (12000²)³ * 10^(-27)/8
        < 603/220000 = 1/25 - (1/44 + (3197/20000)/11).

The constant is small, but uniform for arbitrary graph order and weights. More generally optimizing k gives a bound of the form beta <= 1/44+e/11+O(T^(1/7)), with an absolute implied constant. This uses a sampling *theorem* and does not enumerate graphs of the quoted sample size.
