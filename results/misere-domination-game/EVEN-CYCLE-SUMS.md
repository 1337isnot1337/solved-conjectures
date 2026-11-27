# Misère Domination Game

**An exact rule for arbitrary sums of untouched even cycles and bordered runs.** An untouched cycle of length four or eight can be discarded in any disjunctive sum. If at least one other untouched even cycle survives in the position, let S be the total size of just the ordinary bordered-run heaps and let W be their virtual weight from [the 0.337 formula](PROOF.md). The position is P precisely when both S and W are even. The number and lengths of the remaining untouched even cycles do not matter. In particular, on a union of even cycles the second player wins if at least one component has length other than four or eight; otherwise the first player wins.

This does not classify arbitrary sums involving untouched odd cycles or untouched paths.

## Neutral cycles

Call an impartial game neutral if adjoining it never changes the misère outcome, under a sum with any other finite impartial game. The following elementary reply rule is useful. If a game Y is N and every option of Y has a move to some neutral game, then Y is neutral. Indeed, if X is P, answer a move in Y by that reply, restoring X up to a neutral summand; answer an ordinary move in X by the winning reply in X, continuing until necessary. Equivalently, prove X+Y is P for P-positions X by induction: an ordinary move in X leaves a nonempty N-position of X or the misère empty N-position; the former has a move to a smaller P-position of X while the latter leaves Y itself, which is N. A move in Y has the neutral reply. When X is nonempty and N it has a move to a P-position, so X+Y is N by the first direction; when X is empty use that Y is N. This proves the rule, with the empty game as the initial neutral example.

A bordered heap H(4) is N and every option is one of H(1), H(2), H(3), each with a move to empty. So H(4) is neutral. An untouched C(4) has the sole option H(1), which is P and has a move to empty, proving C(4) neutral. An untouched C(8) has the sole option H(5), which is P by the exact heap formula and has a move to H(4); therefore C(8) is neutral as well.

## Playing with the remaining even cycles

Every remaining untouched even cycle C(n) has a unique option type H(n−3), which is a single odd bad heap: n−3 is odd and is neither one nor five. Call these cycles active. The combined position consists of at least one active cycle plus a heap sum, ignoring neutral cycles. Induct on total undominated size, counting untouched cycle vertices as well as heap sizes. A move in an active cycle removes three vertices and converts that component to an odd bad heap.

Suppose S and W are even. Any heap move removing an odd number flips S; a two-token move flips W (it decrements a bad virtual pile by one or adds a unit pile when played in length four or five). Either kind produces N by induction. A cycle move flips S and creates a bad heap. If another active cycle remains, the result is N by induction since S is odd. If it was the last one, the resulting pure heap state is N by the odd rule of [the exact formula](PROOF.md), since a bad heap is present. Thus the stated even-even position is P.

If S is even and W is odd, some bad heap exists. Remove two tokens from it, leaving S even and W even. If S is odd and W is even, some odd heap exists. Remove one from that odd heap, which flips S without changing W. If S and W are odd, some bad heap exists: from a bad even heap remove one token; from a bad odd heap trim three tokens. Either flips S and decreases W by one. Each of these replies leaves the active cycles untouched and reaches an even-even P state. These cases prove the claimed rule.

## No active cycle can be replaced by a fixed pure heap sum

Take any one active cycle. Suppose a pure heap position Y could replace it in every sum with ordinary heaps. Let σ and W_Y be its actual parity and virtual total. Test against k heaps of size two, with k even and arbitrarily large. The true cycle sum is P. Those many bad heaps force an odd total to be N in the pure heap formula, so σ is even. For large k no virtual pile in the pure sum has positive dominance, whence the even rule makes it P only if W_Y+k is even. Thus W_Y is even as well.

Now instead test against a single even heap with arbitrarily large even virtual weight c (actual length 2c+4). The cycle sum is P because both ordinary parities are even. In the pure sum its virtual total is even, but the giant heap violates the central inequality once c>W_Y. If no other virtual pile exists, the sole even-weight pile is likewise N. This contradicts indistinguishability. Hence the newly solved even-cycle sums really require an extra rule beyond substituting ordinary heaps and evaluating 0.337.
