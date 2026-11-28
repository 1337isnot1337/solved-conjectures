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

## Minor-free templates (literature transfers)

[Naserasr, Nigussie and Škrekovski, Theorem 16](https://users.fmf.uni-lj.si/skreko/Old/MyPapers/00995.pdf) proves that every triangle-free graph with no K5 minor maps to the Clebsch graph. The five Clebsch cuts give rho=1/5 here, so this implies the sharp Erdős bound even for graphs that become homomorphic to such a template after deleting at most 803/80000 of edge mass: (3197/20000)/5 + (4/5)(803/80000) = 1/25. The unperturbed Clebsch implication is already in the [public middle-band record](https://erdosproblems.ai/wiki/research/triangle_free_bipartization/proof_sketch); the transfer simply keeps track of arbitrary original fiber capacities and edit error. The same paper's Proposition 24 gives a triangle-free K6-minor-free graph not mapping to Clebsch, so the argument does not extend by just changing K5 to K6.

[Hell and Zhu](https://onlinelibrary.wiley.com/doi/abs/10.1002/%28SICI%291097-0118%28200001%2933%3A1%3C14%3A%3AAID-JGT2%3E3.0.CO%3B2-%23) show that triangle-free series-parallel graphs have circular chromatic number at most 8/3. Hence they satisfy the fractional-coloring condition above. For the sharp Erdős comparison the stronger K5-minor-free transfer already includes this class.

## A weighted odd-minor obstruction

There is a stronger, signed-minor route to the same numerical edit threshold. If a triangle-free graph H has no odd K5 minor (with all edges negative), then [Guenin's odd-circuit-cover integrality theorem](https://homepages.cwi.nl/~lex/files/guenin2.pdf) gives beta(H) <= e(H)/5 for arbitrary nonnegative edge weights. Indeed the constant assignment 1/5 is a feasible fractional cover of every odd circuit. Thus every strict middle-band counterexample is more than 803/80000 in unordered product edge-deletion mass from the triangle-free graphs with no odd K5 minor. That is stronger as a distance condition than the ordinary-minor version, since excluding an ordinary K5 minor also excludes an odd one. The unperturbed application of odd-circuit-cover integrality has prior attribution in [the reciprocal cover note](RECIPROCAL-ODD-COVER.md).

The same conclusion gives a useful vertex measure condition. If a set S meets every odd K5 minor model, then the total product mass of all edges incident to S must exceed 803/80000. In particular, at a hypothetical least-support maximizer the maximum weighted degree is at most 3/5: cut the independent neighborhood of a vertex of weighted degree d from its complement. The only omitted edges lie in the complement, of mass 1-d; by weighted Mantel their edge mass is at most (1-d)²/4. If d>=3/5 this is at most 1/25. Hence any such vertex hitting set has mass greater than (803/80000)/(3/5)=803/48000. This is a conditional restriction on the concentration of signed-minor models, not a claim about their number.
