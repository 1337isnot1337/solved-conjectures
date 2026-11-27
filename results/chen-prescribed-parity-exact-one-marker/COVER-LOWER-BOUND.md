# The cover bound is at least of order \(t\log t\)

Companion to [Chen's prescribed-parity exact-one-marker conjecture](PROOF.md).
Even if all demands are even and their terminals are private
leaves, any uniform cover function \(f(t)\) in the congestion-two
theorem satisfies \(f(t)=\Omega(t\log t)\).

## Turn odd cycles into even matching demands

Let \(H\) be a simple graph of girth at least \(g+1\).
For each edge \(e=uv\) attach two new leaves \(u_e,v_e\)
to \(u,v\), respectively. Demand an even simple path between
\(u_e\) and \(v_e\). These demands are a matching, their
endpoints are nonadjacent, and all prescribed parities agree.

An eligible path projects to an even simple \(u\)–\(v\) path of
\(H\). It does not use the edge \(uv\): a simple path between its
ends can use that edge only if the edge is the whole path, which
would be odd. Closing the projected path by \(uv\) gives an odd
cycle of \(H\) with exactly its projected vertex set. Conversely,
choosing any edge of an odd cycle gives an eligible demand path by
replacing that closing edge with the two corresponding pendant
edges.

The minimum cover size equals the odd-cycle transversal number
of \(H\). A cover of the odd cycles covers all the demand paths.
Conversely move any leaf in a demand-path cover to its neighbor
in \(H\); for each odd cycle use a corresponding demand path
whose intersection with \(H\) is that cycle's full vertex set.
Every eligible path uses at least \(g+1\) vertices of \(H\). With
vertex congestion at most two the packing size is therefore at
most \(2|V(H)|/(g+1)\), even if repeat uses of a demand were allowed.

## Choose a high-girth graph with large odd-cycle transversal

For large \(n\), take the random graph \(G(n,100/n)\) and let
\[
g=\left\lfloor\frac{\log n}{4\log 100}\right\rfloor,
\]
where the logarithm is natural. The expected number of cycles
of length at most \(g\) is bounded by
\(\sum_{\ell=3}^g 100^\ell/(2\ell)=O(n^{1/4})\). With probability
tending to one there are at most \(n^{1/2}\) of them, by Markov's
inequality. The chance of an independent set of size
\(a=\lceil n/4\rceil\) is at most
\[
2^n\exp\left(-100\binom a2/n\right)=o(1).
\]
Delete one vertex from each short cycle in a realization with both
properties, taking the union of those deletions. The remaining
\(H\) has at least \(n-n^{1/2}\) vertices, girth at least \(g+1\),
and independence number less than \(a\). An induced bipartite
subgraph consists of two independent sets and has at most \(2a\)
vertices. Therefore every odd-cycle transversal has size at least
\(n-n^{1/2}-2a=\Omega(n)\).

For a given large \(t\), take \(n=\lfloor t\log t/(16\log 100)\rfloor\).
Then \(2|V(H)|/(g+1)\le 2n/(g+1)<t\) for all sufficiently large \(t\),
whereas the cover number is \(\Omega(n)=\Omega(t\log t)\).
This forces the bound. The high-girth random graph method is
classical; see [Erdős, *Graph Theory and Probability*](https://old.renyi.hu/~p_erdos/1959-06.pdf).
The point here is the transfer to an all-even matching of demands.
