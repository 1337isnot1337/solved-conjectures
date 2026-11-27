# Structural consequences of the club decomposition

These follow from the [proof of Problem 4](PROOF.md).
They are not additional named-conjecture claims.

## 1. A dichotomy for each uncountably chromatic graph

Every uncountably chromatic graph on \(\omega_1\) either:

* contains a Shelah graph in the sense of the original paper
  (equivalently, a Halin \((\aleph_0,\aleph_1)\)-graph as a
  noninduced subgraph), or
* contains an uncountably chromatic induced graph that,
  on its order of club intervals with any missing indices
  filled by isolates, is of Hajnal–Máté type.

Indeed, in the absence of the first alternative, the slot
decomposition gives the second: if every slot were countably
colorable, their countably many colorings could be combined by
remembering the slot number in each vertex color. This is not
a statement about the coloring number, nor about minors.

## 2. The stronger stationary partition relation

The club proof also gives that existence of a Shelah-free graph
on \(\omega_1\) with no stationary independent set is equivalent to
existence of such a graph of Hajnal–Máté type with no stationary
independent set. For the nontrivial direction, if \(G\) is
Shelah-free, restrict to the endpoints of the club intervals
in the proof, then transport along \(\xi\mapsto\gamma_\xi\).
The transported graph is of Hajnal–Máté type by the very same
bounded-initial-segment argument. Its stationary independent
sets correspond to stationary independent sets in \(G\), since
the endpoint map is continuous and cofinal. For this stronger
hypothesis, there is no need to use the other slots.

In particular the partition relation
\(\omega_1\to(\text{stationary subset},\text{Shelah graph})^2\)
is itself independent over GCH: the original paper disproves it
under \(V=L\); in the SAD model, the designated Shelah color, if it
avoids Shelah graphs, is countably colorable, hence has a
stationary independent set.

## 3. Successor-cardinal form of the decomposition

Let \(\lambda\) be an infinite cardinal. Suppose a graph on
\(\lambda^+\) contains no bipartite subgraph with sides of
sizes \(\lambda,\lambda^+\) in which every vertex in the
larger side has \(\lambda\) neighbors in the smaller side.
For each \(\alpha<\lambda^+\), at most \(\lambda\) vertices
have \(\lambda\) neighbors below \(\alpha\); otherwise enlarge
\(\alpha\) to a \(\lambda\)-set if necessary and retain
\(\lambda^+\) vertices outside it. In the only relevant case
already \(|\alpha|=\lambda\), so no enlargement is needed.
Use the resulting bound \(f(\alpha)\) and closure club as
above, now on \(\lambda^+\). Every club interval has
cardinality at most \(\lambda\), so the same slot construction
decomposes the graph into \(\lambda\) induced graphs. On
interval indices, every vertex in each slot has fewer than
\(\lambda\) neighbors in every strictly bounded lower initial
segment.

Conversely a graph on \(\lambda^+\) with this last property
itself avoids the stated obstruction: the smaller side would
be bounded, and above its bound there cannot be any vertices
with \(\lambda\) neighbors there. This is a direct ZFC
structural equivalence for the existence question at
chromatic number \(\lambda^+\), not an assertion about the
consistency of either side at other cardinals.
