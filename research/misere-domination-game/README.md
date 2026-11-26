# Misère Domination Game

The named problem here is the path/cycle clause of [Brito, Marcilon, Martins and Sampaio, Question 2](https://arxiv.org/html/2502.13118v4#S7): determine whether the winner of the misère domination game can be decided in polynomial time on paths and cycles. Their [journal paper](https://doi.org/10.1016/j.jcss.2025.103751) settles PSPACE-completeness on general graphs, not this question. The same open question asks separately about trees.

**Research checkpoint, not a solution.** Bordered path runs are exactly the impartial octal game 0.337 as game trees, not just in normal-play nimber. The concrete algebraic-periodicity parameters for 0.337 reported as an experimental observation by [Kai Liang](https://arxiv.org/pdf/2608.13273), Section 3.5.3, have an exact counterexample. This invalidates that particular proposed shortcut but leaves open the existence of a variant period or a polynomial-time algorithm.

## The exact heap interpretation

A domination-game state is determined by its undominated vertex set. A move at x removes every still-undominated vertex in its closed neighborhood. Already played vertices have no effect and are never legal again, so they need not be recorded. On a path, undominated vertices lie in runs. When an undominated run separates into two nonempty runs, the removed segment separating them has length three. More generally, every internal dominated gap between undominated runs has length at least three: it was created by such a split and can only grow or merge. No subsequent move can touch two runs. Thus runs interact only as a disjunctive sum.

A bordered run is a nonempty run adjacent on at least one end to a dominated vertex. It may have one or two such ends. Selecting the adjacent dominated vertex removes the single endpoint of the run. Selecting the endpoint itself removes two when possible. Selecting a center whose three closed-neighborhood vertices are in the run removes three, leaving any allowed split of the remaining length into at most two pieces. A length-one residual is completely removed by an ordinary move. Every residual run has a dominated neighbor: a trim preserves a dominated boundary or creates one at the newly shortened end, and a split creates a boundary on each piece.

Conversely, these are all moves affecting a bordered run. A two-vertex removal not covered by a trim is impossible on a path, since an interior center with three undominated vertices in its closed neighborhood removes all three. With length at least three there is a move realizing each split obtained by removing a consecutive triplet. Induction on remaining length shows that the one- and two-border positions of length h have the exact same recursive option set, after identifying shorter runs with heaps. Write H(h) for their common game. Its moves remove one or two tokens without splitting, or remove three tokens and optionally split the remainder in two. In octal notation these digits are 3,3,7, giving 0.337.

An initially untouched cycle C(n), n≥3, has only one type of move, leaving H(n−3). An untouched path P(n) has the untouched endpoint special case (remove up to two at the end) and otherwise removes a triplet; each nonempty residual piece is bordered. Thus a polynomial algorithm for arbitrary sums of 0.337 heaps would settle both single-component path and single-component cycle outcomes after at most n first-option checks. This reduction does not assert the reverse for untouched input graphs, nor does it by itself handle sums of untouched path and cycle components.

## Refuting the displayed period parameters

Liang's Definition 3.4 and table report parameters (22,4,0,2) for 0.337. These predict that once the largest heap is at least 26 and the second-largest heap is at least two, subtracting two from both preserves outcome. Consider
```
(27, 4, 2, 2, 2, 2, 2, 2, 1)      P
(25, 2, 2, 2, 2, 2, 2, 2, 1)      N
```
The second is exactly the specified reduction of the first. One winning move from the second replaces its heap of size 25 by a heap of size 23. The first has no option to a P-position. The standalone [Python certificate](check_oct337.py) checks both facts by the defining outcome recurrence, starting from the empty position as N under misère play. Its states are multisets of positive heap lengths; every recursive move lowers total length by one, two or three, so the verification terminates and does not assume the conjectured rule.

The same two outcomes were found by a separate C++ enumerator. The proof of the graph-to-heap equivalence is not based on finite tests. The counterexample is only to the displayed parameter tuple and does not disprove the existence quantified in Definition 3.4. The reported single-heap eventual sequence may still be true.
