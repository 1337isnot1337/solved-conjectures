# Misère Domination Game on Trees

**A parameterized exact algorithm.** For an n-vertex tree with ℓ leaves, both normal and misère domination can be solved exactly in time
```math
(n+1)^{O(\ell)}\exp(O(\sqrt n)).
```
For normal play the exponential factor is unnecessary: the winner and its Sprague–Grundy value can be computed in (n+1)^(O(ℓ)) time. For misère play the displayed bound is subexponential when ℓ=o(n/log n). This does not settle polynomial-time solvability of misère play on arbitrary trees, or even for fixed ℓ beyond the single-path case.

## Canonical geometry of a partial position

A state is the current set U of undominated vertices. Its moves delete a nonempty intersection with a closed neighborhood. Therefore if two sets of live targets are at graph distance at least three, a move cannot affect both, even when playable centers are themselves already dominated.

Call a vertex critical if its degree is not two. A nontrivial tree decomposes into chains between consecutive critical vertices; the chain interiors consist only of degree-two vertices. There are O(ℓ) critical vertices and chains, by suppressing degree-two vertices and the standard tree degree sum. The single-vertex tree is handled directly.

For each chain, look at its maximal contiguous runs of undominated interior vertices. Retain in a core record every still-undominated critical vertex, and every interior run meeting one of the first two or last two interior positions on its chain. At most one run touches each of those two end portions, because the two interior positions in one portion are consecutive. Thus the core record has at most two intervals per chain, each described by its endpoints.

Every other interior run is an independent bordered heap of the game 0.337. It is at distance at least three from both critical endpoints, so no move can simultaneously affect it and any target on another chain or a critical target. On the same chain, two distinct undominated interior runs are separated by at least three dominated vertices. Indeed an internal dominated gap between interior runs can only be created by an interior move covering three consecutive interior vertices; critical-vertex moves can only touch an end of the interior, not create a gap between two interior vertices. Later moves can only enlarge or merge gaps. This proves separation within the chain as well. The detached run has a dominated vertex at each end and the original [bordered-run analysis](https://github.com/1337isnot1337/solved-conjectures/blob/main/results/misere-domination-game/PROOF.md) applies exactly.

## State transitions and complexity

The canonical key consists of the critical bits and the retained intervals, together with a multiset of lengths of detached runs. A heap move acts only on that multiset, by the ordinary 0.337 rule. A move affecting the core can be computed by keeping only its live targets in the original tree and deleting their intersection with the chosen closed neighborhood. No move hitting the core can affect an already detached run. Reapply the normalization to keep the newly retained intervals and move any newly detached pieces into the multiset. Forgetting their original positions is lossless: the live set only shrinks, and an isolated run cannot reconnect to anything. Every move decreases the total live count.

There are at most 2^(O(ℓ))(n+1)^(O(ℓ)) labeled core records, and exp(O(√n)) possible multisets of lengths summing to at most n by the standard generating-product bound for integer partitions. Each state's options can be listed in polynomial time. Memoized minimax yields the misère bound; the empty state is N.

In normal play, the detached runs are a disjunctive sum and each of length h has nimber h mod 4, from [Brito et al., Lemma 4.2](https://arxiv.org/html/2502.13118v4#S4.SS2). Compute only the core game's nimber: for each move, take the nimber of its new smaller core XOR the nimbers of the detached pieces it created, then use mex. Initial detached pieces are likewise accounted for at the end by XOR. All recursion is over core records only, removing the partition factor. This supplies a polynomial-time normal algorithm for any fixed number of leaves, while leaving the unrestricted tree question open.

The obvious attempt to make the misère algorithm polynomial by storing only the three-coordinate pure 0.337 profile requires a new justification. That profile solves pure heaps and some mixed cycle sums, but is not in general an indistinguishability relation when an external domination component remains. An example of this limitation is recorded in the [mixed cycle note](https://github.com/1337isnot1337/solved-conjectures/blob/research/research/misere-domination-game/MIXED-CYCLE-SUMS.md).
