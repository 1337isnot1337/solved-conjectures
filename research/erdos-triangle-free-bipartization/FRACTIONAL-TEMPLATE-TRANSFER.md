# Transferring weighted cut ratios through templates

These are sufficient conditions for the sharp bound in [Erdős Problem 23](https://www.erdosproblems.com/23), not a resolution. They apply to arbitrary orders, and to approximate as well as exact homomorphisms. The cut distributions used as inputs are not new.

Normalize the vertex mass to 1 and let e be unordered product edge mass. Assign each vertex a label from a template T; call an edge valid if its labels are joined in T. Let U be the total mass of invalid edges. Suppose every nonnegative edge weighting on T has a cut retaining at least a proportion 1-rho of the total weight. On each template edge put the sum of the original valid edge weights with those endpoint labels. The template cut lifts, paying at most rho(e-U) on valid edges and at most U on the rest. Hence

    beta(G) <= rho e + (1-rho) U.

No completeness of the fibers is used; an edge lying inside one fiber is invalid and charged to U.

## Subcubic templates

The November 2026 preprint [Weighted Max Cut in Subcubic Graphs](https://arxiv.org/abs/2611.05178) proves retention at least 15/19 on any triangle-free subcubic template, for arbitrary nonnegative edge weights. Thus every triangle-free graph that can be made homomorphic to a triangle-free subcubic graph by deleting edge mass at most 201/25000 satisfies the sharp Erdős bound. In fact, in the middle band replace e by its upper limit 3197/20000 and use

    (4/19)(3197/20000) + (15/19)(201/25000) = 1/25.

The [two established tails](https://arxiv.org/abs/2103.14179) handle the other densities. The use of arbitrary edge weights is essential because aggregating the original products within label pairs need not produce product weights again. This application does not require or prove Gutin and Yeo's stronger weighted 4/5 conjecture.

## Fractionally colourable templates

If the template has fractional chromatic number at most k, a distribution of independent sets has vertex inclusion probabilities at least 1/k. Use each independent set as a cut shore. Since no edge has both endpoints in the shore, each template edge is cut with probability at least 2/k. Thus rho=1-2/k is valid directly, without assuming the template is triangle-free.

In particular every triangle-free graph of fractional chromatic number at most 6394/2397 satisfies the sharp bound, since at this value rho=800/3197 and the middle-band estimate is exactly 1/25. Using the slightly cleaner bound 8/3 permits an approximate labeling to such a template, with invalid edge mass at most 1/20000: then beta is at most (3197/20000)/4 plus (3/4)(1/20000), exactly 1/25. For odd Kneser templates the distribution is just the usual membership cut; this implication concerns Erdős 23 and does not yield the sharper higher-odd-girth bound.
