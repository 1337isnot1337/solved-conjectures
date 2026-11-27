# Scope, dependencies, and checks

## What is proved

The [written argument](PARITY-FREE-HALF-INTEGRAL.md) answers the
first question in [Chen, Problem 6.5, arXiv:2609.26158v1](https://arxiv.org/pdf/2609.26158#page=14).
For unboundedly many prescribed pairs in an arbitrary undirected
supply graph, the minimum vertex transversal is bounded by a
function of the congestion-two packing number. There is no
restriction on degree, genus, treewidth, or number of markers.
The second question, in which paths must have a prescribed
parity, is separate and is not claimed.

The path version also permits arbitrary demand graphs. For each
demand uv, attach its own private leaf to u and its own private
leaf to v and demand the two leaves. The leaf demands are a
matching. Strip the two pendant edges from each selected path
to project a congestion-two packing back to the original graph.
Map each deleted leaf in a transversal to its original neighbor,
keeping all original-vertex deletions; this is an original
transversal of no greater size. Conversely an original transversal
hits every augmented path. This reduction applies to ordinary
paths; adding two edges also preserves the parity of any
particular path, but the theorem supplies no parity-constrained
packing.

## Source and novelty audit

- Chen's September arXiv preprint states both parts separately
  and explicitly flags the unbounded matching case as unresolved
  there. Its hypergraph-universality result concerns odd cycles
  with prescribed chromatic richness and does not decide the
  marker problem.
- [Marx–Wollan](https://arxiv.org/abs/1411.0871), their proceedings,
  and [Raymond's Erdős–Pósa survey](https://perso.ens-lyon.fr/jean-florent.raymond/files/survep.pdf)
  settle the integral demand-pattern question, not this relaxation.
- [Chekuri–Ene](https://chekuri.cs.illinois.edu/papers/ndp-soda-proceedings.pdf)
  route a fraction depending on the number of demands with bounded
  node congestion, but their stated congestion is 51, not two.
  [Chuzhoy–Li](https://arxiv.org/abs/1208.1272) attain congestion two
  on edges, not vertices.
- [Chekan et al.](https://arxiv.org/abs/2408.16344) concern
  non-null S–T paths for a fixed finite group. The exact demand-pair
  identity cannot be replaced by permitting all S–T pairs.
- [Kawarabayashi–Kobayashi](https://doi.org/10.1137/100808812) and
  [Kawarabayashi–Reed's parity work](https://epubs.siam.org/doi/abs/10.1137/1.9781611973068.128)
  address feasibility with a fixed list of terminals. Their
  algorithms do not state the uniform transversal implication
  for arbitrarily many candidate pairs.
- Searches by the exact marker terminology, valid paths,
  prescribed-pair paths, matching demand graphs, vertex multicut,
  and half-integral or congestion-two packing found no previous
  resolution of this exact formulation. Repository issue searches
  found no competing matching-demand campaign. The open
  Erdős–Hajnal odd-cycle-chromatic-span problem tracked in #1010
  is different.

## Verification checkpoints

The tangle grid input is the statement explicitly quoted as (2)
in [Graph Minors XVI](https://doi.org/10.1016/s0095-8956%2803%2900042-x):
a tangle of sufficiently large order has a square grid minor
with no row on the small side of any sufficiently low-order
separation. The rooted clique input is Robertson–Seymour (5.4),
as quoted in [The disjoint paths problem in quadratic time](https://kam.mff.cuni.cz/~samal/DS/disjoint.pdf#page=6),
Theorem 4.1. The model built in the proof has order 8t+1,
larger than either the 3t or 3t+1 threshold stated in versions of
the latter source. Its check concerns a whole branch set on the
side opposite the prescribed roots, not a single vertex of the
union of the model.

Run the sanity test of the residual exchange with NetworkX:

    python verify_exchange.py --seed 1011 --trials 900

It exercised 449 eligible samples, including nonzero contraction
with simultaneous exchanges of two or three pairs. It computes
max flows independently for both sets of sources and for the
one-at-a-time swaps, decomposes the flow difference, checks the
exact mate of every terminal, and verifies congestion two. This
does not substitute for the proof or for independent mathematical
review. No Lean work was performed. Independent review is the
remaining gate before publication, and no promotion to main has
been made.
