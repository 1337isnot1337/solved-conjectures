# Source and prepublication review record

## Source identity

Peter Christian Heinig, [The Erdős bipartification conjecture is true in the special case of Andrásfai graphs, arXiv:0907.3928v3](https://arxiv.org/pdf/0907.3928#page=7), p. 7, Conjecture 6. The target here is the general-preimage inequality, with no restriction on the order of the graph or the rank of the template. The suggested method in the source uses copies of its specific cut F_k; our method uses three related rotated interval cuts and six-mass inequalities and proves the inequality without requiring those exact cut copies.

## Bounded prior-resolution check

- Direct searches used the author, “Conjecture 6,” arXiv:0907.3928, both spellings of Andrásfai, “homomorphic preimage,” “blow-up,” “bipartification,” “bipartization,” and “MaxCut.”
- The original paper separates Theorem 3 (one unweighted-template construction), Conjecture 5 (its optimality), and Conjecture 6 (all preimages). [Later sparse-half work](https://www.math.uni-hamburg.de/home/schacht/2019/Andrasfai.pdf) resolves the different one-half assertion, with no general nonregular complement bound.
- [Balogh–Clemen–Lidický](https://arxiv.org/html/2103.14179) prove the density tails for arbitrary triangle-free graphs; they are explicitly imported, not presented as new. The homomorphic-preimage geometry is needed to deduce entry to a known tail if the three cuts fail.
- [Ferudun](https://arxiv.org/abs/2606.28041) reports a graph-order range, not all preimages. The [Erdős Problems research audit](https://erdosproblems.ai/wiki/research/triangle_free_bipartization/proof_sketch) gives several homomorphism classes but no Andrásfai-preimage theorem. An August [successor trial](https://github.com/Kuberwastaken/c5-k4/blob/main/results/expansion/prospective_erdos23_andrasfai_result.md) reports finite computations on equal-sized blow-ups, not the claimed theorem.
- Searched the repo issues and both catalogues for the author, object, and alternate spellings. No competing claim was located for this exact target as of 2026-11-27.

A bounded search is not a proof that no prior resolution exists.

## Review status

Author-side argument check: source match, circle labeling, perturbation, late-class cyclic shift, disjoint counting, six-mass inequality, and all-order/weighted transfers checked. No graph-order experiments are required. No Lean work was done. Independent mathematical review and validation of a final indexed publication tree remain pending; this draft is not a catalogue entry or a merge request ready for publication. The full Erdős problem stays open.

## A neighboring claim is not a new solution

The exact maximum-cut formula for the **unweighted templates** (Heinig’s Conjecture 5) follows from [Vasilev’s January 2026 edge-isoperimetric theorem for cycle powers](https://arxiv.org/html/2601.06912v1), Theorem 1, as stated there. The complement of the kth Andrásfai graph is the (k−1)st power of a cycle of length 3k−1. At any fixed cut size, Vasilev's theorem minimizes the interior count for an Andrásfai part by choosing a circular interval; its complement is also an interval, so both minima are attained simultaneously. The interior count of a growing interval is discretely convex since its successive increments count allowable offsets among increasingly many consecutive offsets. Hence the split into the two closest sizes minimizes the total interior count. The resulting count is floor(k²/4), matching Heinig's already constructed cut. This implication concerns the unweighted template only: the cycle-power theorem does not optimize intervals for arbitrary, nonuniform vertex product weights. No novelty is claimed for Conjecture 5, and the proof of Conjecture 6 does not use this theorem.

## Scope of the cut construction

The [fixed-rank rotation obstruction](FIXED-ROTATIONS.md) shows why rotating the original rank’s unweighted template cut alone is insufficient. The median cuts can be realized as rotated Heinig cuts after a change of embedding into another rank. They force the density threshold; the dense-tail theorem may use a different cut.
