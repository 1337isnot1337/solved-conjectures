# Prescribed parity reduces to ordinary routing around a bipartite core

This addresses one structural case of [#1012](https://github.com/1337isnot1337/solved-conjectures/issues/1012).
It does not require a bound on the global odd-cycle transversal.

Let G carry demands with prescribed length parities, and suppose
there is no congestion-two routing of t distinct eligible
demands. Delete a set X of at most h vertices. Assume a component
C of G-X contains every eligible path that avoids X. In C suppose
there is a connected bipartite induced subgraph B, and each
component outside B meets B only at one gate: its set of neighbors
in B is a singleton. For each v in B, assume there is no eligible
path wholly in the union of the components attached at v,
without v. Under these hypotheses there is a hitting set of
size at most `h+t-1+f(t)`, with f from the parity-free theorem.

In particular, the final hypothesis follows if the path tangle
orients each separation at a gate toward the B side, since then
the fringe side off its gate cannot contain an eligible path.
Large odd-minor structure supplies a motivation for finding
a bipartite dominant block. No use of such a structure theorem
to force this outcome in an arbitrary counterexample is claimed.

## Same gate

Project every core vertex to itself, and every fringe vertex to
its gate. Write R_v for v plus all fringe components attached
there. The zones R_v are pairwise disjoint. A simple path whose
endpoints project to the same gate v cannot leave R_v and then
return: v would be repeated. It must use v, because the hypothesis
forbids an eligible path in R_v-v. If t distinct zones had active
same-gate demands, choose one path in each to obtain an integral
packing. Hence at most t-1 gates hit all the same-gate demands.

## Distinct gates

Every eligible simple path with endpoint projections u!=v has
three consecutive pieces: an arm in R_u to u, a path in B from u
to v, and an arm from v in R_v. The arms may have length zero.
The middle has parity fixed by the bipartition. Conversely any
choice of simple arms with compatible total parity, together
with any simple u-v path in B, gives an eligible simple path,
since the zones and the core have disjoint interiors.

Keep a demand edge uv on the core precisely if some original
demand projecting to u,v has compatible arms. Drop duplicate
edges but retain one viable original pair and its two arms for
each edge. Apply the [parity-free theorem](PARITY-FREE-HALF-INTEGRAL.md)
for arbitrary demand graphs to this core instance. A
congestion-two routing of t core demands extends by the stored
arms: each zone can be used by arms only of paths that already
use its gate, and at most two such paths were chosen. The
distinct resulting original demands would contradict the
hypothesis. Therefore a set of at most f(t) core vertices
hits all core demand paths. This hits every original eligible
path with distinct gates, including the demands collapsed into
duplicate core edges. Combine it with X and the at most t-1
same-gate vertices.

## What remains

A graph-minor approach still needs either to prove that this
core outcome always occurs after bounded deletion, or to route
demand paths of the prescribed parity in the other outcomes.
The ordinary doubled-graph clique model and the ordinary
residual exchange do not achieve that on their own.
