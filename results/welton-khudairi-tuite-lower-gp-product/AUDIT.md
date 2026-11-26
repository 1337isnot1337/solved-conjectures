# Source, priority and review

## Exact target

Eartha Kruft Welton, Sharif Khudairi and James Tuite, [*Lower General Position in Cartesian Products*](https://doi.org/10.22049/cco.2024.29171.1879), Communications in Combinatorics and Optimization 10 (2025), 110–125, [journal Conjecture 3, p. 117](https://oro.open.ac.uk/98050/9/98050final.pdf), [arXiv:2404.19451, Conjecture 2.10](https://arxiv.org/html/2404.19451#S2). The conjecture compares the least size of a maximal general position set in the Cartesian product to the smaller corresponding factor invariant. All constructed graphs are finite, connected and simple. The family runs over every integer parameter at least seven.

## Priority check, 26 November 2026

- The [general-position survey](https://arxiv.org/abs/2501.19385) repeats the bound as Conjecture 5.14 in the checked version. The [MathDB exact target](https://mathdb.com/p/362912/the-lower-general-position-product-bound) describes it as open and notes small-order tests.
- Checked the original paper's nearby lower and upper bounds, the earlier [lower-general-position paper](https://arxiv.org/abs/2306.09965), author publication lists, and later papers on Cartesian position problems. A factor-layer upper bound or a change from geodesics to induced paths does not settle this conjecture.
- Searches used the author names, title, both conjecture numbers, and equivalents involving maximal geodesic sets, the smaller factor, twins, complete factors, and unbounded gaps. Both repository branches, the result index, and related issues and PRs were checked. The [previous partial checkpoint in #854](https://github.com/1337isnot1337/solved-conjectures/issues/854) gives a lower bound of four in the large-factor regime; it contains no counterexample. [#869](https://github.com/1337isnot1337/solved-conjectures/issues/869) is the distinct terminal-existence conjecture.
- No earlier proof or disproof of this exact target was located in the inspected sources. This is not a claim about unpublished work.

## Independent checks within the result package

In the diameter-two factor, general position is equivalent to inducing a disjoint union of cliques: its only possible three-vertex geodesic obstruction is an induced path of length two. Adjacent twins are indistinguishable to the other vertices, so adding a missing member of an occupied twin class cannot introduce such a path. A small candidate must then be supported on the six base points, which themselves contain a three-point path; any proper general-position subset of those six admits a new point adjacent only to an omitted vertex. That point is anticomplete to the selected base subset and therefore cannot introduce an induced path of length two.

The product checker constructs adjacency directly, computes shortest-path distances by breadth-first search, checks the six selected vertices, then checks every outside vertex against all selected pairs. It does not assume a prescribed witness type or the Cartesian distance formula. In the second factor it checks all twin profiles and exhausts the 64 possible base supports. The representative parameter checks are regressions; the written proof is uniform and has no computational prerequisite.
