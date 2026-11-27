# Independent mathematical review

A separate project reviewer checked the exact published
Section 5 question and the written proof at
[research commit a8c1f131](https://github.com/1337isnot1337/solved-conjectures/commit/a8c1f1317e714ea274ea7bc94536d834ac7fb453).
The review found no mathematical blocker. It verified that the
counter updates are auxiliary state, that every forced step
adds one genuinely new selection, and that the algorithm does
not know the degree bound or any of the future input. Each
increment contributes to at most one charged counter, and
all old domination is preserved.

For an arbitrary prefix optimum, each later-assigned dominator
can incur at most its arrival degree in forward assignments.
For any other assigned dominator, its j-th assigned forced
step witnesses counter at least j. The reviewer checked the
incidence budget, the prefix comparator, and the matching-order
star lower bound, and suggested the algebraic improvement of
retaining the linear term in the sum of consecutive integers.
That inequality is included in the final proof and gives
the exact bound one when the arrival degree is zero.

The reviewer separately checked 8,339 graph prefixes and
26,610 optimum/comparator assignments, including all optimum
sets through order five, both orderings of the star, and
250 random graphs of orders nine through thirteen. These
checks are supplemental. This is not a Lean formalization or a
journal referee report. See [issue #995](https://github.com/1337isnot1337/solved-conjectures/issues/995).
