# The finite-palette boundary of the rainbow-star girth problem

Two complements to [Erdős–Galvin–Hajnal, Problem 7](PROOF.md).
They distinguish using every label once from using it infinitely
often. They do not reinterpret the original countably infinite
edge-palette question.

## Finite palettes permit arbitrarily large girth

For all positive integers \(k,L,d\) and \(g\ge3\) there is a
finite graph of girth greater than \(g\), edge-labelled with
\([L]\), in which every \(k\)-colouring of the vertices has the following property: at
least two thirds of the vertices have at least \(d\) same-colour neighbours of each label.

For an \(n\)-vertex random graph, independently for each pair
put in an edge with probability \(p=n^{-1+1/(2g)}\) and, if
present, label it uniformly in \([L]\). Each fixed label graph
has marginal distribution \(G(n,p/L)\). Set
\(m=\lceil n/(4kLd)\rceil\). The probability that some label
graph has an independent \(m\)-set is at most
\[
 L\binom nm (1-p/L)^{\binom m2}=o(1).
\]
Indeed the logarithm of the first two factors is \(O(n)\), and
for fixed \(k,L,d,g\) the negative logarithm of the last factor
is \(\Omega(n^{1+1/(2g)})\). The expected total number of
cycles of lengths \(3,\ldots,g\) is \(O(n^{1/2})\), by
summing \(n^i p^i/(2i)\). With probability tending to one,
there are fewer than \(n/4\) such cycles. Delete at most one
vertex per original short cycle; at least \(3n/4\) vertices
remain. Every label graph still has independence number
less than \(m\).

In any \(k\)-colouring, let each deficient vertex (one
not meeting the stated degree condition) choose a label in
which it has same-colour degree at most \(d-1\). Partition
the deficient vertices by their colour and chosen label.
The chosen-label graph in each such cell has maximum
degree at most \(d-1\), so a greedy \(d\)-colouring gives an
independent set of size at least the cell size divided by \(d\).
Its independence number is less than \(m\); thus the cell has
size at most \(d(m-1)\). There are at most \(kL\) cells, so
fewer than \(n/4\) vertices are deficient. Since at least
\(3n/4\) survive, at least two thirds of the surviving
vertices meet the degree condition.

For fixed \(g,L\), take a disjoint union of a witness for
each pair \((k,d)\). This countable graph still has girth
greater than \(g\), and in every finite vertex colouring
it has centres satisfying any prescribed finite \(d\).
This does not assert one centre of infinite degree in all
labels.

## Why infinite multiplicity is different

Let \(\lambda\) be an infinite cardinal and let the graph
have at most \(\lambda\) vertices. Take finite \(k\ge1\).
Either assume \(\lambda\) is regular and the common
neighbourhood of every \(k\)-set has size less than \(\lambda\),
or assume a uniform bound \(\rho<\lambda\) on such common
neighbourhoods (with no regularity hypothesis). Then, even
from arbitrary \(k\)-element lists, one can colour the graph
so each vertex has fewer than \(\lambda\) neighbours of its
own colour, across all labels combined.

Well-order the vertices with order type at most \(\lambda\).
Reuse the available-colour invariant of the countable
missing-label proof. When processing \(v\), choose any
available colour and prohibit it at **all** its unprocessed
neighbours except those for which it is the only available
colour. For an exception, \(k-1\) distinct earlier neighbours
witness the other forbidden colours. Together with \(v\)
they form a \(k\)-set. There are fewer than \(\lambda\)
choices for that set at any stage, since \(k\) is finite.
The total number of exceptions is less than \(\lambda\)
by regularity or by the uniform bound and cardinal
multiplication. Since the lists are finite, the nonempty
availability invariant also holds at limit stages: if all
\(k\) colours had become unavailable by a limit, this
already happened at the latest of their finitely many
prohibition stages.

For any processed vertex, earlier neighbours number less
than \(\lambda\); later neighbours of its colour are among
its recorded exceptions. This proves the defect claim. In
particular, for a \(\lambda\)-sized edge palette every vertex
misses a label. For \(C_4\)-free graphs take \(k=2,\rho=1\);
this applies at **every** infinite \(\lambda\), including
singular cardinals. For regular \(\lambda\), any witness with
\(\lambda\) vertices and labels that defeats all \(k\)-colourings
must contain \(K_{k,\lambda}\).

Thus the countable case can have large girth with every
fixed finite palette and arbitrary finite multiplicity,
but no \(C_4\)-free countable graph can force infinite
multiplicity in even one label against two colours.
At exact host and palette cardinality the general
[odd-girth transfer](../erdos-galvin-hajnal-continuum-rainbow-star/PROOF.md)
meets this obstruction by permitting 4-cycles. For finite
\(k\) it also excludes \(K_{k+1,k+1}\), via the
[well-ordered transfer](../erdos-galvin-hajnal-continuum-rainbow-star/BICLIQUE-TRANSFER.md).

For sharpness at every infinite \(\lambda\), take a countable
disjoint union of the well-ordered transfer with finite
\(k=1,2,\ldots\), using \(\lambda^k=\lambda\) and triangle-free
templates. This graph of order \(\lambda\) forces a
\(\lambda\)-label star against each finite colouring,
has no triangles, and avoids \(K_{\aleph_0,\aleph_0}\):
each component lies in one fixed-\(k\) witness and cannot
contain \(K_{k+1,k+1}\). The negative result above forces
a 4-cycle. The exact girth threshold is therefore four
at every infinite cardinal, with no regularity restriction.

The original [footer to Problem 7, p. 466](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=42)
explicitly credits Theorems 9.21 and 7.1 for the countable
large-girth assertion with a fixed finite edge palette and
one neighbour per label. That assertion is prior. The
random-graph argument above gives finite witnesses and
controls all finite degree thresholds at a positive fraction
of their vertices. The defect argument is a strengthening
of the companion recursion, not a separate priority claim.
