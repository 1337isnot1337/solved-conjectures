# Finite-state reduction for exact-one-marker parity cycles

This reduces Chen's prescribed-parity packing-covering question to
unbreakable **augmented** graphs. It does not supply the missing
unbreakable-graph theorem. The replacement idea follows
[Chekan et al., §§3–4](https://arxiv.org/abs/2408.16344), but the
boundary states here track marker count, parity, simple cycles, and
distinctness of marker identities. There are no terminal identities
in the states.

A host consists of the simple augmented graph $H$, with its
edges partitioned into supply edges and a matching of marker edges.
Give each edge a bit: a supply edge has bit 1 and a marker $d$
has bit equal to the prescribed supply parity of $d$. A cycle
is eligible if it contains exactly one marker and the sum of its
edge bits modulo 2 is zero. Cycles in a packing use distinct
markers and have vertex congestion at most two. A cover is a
vertex set meeting every eligible cycle.

## Boundaried pieces and replacement

Fix an ordered boundary $S$ of size at most $r$, and let the
replaced side $B$ share exactly $S$ with the retained side $A$.
Assign *all* edges within $S$ to $A$; $B$ has none. Suppose
$B-S$ is safe, meaning it contains no eligible cycle. Treat the
ordered boundary as the complete interface. In addition to the
states below, record which boundary vertices meet marker edges in
$B$, so replacement does not break the global matching condition.

For a cycle that uses edges of $B$ and is not wholly in $B-S$,
split at every visit to a boundary vertex. Each of its resulting
$B$-pieces is a nonempty path with two different boundary ends and
all internal vertices off the boundary. Also allow a simple closed
piece based at a single boundary vertex: it represents a full cycle
whose only boundary vertex is that vertex. For each piece record its
ordered ends, its bit sum, and its marker count (0 or 1).
A path whose interior touches the boundary is not a valid
realization of a piece.

For a congestion-two packing, at most $2r$ cycles meet the
boundary, and there are at most $2r$ pieces from $B$: each can
be charged to its first boundary-vertex visit on its own oriented
cycle. Record an abstract pattern of at most $2r$ pieces, with a
partition into groups according to which cycle will use them.
Its list may be ordered arbitrarily. Record every pattern realizable
in $B$ with the following restrictions:
* pieces in the same group meet only at common specified boundary
  ends, with disjoint interiors;
* an off-boundary vertex is used by at most two groups;
* no marker edge is shared by two pieces.

Whether a full cycle is simple at the boundary, and whether the
boundary load is at most two, can be decided from its boundary
sequence and the retained pieces. These are unchanged in any
replacement. If two different eligible cycles have the same
marker, that edge is on exactly one side; forbid this in the
realization on that side. Thus no global marker name needs to be
retained in a state.

For covers, for each subset $T$ of the boundary and each
$j\in\{0,\ldots,r\}$, record the collection of all single-group
pattern signatures obtainable in $B-T-Y$ as $Y$ varies over
interior deletion sets of size at most $j$. A signature is the
set of patterns that remain realizable. It is important to retain
the entire set of signatures, not just whether each pattern can
separately be destroyed. This is still a finite type: $r$
bounds the piece count, number of boundary positions, group labels,
marker counts and bit sums.

Choose one smallest safe simple matching-marked representative
for each type that occurs. The maximum $h(r)$ of their vertex
counts is finite. No effective bound on the smallest representative
is required.

## Exactness of replacement

**Packing.** Keep all cycles whose edges lie in $A$. Every other
eligible cycle touches $S$, by safety. Split those cycles into
pieces. Realize the same grouped $B$-pattern in the representative
and glue it to the unchanged retained-side pieces in the original
boundary order. The shared boundary sequences are unchanged, so
gluing produces simple cycles; interior disjointness within each
group prevents new repetitions. Each cycle retains exactly one
marker and the same parity. Distinctness and congestion are
preserved. Reversing the roles of the pieces proves equality of
packing numbers.

**Cover.** Some minimum cover uses at most $r$ vertices in
$B-S$: if it used more, replace those vertices by $S$. That
hits every eligible cycle meeting $S$; there is no eligible cycle
in $B-S$; and the change cannot unhit a cycle in $A-S$.
Let $T$ be the covered boundary vertices and $Y$ the covered
interior vertices on the replaced side. Choose an interior
deletion set of size at most $|Y|$ in the representative with
the same single-cycle signature at $T$. If an unhit eligible
cycle appeared in the new graph, it could not lie entirely on
the safe side. Its boundary pattern and retained-side pieces
could be glued to an unhit realization in the old graph,
a contradiction. Reverse the roles for equality of cover numbers.

## The hypothetical unbreakable theorem that suffices

Call an augmented graph $(q,k)$-unbreakable if it has no vertex
separation of order less than $k$ for which each side (including
the separator) has at least $q$ vertices. For each packing target
$t\ge 2$, fix $r$ arbitrarily and set $q=h(r)+1$.
Suppose one can prove a uniform cover bound $g(t,q,r)$ for the
$(q,r+1)$-unbreakable augmented graphs lacking a size-$t$ packing.

Then the unrestricted theorem follows by induction on $t$ and,
for fixed $t$, on the number of vertices. Given a separation of
order at most $r$ with sides of size at least $q$, if each open
side contains an eligible cycle, each open side lacks a packing of
size $t-1$. Otherwise one could add the cycle in the opposite
side; disjoint cycles have distinct markers. The two inductive
covers and the separator give a cover of size at most
$2f(t-1)+r$. If one open side is safe, replace it by its smaller
type representative. Both optima remain unchanged, so vertex
induction applies. This gives
$$
f(t)=\max\{g(t,h(r)+1,r),\,2f(t-1)+r\},\qquad f(1)=0.
$$
Unbreakability here concerns $H=G\cup D$, not just $G$. A
matching of marker edges can bypass a small supply separator;
ordinary Menger linkage in $H$ is therefore not the needed
supply linkage. The finite-state reduction does not overcome
that remaining issue.
