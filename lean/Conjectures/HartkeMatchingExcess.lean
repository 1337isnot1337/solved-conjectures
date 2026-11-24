import Conjectures.HartkeMatchingExcessStatement

/-!
# Hartke–Stolee–West–Yancey matching-excess conjecture

Full formalization of the existing repository argument by Cinna Davis
(commit a84f0efd3a7899a73c78019e48b3dfdf62e6a0d7). The original target is
Conjecture 9.15, printed page 21 of Hartke, Stolee, West and Yancey's author
manuscript dated 5 May 2011, *Extremal graphs with a given number of perfect
matchings* (published in Journal of Graph Theory 73(4), 2013, 449–468).

`HartkeMatchingExcess.conjecture_9_15` proves that the minimum of the
actual eventual graph-excess constants over every tail tends to infinity.
`matchingExcess_sqrt_lower_bound` and `tailMinimum_sqrt_lower_bound` prove
the recorded quantitative bound for every positive matching count at least
two. `extremalEdges_eventually` and `matchingExcess_unique` identify these
constants by the exact maximum edge count over all finite simple graphs.

The binary construction is credited to Hartke, Stolee, West and Yancey,
the two-vertex extension to Hetyei, and the original stabilization theorem
to Dudek and Schmitt. The formal proof supplies the boundedness and
stabilization bridges directly, using an alternating four-cycle count.
Historical priority remains as qualified in the entry's source audit.
The stronger growth questions and proposed exact upper bound are not claimed.
-/
