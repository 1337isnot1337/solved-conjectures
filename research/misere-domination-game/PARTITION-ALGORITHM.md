# Misère Domination Game

**Exact subexponential algorithm on all unions of paths and cycles.** On an explicitly given n-vertex graph of maximum degree two, the winner under misère play can be computed in deterministic exp(O(√n)) time and space. This covers arbitrary numbers and lengths of connected components. It does not answer the requested polynomial-time question.

A state is the undominated set; choosing x removes its intersection with the closed neighborhood of x. Untouched components and partially played components do not interact. Once an untouched path or cycle is played, all its remaining undominated pieces are bordered path runs. They are formally equivalent to 0.337 heaps by the [exact graph-to-heap reduction](README.md). The representation uses three kinds of parts:
1. An untouched path, with its vertex count.
2. An untouched cycle, with its vertex count.
3. A bordered run, with its undominated length.

Maintain a canonical sorted list for each kind. Their lengths sum to the total undominated count, at most n. Every move decreases this count strictly. The options of a run of size h are the ordinary 0.337 moves. An untouched cycle of size h has the single option run h−3, omitting length zero. For an untouched path of size h, choosing an endpoint leaves a run of size max(0,h−2), and each internal choice removes three consecutive vertices, leaving two possible nonempty runs whose lengths sum to h−3. In the latter description allow either residual length to be zero. A path of size one simply disappears. These options are exact regardless of which game convention is used.

Compute the outcome by memoized recursion. The empty position is N in misère play. A nonempty position is N precisely when it has a P option. The number of sorted triples of lists with total length at most n is at most (n+1) times the coefficient bound for three-colored integer partitions of n. To see the needed asymptotic without relying on the partition asymptotic formula, set z=exp(−1/√n), let F(z) be the generating product ∏_{j≥1}(1−z^j)^(−3), and note
```math
\log F(z)=3\sum_{k\ge1}\frac1{k(e^{k/\sqrt n}-1)}
\le 3\sqrt n\sum_{k\ge1}\frac1{k^2}=O(\sqrt n).
```
Every monomial z^j of degree j≤n has value at least z^n. Hence the sum of coefficients up to n is at most z^(−n) F(z)=exp(O(√n)). A state has O(n) options even before deduplicating equal moves. Each option and dictionary key can be produced and handled in time polynomial in n, for example using a deterministic ordered dictionary. Multiplying these factors by the number of states proves the stated running time and space bound.

This representation preserves game trees and works without assuming any periodicity or misère quotient. In particular it remains valid at the [published-parameter mismatch](README.md#refuting-the-displayed-period-parameters).
