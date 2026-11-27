# The complete overlap threshold on \(\aleph_2\) vertices

This is a consequence of the [rectangle construction](PROOF.md)
and the neighboring theorems in the original paper. It concerns
all finite uniformities, including odd ones.

Fix integers \(r\ge3\) and \(1\le i<r\). Consider the existence
of an \(r\)-uniform hypergraph on exactly \(\aleph_2\) vertices
with uncountable chromatic number and pairwise intersection
at most \(i\). Then, relative to the consistency of ZFC:

| Parameters | Status |
| --- | --- |
| \(r\le2i\) | Such a hypergraph exists in ZFC, with chromatic number exactly \(\aleph_1\). |
| \(r=2i+1\) | Existence is independent of ZFC. |
| \(r\ge2i+2\) | No such hypergraph exists in ZFC. |

For the first row, if \(r\) is even use the construction
at width \(r/2\), where the overlap is exactly bounded by
\(r/2\le i\). If \(r\) is odd, use width \((r+1)/2\le i\)
and delete one vertex from each edge. A monochromatic
original edge still supplies a monochromatic retained
edge. Both rows of each edge are still occupied, so
distinct original row pairs give distinct retained edges
and the union still has size \(\aleph_2\). Coloring by
column remains proper, because the retained edge uses
at least two columns. In particular, the two existence
questions of EGH Problem 12 follow as numerical corollaries
of this general result, not as separate targets.

For the boundary \(r=2i+1\), existence in a GCH model is
[EGH Theorem B(b) and Corollary 12.4](https://www.renyi.hu/~p_erdos/1975-24.pdf),
with base cardinal \(\aleph_0\) and two successor steps.
In a model of \(\mathrm{MA}_{\aleph_2}\), their Theorem 5.6
says any uncountably chromatic \(r\)-uniform hypergraph on
\(\aleph_2\) vertices has an \((i+1)\)-set in at least two
edges. This is incompatible with the required overlap.
Both models are relatively consistent with ZFC. These two
boundary directions are credited to the original paper.

For \(r\ge2i+2\), the nonexistence is their Theorem B(a)
with the same base cardinal and two successors. Thus the
rectangle construction fills exactly the previously
conditional range \(r\le2i\), not the independent
boundary or the impossible range.

## Other successor cardinals

The rectangle argument works unchanged on
\(\lambda^+\times\lambda\), for any infinite \(\lambda\)
admitting a strong coloring
\(\lambda^+\nrightarrow[\lambda^+]^2_{\lambda^+}\).
For a palette of size \(\mu<\lambda\), every row has at
least \(n\) columns of one color; there are at most
\(\lambda\) choices of a color and \(n\)-set of columns.
Some choice occurs on \(\lambda^+\) rows, and the
strong coloring yields its rectangle. Coloring by
column is proper for \(n\ge2\), so the exact
chromatic number is \(\lambda\). This construction
therefore applies to all infinite regular \(\lambda\)
by [Rinot–Todorčević (2013)](https://doi.org/10.4064/fm220-2-2).
The odd-uniformity trimming also works.
