# Independent mathematical review

A separate project reviewer checked the written proof at
[research commit 48e41054](https://github.com/1337isnot1337/solved-conjectures/commit/48e41054ddc6701621c149778398f5d6302eb187).
The review found no mathematical blocker. It verified the exact
scope in the last paragraph of Section 4 on page 15 of the
[author preprint](https://arxiv.org/pdf/1601.01129#page=15):
a polynomial in the stable-set bound for each fixed clique
bound. The original cubic case and the broader two-variable
Problem 1 are distinct from this question.

The reviewer checked that for each pivot, the restricted clique
and stable families still cover the region and every cross
intersection survives; the clique bound drops by one without
requiring disjoint regions. For the lower bound, the review
checked all coverage and cross-intersection requirements of
the variable-branching prefix tree and the exact frontier size.
For the second upper bound it checked disjointness of the
permutation events even when a cross intersection is a pivot,
and the exact probability of each event.

The separate finite checks included 417 normal covers,
109,704 cross-intersections, 7,324 nonempty restricted regions
and 63,413 permutation orders. The reviewer also searched the
literature by exact statement and DOI, normal covers, local
rectangle partitions and cross-intersecting set-pairs. The
nearby Pinto local parameter optimizes a different quantity;
the reviewed Füredi–Gyárfás–Király results assume disjoint
diagonal pairs. No prior resolution was located in this bounded
search.

This is independent project review, not Lean formalization or an
external referee report. See [issue #989](https://github.com/1337isnot1337/solved-conjectures/issues/989).
